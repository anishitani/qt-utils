GIT_VERSION = $$system( git describe --tags --long --match "v[0-9]*" )

GIT_MAJOR = $$GIT_VERSION
GIT_MAJOR ~= s/v/
GIT_MAJOR ~= s/\..*/

GIT_MINOR = $$GIT_VERSION
GIT_MINOR ~= s/v[0-9]*\./
GIT_MINOR ~= s/\.[0-9]*\-.*/

GIT_BUILD = $$GIT_VERSION
GIT_BUILD ~= s/v[0-9]*\.[0-9]*\./
GIT_BUILD ~= s/\-.*/

VERSION= $$GIT_MAJOR'.'$$GIT_MINOR'.'$$GIT_BUILD
DEFINES += APP_VERSION=\\\"$$VERSION\\\"

message( [ $$TARGET ]     Template:   $$TEMPLATE  )
message( [ $$TARGET ]     Version:    $$VERSION   )
