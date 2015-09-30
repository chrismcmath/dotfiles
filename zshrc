# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="blinks"
 
alias -s gz='tar -xzvf'
alias -s bz2='tar -xjvf'
alias -s zip='unzip'
alias -s txt=$EDITOR
alias -s html=$BROWSER

alias synctory='cd /Volumes/@chrismcmath/projects/synctory_unity_api/Synctory\ API/Assets/Addons/Synctory/'

alias cockateers='cd /Volumes/@chrismcmath/projects/cockateers'

#Ember specific stuff
alias ember='cd /Volumes/@chrismcmath/projects/ember'
alias annex='cd /Volumes/@chrismcmath/projects/ember/unity/EmberClient/Assets/Annex'
alias meta='cd /Volumes/@chrismcmath/projects/ember/unity/Metadata'
alias nodejs='cd /Volumes/@chrismcmath/projects/ember/nodejs/dashboard && npm start'
alias cache='/Volumes/@chrismcmath/cache/RunOSX.command'
alias ember_mongo='mongod --config /usr/local/etc/mongod.conf'
alias ember_redis='redis-server /usr/local/etc/redis.conf'

alias blog='cd ~/Documents/websites/hexo/blog/'
alias hgs='hexo geneate & hexo server'

# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias chromex='open /Applications/Google\ Chrome.app --args --allow-file-access-from-files'
alias unity='/Applications/Unity/Unity.app/Contents/MacOS/Unity -projectPath "/"'
alias unity5='/Applications/Unity5/Unity.app/Contents/MacOS/Unity -projectPath "/"'
alias eprc="emacs ~/.procmailrc"
alias ctags="`brew --prefix`/bin/ctags"
alias ls='ls --color=auto'
alias ll='ls -l --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias diff='colordiff'
alias gco='git checkout'
alias gm='git merge'
alias gs='git status'
alias gl='git log'
alias ..='cd ..'
alias rg='grep -r' #for 'recursively grep', needs a * after tho, need to parameterize
alias cpwd="pwd | tr -d '\n' | pbcopy"
alias pngify='mogrify -format png *.jpg && rm * .jpg'

#Skype can't find camera
alias fixcam='sudo killall VDCAssistant'

# Week check aliases
alias current_week='~/text/week_check/open_most_recent_week_check'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github pip python)

source $ZSH/oh-my-zsh.sh
source ~/.profile

# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Developer/Marmalade/6.1/s3e/bin
bindkey -v

#powerline stuff
POWERLINE_HIDE_USER_NAME="true"
POWERLINE_HIDE_HOST_NAME="true"
POWERLINE_RIGHT_A="Your very best text"
POWERLINE_FULL_CURRENT_PATH="true"
POWERLINE_DETECT_SSH="true"

#. /var/folders/sx/6s4pvyw91z3845j3pztqprgr0000gn/T/pip-6qutcE-build/powerline/bindings/zsh/powerline.zsh

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
