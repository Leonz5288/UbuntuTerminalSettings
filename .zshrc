# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/leon/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="crunch"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export BRAICHI_REPO_DIR=~/repos/braichi
export PYTHONPATH=$BRAICHI_REPO_DIR:$PYTHONPATH
export PATH=/usr/local/cuda-11.2/bin:$PATH
export PATH=/usr/local/go/bin:$PATH
export PATH=/home/leon/go/bin:$PATH
export PATH=/home/leon/repos/depot_tools:$PATH
export CXX=clang++
export GIT_EDITOR=vim
export VISUAL=vim
export EDITOR="$VISUAL"

source /home/leon/repos/vulkan/1.2.182.0/setup-env.sh

function gcop() {
    git log --color=always --format="%C(cyan)%h %C(blue)%ar%C(auto)%d \
                                               %C(yellow)%s%+b %C(black)%ae" "$@" | 
    fzf -i -e +s --reverse --tiebreak=index --no-multi --ansi \
        --preview="echo {} | grep -o '[a-f0-9]\{7\}' | head -1 | xargs -I % sh -c 'git show --color=always %'" \
        --header "enter: view, C-c: copy hash" \
        --bind "enter:execute:$_viewGitLogLine | less -R" \
        --bind "ctrl-c:execute:$_gitLogLineToHash | xclip -r -selection clipboard"
}


# git shortcut
alias lg='lazygit'
alias gs='git status'
alias gl='git lg'
alias gla='git lg --decorate --all --graph'
alias gd='git diff'
alias gdt='git difftool'
alias gds='git diff --staged'
alias gdts='git difftool --staged'
alias ga='git add'
alias gm='git commit'
alias gpl='git pull'
alias gps='git push'
alias gcop='gcop'

# ls & cd & vim & tree
alias l='ls -alh --group-directories-first -sS'
alias cf='cd $(find -L ./ -type d -print 2>&1 | grep -v "Permission denied" | fzf -i)'
alias cfh='cd $(find -L ~/Desktop -type d -print 2>&1 | grep -v "Permission denied" | fzf -i)'
alias t='tree'
alias v='vim'
alias vd='vim -d'
alias nv='nvim'
alias nvd='nvim -d'

# open/execute files/apps
alias o='xdg-open'
alias wslo='explorer.exe'
alias k='kstart5'

# update, clean, install, remove for ubuntu
alias update='sudo apt update && sudo apt upgrade'
alias updated='sudo apt dist-upgrade'
alias cleaning='sudo apt autoremove && sudo apt autoclean && sudo apt clean'
alias sinstall='sudo apt install'
alias sremove='sudo apt remove'

# sys info
alias b='acpi'
alias B='acpi -V'
alias digip='dig +short myip.opendns.com @resolver1.opendns.com'
alias h='htop'

# miscellaneous
alias p='python3'
alias jl='jupyter lab'
alias jn='jupyter notebook'
alias coverage='/home/richie/.local/bin/coverage'
alias c='clear'
alias bat='batcat'
alias hf='history | fzf'
alias s='source'
alias sz='source ~/.zshrc'
