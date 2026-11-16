# The version header (generated/xr/Version.h), written at every build by the target xr_version: the project's
# version, the branch or tag and the commit built (CI passes GIT_REF_NAME and GIT_SHA, as GERBER_X3's does; a
# local build asks git), `git describe` with -dirty for a changed tree, the date the build was configured.
# configure_file leaves the file alone when nothing changed, so nothing is compiled again for it.
#
# cmake -DSRC_DIR=... -DOUT=... -DVERSION=... [-DGIT_REF_NAME=...] [-DGIT_SHA=...] -DBUILD_DATE=... -P Version.cmake

set(ref "${GIT_REF_NAME}")
set(sha "${GIT_SHA}")
set(describe "")
find_program(XR_GIT git)
if(XR_GIT AND EXISTS "${SRC_DIR}/.git")
  execute_process(COMMAND "${XR_GIT}" describe --tags --always --dirty WORKING_DIRECTORY "${SRC_DIR}"
                  OUTPUT_VARIABLE describe OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
  if(NOT ref)
    execute_process(COMMAND "${XR_GIT}" rev-parse --abbrev-ref HEAD WORKING_DIRECTORY "${SRC_DIR}"
                    OUTPUT_VARIABLE ref OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
  endif()
  if(NOT sha)
    execute_process(COMMAND "${XR_GIT}" rev-parse HEAD WORKING_DIRECTORY "${SRC_DIR}"
                    OUTPUT_VARIABLE sha OUTPUT_STRIP_TRAILING_WHITESPACE ERROR_QUIET)
  endif()
endif()

# The version as shown: a tag's own name ("0.1", "0.1-3-gabc1234-dirty") when described from one, else the project's
# with the commit ("0.1.0+abc1234-dirty").
if(describe MATCHES "^[0-9]+\\.[0-9]+")
  set(full "${describe}")
elseif(describe)
  set(full "${VERSION}+${describe}")
elseif(sha)
  string(SUBSTRING "${sha}" 0 7 short)
  set(full "${VERSION}+${short}")
else()
  set(full "${VERSION}")
endif()

configure_file("${CMAKE_CURRENT_LIST_DIR}/Version.h.in" "${OUT}" @ONLY)
