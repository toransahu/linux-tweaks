# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

export PATH=$PATH:$HOME/miniconda3/bin:$HOME/anaconda3/bin:$HOME/anaconda/bin:$HOME/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin

# set GO paths
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go/
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# eclipse/eclim
export ECLIPSE_HOME=$HOME/.eclipse/org.eclipse.platform_4.8.0_1473617060_linux_gtk_x86_64

# set IP ADDRESS
export MY_IP_ADDR=$(ifconfig wlp2s0 | awk '/inet / {print $2}') 

# HISTFILE, HISTSIZE, HISTFILESIZE are common to bash & zsh - should be here


# Ref:
# - overall good stuff
#   - https://justin.abrah.ms/dotfiles/zsh.html
