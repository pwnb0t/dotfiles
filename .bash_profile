# Git aware prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"

# Add core utils and ~/bin to path
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH:~/bin"

# Aliases
alias ls="ls --color"
alias ll="ls --color -l"
alias vup="cd ~/work/web && vagrant up && vagrant ssh"
alias grep='grep --color=auto'
#alias gmergepushupstream="cd ~/work/web && git fetch upstream && git merge upstream/master && git push"

# Skip .DS_Store on tab tab
export FIGNORE=$FIGNORE:DS_Store

# Grep Colors
export GREP_COLOR='38;5;208'

# NPM Installs Locally
#export PATH="$PATH:$HOME/npm/bin"
#export NODE_PATH="$NODE_PATH:$HOME/npm/lib/node_modules"

# History Details
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# PS1 Prompt from Chris Pierce
#export PS1="(\[\e[0m\]#\[\e[1;34m\]\!\[\e[0m\]) \[\e[38;5;208m\]\u\[\e[0;37m\]@\[\e[38;5;208m\]\h\[\e[0;37m\]:\[\e[0;34m\]\w\[\e[0;37m\]\$\[\e[0m\] "

# PS1 from git aware prompt
#export PS1="\u@\h \W \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "

# PS1 from git-prompt.sh
source ~/.git-prompt.sh
#export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '

#export PS1="(\[\e[0m\]#\[\e[1;34m\]\!\[\e[0m\]) \[\e[38;5;208m\]\u\[\e[0;37m\]@\[\e[38;5;208m\]\h\[\e[0;37m\]:\[\e[0;34m\]\w\[\e[0;37m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$\[\e[0m\] "
#export PS1="(\[\e[0m\]#\[\e[1;34m\]\!\[\e[0m\]) \[\e[38;5;208m\]\u\[\e[0;37m\]@\[\e[38;5;208m\]\h\[\e[0;37m\]:\[\e[0;34m\]\w\[\e[0;37m\] \W$(__git_ps1 " (%s)")\$\[\e[0m\] "
export PS1='(\[\e[0m\]#\[\e[1;34m\]\!\[\e[0m\]) \[\e[38;5;208m\]\u\[\e[0;37m\]@\[\e[38;5;208m\]\h\[\e[0;37m\] \[\e[0;34m\]\w\[$txtcyn\]$(__git_ps1 " (%s)")\[\e[0m\]\$ '
