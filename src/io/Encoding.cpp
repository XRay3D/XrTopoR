#include "io/Encoding.h"

#include <cstdint>

namespace xr::io {

// Unicode code points for CP1251 bytes 0x80..0xBF (0xC0..0xFF map to U+0410..U+044F).
static const std::uint16_t kCp1251High[64] = {
    0x0402, 0x0403, 0x201A, 0x0453, 0x201E, 0x2026, 0x2020, 0x2021, 0x20AC, 0x2030, 0x0409, 0x2039, 0x040A,
    0x040C, 0x040B, 0x040F, 0x0452, 0x2018, 0x2019, 0x201C, 0x201D, 0x2022, 0x2013, 0x2014, 0x0000, 0x2122,
    0x0459, 0x203A, 0x045A, 0x045C, 0x045B, 0x045F, 0x00A0, 0x040E, 0x045E, 0x0408, 0x00A4, 0x0490, 0x00A6,
    0x00A7, 0x0401, 0x00A9, 0x0404, 0x00AB, 0x00AC, 0x00AD, 0x00AE, 0x0407, 0x00B0, 0x00B1, 0x0406, 0x0456,
    0x0491, 0x00B5, 0x00B6, 0x00B7, 0x0451, 0x2116, 0x0454, 0x00BB, 0x0458, 0x0405, 0x0455, 0x0457};

static std::uint32_t cpToUnicode(unsigned char c) {
  if (c < 0x80) return c;
  if (c >= 0xC0) return 0x0410 + (c - 0xC0);
  return kCp1251High[c - 0x80];
}

static void appendUtf8(std::string& out, std::uint32_t cp) {
  if (cp < 0x80) out += char(cp);
  else if (cp < 0x800) { out += char(0xC0 | (cp >> 6)); out += char(0x80 | (cp & 0x3F)); }
  else { out += char(0xE0 | (cp >> 12)); out += char(0x80 | ((cp >> 6) & 0x3F)); out += char(0x80 | (cp & 0x3F)); }
}

bool isValidUtf8(const std::string& s) {
  size_t i = 0, n = s.size();
  while (i < n) {
    unsigned char c = s[i];
    int len = c < 0x80 ? 1 : (c >> 5) == 6 ? 2 : (c >> 4) == 14 ? 3 : (c >> 3) == 30 ? 4 : 0;
    if (!len || i + len > n) return false;
    for (int k = 1; k < len; ++k)
      if ((static_cast<unsigned char>(s[i + k]) >> 6) != 2) return false;
    i += len;
  }
  return true;
}

std::string cp1251ToUtf8(const std::string& s) {
  std::string out;
  out.reserve(s.size() * 2);
  for (unsigned char c : s) {
    std::uint32_t cp = cpToUnicode(c);
    if (cp) appendUtf8(out, cp);
  }
  return out;
}

std::string utf8ToCp1251(const std::string& s) {
  std::string out;
  size_t i = 0;
  while (i < s.size()) {
    unsigned char c = s[i];
    std::uint32_t cp;
    if (c < 0x80) { cp = c; i += 1; }
    else if ((c >> 5) == 6 && i + 1 < s.size()) { cp = ((c & 0x1F) << 6) | (s[i + 1] & 0x3F); i += 2; }
    else if ((c >> 4) == 14 && i + 2 < s.size()) { cp = ((c & 0x0F) << 12) | ((s[i + 1] & 0x3F) << 6) | (s[i + 2] & 0x3F); i += 3; }
    else { i += 1; out += '?'; continue; }
    if (cp < 0x80) { out += char(cp); continue; }
    if (cp >= 0x0410 && cp <= 0x044F) { out += char(0xC0 + (cp - 0x0410)); continue; }
    char r = '?';
    for (int k = 0; k < 64; ++k)
      if (kCp1251High[k] == cp) { r = char(0x80 + k); break; }
    out += r;
  }
  return out;
}

std::string toUtf8(const std::string& s) { return isValidUtf8(s) ? s : cp1251ToUtf8(s); }

}  // namespace xr::io
