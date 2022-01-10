# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/zkurtanidze/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true" # Uncomment the following line to disable bi-weekly auto-update checks.
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
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#3B4252,bold,underline"
bindkey '^N' autosuggest-accept

source $ZSH/oh-my-zsh.sh


. ~/z/z.sh
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
# You may need to manually set your language environment export LANG=en_US.UTF-8

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
alias python=python3
alias go=z
alias vim=nvim
alias vimconf="nvim ~/.config/nvim/init.vim"
alias tmuxconf="nvim ~/.tmux.conf"
alias termconf="nvim ~/.config/alacritty/alacritty.yml"
alias zshconf="nvim ~/.zshrc"
alias autojournal="ssh root@165.232.153.9"

alias con_wifi="nmcli dev wifi connect" 
alias scan_bluetooth="hcitool -i hci0 scan" 
alias con_bluetooth="bluetoothctl" # trust {ID} | # connect {ID}
alias fzfi='rg --files --hidden --follow --no-ignore-vcs -g "!{node_modules,.git}" | fzf'
alias testspeed='curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -'

set -g default-terminal "xterm"

export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "pygmentize {} | less -R"'
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

stty -ixon
export TERM=xterm-256color

test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

test -r ~/.dir_colors && eval $(dircolors ~/.dir_colors)

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context
    dir
    vcs
    newline
    os_icon
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    time
)

POWERLEVEL9K_DIR_BACKGROUND='#5E81AC'
POWERLEVEL9K_DIR_FOREGROUND="#D8DEE9"
POWERLEVEL9K_DIR_SHORTENED_FOREGROUND="#D8DEE9"
POWERLEVEL9K_DIR_ANCHOR_FOREGROUND="#D8DEE9"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='#88C0D0'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='#88C0D0'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='#88C0D0'
POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND='#88C0D0'
POWERLEVEL9K_VCS_LOADING_BACKGROUND='#88C0D0' 

POWERLEVEL9K_TIME_FOREGROUND='#E5E9F0'
POWERLEVEL9K_TIME_BACKGROUND='#4C566A'

POWERLEVEL9K_VCS_BRANCH_ICON=" "

POWERLEVEL9K_OS_ICON_FOREGROUND="#3B4252"
POWERLEVEL9K_OS_ICON_BACKGROUND="#7EB2C1"
POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION=''

POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR='─'

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/home/zkurtanidze'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet


export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
