# -----------------------------
# 🛠️  PATH Configuration
# -----------------------------
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/share/nvim/lsp_servers/python/node_modules/.bin:$PATH"
export PATH="$HOME/.local/share/nvim/lsp_servers/clangd/clangd/bin:$PATH"

# -----------------------------
# 🎨 LS_COLORS (Nord-tuned, drives zsh completion list-colors below)
# Bold + truecolor so entries stay crisp against a dark background.
# Set before oh-my-zsh loads so its "not very pretty" fallback doesn't win.
# -----------------------------
export LS_COLORS="di=1;38;2;136;192;208:ln=1;38;2;180;142;173:so=1;38;2;163;190;140:pi=1;38;2;235;203;139:ex=1;38;2;191;97;106:bd=1;38;2;235;203;139;48;2;59;66;82:cd=1;38;2;235;203;139;48;2;59;66;82:su=1;38;2;46;52;64;48;2;191;97;106:sg=1;38;2;46;52;64;48;2;136;192;208:tw=1;38;2;46;52;64;48;2;163;190;140:ow=1;38;2;46;52;64;48;2;235;203;139"

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
alias vim="nvim"
alias v="vim"

function kill_port {
  # free the vite dev port (3000) before starting
  local pids
  pids=$(lsof -ti tcp:3000 -sTCP:LISTEN)
  if [[ -n "$pids" ]]; then
    echo "Killing process on :3000 -> $pids"
    kill $pids 2>/dev/null
    # wait up to ~3s for graceful exit, then force
    for i in {1..6}; do
      lsof -ti tcp:3000 -sTCP:LISTEN >/dev/null || break
      sleep 0.5
    done
    lsof -ti tcp:3000 -sTCP:LISTEN >/dev/null && kill -9 $(lsof -ti tcp:3000 -sTCP:LISTEN) 2>/dev/null
  fi

}
function web {
  kill_port
  npm run dev
}
alias npr="npm run"
alias GS="git stash"
alias GSP="git stash pop"
export EDITOR='nvim'


function gc() { git clone $1 }
function gp() { git checkout develop && git pull origin }
function gpr() { git checkout $1 && git pull origin }
function runTest() {
  cd /Users/sourav/Code/frontend-dashboard/Playwright-Test
  HEADED=1 ./node_modules/.bin/playwright test $@ --project=chromium --workers=1
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

# -----------------------------
# 📋 Dashboard env switchers
# -----------------------------
# Copy an environment's dashboard-common.env into the dashboard .env file.
# Resolves paths from the git repo root, so these work from any subdirectory.
_cp_dashboard_env() {
    local env_name="$1"
    local repo_root
    repo_root="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [ -z "$repo_root" ]; then
        echo "cp_${env_name}: not inside a git repository" >&2
        return 1
    fi
    local src="$repo_root/ops/env/${env_name}/dashboard-common.env"
    local dest="$repo_root/src/galileo_apps/dashboard/.env"
    if [ ! -f "$src" ]; then
        echo "cp_${env_name}: source not found: $src" >&2
        return 1
    fi
    cp "$src" "$dest" && echo "Copied ${env_name} env -> $dest"
}

cp_stg()     { _cp_dashboard_env staging; }
cp_prod()    { _cp_dashboard_env production; }
cp_preprod() { _cp_dashboard_env preprod; }

alias goto="cd /Users/sourav/Code/frontend-dashboard/src/galileo_apps/dashboard"

