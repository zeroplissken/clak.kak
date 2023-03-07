#################################
# a bunch of common lisp things #
#################################

declare-user-mode sbcl

define-command -hidden send-newline-char %{
	evaluate-commands -save-regs n %{
    	execute-keys -draft ge"ny
    	repl-send-text %reg{n}
	}
}

define-command select-expr -docstring 'convenient parens object selection' %{
    execute-keys <a-a>b 
}

define-command sbcl-start -docstring 'start REPL and launch SBCL with current file' %{
    evaluate-commands %{
        repl-new sbcl --noinform --load %val{buffile}
    }
}

define-command sbcl-kill -docstring 'closes SBCL and REPL window' %{
	repl-send-text (quit)
	send-newline-char
}

define-command sbcl-send-expr -docstring 'sends form under cursor to SBCL' %{
    evaluate-commands -save-regs l %{
		try %{ select-expr }
		execute-keys -draft %{"ly}
		repl-send-text %reg{l}
		send-newline-char
	}
}

define-command sbcl-reload-file -docstring 'reload current file in SBCL'  %{
	repl-send-text ":ld %val{buffile}"
	send-newline-char
    
}

define-command sbcl-compile-file -docstring 'compile current file in SBCL' %{
    repl-send-text ":cload %val{buffile}"
    send-newline-char
}

define-command sbcl-describe-symbol -docstring 'view description of symbol under cursor' %{
    evaluate-commands -save-regs f %{
        execute-keys -draft be"fy
        repl-send-text "(describe '%reg{f})"
        send-newline-char
    }
}
