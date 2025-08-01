# to profile enable the following line and the last line
# zmodload zsh/zprof

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

# compinit -C

eval "$(/opt/homebrew/bin/brew shellenv)"
export GIT_EDITOR='nvim'
export LANG='en-US.UTF-8'
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=nvim
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export HOMEBREW_NO_INSTALLED_DEPENDENTS_CHECK=true
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH:/Users/nick/.yarn/bin:/Users/nick/.cargo/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:$N_PREFIX/bin:/Users/nick/.dotfiles/bin:/usr/local/go/bin:/Users/nick/go/bin"
source ~/.dotfiles/catppuccin-zsh-syntax-highlighting.zsh
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
DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"
# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"
export HISTSIZE=1000000000
export HISTFILESIZE=1000000000
export SAVEHIST=$HISTSIZE

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export ZSH=/Users/nick/.oh-my-zsh
if [[ -z "$TMUX" && -z "$VIM" ]]; then
  exec /opt/homebrew/bin/tmux new-session -As0
fi

plugins=(rails zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/id_rsa"

alias r="rails"
alias rgmo="rails generate model"

alias "console"="bin/console"

alias g='git'
alias glg="g log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit --date=relative"
alias gll="g log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
alias gcleanup="g remote prune origin && git br -vv | grep gone | cut -d' ' -f3 | sed -e 's/'\$(echo \"\033\[m\")'//g' | xargs -n 1 git branch -D"
alias gcleanuplocals="g branch -vv | cut -c 3- | awk '\$3 !~/\[/ { print \$1 }' | xargs -n 1 git branch -D"
alias gd='g diff --color-moved --patience'
alias ga='g a'
alias gcan="g ci --amend --no-edit"
alias gsw="g switch"
alias grs="g restore"
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'
alias gst='git status'
alias glog='git log --oneline --decorate --graph'
alias sw="g br --format='%(refname:short)' | fozzie | command xargs -n 1 git switch"
alias swa="gbr --format='%(refname:short)' | fozzie | command xargs -n 1 git switch"
alias gcp='git cherry-pick'
alias gci='g commit'
alias gco='g checkout'
alias grbi='g rebase -i'
alias gap='git add --intent-to-add . && git add --patch'
alias gci='g ci'

alias mb='bundle exec middleman build'
alias md='bundle exec middleman deploy'
alias ms='bundle exec middleman server'

alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

alias l='eza -lah --git'
alias ll='eza -lh --git'
alias ls='eza -G'
alias lsa='eza -lah --git'
alias la='eza -Glah'
alias cat='bat  --theme="Catppuccin-mocha" --style="numbers,changes,header"'

alias ttags-all='ttags $({ g ls-files; g ls-files -o --exclude-standard; } | rg -v "(.*\.(pdf|json|md|css|svg|sql|keep|yml|csv|key|ru|txt|png|jpg|jpeg|webp|ttf|woff2|otf|woff)$)|(db/schema.rb)|(^public.*)|(db/migrate/.*)|(^bin.*)|(^\..*)|Gemfile.*|Rakefile")'
alias killruby="ps -ax | grep ruby | grep -v grep | awk '{print $1}' | xargs kill -9"
alias killvim="ps -ax | grep vim | grep -v grep | awk '{print $1}' | xargs kill -9"

alias vim="nvim -i NONE"
alias vimrc="cd ~/.config/nvim; vim ~/.config/nvim/init.vim; cd -"
alias zshrc="vim ~/.zshrc"
alias dotfiles="cd ~/.dotfiles"
function vimf() {
  emulate -L zsh
  zle -I
  FFILE="$(fd -H -E .git --type file --color=never --strip-cwd-prefix . | fozzie)"
  if [[ -z ${FFILE} ]] ; then
    return 1
  else
    vim $FFILE
  fi
}
alias v="vimf"
alias vimm="vim \$(git ls-files --others --exclude-standard -m | fozzie)"
alias kp="ps -ef | sed 1d | eval "fozzie" | awk '{print $2}' | xargs kill $1"

alias -g RED='RAILS_ENV=development'
alias -g REP='RAILS_ENV=production'
alias -g RET='RAILS_ENV=test'

alias rc='bundle exec rails console'
alias rcs='bundle exec rails console --sandbox'
alias rd='bundle exec rails destroy'
alias rdb='bundle exec rails dbconsole'
alias rgen='bundle exec rails generate'
alias rgm='bundle exec rails generate migration'
alias rp='bundle exec rails plugin'
alias ru='bundle exec rails runner'
alias rs='bundle exec rails server'
alias rsd='bundle exec rails server --debugger'
alias rsp='bundle exec rails server --port'

# Rake aliases
alias rdm='bundle exec rails db:migrate'
alias rdms='bundle exec rails db:migrate:status'
alias rdr='bundle exec rails db:rollback'
alias rdc='bundle exec rails db:create'
alias rds='bundle exec rails db:seed'
alias rdd='bundle exec rails db:drop'
alias rdrs='bundle exec rails db:reset'
alias rdtc='bundle exec rails db:test:clone'
alias rdtp='bundle exec rails db:test:prepare'
alias rdmtc='bundle exec rails db:migrate db:test:clone'
alias rdsl='bundle exec rails db:schema:load'
alias rlc='bundle exec rails log:clear'
alias rn='bundle exec rails notes'
alias rr='bundle exec rails routes'
alias rrg='bundle exec rails routes | grep'
alias rt='bundle exec rails test'
alias rmd='bundle exec rails middleware'
alias rsts='bundle exec rails stats'

export PROMPT=$'\n'"%(?.%F{magenta}.%F{red})❯%f "
export CDPATH=.:~:~/Documents

cd() {
  builtin cd $1
  if [ "$TMUX" ]
  then
    tmux refresh-client -S
  fi
}

if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}:${RBENV_ROOT:-${HOME}/.rbenv}/plugins/ruby-build/bin"
  function rbenv() {
    unset -f rbenv > /dev/null 2>&1
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

# zprof

# bun completions
[ -s "/Users/nick/.bun/_bun" ] && source "/Users/nick/.bun/_bun"
fpath=(~/.zsh/completions $fpath)
