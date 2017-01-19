######################### QT VERSION #########################
## Script to extract the version from Git tags with the     ##
## pattern v<MAJOR>[[.<MINOR>].<BUILD>]                     ##
##############################################################

defineReplace(GitTagVersion){
    GIT_VERSION = $$system( cd $$1 && git describe --tags --long --match "v[0-9]*" )

    GIT_MAJOR = $$GIT_VERSION
    GIT_MAJOR ~= s/v/
    GIT_MAJOR ~= s/\..*/
    isEmpty(GIT_MAJOR){
        GIT_MAJOR = 0
    }

    GIT_MINOR = $$GIT_VERSION
    GIT_MINOR ~= s/v[0-9]*\./
    GIT_MINOR ~= s/\.[0-9]*\-.*/
    !isEmpty(GIT_MINOR){
        GIT_MINOR = '.'$$GIT_MINOR
    }

    GIT_BUILD = $$GIT_VERSION
    GIT_BUILD ~= s/v[0-9]*\.[0-9]*\./
    GIT_BUILD ~= s/\-.*/
    !isEmpty(GIT_BUILD){
        GIT_BUILD = '.'$$GIT_BUILD
    }

    VERSION = $$GIT_MAJOR$$GIT_MINOR$$GIT_BUILD

    return($$VERSION)
}

