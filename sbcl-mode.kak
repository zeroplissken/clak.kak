############################
# defines a lisp/sbcl mode #
# and some keymappings     #
############################

try %{ source "%val{config}/local/clak.kak/rc/clak.kak" }

declare-user-mode sbcl

map buffer sbcl S -docstring 'start SBCL REPL' ':sbcl-start<ret>' 
map buffer sbcl Q -docstring 'quit SBCL and close REPL' ':sbcl-kill<ret>'
map buffer sbcl l -docstring 'send selected expressions to SBCL' ':sbcl-send-expr<ret>'
map buffer sbcl s -docstring 'select expression under cursor. Repeat to expand out.' ':select-expr<ret>'
map buffer sbcl d -docstring 'describe symbol under cursor' ':sbcl-describe-symbol<ret>'

map buffer normal <a-l> ':enter-user-mode sbcl<ret>'
