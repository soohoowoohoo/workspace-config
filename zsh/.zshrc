HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst
setopt inc_append_history
zstyle ':vcs_info:git:*' formats '(%b)'

NEWLINE=$'\n'
PS1="%F{cyan}[%d]%f %F{green}\$vcs_info_msg_0_%f${NEWLINE}%m: %n%# "
