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
alias gcm='git commit -m'
alias gits='git status'
alias gpull='export GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2) && git pull origin $GIT_TEMP_BRANCH && unset GIT_TEMP_BRANCH'
#alias gpush='export GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2) && git push origin $GIT_TEMP_BRANCH && unset GIT_TEMP_BRANCH'
gpush(){
    GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2)
    git push origin $GIT_TEMP_BRANCH $1
}
grdiff(){
    REMOTE='origin'
    if [ $1 ]; then REMOTE=$1; fi
    GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2)
    git diff $REMOTE/$GIT_TEMP_BRANCH $GIT_TEMP_BRANCH 
}
alias glogo='git log --graph --oneline'
alias glog='git log --graph'
alias gi.py='wget https://raw.githubusercontent.com/toransahu/gitignore/master/Python.gitignore -O .gitignore'
alias gi.go='wget https://raw.githubusercontent.com/toransahu/gitignore/master/Go.gitignore -O .gitignore'
alias gi.java='wget https://raw.githubusercontent.com/toransahu/gitignore/master/Java.gitignore -O .gitignore'
alias gitrepo='print -z "$(<~/.personalized/.gitrepo)"'
alias gch='git checkout'
alias ghtokencpy='cpy $WORKSPACE/recovery/github-access-token.txt'
alias gbd='export GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2) && git checkout master && git branch -d $GIT_TEMP_BRANCH && unset GIT_TEMP_BRANCH'
alias gbdf='export GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2) && git checkout master && git branch -D $GIT_TEMP_BRANCH && unset GIT_TEMP_BRANCH'
alias gls='git log --stat'
alias gfa='git fetch --all'
alias master='git checkout master'
alias gdiff='git diff'
alias gcom='git commit -m'
alias gprom='git pull --rebase origin master'
alias gchr='git checkout --track'
gfb(){
    git checkout --track origin/$1
}
gri(){
    git rebase -i HEAD~$1
}
gclone(){
if [ "$2" = -http ]; then
    git clone https://github.com/$1.git
else
    git clone git@github.com:$1.git
fi
}
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
# alias tmux='tmux -u'
# alias tmux='TERM=screen-256color tmux -u'
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
alias cdss='cd ~/cloud/Dropbox/Toran/Salary\ Slip'
alias cdgi='$WORKSPACE/gitignore'
alias show='less +F'
alias cdo='$WORKSPACE/office-repos'
alias cleardns='sudo /etc/init.d/networking restart'
alias vpnstag='cd ~/vpns/mist/openVpn/aws/toran.sahu@mistsys.com_stag && sudo openvpn --config staging-toran.sahu@mistsys.com.ovpn'
alias vpnprod='cd ~/vpns/mist/openVpn/aws/toran.sahu@mistsys.com_prod && sudo openvpn --config production-toran.sahu@mistsys.com.ovpn'
alias vpneu='cd ~/vpns/mist/openVpn/aws/toran.sahu@mistsys.com_eu && sudo openvpn --config eu-toran.sahu@mistsys.com.ovpn'
alias vpngcpstag='cd ~/vpns/mist/openVpn/gcp/toran.sahu@mistsys.com_stag && sudo openvpn --config gcp-staging-toran.sahu@mistsys.com.ovpn'
alias vpngcpprod='cd ~/vpns/mist/openVpn/gcp/toran.sahu@mistsys.com_prod && sudo openvpn --config gcp-production-toran.sahu@mistsys.com.ovpn'
alias clearswap='sudo swapoff -a && sudo swapon -a'
alias freeswap='sudo swapoff -a && sudo swapon -a'
alias uninstall-go='sudo rm -rvf /usr/local/go/'
alias cdgo='cd $GOPATH/src/'
alias cdgopkg='cd $GOPATH/pkg/'
alias cdgobin='cd $GOPATH/bin/'
alias gpager-vim='git config --global core.pager "vim -"'
alias gpager-less='git config --global core.pager "less"'
alias vim-mode-on='set -o vi'
alias vim-mode-off='set -o emacs'
alias cdt='cd ~/.test'
gomsync() {
    for i in "$@"
    do 
        case $i in
            -p|--populate)
                local POPULATE="Y"
                ;;
            -d|--delete)
                local DELETE_VENDOR="Y"
                ;;
            *)
                echo "\nUnknown Command!"
                ;;
        esac
    done
    if [ "$POPULATE" = "Y" ]; then
        gom populate
        echo "\nPopulated.." 
    fi
    rsync -r _vendor/src $GOPATH
    echo "Synced.."
    if [ "$DELETE_VENDOR" = "Y" ]; then 
        rm -rf _vendor
        echo "Deleted.."
    fi
}
alias todo='vim ~/TODO.md'
alias reload='. ~/.zshrc'
alias cdoc='cd ~/go/src/github.com/mistsys/mist-openconfig'
alias m='gch master'
alias epoch='date +%s'
alias glistall='git for-each-ref --format=" %(authorname) %09 %(refname)" --sort=authorname'
alias pyfmt='black -l 120'
alias freeram='sudo $WORKSPACE/linux-tweaks/scripts/freeram.sh'
alias cdgnoi='cd $GOPATH/src/github.com/mistsys/mist-openconfig-gnoi'
alias cdm='cd $WORKSPACE/mist'
alias cdom='cd $WORKSPACE/office-repos/mist'
alias cdlb='cd $WORKSPACE/linux-tweaks/backups'
alias ttt='TERM=screen-256color tmux -u && tmux set -g pane-border-status top && tmux set -g pane-border-format "#[bg=green] #[fg=white] #{pane_index} #(ps --no-headers -t #{pane_tty} -o args -O-c)"'
alias tpnum='tmux bind Left select-pane -L \; display-pane -d 5000'
alias tks='tmux kill-server'
alias cdp='cd $WORKSPACE/post-linux-install'

