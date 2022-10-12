# Docs: 
# - http://zsh.sourceforge.net/Doc/zsh_us.pdf
# - http://zsh.sourceforge.net/Doc/Release/Options.html

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse" 
# ZSH_THEME="avit"
# ZSH_THEME="agnoster"
# ZSH_THEME="robbyrussell"

# in case using utf-8 fonts
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  # git redis-cli aws celery docker mvn python supervisor systemd pip 
  zsh-autosuggestions zsh-syntax-highlighting # zsh-syntax-highlighting in last
)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'


## custom common shell configs
if [ -f ~/.commonrc ]; then
      . ~/.commonrc
fi

# fuzzy search
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
#export FZF_DEFAULT_OPS='--extended --height=70% --preview="cat {}" --preview-window=right:60%:wrap'
export FZF_DEFAULT_OPS="--extended --height=70% --preview 'bat --color=always --line-range :500 {}' --preview-window=right:60%:wrap"
# if using fd an find alternative used by git"
#export FZF_DEFAULT_COMMAND="fd --type f"
# if using ripgrep
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!{.git,venv,venv3.5}/*" 2> /dev/null'
# export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!{.git,venv,venv3.5}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
#export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"   #failing in terminal


export GIT_EDITOR=vim

# Set default term to xterm
export TERM=xterm-256color              # `xterm*` is default as well; see ~/.bashrc; though not recommanded to set explicitely
# source ~/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh          # required only when installed manually

# vim mode
# set -o vi

# Edit line in vim with ctrl+e
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# autostart tmux - pre-requiiste - oh-my-zsh's plugin `tmux` installed
# export ZSH_TMUX_AUTOSTART=true  # DO NOT USE - issue to timer emoji

# start tmux automatically 
if [ "$TMUX" = "" ]; then tmux; fi

unsetopt beep                                               # stop bell sound on invalid operation

# -----------shell history related

# remove duplicates & keep last once in the HISTFILE - NOT working as expected for multiline cmds
# tac "$HISTFILE" | awk '!x[$0]++' > /tmp/tmpfile  && tac /tmp/tmpfile > "$HISTFILE"

# HISTORY FILE
HISTFILE=~/.bash_history  # keep bash and zsh in sync
# HISTFILE=~/.zsh_history
# HISTFILE=~/.all_hists  # backup
export HISTFILE=$HISTFILE  # to avail as ENV VAR

HISTSIZE=100000                                         # default:30
HISTFILESIZE=100000                                     # default:not-set

# FIXME - move to ~/.commonrc
# FIXME - functionality
COMMONIGNORE="clear:tmux:pwd:du:df"
ALIASIGNORE="t:c:tks:ttt"
GITIGNORE="gch:master:gpull:gpush"
export HISTIGNORE="$COMMONIGNORE:$ALIASIGNORE:$GITIGNORE"

# HISTCONTROL equivalents
setopt HIST_IGNORE_ALL_DUPS                             # HISTCONTROL=erasedups
setopt HIST_IGNORE_SPACE                                # HISTCONTROL=ignorespace
# setopt HIST_IGNORE_DUPS                                 # HISTCONTROL=ignoredups
setopt HIST_FIND_NO_DUPS                                # when searching for history entries in the line editor, do not display duplicates of a line previously found, even if the duplicates are not contiguous
setopt HIST_EXPIRE_DUPS_FIRST                           # delete duplicates first when HISTFILE size exceeds HISTSIZE

# History Sharing across multiple sessionshow

# By default the history files are written when the shell closes
# the following allows the shells to write and read from the history file after each command
setopt INC_APPEND_HISTORY                               # shopt -s histappend

# 1. cons: does not write to file untill session terminates
# 2. pros: on current terminal session, hist from other sessions are synced (on enter - new prompt) BUT via hist cache
# 3. I'll prefer `INC_APPEND_HISTORY` + `exec zsh` than SHARE_HISTORY
# setopt SHARE_HISTORY                                    # default: ON; PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# setopt EXTENDED_HISTORY                                # default: OFF (but found it ON; see `$ setopt`

# stop prefixing with epoch
setopt NOSHAREHISTORY                                   # drawback will be no automatic history syncup across multiple session 
setopt NOEXTENDEDHISTORY                                # extendedhistory feature tells how long a command took in addition to when it ran; default it is off but it doing this to be sure

setopt NO_HIST_BEEP                                     # turn off beep signal when trying scroll up/down beyond history search results

# setopt HIST_REDUCE_BLANKS                               # tidy up the line when it is entered into the history by removing any excess blanks that mean nothing to the shell (including multiline cmd --> single line)

setopt HIST_VERIFY                                      # whenever the user enters a line with history expansion, don’t execute the line directly; instead, perform history expansion and reload the line into the editing buffer. 


# PROMPT_COMMAND="history -n; history -w; history -c;"
# prmptcmd() { eval "$PROMPT_COMMAND" }
# precmd_functions=(prmptcmd)

# Ref:
# - Official
#   - http://zsh.sourceforge.net/Guide/zshguide02.html#l18
# - All bash equivalents
#   - https://kevinjalbert.com/more-shell-history/
# - sharehistory and extendedhistory
#   - https://unix.stackexchange.com/questions/399527/why-does-zsh-timestamp-history

# --------------------------------------------

# source env vars
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.zsh.inc ]; then source $HOME/google-cloud-sdk/path.zsh.inc; fi

# The next line enables shell command completion for gcloud.
if [ -f $HOME/google-cloud-sdk/completion.zsh.inc ]; then source $HOME/google-cloud-sdk/completion.zsh.inc; fi

# setup autocomplete in zsh into the current shell
if [ -f '/usr/local/bin/kubectl' ]; then source <(kubectl completion zsh); fi

# setup `aws-okta` autocomplete in zsh
if [ -f $GOPATH/bin/aws-okta ]; then source <(aws-okta completion zsh); fi

autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/toran/.sdkman"
[[ -s "/Users/toran/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/toran/.sdkman/bin/sdkman-init.sh"
