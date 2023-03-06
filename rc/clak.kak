#################################
# a bunch of common lisp things #
#################################

declare-user-mode lisp

define-command -hidden send-newline-char %{
	evaluate-commands -save-regs n %{
    	execute-keys -draft ge"ny
    	repl-send-text %reg{n}
	}
}

define-command start-sbcl -docstring 'start REPL and launch SBCL with current file' %{
    evaluate-commands %{
        repl-new sbcl --noinform --load %val{buffile}
    }
}

define-command kill-sbcl -docstring 'closes SBCL and REPL window' %{
	repl-send-text (quit)
	send-newline-char
    }
}

define-command select-sexpr -docstring 'convenient parens object selection' %{
    execute-keys <a-a>b 
}

define-command send-to-sbcl -docstring 'sends s-expression under cursor to SBCL' %{
    evaluate-commands -save-regs l %{
		try %{ select-sexpr }
		execute-keys -draft %{"ly}
		repl-send-text %reg{l}
		send-newline-char
		}
    }
}

define-command reload-sbcl -docstring 'reload current file in SBCL'  %{
    evaluate-commands -save-regs n %{
        execute-keys -draft ge"ny
		repl-send-text ":ld %val{buffile} %reg{n}"
    }
}


