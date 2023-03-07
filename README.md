# clak.kak
## Common Lisp (of the Steel Bank kind) Accessiblity (in the way of features and commands for) Kakoune
Disclaimer: this is very much WIP and I'm also stupid, use at your own risk

I mostly use CL for generative/algorithmic art right now, and so my needs
are probably a lot less than most CL developers. On the other hand, most CL developers use
Emacs so this little set doesn't matter too much. However, if you(like me) already use Kakoune
and later found an interest in CL, then maybe this will be of some use.

Currently only consists of some simple commands which use Kak's `repl-new` and `repl-send-text`
to control SBCL in another terminal window. Basically these commands streamline copy and pasting
chunks of code(SLIME this is not). In addition to being something my tired brain can grok, I
think this paradigm fits in well with the spirit of Kakoune by not trying to shoehorn a common
lisp REPL into a text editor.

## Usage
Install like you would literally any other plugin for kakoune. Then you'll want to map some commands.
I declare a usermode `sbcl` and toss everything in that inside a hook for lisp files.

`bundle https://github.com/zeroplissken/clak.kak
bundle-config clak.kak %{
    hook global WinSetOption filetype=lisp %{
        declare-user-mode sbcl
		map buffer normal <a-s> ':select-expr<ret>'
        map buffer sbcl -docstring 'start SBCL REPL' S ': sbcl-start<ret>'
        map buffer sbcl -docstring 'stop SBCL REPL and close terminal' Q ': sbcl-kill<ret>'
        map buffer sbcl -docstring 'send form under cursor to SBCL' l ': sbcl-send-expr<ret>'
        map buffer sbcl -docstring 'reload current file in SBCL' r ': sbcl-reload-file<ret>'
        map buffer sbcl -docstring 'view description of symbol under cursor' d ': sbcl-describe-symbol<ret>'

        map buffer normal -docstring 'SBCL mode' <a-l> ': enter-user-mode sbcl<ret>'
    }
}`

## Commands

- `sbcl-start`: starts the repl and loads the current file in SBCL
- `sbcl-kill`: quits SBCL and closes the repl
- `sbcl-send-expr`: sends the lisp form underneath the cursor to SBCL for evaluation
- `sbcl-reload-file`: reloads the current file in SBCL
- `sbcl-compile-file`: compile the current file
- `sbcl-describe-symbol`: describes the symbol under the cursor
- `select-expr`: selects the expression under the cursor. Repeat to expand.
