#alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'
#alias grep='grep --color=auto'
#alias fgrep='fgrep --color=auto'
#alias egrep='egrep --color=auto'

# some more ls aliases
#alias ll='ls -alF'
#alias la='ls -A'
#alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


#aliases
alias cdw='cd /mnt/ExternalHDD/E/workspace/'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias cdd='cd /mnt/ExternalHDD/D/'
alias cdresume='cd /mnt/ExternalHDD/D/Clouds/Dropbox/Toran/Resume'
alias pdf='evince'
alias lsA='ls -A'
alias lsa='ls -a'
alias rdi='rmdir --ignore-fail-on-non-empty '
alias cde='cd /mnt/ExternalHDD/E'
alias pgadmin4='. ~/.virtualenvs/pgadmin4/bin/activate &&  sudo python3 ~/.virtualenvs/pgadmin4/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py'
alias bashrc-bkp='cp ~/.bashrc /mnt/ExternalHDD/E/workspace/linux-tweaks/bashrc-bkp/mint/'
alias gits='git status'
alias djangodev='. ~/.virtualenvs/djangodev/bin/activate'
alias pycharm='/mnt/ExternalHDD/E/sw/pycharm/pycharm-community-2018.1/bin/pycharm.sh $1'
alias anaconda='. ~/anaconda/bin/activate'
alias django='. ~/.virtualenvs/djangovenv/bin/activate'
alias flaskvenv='. ~/.virtualenvs/flaskvenv/bin/activate'
#eval $(thefuck --alias)
alias tmux='tmux -u'
alias cpy='xclip -sel clip'
alias ls='ls -la'
alias bak='/mnt/ExternalHDD/E/workspace/linux-tweaks/scripts/backup_confs.sh'
alias bkp='/mnt/ExternalHDD/E/workspace/linux-tweaks/scripts/backup_confs.sh'
aliasit()
{
    echo "alias $1='$2'" >> ~/.bash_aliases

    if [ $SHELL=='/usr/bin/zsh' ]; then
        . ~/.zshrc;
    else
        . ~/.bashrc;
    fi

    echo "[Alias Created:] alias $1='$2'";
}
alias tmux='TERM=screen-256color tmux -u'
alias ls='ls -ltrhFa'
alias t='mate-terminal'
alias terminal='mate-terminal'
alias cdeth='cd /mnt/ExternalHDD/E/workspace/ethereal-machines/'
alias pe='pipenv'
alias pes='pipenv shell'
alias cdeee='/mnt/ExternalHDD/E/workspace/ethereal-machines/ethereal-machines-site/ethereal-machines-backend'
alias cderp='cd /mnt/ExternalHDD/E/workspace/ethereal-machines/ethereal-erp'
