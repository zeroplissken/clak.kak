# clak.kak
## Common Lisp (meaning SBCL) Accessiblity (in the way of features and commands for) Kakoune

ok defun poo blah blah
...
sweet alright so g h x shift j j j j j y ok now where'd I leave my little rappel thingy...
ah here we go ok middle click aaaaand ENTER! sweet back to kak
...
man this workflow _sucks_ maybe I should do something to make it flow like my new sink does

In all seriousness I mostly use CL for generative/algorithmic art right now, and so my needs
are probably a lot less than most CL developers. On the other hand, most CL developers use
Emacs so this little set doesn't matter too much. However, if you(like me) already use Kakoune
and then have an interest in CL, then maybe this will be of some use.

Currently only consists of some simple commands which use Kak's `repl-new` and `repl-send-text`
to start, end and control SBCL in a separate terminal window. I'm satisfied with this for the
most part, as I feel this method keeps in line with the Kakoune philosophy and doesn't try to
shoehorn a common lisp REPL into a text editor. ymmv.
