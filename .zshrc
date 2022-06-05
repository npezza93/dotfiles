# to profile enable the following line and the last line
# zmodload zsh/zprof

autoload -Uz compinit

for dump in ~/.zcompdump(N.mh+24); do
  compinit
done

# compinit -C

eval "$(/opt/homebrew/bin/brew shellenv)"
export GIT_EDITOR='nvim -i NONE'
export LANG='en-US.UTF-8'
export DIRENV_LOG_FORMAT=
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim
export N_PREFIX=$HOME/.n
export PATH="$PATH:/Users/nick/.yarn/bin:/Users/nick/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Users/nick/.vimpkg/bin:$N_PREFIX/bin"

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
# DISABLE_AUTO_TITLE="true"

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

plugins=(rails fast-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh
# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/id_rsa"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# function _rails_command () {
#   if [ -e "bin/rails" ]; then
#     bin/rails $@
#   else
#     command rails $@
#   fi
# }

# function _rake_command () {
#   if [ -e "bin/rake" ]; then
#     bin/rake $@
#   elif type bundle &> /dev/null && ([ -e "Gemfile" ] || [ -e "gems.rb" ]); then
#     bundle exec rake $@
#   else
#     command rake $@
#   fi
# }

# alias rails='_rails_command'
# compdef _rails_command=rails
# compdef _rails=rails

# alias rake='_rake_command'
# compdef _rake_command=rake

alias r="rails"
alias rgmo="rails generate model"

alias "console"="bin/console"

alias g='git'
alias glg="g log --graph --pretty=format:'%Cred%h%Creset %C(bold blue)<%an>%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)' --abbrev-commit --date=relative"
alias gll="g log --pretty=format:'%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]' --decorate --numstat"
alias gcleanup="g remote prune origin && git br -vv | grep gone | cut -d' ' -f3 | sed -e 's/'\$(echo \"\033\[m\")'//g' | xargs -n 1 git branch -D"
alias gcleanuplocals="g branch -vv | cut -c 3- | awk '\$3 !~/\[/ { print \$1 }' | xargs -n 1 git branch -D"
alias gd='g diff --color-moved --patience'
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
alias gap='g a -p'
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

alias l='exa -lah --git'
alias ll='exa -lh --git'
alias ls='exa -G'
alias lsa='exa -lah --git'
alias cat='bat  --theme="Catppuccin" --style="numbers,changes,header"'

alias ctags='ctags -R --exclude=public --exclude=tmp --exclude=.git --exclude=node_modules --exclude=vendor --exclude=dist --exclude=coverage --exclude=README.md --exclude=CODE_OF_CONDUCT.md'
alias killruby="ps -ax | grep ruby | grep -v grep | awk '{print $1}' | xargs kill -9"

alias vim="nvim -i NONE"
alias vimrc="cd ~/.config/nvim; vim ~/.config/nvim/init.vim; cd -"
alias zshrc="vim ~/.zshrc"
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

. /opt/homebrew/etc/profile.d/z.sh

# export fpath=(
#   # /usr/local/share/zsh-completions/zsh-completions.plugin.zsh
#   # ~/.zsh
#   $fpath
# )

PROMPT=$'\n'"%(?.%F{magenta}.%F{red})❯%f "

cd() {
  builtin cd $1
  if [ "$TMUX" ]
  then
    tmux refresh-client -S
  fi
}

if type rbenv &> /dev/null; then
  local RBENV_SHIMS="${RBENV_ROOT:-${HOME}/.rbenv}/shims"
  export PATH="${RBENV_SHIMS}:${PATH}"
  source $(dirname $(greadlink -f `whence -p rbenv`))/../completions/rbenv.zsh
  function rbenv() {
    unset -f rbenv > /dev/null 2>&1
    eval "$(command rbenv init -)"
    rbenv "$@"
  }
fi

# export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
# if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
#     export PATH="${PYENV_ROOT}/bin:${PATH}"
# fi
#
# # Lazy load pyenv
# if type pyenv > /dev/null; then
#     export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
#     function pyenv() {
#         unset -f pyenv
#         eval "$(command pyenv init -)"
#         if [[ -n "${ZSH_PYENV_LAZY_VIRTUALENV}" ]]; then
#             eval "$(command pyenv virtualenv-init -)"
#         fi
#         pyenv $@
#     }
# fi
export PATH=/usr/local/bin:$PATH

export LS_COLORS="ln=0;38;2;245;194;231:sg=0:or=0;38;2;21;18;28;48;2;240;143;169:mh=0:rs=0:bd=0;38;2;194;231;240;48;2;110;108;126:no=0:cd=0;38;2;245;194;231;48;2;110;108;126:tw=0:fi=0:ex=1;38;2;240;143;169:*~=0;38;2;152;139;162:so=0;38;2;21;18;28;48;2;245;194;231:di=0;38;2;152;187;245:st=0:do=0;38;2;21;18;28;48;2;245;194;231:mi=0;38;2;21;18;28;48;2;240;143;169:ca=0:pi=0;38;2;21;18;28;48;2;152;187;245:ow=0:su=0:*.z=4;38;2;194;231;240:*.t=0;38;2;172;229;171:*.r=0;38;2;172;229;171:*.o=0;38;2;152;139;162:*.d=0;38;2;172;229;171:*.h=0;38;2;172;229;171:*.m=0;38;2;172;229;171:*.c=0;38;2;172;229;171:*.p=0;38;2;172;229;171:*.a=1;38;2;240;143;169:*.jl=0;38;2;172;229;171:*.hh=0;38;2;172;229;171:*.fs=0;38;2;172;229;171:*.sh=0;38;2;172;229;171:*.lo=0;38;2;152;139;162:*.bc=0;38;2;152;139;162:*.gz=4;38;2;194;231;240:*.cs=0;38;2;172;229;171:*.rb=0;38;2;172;229;171:*.as=0;38;2;172;229;171:*.pm=0;38;2;172;229;171:*.vb=0;38;2;172;229;171:*.go=0;38;2;172;229;171:*.py=0;38;2;172;229;171:*.ex=0;38;2;172;229;171:*.xz=4;38;2;194;231;240:*.cr=0;38;2;172;229;171:*.ko=1;38;2;240;143;169:*.so=1;38;2;240;143;169:*.td=0;38;2;172;229;171:*.la=0;38;2;152;139;162:*.bz=4;38;2;194;231;240:*.ts=0;38;2;172;229;171:*.rm=0;38;2;245;194;231:*css=0;38;2;172;229;171:*.7z=4;38;2;194;231;240:*.ui=0;38;2;240;222;170:*.pp=0;38;2;172;229;171:*.pl=0;38;2;172;229;171:*.ll=0;38;2;172;229;171:*.wv=0;38;2;245;194;231:*.gv=0;38;2;172;229;171:*.js=0;38;2;172;229;171:*.kt=0;38;2;172;229;171:*.hi=0;38;2;152;139;162:*.hs=0;38;2;172;229;171:*.md=0;38;2;240;222;170:*.el=0;38;2;172;229;171:*.cc=0;38;2;172;229;171:*.rs=0;38;2;172;229;171:*.ps=0;38;2;240;143;169:*.cp=0;38;2;172;229;171:*.mn=0;38;2;172;229;171:*.nb=0;38;2;172;229;171:*.ml=0;38;2;172;229;171:*.di=0;38;2;172;229;171:*.clj=0;38;2;172;229;171:*.mir=0;38;2;172;229;171:*.odt=0;38;2;240;143;169:*.bat=1;38;2;240;143;169:*.out=0;38;2;152;139;162:*.ltx=0;38;2;172;229;171:*.csx=0;38;2;172;229;171:*.erl=0;38;2;172;229;171:*.hxx=0;38;2;172;229;171:*.mp3=0;38;2;245;194;231:*.mpg=0;38;2;245;194;231:*hgrc=0;38;2;172;229;171:*.doc=0;38;2;240;143;169:*.pgm=0;38;2;245;194;231:*TODO=1:*.apk=4;38;2;194;231;240:*.aux=0;38;2;152;139;162:*.vob=0;38;2;245;194;231:*.xcf=0;38;2;245;194;231:*.h++=0;38;2;172;229;171:*.php=0;38;2;172;229;171:*.git=0;38;2;152;139;162:*.cfg=0;38;2;240;222;170:*.bbl=0;38;2;152;139;162:*.sbt=0;38;2;172;229;171:*.bag=4;38;2;194;231;240:*.psd=0;38;2;245;194;231:*.pyo=0;38;2;152;139;162:*.rst=0;38;2;240;222;170:*.exs=0;38;2;172;229;171:*.tgz=4;38;2;194;231;240:*.wmv=0;38;2;245;194;231:*.inc=0;38;2;172;229;171:*.jpg=0;38;2;245;194;231:*.exe=1;38;2;240;143;169:*.epp=0;38;2;172;229;171:*.xml=0;38;2;240;222;170:*.txt=0;38;2;240;222;170:*.zst=4;38;2;194;231;240:*.deb=4;38;2;194;231;240:*.fsx=0;38;2;172;229;171:*.com=1;38;2;240;143;169:*.rtf=0;38;2;240;143;169:*.blg=0;38;2;152;139;162:*.gif=0;38;2;245;194;231:*.dpr=0;38;2;172;229;171:*.tif=0;38;2;245;194;231:*.mkv=0;38;2;245;194;231:*.asa=0;38;2;172;229;171:*.zsh=0;38;2;172;229;171:*.tsx=0;38;2;172;229;171:*.bst=0;38;2;240;222;170:*.ini=0;38;2;240;222;170:*.fnt=0;38;2;245;194;231:*.eps=0;38;2;245;194;231:*.mp4=0;38;2;245;194;231:*.lua=0;38;2;172;229;171:*.rar=4;38;2;194;231;240:*.odp=0;38;2;240;143;169:*.sty=0;38;2;152;139;162:*.hpp=0;38;2;172;229;171:*.tbz=4;38;2;194;231;240:*.tar=4;38;2;194;231;240:*.dll=1;38;2;240;143;169:*.mov=0;38;2;245;194;231:*.dox=0;38;2;172;229;171:*.dmg=4;38;2;194;231;240:*.cxx=0;38;2;172;229;171:*.pps=0;38;2;240;143;169:*.jar=4;38;2;194;231;240:*.wav=0;38;2;245;194;231:*.c++=0;38;2;172;229;171:*.bib=0;38;2;240;222;170:*.wma=0;38;2;245;194;231:*.fsi=0;38;2;172;229;171:*.dot=0;38;2;172;229;171:*.ppm=0;38;2;245;194;231:*.bmp=0;38;2;245;194;231:*.avi=0;38;2;245;194;231:*.swp=0;38;2;152;139;162:*.cpp=0;38;2;172;229;171:*.bsh=0;38;2;172;229;171:*.ics=0;38;2;240;143;169:*.tmp=0;38;2;152;139;162:*.pdf=0;38;2;240;143;169:*.aif=0;38;2;245;194;231:*.tex=0;38;2;172;229;171:*.xlr=0;38;2;240;143;169:*.ogg=0;38;2;245;194;231:*.ppt=0;38;2;240;143;169:*.sxi=0;38;2;240;143;169:*.mid=0;38;2;245;194;231:*.pyd=0;38;2;152;139;162:*.idx=0;38;2;152;139;162:*.bz2=4;38;2;194;231;240:*.ttf=0;38;2;245;194;231:*.pyc=0;38;2;152;139;162:*.pid=0;38;2;152;139;162:*.img=4;38;2;194;231;240:*.vcd=4;38;2;194;231;240:*.ico=0;38;2;245;194;231:*.fon=0;38;2;245;194;231:*.bak=0;38;2;152;139;162:*.tcl=0;38;2;172;229;171:*.iso=4;38;2;194;231;240:*.awk=0;38;2;172;229;171:*.ipp=0;38;2;172;229;171:*.zip=4;38;2;194;231;240:*.xls=0;38;2;240;143;169:*.inl=0;38;2;172;229;171:*.tml=0;38;2;240;222;170:*.m4v=0;38;2;245;194;231:*.flv=0;38;2;245;194;231:*.ps1=0;38;2;172;229;171:*.ilg=0;38;2;152;139;162:*.kts=0;38;2;172;229;171:*.log=0;38;2;152;139;162:*.kex=0;38;2;240;143;169:*.ods=0;38;2;240;143;169:*.elm=0;38;2;172;229;171:*.png=0;38;2;245;194;231:*.sql=0;38;2;172;229;171:*.pas=0;38;2;172;229;171:*.otf=0;38;2;245;194;231:*.pod=0;38;2;172;229;171:*.toc=0;38;2;152;139;162:*.gvy=0;38;2;172;229;171:*.htc=0;38;2;172;229;171:*.pro=0;38;2;172;229;171:*.nix=0;38;2;240;222;170:*.csv=0;38;2;240;222;170:*.mli=0;38;2;172;229;171:*.fls=0;38;2;152;139;162:*.vim=0;38;2;172;229;171:*.pbm=0;38;2;245;194;231:*.ind=0;38;2;152;139;162:*.bcf=0;38;2;152;139;162:*.xmp=0;38;2;240;222;170:*.def=0;38;2;172;229;171:*.swf=0;38;2;245;194;231:*.cgi=0;38;2;172;229;171:*.bin=4;38;2;194;231;240:*.yml=0;38;2;240;222;170:*.rpm=4;38;2;194;231;240:*.pkg=4;38;2;194;231;240:*.arj=4;38;2;194;231;240:*.sxw=0;38;2;240;143;169:*.m4a=0;38;2;245;194;231:*.svg=0;38;2;245;194;231:*.htm=0;38;2;240;222;170:*.orig=0;38;2;152;139;162:*.purs=0;38;2;172;229;171:*.bash=0;38;2;172;229;171:*.tiff=0;38;2;245;194;231:*.pptx=0;38;2;240;143;169:*.yaml=0;38;2;240;222;170:*.json=0;38;2;240;222;170:*.conf=0;38;2;240;222;170:*.lisp=0;38;2;172;229;171:*.java=0;38;2;172;229;171:*.make=0;38;2;172;229;171:*.lock=0;38;2;152;139;162:*.flac=0;38;2;245;194;231:*.toml=0;38;2;240;222;170:*.psm1=0;38;2;172;229;171:*.diff=0;38;2;172;229;171:*.html=0;38;2;240;222;170:*.docx=0;38;2;240;143;169:*.jpeg=0;38;2;245;194;231:*.rlib=0;38;2;152;139;162:*.less=0;38;2;172;229;171:*.xlsx=0;38;2;240;143;169:*.mpeg=0;38;2;245;194;231:*.webm=0;38;2;245;194;231:*.opus=0;38;2;245;194;231:*.h264=0;38;2;245;194;231:*.tbz2=4;38;2;194;231;240:*.epub=0;38;2;240;143;169:*.psd1=0;38;2;172;229;171:*.fish=0;38;2;172;229;171:*.dart=0;38;2;172;229;171:*.hgrc=0;38;2;172;229;171:*.xhtml=0;38;2;240;222;170:*.dyn_o=0;38;2;152;139;162:*.class=0;38;2;152;139;162:*.ipynb=0;38;2;172;229;171:*.patch=0;38;2;172;229;171:*.cabal=0;38;2;172;229;171:*.cmake=0;38;2;172;229;171:*.mdown=0;38;2;240;222;170:*shadow=0;38;2;240;222;170:*passwd=0;38;2;240;222;170:*README=0;38;2;30;30;40;48;2;240;222;170:*.scala=0;38;2;172;229;171:*.shtml=0;38;2;240;222;170:*.swift=0;38;2;172;229;171:*.cache=0;38;2;152;139;162:*.toast=4;38;2;194;231;240:*.matlab=0;38;2;172;229;171:*.ignore=0;38;2;172;229;171:*.dyn_hi=0;38;2;152;139;162:*.groovy=0;38;2;172;229;171:*.gradle=0;38;2;172;229;171:*INSTALL=0;38;2;30;30;40;48;2;240;222;170:*TODO.md=1:*.config=0;38;2;240;222;170:*LICENSE=0;38;2;195;186;198:*COPYING=0;38;2;195;186;198:*.flake8=0;38;2;172;229;171:*setup.py=0;38;2;172;229;171:*.gemspec=0;38;2;172;229;171:*Doxyfile=0;38;2;172;229;171:*.desktop=0;38;2;240;222;170:*Makefile=0;38;2;172;229;171:*TODO.txt=1:*.fdignore=0;38;2;172;229;171:*.rgignore=0;38;2;172;229;171:*.markdown=0;38;2;240;222;170:*.cmake.in=0;38;2;172;229;171:*.kdevelop=0;38;2;172;229;171:*configure=0;38;2;172;229;171:*README.md=0;38;2;30;30;40;48;2;240;222;170:*COPYRIGHT=0;38;2;195;186;198:*.DS_Store=0;38;2;152;139;162:*INSTALL.md=0;38;2;30;30;40;48;2;240;222;170:*.scons_opt=0;38;2;152;139;162:*SConstruct=0;38;2;172;229;171:*SConscript=0;38;2;172;229;171:*README.txt=0;38;2;30;30;40;48;2;240;222;170:*.localized=0;38;2;152;139;162:*.gitconfig=0;38;2;172;229;171:*.gitignore=0;38;2;172;229;171:*CODEOWNERS=0;38;2;172;229;171:*Dockerfile=0;38;2;240;222;170:*LICENSE-MIT=0;38;2;195;186;198:*Makefile.in=0;38;2;152;139;162:*INSTALL.txt=0;38;2;30;30;40;48;2;240;222;170:*.travis.yml=0;38;2;172;229;171:*.gitmodules=0;38;2;172;229;171:*Makefile.am=0;38;2;172;229;171:*MANIFEST.in=0;38;2;172;229;171:*.synctex.gz=0;38;2;152;139;162:*.applescript=0;38;2;172;229;171:*CONTRIBUTORS=0;38;2;30;30;40;48;2;240;222;170:*appveyor.yml=0;38;2;172;229;171:*configure.ac=0;38;2;172;229;171:*.fdb_latexmk=0;38;2;152;139;162:*.clang-format=0;38;2;172;229;171:*.gitattributes=0;38;2;172;229;171:*CMakeLists.txt=0;38;2;172;229;171:*LICENSE-APACHE=0;38;2;195;186;198:*CMakeCache.txt=0;38;2;152;139;162:*CONTRIBUTORS.md=0;38;2;30;30;40;48;2;240;222;170:*requirements.txt=0;38;2;172;229;171:*.sconsign.dblite=0;38;2;152;139;162:*CONTRIBUTORS.txt=0;38;2;30;30;40;48;2;240;222;170:*package-lock.json=0;38;2;152;139;162:*.CFUserTextEncoding=0;38;2;152;139;162"

# zprof
