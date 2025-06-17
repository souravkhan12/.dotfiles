# -----------------------------
# 🛠️  PATH Configuration
# -----------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin:$PATH"
export PATH=$PATH:~/.local/bin/clangd

# -----------------------------
# 📦 Oh-My-Zsh Config
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"
#ZSH_THEME="avit"
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="agnoster"

ZSH_THEME="bureau"



# Plugins
plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# -----------------------------
# 🖥️  Language & Encoding
# -----------------------------
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_TYPE=en_US.UTF-8

# -----------------------------
# 📚 Aliases & Functions
# -----------------------------
alias py="python3"
alias vim="/bin/nvim"
alias v="/bin/vim"
export EDITOR='nvim'

function gc() { git clone $1 }

function makeclear() {
  sudo pacman -Qttdq | sudo pacman -Rns -
}

function mkcd {
  if [[ -z $1 ]]; then
    echo "Enter a directory name"
  elif [[ -d $1 ]]; then
    echo "Already Present"
  else
    mkdir $1 && cd $1
  fi
}

function r { ./a.out; }

function clean {
  if [[ -f $1 ]]; then
    rm *
  elif [[ -d $1 ]]; then
    rm -rf *
  else
    clear
  fi
}

function update {
    sudo dnf upgrade
}

function run {
    g++ -std=c++20 -Wall -Wextra -Wshadow -Werror -O2 -DLOCAL $1
}

# -----------------------------
# 🔍 FZF Configuration
# -----------------------------
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files --hidden'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

_gen_fzf_default_opts_solarized() {
  local blue="4" base1="14" base02="0" yellow="3" base3="15"

  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base1,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}

if [[ "$TERM" =~ (rxvt|xterm|alacritty|tmux) ]]; then
  _gen_fzf_default_opts_solarized
fi

[[ -f /usr/share/fzf/completion.zsh ]] && source /usr/share/fzf/completion.zsh
[[ -f /usr/share/fzf/key-bindings.zsh ]] && source /usr/share/fzf/key-bindings.zsh

# -----------------------------
# 📦 LS Colors & Completion Cache
# -----------------------------
[[ -e ~/.dircolors ]] && eval "$(dircolors ~/.dircolors)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# -----------------------------
# ⚙️  Miscellaneous Config
# -----------------------------
NVM_LAZY=1


export STARSHIP_CONFIG=~/.config/starship.toml

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
