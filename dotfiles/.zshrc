export JIRA_API_TOKEN="ATATT3xFfGF0-obuRc_PsEEfx7qpDFGYbv0AGioBywm216OEHJWxPEzosEi8egv0ZoRnzTcuqfwgJTdv3zzpueec20AxMLHUkUVjxi73tOasK0bBSz08N-BM5B9g63ceUVdDbVYz1gIWzcD1wJG5Knx-LSj7BvHQep5dFRqmm9o9xoPa-1cLp8o=AD52157F"
# Dotnet tools initialization
export PATH="$PATH:$HOME/.dotnet/tools/"
export PATH="$PATH:/opt/mssql-tools/bin"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:/usr/local/bin/webtorrent"
export PATH="$PATH:/home/jferrara/go/bin"
export export LD_LIBRARY_PATH="/usr/local/lib"
export NODE_EXTRA_CA_CERTS="usr/local/share/ca-certificates/zscaler-root.pem"
export NIXPKGS_ALLOW_UNFREE=1
alias nuget="mono /usr/local/bin/nuget.exe"
EDITOR=nvim

# Case insensitive completion
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

#alias rofi="/home/jferrara/.config/rofi/launchers/type-1/launcher.sh"
alias npush="dotnet nuget push --api-key oy2i6h4vojirqnolo2dqrzlk6vi54ueevao2vpmlr246z4 --source https://api.nuget.org/v3/index.json"

# Node options
# export NODE_OPTIONS=--openssl-legacy-provider

# ssh keychain
{eval ``keychain --eval --agents ssh id_rsa} &>/dev/null


k() { cd .. && exa -l  }
alias 2k="k; k;"
alias 3k="k; k; k;"

# Created by newuser for 5.8.1
alias ho="cd /home/jferrara/"
alias hosts="batcat /mnt/c/Windows/System32/drivers/etc/hosts"
alias ho="cd /home/jferrara/"
alias pr="cd /home/jferrara/repos/; ls"
#alias dexlaminas="docker exec -it $(docker ps -q --filter name=laminas-laminas-1) /bin/bash"
alias brc="nvim /root/.bashrc"
alias ls="exa -l"
alias l="exa -l --icons "
alias lt="exa -l --tree --level=2 --long --icons -a"
alias cl="clear"
alias rm="rm -dfr"
alias rem="rm -dfr"
alias op="explorer.exe ."
alias cred="cat /home/jferrara/vault/novigo/credentials.md"
alias cr="cat /home/jferrara/vault/novigo/credentials.md"
alias vcr="nvim /home/jferrara/vault/novigo/credentials.md"
alias vcred="nvim /home/jferrara/vault/novigo/credentials.md"
function md() {
    mkdir $1
    cd $1
}
function seda() {
    sed -i "s/${1//\//\\/}/${2//\//\\/}/g" *
}
alias sh="sudo shutdown"
alias s="/home/jferrara/.scripts/dmscripts/scripts/dm-hub"
alias rb="cd /etc/nixos/ && sudo nixos-rebuild --flake .#jferrara switch --fast"
function s() {
    query="https://www.google.com/search?q="+$*
    chrome.exe $query
}
function sl() {
    query="https://duckduckgo.com/?q=!ducky+"+$*
    chrome.exe $query
}

function upload() {
BASE_URL="https://wasabi-uploader.fly.dev/upload"

for file in *; do
  if [ -f "$file" ]; then
    curl -X POST -F "file=@$file" "$BASE_URL"
  fi
done
}

function upload_wav() {
BASE_URL="https://wasabi-uploader.fly.dev/upload_wav"

for file in *.wav; do
  if [ -f "$file" ]; then
    curl -X POST -F "file=@$file" "$BASE_URL"
  fi
done
}

# cx() { cd "$@" && exa --icons -a; }
# alias cd="cx";
alias js="jq";
alias debug="make debug"

alias q="exit";
alias cm="cmatrix -C white -u 9";
alias va="nvim /home/jferrara/vault/"
function utar() {
    tar xzf $1
    rm $1
}
alias untar="utar"

#Docker
function docker_compose_exec { docker-compose exec -it "$1" /bin/bash -c "$2"; }

alias dc="docker-compose"
alias dcp="docker-compose ps"
alias dcu="docker-compose up -d"
alias dcub="docker-compose up -d --build"
alias dcl="docker-compose ls"
alias dce="docker_compose_exec"
alias dcdb="docker_compose_exec db 'mysql -u root -p -h localhost'"

#dotnet
alias dn="/root/.dotnet/dotnet"
alias dnb="dn build"
alias dnr="dn run --project"

#git
alias lg="lazygit"
alias status="tmux neww git log --graph --pretty=format:\'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset\' --abbrev-commit"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias lgp="powershell lazygit"

