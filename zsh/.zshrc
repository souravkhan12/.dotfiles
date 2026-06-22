# -----------------------------
# 🛠️  PATH Configuration
# -----------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin:$PATH"

# -----------------------------
# 📦 Oh-My-Zsh Config
# -----------------------------
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(git zsh-completions zsh-autosuggestions zsh-nvm)

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
alias goto="~/Programming/CPP/"
alias web="npm run dev"
alias npr="npm run"
export EDITOR='nvim'


function gc() { git clone $1 }
function gp() { git checkout develop && git pull origin }
function gpr() {git checkout $1 && git pull origin }
function runTest() {
  cd /Users/sourav/frontend-dashboard/Playwright-Test
  HEADED=1 ./node_modules/.bin/playwright test $1 --project=chromium --workers=1
}

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

load-nvm() {
  unset -f node npm npx nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
}

node() { load-nvm; node "$@"; }
npm() { load-nvm; npm "$@"; }
npx() { load-nvm; npx "$@"; }
nvm() { load-nvm; nvm "$@"; }
export DOCKER_HOST='unix:///var/run/docker.sock'


function nvm_prompt_info() {
  if command -v nvm &>/dev/null; then
    local version=$(nvm current)
    echo "⬢ $version"
  fi
}

# Pop up a macOS confirmation before a destructive delete.
# Returns 0 (proceed) only if the user clicks "Yes".
function _confirm_delete {
  local answer
  answer=$(osascript \
    -e "display dialog \"Do you really want to delete?

$*\" buttons {\"No\", \"Yes\"} default button \"No\" with icon caution with title \"Confirm deletion\"" \
    -e 'button returned of result' 2>/dev/null)
  [ "$answer" = "Yes" ]
}

# Guard `rm` for recursive deletes (-r/-R/-rf/-fr/--recursive); plain rm passes through.
function rm {
  local recursive=0 arg
  for arg in "$@"; do
    case "$arg" in
      --recursive) recursive=1 ;;
      --) break ;;
      -[!-]*) [[ "$arg" == *[rR]* ]] && recursive=1 ;;
    esac
  done
  if (( recursive )); then
    if _confirm_delete "rm $*"; then
      command rm "$@"
    else
      echo "rm: cancelled"
      return 1
    fi
  else
    command rm "$@"
  fi
}

function rmrf {
  if [ $# -eq 0 ]; then
    echo "rmrf: nothing to delete"
    return 1
  fi
  if _confirm_delete "rm -rf $*"; then
    command rm -rf "$@"
  else
    echo "rmrf: cancelled"
    return 1
  fi
}

if [ "$XDG_CURRENT_DESKTOP" = "Hyprland" ]; then
    export HYPRLAND_ACTIVE=1
fi

eval "$(starship init zsh)"
export PATH="$HOME/.local/bin:$PATH"
