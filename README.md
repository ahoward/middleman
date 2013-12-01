middleman
=========

A simple web app which will handle the communication between peers. It
consists of two components:

    * the middleman which manages communication
    * githook - which transmit and checks what is being worked on to
      avoid collision of work.

Installation
------------

1. Deploy the rails app.
1. Move the `post-checkout` githook into your projects `.git/hooks`
   directory.
1. Configure the URL to the rails app, (e.g. if it's deployed on the
   same server):

        git config --global middleman.address 'http://localhost:3000'

1. Create a branch with a `bug_XXXX` sub-string. Every successful post
   to the rails app will respond with a:

        middleman: foo@bar.com => #231224
