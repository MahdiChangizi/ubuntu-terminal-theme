#!/bin/bash

echo "آغاز پیکربندی ترمینال شیطانی و فوق‌العاده خفن..."

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#FF0000,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#8B0000,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#800080,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#4B0082,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#B22222,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#8B008B,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#A52A2A,bold'
ZSH_HIGHLIGHT_STYLES[argument]='fg=#DC143C'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#FF69B4'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#FF69B4'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#C71585'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#C71585'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#8E4585,bold'

# تنظیم رنگ prompt
PROMPT_COLOR="#FF0000"
PROMPT_SYMBOL="†"

# تنظیم prompt با طرح شیطانی
PROMPT='%F{#FF0000}┌──[%B%F{#800080}魔王%F{#FF0000}%b]──(%B%F{#8B0000}%n%F{#FF0000}%b†%B%F{#8B0000}%m%F{#FF0000}%b)──[%B%F{#4B0082}%~%F{#FF0000}%b]
%F{#FF0000}└─%B%F{#FF0000}$PROMPT_SYMBOL%F{#FF0000}%b '

# اضافه کردن نمایش شاخه گیت با رنگ شیطانی
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{#8B0000}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# فعال کردن هایلایت سینتکس
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# تنظیم رنگ‌های ls
export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"
export LS_COLORS="di=1;31:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# الیاس‌های رنگی
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# تنظیم رنگ برای man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # شروع متن چشمک‌زن
export LESS_TERMCAP_md=$'\E[1;35m'     # شروع متن پررنگ
export LESS_TERMCAP_me=$'\E[0m'        # پایان متن
export LESS_TERMCAP_so=$'\E[01;44;33m' # شروع خروجی
export LESS_TERMCAP_se=$'\E[0m'        # پایان خروجی
export LESS_TERMCAP_us=$'\E[4;31m'     # شروع زیرخط
export LESS_TERMCAP_ue=$'\E[0m'        # پایان زیرخط

# تنظیم پس‌زمینه ترمینال (اگر ترمینال از آن پشتیبانی کند)
echo -e "\033]11;#000000\007"

# اضافه کردن پیام خوش‌آمدگویی شیطانی
cat << "WELCOME" >> ~/.zshrc
echo "
 ██▓███    ▒█████    █     █░ ▓█████  ██▀███         ▒█████     █████
▓██░  ██  ▒██▒  ██  ▓█░ █ ░█  ▓█   ▀ ▓██ ▒ ██       ▒██▒  ██  ▒██▓  ██
▓██░ ██▓  ▒██░  ██  ▒█░ █ ░█  ▒███   ▓██ ░▄█       ▒██░  ██  ▒██▒  ██
▒██▄█▓▒   ▒██   ██  ░█░ █ ░█  ▒▓█  ▄ ▒██▀▀█▄       ▒██   ██  ░██  █▀
▒██▒ ░    ░ ████▓▒  ░░██▒██▓  ░▒████ ░██▓ ▒██      ░ ████▓▒  ░▒███▒█
▒▓▒░ ░    ░ ▒░▒░▒░  ░ ▓░▒ ▒   ░░ ▒░  ░ ▒▓ ░▒▓      ░ ▒░▒░▒░  ░░ ▒▒░ ▒
░▒ ░        ░ ▒ ▒░    ▒ ░ ░    ░ ░     ░▒ ░ ▒        ░ ▒ ▒░   ░ ▒░  ░
░░        ░ ░ ░ ▒     ░   ░      ░     ░░   ░      ░ ░ ░ ▒      ░   ░
               ░ ░       ░        ░     ░                ░ ░      ░

به قلمرو تاریکی خوش آمدید...
"
WELCOME

EOF

echo "تنظیمات ترمینال شیطانی و فوق‌العاده خفن به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting اگر قبلاً نصب نشده باشد
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "پلاگین zsh-syntax-highlighting نصب شد."
else
    echo "پلاگین zsh-syntax-highlighting قبلاً نصب شده بود."
fi

echo "پیکربندی ترمینال شیطانی و فوق‌العاده خفن کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید."
