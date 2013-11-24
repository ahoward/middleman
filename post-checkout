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
TEAMFILE='.git/hooks/team'

#
# Sends an e-mail to participants defined in $TEAMFILE
#
function notify {
    BUG=$(expr $1 : 'bug_\([[:digit:]]\+\)')
    CONTENTS="
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
    #
    # Warn the user that we need a team file if we want to notify
    # participants.
    #
    if [[ ! -e $TEAMFILE ]]
    then
        echo "
You need a file called 'team' in your .git/hooks directory to use the

    post-checkout.sh

hook."

    else
        source $TEAMFILE
    fi
    notify $BASH_REMATCH
else
    exit 0
fi
