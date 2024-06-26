# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# ZSH_THEME="lambda"
PROMPT='%~/ $(git_prompt_info)%{$reset_color%}'
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

autoload -Uz compinit promptinit
compinit
promptinit

PATH="$HOME/.npm-global/bin:$PATH"
export npm_config_prefix=~/.npm-global
# export QT_QPA_PLATFORMTHEME=qt5ct
export QT_QPA_PLATFORMTHEME=gtk3

# PATH="$HOME/.node_modules/bin:$PATH"
# export npm_config_prefix=~/.node_modules
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:~/.my-scripts
export PATH=$PATH:~/.the-knowledge-garden/scripts
export OPENAI_API_KEY=$(cat ~/shared-2/.openai-api-key)
export DISPLAY=:0
# export TERM=xterm-kitty

#Vi style
#set -o vi
bindkey -v
export KEYTIMEOUT=1

alias ls='ls -1 --color=auto'
# alias ls='yazi'
alias rmorphans='sudo pacman -Rns $(pacman -Qtdq)'
alias fbtofbzip="find . -name '*.fb2' -print -exec zip '{}'.zip '{}' \; -exec rm '{}' \;"
alias webcam='mpv av://v4l2:/dev/video0'
alias wifi-menu='sudo wifi-menu'
alias backl='sudo vim /sys/class/backlight/amdgpu_bl0/brightness'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias chillmeup='mpv --no-video https://www.youtube.com/watch\?v\=5qap5aO4i9A --volume=40'
alias chilldrive='mpv --no-video https://www.youtube.com/watch\?v\=2R0J1EN5hu0 --volume=40'
alias grep='grep --colour=auto'
alias tojxl='find . -type f -regextype sed -regex ".*[^jxl|mp4]" -exec sh -c 'cjxl -q 100 {} "${0%.*}.jxl"' {} \;'
alias mountfa='sudo mount -t vfat -ouser,umask=0000'
alias mupdf='mupdf -C FBF1C7'
# alias dic='sgpt --model=gpt-4 --role dic'
alias datesystemwasintalled='ls -l --time=creation /var/log/pacman.log'
alias gf='myfunction() { sgpt --role corrector "$1" | tee /dev/tty | xclip -selection clipboard; }; myfunction'
alias def='sgpt --role dictionary'
alias gpt='sgpt --repl temp'
alias listen='mpv --no-video'
alias wkdict='wkdict --limit 999'
alias lofi='mpv --shuffle ~/shared-2/audio/lofi-girl'
alias dpin='yarn && yarn configure test'
alias dpstart='yarn && yarn configure test && yarn dev'
alias boin='yarn && yarn configure test'
alias bostart='yarn && yarn configure test && yarn start'
alias bfm='mpv "$(find ~/shared-2/audio/background-music/brainfm | shuf -n 1)" & disown'
alias yt='yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
alias inno='sudo n $(cat package.json | jq -r ".engines.node[2:]")'
alias brainfm='mpv "$(find ~/shared-2/audio/background-music/brainfm | shuf -n 1)" & disown'

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
