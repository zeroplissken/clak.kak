#################################
# a bunch of common lisp things #
#################################

declare-user-mode lisp

define-command boot-sbcl %{
    evaluate-commands %{
        repl-new sbcl --noinform --load %val{buffile}
    }
}

define-command kill-sbcl %{
    evaluate-commands -save-regs n %{
        execute-keys -draft ge"ny
		repl-send-text (quit)
        repl-send-text %reg{n}
    }
}

define-command select-sexpr -docstring 'convenient parens object selection' %{
    execute-keys <a-a>b 
}

define-command send-to-sbcl %{
    evaluate-commands -save-regs l %{
		try %{ select-sexpr }
		execute-keys -draft %{"ly}
		repl-send-text %reg{l}
		evaluate-commands -save-regs n %{
    		execute-keys -draft ge"ny
			repl-send-text %reg{n}
		}
    }
}

define-command reload-sbcl %{
    evaluate-commands -save-regs n %{
        execute-keys -draft ge"ny
		repl-send-text ":ld %val{buffile} %reg{n}"
    }
}
map buffer lisp l -docstring 'start SBCL loading current file' %{<esc>: boot-sbcl <ret>}
map buffer lisp c -docstring 'send expression to REPL' %{<esc>: send-to-sbcl <ret>}
map buffer lisp b -docstring 'reload file in SBCL' %{<esc>: reload-sbcl <ret>}
map buffer lisp Q -docstring 'kill the SBCL REPL' %{<esc>: kill-sbcl <ret>}
map buffer lisp s -docstring 'select parens object, repeat to expand' %{<esc>: select-sexpr <ret>} 

map buffer normal <a-l> %{: enter-user-mode<space>lisp<ret>}
map buffer normal <a-s> %{: select-sexpr<ret>}

