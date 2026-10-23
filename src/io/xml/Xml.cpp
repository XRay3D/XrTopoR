#include "io/xml/Xml.h"

#include <cctype>
#include <charconv>
#include <cstdlib>

namespace xr::xml {

bool Element::has(std::string_view a) const {
  for (auto& [k, v] : attrs)
    if (k == a) return true;
  return false;
}

std::string_view Element::attr(std::string_view a, std::string_view def) const {
  for (auto& [k, v] : attrs)
    if (k == a) return v;
  return def;
}

double Element::num(std::string_view a, double def) const {
  std::string_view v = attr(a);
  if (v.empty()) return def;
  double d = def;
  auto r = std::from_chars(v.data(), v.data() + v.size(), d);
  if (r.ec != std::errc{}) return std::strtod(std::string(v).c_str(), nullptr);
  return d;
}

bool Element::flag(std::string_view a, bool def) const {
  std::string_view v = attr(a);
  if (v.empty()) return def;
  return v == "on" || v == "true" || v == "1" || v == "yes";
}

const Element* Element::find(std::string_view n) const {
  for (auto& k : kids)
    if (k.name == n) return &k;
  return nullptr;
}

std::vector<const Element*> Element::findAll(std::string_view n) const {
  std::vector<const Element*> r;
  for (auto& k : kids)
    if (k.name == n) r.push_back(&k);
  return r;
}

const Element* Element::path(std::initializer_list<std::string_view> names) const {
  const Element* e = this;
  for (auto n : names) {
    e = e->find(n);
    if (!e) return nullptr;
  }
  return e;
}

namespace {

struct Parser {
  std::string_view s;
  size_t i = 0;
  int line = 1;
  std::string err;

  bool eof() const { return i >= s.size(); }
  char peek(size_t k = 0) const { return i + k < s.size() ? s[i + k] : '\0'; }
  bool startsWith(std::string_view t) const { return s.substr(i, t.size()) == t; }
  void advance(size_t n) {
    for (size_t k = 0; k < n && i < s.size(); ++k, ++i)
      if (s[i] == '\n') ++line;
  }
  void skipSpace() {
    while (!eof() && (s[i] == ' ' || s[i] == '\t' || s[i] == '\r' || s[i] == '\n')) advance(1);
  }
  bool fail(const std::string& m) {
    if (err.empty()) err = "xml: " + m + " at line " + std::to_string(line);
    return false;
  }
  static bool nameChar(char c) {
    return std::isalnum(static_cast<unsigned char>(c)) || c == '_' || c == '-' || c == '.' || c == ':' ||
           static_cast<unsigned char>(c) >= 0x80;
  }
  std::string_view readName() {
    size_t b = i;
    while (!eof() && nameChar(s[i])) ++i;
    return s.substr(b, i - b);
  }

  static void appendUtf8(std::string& out, unsigned long cp) {
    auto cont = [&](int shift) { out += char(0x80 | ((cp >> shift) & 0x3F)); };
    if (cp < 0x80) {
      out += char(cp);
    } else if (cp < 0x800) {
      out += char(0xC0 | (cp >> 6));
      cont(0);
    } else if (cp < 0x10000) {
      out += char(0xE0 | (cp >> 12));
      cont(6);
      cont(0);
    } else {
      out += char(0xF0 | (cp >> 18));
      cont(12);
      cont(6);
      cont(0);
    }
  }

  // Decodes entity references in raw character data.
  static std::string decode(std::string_view raw) {
    if (raw.find('&') == std::string_view::npos) return std::string(raw);
    std::string out;
    out.reserve(raw.size());
    for (size_t k = 0; k < raw.size(); ++k) {
      if (raw[k] != '&') { out += raw[k]; continue; }
      size_t semi = raw.find(';', k);
      if (semi == std::string_view::npos) { out += raw[k]; continue; }
      std::string_view ent = raw.substr(k + 1, semi - k - 1);
      if (ent == "amp") out += '&';
      else if (ent == "lt") out += '<';
      else if (ent == "gt") out += '>';
      else if (ent == "quot") out += '"';
      else if (ent == "apos") out += '\'';
      else if (!ent.empty() && ent[0] == '#') {
        bool hex = ent.size() > 1 && (ent[1] == 'x' || ent[1] == 'X');
        unsigned long cp = std::strtoul(std::string(ent.substr(hex ? 2 : 1)).c_str(), nullptr, hex ? 16 : 10);
        appendUtf8(out, cp);
      } else {
        out += raw.substr(k, semi - k + 1);  // unknown entity: keep verbatim
      }
      k = semi;
    }
    return out;
  }

  // Skips comments, processing instructions and the declaration between elements.
  bool skipMisc() {
    for (;;) {
      skipSpace();
      if (startsWith("<!--")) {
        size_t e = s.find("-->", i);
        if (e == std::string_view::npos) return fail("unterminated comment");
        advance(e + 3 - i);
      } else if (startsWith("<?")) {
        size_t e = s.find("?>", i);
        if (e == std::string_view::npos) return fail("unterminated processing instruction");
        advance(e + 2 - i);
      } else if (startsWith("<!DOCTYPE")) {
        size_t e = s.find('>', i);  // internal subsets are not supported
        if (e == std::string_view::npos) return fail("unterminated DOCTYPE");
        advance(e + 1 - i);
      } else {
        return true;
      }
    }
  }

