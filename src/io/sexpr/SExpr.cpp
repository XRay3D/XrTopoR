#include "io/sexpr/SExpr.h"

#include <charconv>
#include <cmath>
#include <cstdio>
#include <stdexcept>

namespace xr::sexpr {

static const std::string kEmpty;

const std::string& Node::head() const {
  if (isList && !kids.empty() && !kids[0].isList) return kids[0].text;
  return kEmpty;
}

const Node* Node::find(std::string_view h) const {
  for (auto& k : kids)
    if (k.is(h)) return &k;
  return nullptr;
}

Node* Node::find(std::string_view h) {
  for (auto& k : kids)
    if (k.is(h)) return &k;
  return nullptr;
}

std::vector<const Node*> Node::findAll(std::string_view h) const {
  std::vector<const Node*> out;
  for (auto& k : kids)
    if (k.is(h)) out.push_back(&k);
  return out;
}

const std::string& Node::arg(size_t i) const {
  if (i + 1 < kids.size() && !kids[i + 1].isList) return kids[i + 1].text;
  return kEmpty;
}

double Node::num(size_t i, double def) const {
  const std::string& s = arg(i);
  if (s.empty()) return def;
  double v = def;
  auto r = std::from_chars(s.data(), s.data() + s.size(), v);
  if (r.ec != std::errc()) return def;
  return v;
}

namespace {

struct Parser {
  std::string_view s;
  size_t i = 0;
  char quoteChar = '"';
  bool dsn = false;

  void skipWs() {
    while (i < s.size()) {
      char c = s[i];
      if (c == ' ' || c == '\t' || c == '\n' || c == '\r') { ++i; continue; }
      if (!dsn && c == '#' && (i == 0 || s[i - 1] == '\n')) {  // comment line (KiCad libs)
        while (i < s.size() && s[i] != '\n') ++i;
        continue;
      }
      break;
    }
  }

  Node readQuoted(char q) {
    ++i;  // opening quote
    std::string out;
    while (i < s.size() && s[i] != q) {
      if (!dsn && s[i] == '\\' && i + 1 < s.size()) {
        char n = s[i + 1];
        switch (n) {
          case 'n': out += '\n'; break;
          case 't': out += '\t'; break;
          case '\\': out += '\\'; break;
          case '"': out += '"'; break;
          default: out += '\\'; out += n; break;
        }
        i += 2;
        continue;
      }
      out += s[i++];
    }
    if (i < s.size()) ++i;  // closing quote
    return Node::atom(std::move(out), true);
  }

  Node readAtom() {
    size_t b = i;
    while (i < s.size()) {
      char c = s[i];
      if (c == ' ' || c == '\t' || c == '\n' || c == '\r' || c == '(' || c == ')') break;
      if (c == quoteChar && i == b) break;
      ++i;
    }
    return Node::atom(std::string(s.substr(b, i - b)));
  }

  Node readList() {
    Node n;
    n.isList = true;
    ++i;  // '('
    while (true) {
      skipWs();
      if (i >= s.size()) break;
      char c = s[i];
      if (c == ')') { ++i; break; }
      if (c == '(') { n.kids.push_back(readList()); continue; }
      if (dsn && n.kids.size() == 1 && n.kids[0].text == "string_quote") {
        // (string_quote ") - the next char is the quote character itself.
        Node q = Node::atom(std::string(1, c));
        ++i;
        quoteChar = c;
        n.kids.push_back(std::move(q));
        continue;
      }
      if (c == quoteChar) { n.kids.push_back(readQuoted(c)); continue; }
      n.kids.push_back(readAtom());
    }
    return n;
  }
};

}  // namespace

Node parse(std::string_view text, ParseOptions opt) {
  Parser p;
  p.s = text;
  p.dsn = opt.dsnQuoting;
  Node root;
  root.isList = true;
  while (true) {
    p.skipWs();
    if (p.i >= text.size()) break;
    char c = text[p.i];
    if (c == '(') root.kids.push_back(p.readList());
    else if (c == ')') ++p.i;
    else if (c == p.quoteChar) root.kids.push_back(p.readQuoted(c));
    else root.kids.push_back(p.readAtom());
  }
  return root;
}

std::string quote(const std::string& s) {
  std::string out = "\"";
  for (char c : s) {
    if (c == '"' || c == '\\') out += '\\';
    if (c == '\n') { out += "\\n"; continue; }
    out += c;
  }
  out += '"';
  return out;
}

std::string fmtNum(double v, int maxDecimals) {
  if (std::abs(v) < 0.5 * std::pow(10.0, -maxDecimals)) v = 0;
  char buf[64];
  std::snprintf(buf, sizeof buf, "%.*f", maxDecimals, v);
  std::string s = buf;
  if (s.find('.') != std::string::npos) {
    while (!s.empty() && s.back() == '0') s.pop_back();
    if (!s.empty() && s.back() == '.') s.pop_back();
  }
  if (s == "-0") s = "0";
  return s;
}

static bool isSimple(const Node& n) {
  for (size_t k = 1; k < n.kids.size(); ++k)
    if (n.kids[k].isList) return false;
  return true;
}

static void writeImpl(const Node& n, int indent, std::string& out) {
  if (!n.isList) {
    out += n.quoted ? quote(n.text) : n.text;
    return;
  }
  out += '(';
  bool simple = isSimple(n);
  // KiCad keeps (xy ..) point runs and short lists on one line.
  bool inlineKids = n.is("pts") || n.is("at") || n.is("xy");
  for (size_t k = 0; k < n.kids.size(); ++k) {
    const Node& c = n.kids[k];
    if (c.isList && !simple && !inlineKids) {
      out += '\n';
      out.append(indent + 1, '\t');
      writeImpl(c, indent + 1, out);
    } else {
      if (k > 0) out += ' ';
      writeImpl(c, indent + 1, out);
    }
  }
  if (!simple && !inlineKids) {
    out += '\n';
    out.append(indent, '\t');
  }
  out += ')';
}

std::string write(const Node& n, int indent) {
  std::string out;
  writeImpl(n, indent, out);
  return out;
}

}  // namespace xr::sexpr
