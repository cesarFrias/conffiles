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


alias luthieria='workon luthieria'
alias lu=luthieria
alias simple-calc='cd ~/.local/share/gnome-shell/extensions/simple-calculator@cagfrias.gmail.com/'

alias aprovometro='cd ~/Workspace/Parafernalha/aprovometro/'
alias fabriq='cd ~/Workspace/Parafernalha/fabric/'
alias bfix='cd ~/Workspace/Parafernalha/bitbucket-bfix-backend/'
alias jota-backend='cd ~/Workspace/Parafernalha/jota-backend/'

alias infra='cd ~/Workspace/Cultura/infra/; docker-compose -f docker-compose.basic.yml up -d'
alias vtex-adapter='cd ~/Workspace/Cultura/vtex-adapter/; pipenv shell'
alias sitef-adapter='cd ~/Workspace/Cultura/sitef-adapter/; pipenv shell'
alias buzzina='cd ~/Workspace/Cultura/buzzina/; pipenv shell'
alias ev-adapter='cd ~/Workspace/Cultura/ev-adapter/; pipenv shell'
alias pedido-port='cd ~/Workspace/Cultura/pedido-port/; pipenv shell'

export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export WORKON_HOME=$HOME/.virtualenvs/
source /usr/local/bin/virtualenvwrapper.sh

alias start_docker='sudo mkdir /sys/fs/cgroup/systemd && sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd && sudo systemctl start docker'

export PATH="/home/cesarfrias/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