gcdiff(){
    GIT_TEMP_BRANCH=$(git branch | grep \* | cut -d " " -f2)
    if [[ -z "$1" ]] 
    then
        COMMENT="_$1"
    fi
    COMMENT="_$1"
    STAMP="$(date +"%Y-%m-%d-%I:%M:%S")"
    mkdir -p .diff
    git diff > .diff/${GIT_TEMP_BRANCH}${COMMENT}_${STAMP}.diff
}
alias cdgog='cd $GOPATH/src/github.com'
alias gh2fa='2fa $(cat $WORKSPACE/recovery/github_totp_2fa_secret_code.txt)'
alias night='xdotool key Shift+F10 r Down  Down Down Return'
alias day='xdotool key Shift+F10 r Down  Return'
alias freeaptcache='sudo apt-get clean'
alias mist='source $WORKSPACE/secret/mist/envs/.mist_aliases && source $WORKSPACE/secret/mist/envs/.mist_local_aliases'
alias eshead='cd $WORKSPACE/elasticsearch-head && npm run start & sleep 2s && firefox http://localhost:9100'
alias eshead-stop='pkill grunt > /dev/null'

# TODO: whoisusingport :port -> kill that service
alias 2fa-juniper='2fa $(cat $WORKSPACE/recovery/juniper_totp_2fa_secret_code.txt)'
alias 2fa-github='2fa $(cat $WORKSPACE/recovery/github_totp_2fa_secret_code.txt)'
alias gchp='git cherry-pick'
alias mmdc='~/node_modules/.bin/mmdc'
alias myip='echo $MY_IP_ADDR'

k8s-bash() {
    namespace=$1
    # pod=$(kubectl get pods --all-namespaces | grep $namespace | awk '{$NF=""; print $2}')
    pod=$(kubectl get pods --all-namespaces | grep "^$namespace .*" | awk 'NR==1 {print $2}')
    kubectl -n $namespace exec -it $pod -- /bin/bash
}

var() {
    ~/.personalized/parse_envvars.py --cmd=var $@ 
    exec zsh
}

unvar() {
    ~/.personalized/parse_envvars.py --cmd=unvar $@
    exec zsh
}
alias k8s-list-context='kubectl config view -o jsonpath="{.contexts[*].name}" | tr " " "\n"'

alias dedupe-hist='python $WORKSPACE/linux-tweaks/scripts/dedupe_sh_history.py'
alias bak-hist='dedupe-hist && cp ~/.bash_history $WORKSPACE/secret/self'
alias res-hist='cp $WORKSPACE/secret/self/.bash_history ~/.bash_history'
