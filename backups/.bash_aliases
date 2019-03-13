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


##
# Include/source PATHs
##
. ~/paths.sh


##
# application aliases
##

# git
alias gits='git status'
alias gpull='git pull origin master'
alias gpush='git push origin master'
alias glogo='git log --graph --oneline'
alias glog='git log --graph'
alias py.gi='wget https://raw.githubusercontent.com/toransahu/gitignore/master/Python.gitignore -O .gitignore'
alias java.gi='wget https://raw.githubusercontent.com/toransahu/gitignore/master/Java.gitignore -O .gitignore'
alias gitrepo='print -z "$(<~/.personalized/.gitrepo)"'

gsize(){
#curl https://api.github.com/repos/$1/$2 | grep size
if [ "$3" = -a ]; then
    curl -u toransahu -s https://api.github.com/repos/$1/$2 | \
    python -c 'import sys, json; size = json.load(sys.stdin)["size"]; print(size/1024, "Mb") if(size>=1024)  else print(size, "Kb")'
else
curl -s https://api.github.com/repos/$1/$2 | \
python -c 'import sys, json; size = json.load(sys.stdin)["size"]; print(size/1024, "Mb") if(size>=1024)  else print(size, "Kb")'
fi
}

grepo(){
    echo "Creating repo $1"
    python ~/.personalized/.gitrepo.py $1
    echo "Done."
}

ghrepo(){
    curl -H "Content-Type: application/json" -POST https://api.github.com/user/repos -d "{\"name\":\""$1"\", \"private\":"$2"}" -u toransahu
}

# utils
alias pdf='evince'
alias tmux='tmux -u'
alias tmux='TERM=screen-256color tmux -u'
alias cpy='xclip -sel clip'
alias ls='ls -ltrhFa'
alias t='gnome-terminal'
alias terminal='gnome-terminal'

# dir ops
alias ls='ls -la'
alias lsA='ls -A'
alias lsa='ls -a'
alias rdi='rmdir --ignore-fail-on-non-empty '

alias cdd='cd $DROOT/'
alias cdw='cd $WORKSPACE/'
alias cdresume='cd $DROOT/Clouds/Dropbox/Toran/Resume'
alias cde='cd $EROOT'

# personalized dir ops
alias cdeth='cd $WORKSPACE/ethereal-machines/'
alias cdeee='$WORKSPACE/ethereal-machines/ethereal-machines-site/ethereal-machines-backend'
alias cderp='cd $WORKSPACE/ethereal-machines/ethereal-erp'
alias cdhalo='$WORKSPACE/ethereal-machines/halo'

# coding related
alias pgadmin4='. ~/.virtualenvs/pgadmin4/bin/activate &&  sudo python3 ~/.virtualenvs/pgadmin4/lib/python2.7/site-packages/pgadmin4/pgAdmin4.py'

alias pe='pipenv'
alias pes='pipenv shell'
alias djangodev='. ~/.virtualenvs/djangodev/bin/activate'
alias pycharm='$EROOT/sw/pycharm/pycharm-community-2018.1/bin/pycharm.sh $1'
alias anaconda='. ~/anaconda3/bin/activate'
alias miniconda='. ~/miniconda3/bin/activate'
alias winconda='. /c/ProgramData/Miniconda3/Scripts/activate'
alias django='. ~/.virtualenvs/djangovenv/bin/activate'
alias flaskvenv='. ~/.virtualenvs/flaskvenv/bin/activate'
#eval $(thefuck --alias)
mvnnew(){
     ~/.personalized/mvn_create_project.sh $1 $2
}

# routine jobs
alias bak='$WORKSPACE/linux-tweaks/scripts/backup_confs.sh'
alias res='$WORKSPACE/linux-tweaks/scripts/restore_confs.sh'
alias bkp='$WORKSPACE/linux-tweaks/scripts/backup_confs.sh'
alias bashrc-bkp='cp ~/.bashrc $WORKSPACE/linux-tweaks/bashrc-bkp/mint/'

##
# functions
##

# syntax: aliasit command_alias='command'
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

alias cdww='cd $WORKSPACE/'
alias hdp='sudo hdparm -q -S 120 -Y /dev/sda'
alias zbinon='subst z: /g/toran/E/workspace/zbin'
alias zbin='subst z: /g/toran/E/workspace/zbin'
alias zbinoff='subst /D z:'
alias rmbuild='rm -r build dist *.egg-info'
alias cdl='cd $WORKSPACE/linux-tweaks'

alias installvundle='git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim'
alias installohmyzsh='sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
alias fixcinnamon='export DISPLAY=:0; cinnamon --replace &'
alias installsublime='sh -c "~/.personalized/installsublime.sh"'
alias pm='python manage.py'
alias gch='git checkout'
alias cdss='cd ~/cloud/Dropbox/Toran/Salary\ Slip'
alias cdgi='$WORKSPACE/gitignore'
alias ghtokencpy='cpy $WORKSPACE/recovery/github-access-token.txt'
alias show='less +F'
alias gbd='git branch -D'
alias cdo='$WORKSPACE/office-repos'
alias gls='git log --stat'
alias cleardns='sudo /etc/init.d/networking restart'
alias master='git checkout master'
alias vpnstag='cd ~/openVpn/toran.sahu@mistsys.com_stag && sudo openvpn --config staging-toran.sahu@mistsys.com.ovpn'
alias vpnprod='cd ~/openVpn/toran.sahu@mistsys.com_prod && sudo openvpn --config production-toran.sahu@mistsys.com.ovpn'
