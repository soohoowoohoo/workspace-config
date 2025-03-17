HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz vcs_info

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )

setopt prompt_subst
setopt inc_append_history
setopt HIST_IGNORE_DUPS
zstyle ':vcs_info:git:*' formats '(%b)'

bindkey -v  # add command-line vi bindings
bindkey "^R" history-incremental-search-backward

export CLICOLOR=true
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

NEWLINE=$'\n'
# Below is how to get a newline in zsh
# echo "%{\n%}"
# 
# Possibly also this
# %{$'\n'%}
CURRENT_DIRECTORY="%F{cyan}[%~]%f"
GIT_INFO="%F{green}\$vcs_info_msg_0_%f"
# PS1="${CURRENT_DIRECTORY} ${GIT_INFO}${NEWLINE}%m: %n%# "
# PS1="${CURRENT_DIRECTORY} ${GIT_INFO}${NEWLINE}%n%# %F{green}>%f "
PS1="${CURRENT_DIRECTORY} ${GIT_INFO}${NEWLINE}%F{green}>%f "

# KUBE_PS1 additional settings
# KUBE_PS1_SUFFIX=")%{\n%}"
# PS1='$(kube_ps1)'$PS1
