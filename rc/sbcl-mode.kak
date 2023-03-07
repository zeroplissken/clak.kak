############################
# defines a lisp/sbcl mode #
# and some keymappings     #
############################

source "rc/clak.kak"

declare-user-mode sbcl

map window normal <a-l> %{: enter-user-mode sbcl <ret> }
map window normal <a-s> %{: select-sexpr <ret> }
map window sbcl s %{: sbcl-start <ret> }
map window sbcl Q %{: sbcl-kill <ret>}
