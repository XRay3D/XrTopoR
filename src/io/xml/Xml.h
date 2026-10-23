#pragma once
// Minimal XML DOM: enough for CAD interchange files (elements, attributes, text, comments,
// CDATA, the five predefined entities and numeric character references). No DTD, no namespaces.
#include <expected>
#include <string>
#include <string_view>
#include <vector>

namespace xr::xml {

struct Element {
  std::string name;
  std::vector<std::pair<std::string, std::string>> attrs;  // in document order
  std::vector<Element> kids;                                // in document order
  std::string text;                                         // concatenated character data

  bool is(std::string_view n) const { return name == n; }
  bool has(std::string_view attr) const;
  // Attribute value or `def` when missing.
  std::string_view attr(std::string_view name, std::string_view def = "") const;
  double num(std::string_view name, double def = 0) const;
  bool flag(std::string_view name, bool def = false) const;  // "on"/"off", "true"/"false", "1"/"0"
  // First child with the given name (nullptr when absent) and all such children.
  const Element* find(std::string_view name) const;
  std::vector<const Element*> findAll(std::string_view name) const;
  // Nested lookup: find("a")->find("b") with null propagation.
  const Element* path(std::initializer_list<std::string_view> names) const;
};

// Parses a whole document; returns the root element. A UTF-8 BOM and the XML declaration are
// skipped. Errors carry a line number.
std::expected<Element, std::string> parse(std::string_view text);

// Streaming writer producing indented output with the given line ending.
class Writer {
 public:
  explicit Writer(std::string indent = "\t", std::string eol = "\r\n") : indent_(std::move(indent)), eol_(std::move(eol)) {}
  void declaration(std::string_view encoding = "UTF-8");
  void comment(std::string_view text);
  void blank() { out_ += eol_; }
  // Opens an element; attributes are given as name/value pairs.
  void open(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs = {});
  void close();
  // Self-closing element.
  void empty(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs = {});
  // Self-closing element with a run-time list of attributes.
  void emptyList(std::string_view name, const std::vector<std::pair<std::string, std::string>>& attrs);
  // <name>text</name> on one line.
  void textElement(std::string_view name, std::string_view text);
  // A parsed element written back with its attributes, text and children (sections kept verbatim).
  void element(const Element& e);
  std::string str() && { return std::move(out_); }
  const std::string& str() const& { return out_; }

 private:
  void startTag(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs);
  void attribute(std::string_view k, std::string_view v);
  void pad();
  std::string indent_, eol_, out_;
  std::vector<std::string> stack_;
};

std::string escape(std::string_view s);  // for attribute values and text

}  // namespace xr::xml
