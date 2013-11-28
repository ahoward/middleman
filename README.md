middleman
=========

A simple web app which will handle the communication between peers. It
consists of two components:

    * the middleman which manages communication
    * githook - which transmit and checks what is being worked on to
      avoid collision of work.

post-checkout
-------------

# Warning
This hook sends e-mail whenever you checkout a branch - even if it's the
same one. So keep that in mind.

### Installation

Rename to `post-checkout`, make it executable and stick it into your
projects `.git/hooks/` directory. Create an additional file `team` in
the same `.git/hooks/` directory and add your team members like this:

    TEAM="frob@foo.com fred@bar.com"

It will be source by the script and handed over to the mail command.

The script matches `bug_XXXXX` anywhere in the branch name. It will
display a message when it notifies participants:

    Notify frob@foo.com fred@bar.com that you work on #XXXXX


### Motivation

When working with an international team, you may have situations where
team members end up working on the same solution. Usually your issue
tracker should prevent this, by people following a process (e.g.
assigning tickets).
Sometimes this fails tho, since the we think we can quickly fix the
problem. Most of the time, it still takes a while to implement the
solution/fix/update and that's when potentially people might work on
the same solution

### Implementation Notes

This hook matches on a Bugzilla bug number and sends out an e-mail to
it's participants. The included information is used to notify each
participant on what is being worked on.

### Future Idea

Potentially communicating with a web app which serves as the
communication middle man would make it easier to maintain the logic (my
Bash is not very fluent).

Furthermore, it could display a note for the developer when he switches
branches with the same bug number to warn him, that it is being worked
on this bug.
