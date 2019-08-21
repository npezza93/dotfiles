# Path to your oh-my-zsh installation.
# zmodload zsh/zprof
export GIT_EDITOR='vim'

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"
# ZSH_DISABLE_COMPFIX="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.

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
export ZSH=/Users/nick/.oh-my-zsh
plugins=(git rails fast-syntax-highlighting zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"
# export GEM_PATH=PATH/Users/nick/.rvm/gems/

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
# export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias zshconf="atom-nightly ~/.zshrc"

alias atom="atom-nightly"
alias apm="apm-nightly"

alias r="rails"
alias rgmo="rails generate model"

alias "b/c"="bin/console"

alias "glg"="g log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit --date=relative"
alias "gll"="g log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
alias gcleanup='g remote prune origin && git br -vv | grep gone | awk "{print $1}" | xargs -n 1 git branch -D'
alias gcleanuplocals="g branch -vv | cut -c 3- | awk '\$3 !~/\[/ { print \$1 }' | xargs -n 1 git branch -D"
alias gd='g diff --color-moved --patience'
alias gcan="g ci --amend --no-edit"
alias sw="g br --format='%(refname:short)' | fzy | command xargs -n 1 git switch"
alias swa="gbr --format='%(refname:short)' | fzy | command xargs -n 1 git switch"
 
alias mb='bundle exec middleman build'
alias md='bundle exec middleman deploy'
alias ms='bundle exec middleman server'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias l='exa -lah --git'
alias ll='exa -lh --git'
alias ls='exa -G'
alias lsa='exa -lah --git'
alias cat='bat --pager="less -FR" --theme="Sublime Snazzy" --style="numbers,changes,header"'

alias ctags='/usr/local/bin/ctags -R --exclude=public --exclude=tmp --exclude=.git --exclude=node_modules --exclude=vendor --exclude=dist --exclude=coverage'
alias killruby="ps -ax | grep ruby | grep -v grep | awk '{print $1}' | xargs kill -9"

export PATH="$HOME/.yarn/bin:$PATH"
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source /usr/local/etc/profile.d/z.sh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.git-completion.bash

export fpath=(
  /usr/local/share/zsh-completions/zsh-completions.plugin.zsh
  ~/.zsh
  $fpath
)

if [ -z "$TMUX" ]
then
  autoload -Uz promptinit && promptinit
  prompt pure
else
  PROMPT=$'\n'"%(?.%F{magenta}.%F{red})❯%f "
fi

function override_icons() {
  cp ~/.icon-overrides/atom.icns /Applications/Atom\ Nightly.app/Contents/Resources/atom.icns
  touch /Applications/Atom\ Nightly.app
  sudo killall Finder && sudo killall Dock
}

export PATH="$PATH:/Users/nick/.rvm/gems/ruby-2.6.3/bin:/Users/nick/.rvm/gems/ruby-2.6.3@global/bin:/Users/nick/.rvm/rubies/ruby-2.6.3/bin:/Users/nick/.yarn/bin:/Users/nick/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Users/nick/.rvm/bin:/Users/nick/.vimpkg/bin"

export PATH="$PATH:$HOME/.rvm/bin"

cd() {
  builtin cd $1
  if [ "$TMUX" ]
  then
    tmux refresh-client -S
  fi
}
