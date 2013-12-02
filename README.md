middleman
=========

A simple web app and git hook preventing conflict of work between
distributed teams/peers.

There are two components:

* the middleman which manages communication
* githook - which transmit and checks what is being worked on to
  avoid collision of work.

Motivation
----------

This solves two problems:

* Most information you have in your repository is not shared but some
  you may want to share with your colleagues.
* Sometimes you are quicker having the bug fixed/reproduced than
  assigning tickets or following processes. Let software do that for
  you.

This software simply adds another redundancy point when tracking issue
assignees.

Installation
------------

1. Deploy the rails app. (currently tested with ruby 1.8.7)
1. Move the `post-checkout` githook into your projects `.git/hooks`
   directory.
1. Configure the URL to the rails app, (e.g. if it's deployed on the
   same server):

        git config --global middleman.address 'http://localhost:3000'

1. Create a branch with a `bug_XXXX` sub-string. Every successful post
   to the rails app will respond with a:

        middleman: foo@bar.com => #231224
