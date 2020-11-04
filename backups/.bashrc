# Doc: https://www.gnu.org/software/bash/manual/bash.pdf

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# ----------- shell history related
COMMONIGNORE="clear:tmux:pwd:du:df"
ALIASIGNORE="t:c:tks:ttt"
GITIGNORE="gch:master:gpull:gpush"
export HISTIGNORE="$COMMONIGNORE:$ALIASIGNORE:$GITIGNORE"

# TODO: give more try to keep zsh and bash history epoch stamp in sync
# export HISTTIMEFORMAT=": %s:0;"           # this is just about display, however time is always stored as epoch in the file like:
                                            # `# 159454837

HISTSIZE=100000                            # limits the number of commands shown by the command history; default:500
HISTFILESIZE=100000                       # limits the number of commands which can be saved in $HISTFILE; default:500

# HISTCONTROL=ignoredups                  # ignoredups causes lines matching the previous history entry to not be saved
# HISTCONTROL=erasedups                   # erasedups causes lines matching the previous history entry to not be saved
# HISTCONTROL=ignorespace                 # ignoredups causes to ignore commands starting with whitespace
# HISTCONTROL=ignoreboth                  # don't put duplicate lines or lines starting with space
                                          # in the history; 
                                          # ignoreboth == shorthand for `ignorespace` and `ignoredups`
HISTCONTROL=ignorespace:erasedups         # until I clean all duplicates; after that I'll think about `ignoredups`
shopt -s histappend                         # append to the history file, don't overwrite it
shopt -s cmdhist                            # multiline commands are a single command in history
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Ref:
# - HISTFILE vs HISTFILESIZE
#   - https://stackoverflow.com/questions/19454837/bash-histsize-vs-histfilesize
# - HISTCONTROL (everything I wanted)
#   - https://unix.stackexchange.com/questions/163371/how-long-do-the-contents-of-the-bash-history-file-last
# - PROMPT_COMMAND (everything I wanted)
#   - https://unix.stackexchange.com/questions/18212/bash-history-ignoredups-and-erasedups-setting-conflict-with-common-history

# -------------

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm|xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    if [[ ${EUID} == 0 ]] ; then
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\h\[\033[01;34m\] \W \$\[\033[00m\] '
    else
        PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '
    fi
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \w \$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi


## custom common shell configs
if [ -f ~/.commonrc ]; then
          . ~/.commonrc
fi

# added by Anaconda3 installer
export PATH="~/anaconda3/bin:$PATH"
export PATH="~/miniconda3/bin:$PATH"
#export PATH="/usr/bin":$PATH  # set python2 default

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
# added by Miniconda3 4.5.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/home/toran/miniconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/toran/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/toran/miniconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/toran/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