#nvim
#alias vi="tmux neww nvim -c 'lua require(\"harpoon.ui\").nav_file(1)'; exit"
alias vi="nvim"
alias vim="nvim -c 'Telescope find_files; exit'"
alias nvim="nvim"
alias hdmi="/home/jferrara/.scripts/xrandr/hdmi.sh"

alias m="make"
alias mr="make reset"
alias mi="make install"
alias mb="make build"
alias mp="make publish"
alias npush="dotnet nuget push -k oy2ennom7xpdiyoheclq5wxt2q2hjbzunlx3uz6hujx42u --source https://api.nuget.org/v3/index.json"

function transfer {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename $1) | tee /dev/null;
}

alias transfer=transfer

#ranger
function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

# bindkey -s '^O' 'ranger-cd\n'
alias lf="ranger-cd"
alias ra="ranger-cd"
alias fd="fdfind"

#Plugins 
autoload -U compinit && compinit
zstyle ':completion:*' menu select

zx() { z "$@" && ls; }
vx() { z "$@" && nvim; }
alias vd="vx"
alias bat="batcat"
alias cat="bat -P"
alias pman="./root/scripts/pman.sh"
alias pm="/root/.scripts/pman.sh"
alias fzf="fzf --preview 'batcat --color=always --style=numbers --line-range=:500 {}'"
alias new="touch"
alias apt="nala"
alias install="sudo nala -y install"
alias uninstall="sudo nala remove"
alias search="sudo nala search"
alias in="sudo nala -y install"
alias nix='nix --extra-experimental-features "nix-command flakes"'
alias nixs='nix --extra-experimental-features "nix-command flakes" search nixpkgs'
alias nixi='nix-env -iA nixpkgs.'
alias nixgc='nix-env --delete-generations old; nix-store --gc'
alias un="sudo nala -y remove"

bindkey '^J' autosuggest-execute
#bindkey "0x6j" autosuggest-execute

export dotnet=/home/jferrara/.dotnet/dotnet

#ToggleTerm
function git-flow-jira-feature {
    clear
    local result=$(jira issue list -a$(jira me) --order-by rank --reverse --plain | fzy)
    local aRes=$(echo $result | awk '{print $2}')
    git flow feature start $aRes
}

alias gitlines="git diff --stat HEAD~1..HEAD"

function view-jira-issue {
    clear
    local result=$(jira issue list -a$(jira me) --order-by rank --reverse --plain | fzy)
    local id=$(echo $result | awk '{print $2}')
    jira issue view $id
}
alias hj="view-jira-issue"
# alias ="clear && jira issue list -a$(jira me) --order-by rank --reverse --plain | fzf | awk '{print \$2}'"

function f() {
    out=$(fdfind $1 | fzf)
    echo $out | xclip
    echo $out
}
alias p="xclip -o"

timezsh() {
  shell=${1-$SHELL}
  for i in $(seq 1 10); do /usr/bin/time $shell -i -c exit; done
}

#History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

function c { file=$(exa -a | fzy) cat $file }
function h { history | fzy }

#TMUX
alias tm="tmux"
alias ta="tmux attach"
alias tkd="tmux list-sessions -F '#{session_attached} #{session_id}' | awk '/^0/{print $2}' | xargs -n 1 tmux kill-session -t"
alias tk="tmux kill-session"
export TERM="xterm-256color"
#source /home/jferrara/.scripts/t.sh
alias ch="/root/.scripts/tmux-cht.sh"
alias cg="/root/.scripts/cgpt.sh"
alias gpt="/root/.scripts/cgpt.sh"

alias sus="systemctl suspend"
# if [ "$TMUX" = "" ]; then tn; fi

alias wifi='/home/jferrara/.scripts/wifi.sh'
alias wifi-lorenza='nmcli dev wifi connect 64:70:02:B7:42:E4 password igeamarina'
alias wifi-ferrara='nmcli dev wifi connect 64:70:02:FC:04:BC password elettra1'

alias domains="godaddy domains"

source /home/jferrara/.scripts/z-plugin.sh

alias reboot="sudo reboot"
alias feh="feh --bg-fill"
alias conf="nvim /home/jferrara/.dotfiles"
alias speed="speedtest-rs"
alias pkg="nix --extra-experimental-features 'nix-command flakes' search nixpkgs"
alias pkgrm="/home/jferrara/.scripts/pkgrm.sh"
function scr() {
    touch $1
    chmod +x $1
}

eval "$(starship init zsh)"
# eval "$(mcfly init zsh)"

export EXA_COLORS="\
uu=36:\
gu=37:\
sn=32:\
sb=32:\
da=34:\
ur=34:\
uw=35:\
ux=36:\
ue=36:\
gr=34:\
gw=35:\
gx=36:\
tr=34:\
tw=35:\
tx=36:"

if ! command -v tmux &> /dev/null; then
    tmux
fi

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
