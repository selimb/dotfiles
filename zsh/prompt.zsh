autoload colors && colors

# get the name of the branch we are on
function git_prompt_info() {
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# Only show host name if on Guillimin supercomputer, in which case show
# "guillimin" instead of the random node.
function dothost ()
{
    if [ $GUILLIMIN_JOB_NODE ]; then
        out="guillimin*"
    elif [ $GUILLIMIN ]; then
        out="guillimin"
    else
        if [ $host ]; then
            out=$host
        else
            out="$(hostname)"
        fi
    fi
    echo "$out"
}

function virtualenv_info ()
{
  venv_info=" using %{$fg[yellow]%}"
  if [ $VIRTUAL_ENV ]; then
    echo "$venv_info"`basename $VIRTUAL_ENV`
  elif [ $CONDA_DEFAULT_ENV ]; then
    echo "$venv_info$CONDA_DEFAULT_ENV"
  fi
}
export VIRTUAL_ENV_DISABLE_PROMPT=1

function git_prompt ()
{
    STATUS="$(git_prompt_info)"
    echo "$STATUS"
}

ZSH_THEME_GIT_PROMPT_PREFIX=' on '%{$fg[magenta]%}
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="?"
ZSH_THEME_GIT_PROMPT_STASHED="$"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
PROMPT=$'\n'
PROMPT+='%{$fg[cyan]%}%n%{$reset_color%}'
PROMPT+=' at %{$fg[blue]%}$(dothost)%{$reset_color%}'
PROMPT+=' in %{$fg[green]%}${PWD/#$HOME/~}%b%{$reset_color%}'
PROMPT+='$(git_prompt)%{$reset_color%}'
PROMPT+='$(virtualenv_info) %{$reset_color%}'
PROMPT+=' % '$'\n%{$reset_color%}'
PROMPT+='%{$fg[red]%}%(?,,[%?] )%{$reset_color%}'
PROMPT+='$ '
RPROMPT=''

