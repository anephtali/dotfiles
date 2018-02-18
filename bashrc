export EDITOR=vi
export VISUAL=vi
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
export PATH="/usr/lib/ccache:$PATH"
