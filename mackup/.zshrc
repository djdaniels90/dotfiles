DEFAULT_USER=$USER

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Added by Zinit's installer
### Check if zinit is installed or install if needed
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# Add iterm shell intergrations if present
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Source some repos
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet PZT::modules/helper/init.zsh

# NOTE: Before each prompt, direnv checks for the existence of a .envrc file in the current
# and parent directories. If the file exists (and is authorized), it is loaded into a bash
# sub-shell and all exported variables are then captured by direnv and then made available
# to the current shell.
# https://github.com/direnv/direnv
# https://zdharma.org/zinit/wiki/Direnv-explanation/
zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
    atpull'%atclone' pick"direnv" src"zhook.zsh" for \
    direnv/direnv

# https://zdharma.org/zinit/wiki/LS_COLORS-explanation/
# https://github.com/trapd00r/LS_COLORS
zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

zinit ice depth=1
zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


zinit ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"

zinit light b4b4r07/httpstat
zinit light rupa/z

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' zinit light zsh-users/zsh-completions

zinit for \
    light-mode  zdharma/history-search-multi-word \
    light-mode  zinit-zsh/z-a-bin-gem-node \
    light-mode  zinit-zsh/z-a-submods \

zinit ice wait"2" lucid from"gh-r" as"program" mv"exa* -> exa"
zinit light ogham/exa

#  or rg?
# zinit ice from"gh-r" as"program"
# zinit light junegunn/fzf-bin

# sharkdp/fd
zinit ice as"command" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# sharkdp/bat
zinit ice as"command" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

# asciinema
zinit ice as"command" wait lucid \
    atinit"export PYTHONPATH=$ZPFX/lib/python3.7/site-packages/" \
    atclone"python3 setup.py --quiet install --prefix $ZPFX" \
    atpull'%atclone' test'0' \
    pick"$ZPFX/bin/asciinema"

# Terminal GIPHY creator cast terminal
# zinit load asciinema/asciinema.git

#  Virtual Env Related Shit
#  PYENV, RVM, NVM...

# zinit ice atclone'PYENV_ROOT="$PWD" ./libexec/pyenv init - > zpyenv.zsh' \
#     atinit'export PYENV_ROOT="$PWD"' atpull"%atclone" \
#     as'command' pick'bin/pyenv' src"zpyenv.zsh" nocompile'!'
# zinit light pyenv/pyenv

# zinit creinstall %HOME/my_completions


export PATH="/usr/local/sbin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# can change all these custom sources to conditionaly load them through zpromp.
# the goal would be to make it so we can source this file only into server

source ~/.exports
source ~/.functions
source ~/.aliases
# source ~/.upstart_env.sh
# source ~/.secrets

ulimit -n 21504
ulimit -c 2000
ulimit -s 10000



# export PIPENV_VENV_IN_PROJECT=1
# zplug "plugins/git", from:oh-my-zsh
# zplug "b4b4r07/enhancd", use:init.sh
# zplug "plugins/npm", from:oh-my-zsh
# zplug "plugins/brew", from:oh-my-zsh
# zplug "plugins/docker", from:oh-my-zsh
# zplug "plugins/docker-machine", from:oh-my-zsh
# # https://github.com/zsh-users/zsh-autosuggestions requires brew
# zplug "zsh-users/zsh-autosuggestions"
# # https://github.com/zsh-users/zsh-completions requires brew
# zplug "zsh-users/zsh-completions"
# zplug "lukechilds/zsh-better-npm-completion", defer:2

# # zplug "knu/z", use:z.sh
# unalias run-help
# autoload run-help
# HELPDIR=/usr/local/share/zsh/help

# zplug "plugins/rvm", from:oh-my-zsh, lazy:1
# export NVM_AUTO_USE=true
# zplug "lukechilds/zsh-nvm"

# auto-pipenv.zsh
# zplug "djdaniels90/759dc65d7775f76e5117337b59dc4833", from:gist
# zplug "plugins/pyenv", from:oh-my-zsh
# zplug "paulmelnikow/zsh-startup-timer"

# if [ $commands[kubectl] ]; then
# 	zplug "plugins/kubectl", from:oh-my-zsh
# 	source <(kubectl completion zsh)
# fi
# zplug "plugins/virtualenvwrapper", from:oh-my-zsh
# zplug "plugins/pip", from:oh-my-zsh
# [ -z "${PIPENV_ACTIVE}" ] && {
#
# 		# eval "$(pipenv --completion)"
# }
zinit light tysonwolker/iterm-tab-colors

# zplug "zlsun/solarized-man"
# zplug "bric3/nice-exit-code"
# zplug "arzzen/calc.plugin.zsh"

# autoload -Uz add-zsh-hook

# change-prompt-title() {
#   echo -ne "\e]1;${PWD##*/}\a"
# }

# add-zsh-hook chpwd change-prompt-title

# periodic
#
# add-zsh-hook chpwd change-prompt-title
# zplug  "hagkozak/zhooks", use:zhooks.plugin.zsh

# zplug "lukechilds/zsh-better-npm-completion"
# zstyle ':completion:*' menu select=2
# zplug "zsh-users/zsh-history-substring-search"
# zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"

# zplug "teamupstart/upstart_web", \
#     as:command, \
#     depth:1, \
#     use: 'upstart-drop-a-pod/(*).bash', \
#     rename-to:'dropapod'

# httpstat --help
# zplug "b4b4r07/httpstat", \
#     as:command, \
#     use:'(*).sh', \
#     rename-to:'$1'

# zplug "HaleTom/89ffe32783f89f403bba96bd7bcd1263", \
# 		from:gist, \
# 		as:command, \
# 		use:'(*).sh', \
#     rename-to:'colortest'

# zplug "iam4x/zsh-iterm-touchbar"

# if type brew &>/dev/null; then
#   FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# fi

# The following lines were added by compinstall
# zstyle :compinstall filename '~/.zshrc'

# autoload -Uz compinit
# compinit
# # End of lines added by compinstall
# # Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=5000
# SAVEHIST=5000
# setopt appendhistory autocd extendedglob notify
# bindkey -v
# End of lines configured by zsh-newuser-install

#
# if command -v pyenv 1>/dev/null 2>&1; then
# 	echo 'pyenv found using it'
#   	eval "$(pyenv init -)"
# 	eval "$(pyenv virtualenv-init -)"
# fi
# PERIODIC=10
# docker-link &
# Show splash screen
neofetch
eval "$(direnv hook zsh)"
