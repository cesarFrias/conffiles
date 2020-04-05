# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

# clera --> Comando clear
alias clera='clear'

# cler --> Comando clear
alias cler='clear'

# cleasr --> Comando clear
alias cleasr='clear'

alias claer='clear'

alias cçear='clear'

# limpyc --> Limpa os arquivos pyc
alias limpyc='find ./ -name "*.pyc" | xargs rm -v'

# conflitos --> Procura por conflitos em arquivos versionados
alias conflitos="grep -REn '(>>>|<<<|===)' ./"

alias vi='vimx '

alias car='cat '

alias rprune='git remote prune origin'

# show_patch necessita, logicamente, do hash do commit
alias show_patch='git show -p '

alias log_fuderoso='git log --graph --oneline --decorate'

alias ks='ls'


alias aprovometro='cd ~/Workspace/Parafernalha/aprovometro/'
alias fabriq='cd ~/Workspace/Parafernalha/fabric/'
alias bfix='cd ~/Workspace/Parafernalha/bitbucket-bfix-backend/'
alias jota-backend='cd ~/Workspace/Parafernalha/jota-backend/'
alias luthieria='workon luthieria'

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export WORKON_HOME=$HOME/.virtualenvs/
source /usr/local/bin/virtualenvwrapper.sh

alias docker_cgroups='sudo mkdir /sys/fs/cgroup/systemd && sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd'
