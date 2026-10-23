#pragma once
// Minimal S-expression tree shared by the KiCad, Specctra DSN/SES and P-CAD ASCII formats.
#include <string>
#include <string_view>
#include <vector>

namespace xr::sexpr {

struct Node {
  bool isList = false;
  bool quoted = false;  // atom was written as a quoted string
  std::string text;     // atom text
  std::vector<Node> kids;

  static Node atom(std::string s, bool q = false) { Node n; n.text = std::move(s); n.quoted = q; return n; }
  static Node list(std::string head) { Node n; n.isList = true; n.kids.push_back(atom(std::move(head))); return n; }

  // Head symbol of a list, e.g. "footprint" for (footprint ...).
  const std::string& head() const;
  bool is(std::string_view h) const { return isList && !kids.empty() && !kids[0].isList && kids[0].text == h; }
  const Node* find(std::string_view h) const;
  Node* find(std::string_view h);
  std::vector<const Node*> findAll(std::string_view h) const;
  // i-th argument after the head (0-based). Empty string if missing / is a list.
  const std::string& arg(size_t i) const;
  double num(size_t i, double def = 0) const;
  size_t argc() const { return kids.empty() ? 0 : kids.size() - 1; }

  Node& add(Node n) { kids.push_back(std::move(n)); return kids.back(); }
  Node& addAtom(std::string s, bool q = false) { return add(atom(std::move(s), q)); }
};

struct ParseOptions {
  bool dsnQuoting = false;  // Specctra: (string_quote X) changes the quote char
};

// Parses all top-level expressions of the text into the children of a synthetic root list.
Node parse(std::string_view text, ParseOptions opt = {});
// KiCad-style pretty printer (tabs, one list per line for nested lists).
std::string write(const Node& n, int indent = 0);
// P-CAD style: two-space indentation, lists nested at most two deep stay on one line, strings are
// written verbatim between quotes (P-CAD has no escapes).
std::string writeCompact(const Node& n, int indent = 0);
std::string quote(const std::string& s);
std::string fmtNum(double v, int maxDecimals = 6);

}  // namespace xr::sexpr
