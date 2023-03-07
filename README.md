# clak.kak
## Common Lisp (meaning SBCL) Accessiblity (in the way of features and commands for) Kakoune

I mostly use CL for generative/algorithmic art right now, and so my needs
are probably a lot less than most CL developers. On the other hand, most CL developers use
Emacs so this little set doesn't matter too much. However, if you(like me) already use Kakoune
and then have an interest in CL, then maybe this will be of some use.

Currently only consists of some simple commands which use Kak's `repl-new` and `repl-send-text`
to start, end and control SBCL in a separate terminal window. I'm satisfied with this for the
most part, as I feel this method keeps in line with the Kakoune philosophy and doesn't try to
shoehorn a common lisp REPL into a text editor. ymmv.