  bool parseElement(Element& el) {
    if (peek() != '<') return fail("expected '<'");
    advance(1);
    el.name = std::string(readName());
    if (el.name.empty()) return fail("expected element name");
    for (;;) {
      skipSpace();
      if (eof()) return fail("unexpected end of file in tag");
      if (peek() == '/') {
        advance(1);
        if (peek() != '>') return fail("expected '>'");
        advance(1);
        return true;
      }
      if (peek() == '>') { advance(1); break; }
      std::string_view an = readName();
      if (an.empty()) return fail("bad attribute");
      skipSpace();
      if (peek() != '=') return fail("expected '='");
      advance(1);
      skipSpace();
      char q = peek();
      if (q != '"' && q != '\'') return fail("expected quoted attribute value");
      advance(1);
      size_t e = s.find(q, i);
      if (e == std::string_view::npos) return fail("unterminated attribute value");
      std::string_view raw = s.substr(i, e - i);
      advance(e + 1 - i);
      el.attrs.emplace_back(std::string(an), decode(raw));
    }
    // Content
    for (;;) {
      if (eof()) return fail("unexpected end of file in element " + el.name);
      if (peek() == '<') {
        if (startsWith("</")) {
          advance(2);
          std::string_view n = readName();
          if (n != el.name) return fail("mismatched closing tag </" + std::string(n) + "> for <" + el.name + ">");
          skipSpace();
          if (peek() != '>') return fail("expected '>'");
          advance(1);
          return true;
        }
        if (startsWith("<!--")) {
          size_t e = s.find("-->", i);
          if (e == std::string_view::npos) return fail("unterminated comment");
          advance(e + 3 - i);
        } else if (startsWith("<![CDATA[")) {
          size_t e = s.find("]]>", i);
          if (e == std::string_view::npos) return fail("unterminated CDATA");
          el.text += s.substr(i + 9, e - i - 9);
          advance(e + 3 - i);
        } else if (startsWith("<?")) {
          size_t e = s.find("?>", i);
          if (e == std::string_view::npos) return fail("unterminated processing instruction");
          advance(e + 2 - i);
        } else {
          el.kids.emplace_back();
          if (!parseElement(el.kids.back())) return false;
        }
      } else {
        size_t e = s.find('<', i);
        if (e == std::string_view::npos) e = s.size();
        std::string_view raw = s.substr(i, e - i);
        // Whitespace-only runs between child elements are formatting, not data.
        if (raw.find_first_not_of(" \t\r\n") != std::string_view::npos) el.text += decode(raw);
        advance(e - i);
      }
    }
  }
};

}  // namespace

std::expected<Element, std::string> parse(std::string_view text) {
  Parser p;
  p.s = text;
  if (text.substr(0, 3) == "\xEF\xBB\xBF") p.i = 3;
  if (!p.skipMisc()) return std::unexpected(p.err);
  if (p.eof()) return std::unexpected(std::string("xml: empty document"));
  Element root;
  if (!p.parseElement(root)) return std::unexpected(p.err);
  return root;
}

std::string escape(std::string_view s) {
  std::string out;
  out.reserve(s.size());
  for (char c : s) {
    switch (c) {
      case '&': out += "&amp;"; break;
      case '<': out += "&lt;"; break;
      case '>': out += "&gt;"; break;
      case '"': out += "&quot;"; break;
      default: out += c;
    }
  }
  return out;
}

void Writer::pad() {
  for (size_t k = 0; k < stack_.size(); ++k) out_ += indent_;
}

void Writer::declaration(std::string_view encoding) {
  out_ += "<?xml version=\"1.0\" encoding=\"";
  out_ += encoding;
  out_ += "\"?>";
  out_ += eol_;
}

void Writer::comment(std::string_view text) {
  pad();
  out_ += "<!--";
  out_ += text;
  out_ += "-->";
  out_ += eol_;
}

void Writer::startTag(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs) {
  pad();
  out_ += '<';
  out_ += name;
  for (auto& [k, v] : attrs) attribute(k, v);
}

void Writer::attribute(std::string_view k, std::string_view v) {
  out_ += ' ';
  out_ += k;
  out_ += "=\"";
  out_ += escape(v);
  out_ += '"';
}

void Writer::emptyList(std::string_view name, const std::vector<std::pair<std::string, std::string>>& attrs) {
  startTag(name, {});
  for (auto& [k, v] : attrs) attribute(k, v);
  out_ += "/>";
  out_ += eol_;
}

void Writer::open(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs) {
  startTag(name, attrs);
  out_ += '>';
  out_ += eol_;
  stack_.emplace_back(name);
}

void Writer::close() {
  if (stack_.empty()) return;
  std::string name = std::move(stack_.back());
  stack_.pop_back();
  pad();
  out_ += "</";
  out_ += name;
  out_ += '>';
  out_ += eol_;
}

void Writer::empty(std::string_view name, std::initializer_list<std::pair<std::string_view, std::string_view>> attrs) {
  startTag(name, attrs);
  out_ += "/>";
  out_ += eol_;
}

void Writer::textElement(std::string_view name, std::string_view text) {
  pad();
  out_ += '<';
  out_ += name;
  out_ += '>';
  out_ += escape(text);
  out_ += "</";
  out_ += name;
  out_ += '>';
  out_ += eol_;
}

}  // namespace xr::xml
