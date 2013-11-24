#!/bin/bash
#
# See README.md for further details.
#
PREVIOUS_HEAD=$1
NEW_HEAD=$2
BRANCH_SWITCH=$3
NEW_BRANCH=$(git rev-parse --abbrev-ref HEAD)
AUTHORMAIL=$(git config --get user.email)
AUTHOR=$(git config --get user.name)
TEAMFILE=team

if [[ -e $TEAMFILE ]]
then
    $TEAM=source $TEAMFILE
fi

function notify {
    $BUG=$1
    $CONTENTS="
        $AUTHOR is working on bug $BUG

        https://bugzilla.redhat.com/show_bug.cgi?id=$BUG
    "
    echo $CONTENTS | mail -s "$AUTHOR works on $BUG" $TEAM
}


#
# If we don't checkout a new branch, but stay on the branch, bail out.
#
if [[ $PREVIOUS_HEAD == $NEW_HEAD ]]
then
    exit 0
fi


if [[ $NEW_BRANCH =~ bug_[[:digit:]]+ ]]
then
    BUG=$(expr match $NEW_BRANCH 'bug_[0-9]+')
    echo "Working on bug: $NEW_BRANCH"
else
    echo "Ignored"
fi
