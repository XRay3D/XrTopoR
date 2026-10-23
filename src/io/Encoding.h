#pragma once
#include <string>

namespace xr::io {

bool isValidUtf8(const std::string& s);
std::string cp1251ToUtf8(const std::string& s);
std::string utf8ToCp1251(const std::string& s);
// Returns s if it is valid UTF-8, otherwise decodes it as CP1251.
std::string toUtf8(const std::string& s);

}  // namespace xr::io
