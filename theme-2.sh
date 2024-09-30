#!/bin/bash

echo "شروع پیکربندی ترمینال فوق‌العاده خفن..."

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#00FFFF,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#FF00FF,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#FFD700,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#1E90FF,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#FF4500,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#32CD32,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#FF1493,bold'
ZSH_HIGHLIGHT_STYLES[argument]='fg=#00FA9A'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#FF69B4'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#FF69B4'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#B0E0E6'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#B0E0E6'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#00BFFF,bold'

# تنظیم رنگ prompt
PROMPT_COLOR="#FF00FF"
PROMPT_SYMBOL="⚡"

# تنظیم prompt با رنگ‌های نئون
PROMPT='%F{#00FFFF}┌──(%B%F{#FF1493}%n%F{#00FFFF}%b⚡%B%F{#FF1493}%m%F{#00FFFF}%b)-[%B%F{#1E90FF}%~%F{#00FFFF}%b]
%F{#00FFFF}└─%B%F{#FF00FF}$PROMPT_SYMBOL%F{#00FFFF}%b '

# اضافه کردن نمایش شاخه گیت با رنگ نئون
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{#FFD700}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# فعال کردن هایلایت سینتکس
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# تنظیم رنگ‌های ls
export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"
export LS_COLORS="di=1;36:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"

# الیاس‌های رنگی
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# تنظیم رنگ برای man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # شروع متن چشمک‌زن
export LESS_TERMCAP_md=$'\E[1;36m'     # شروع متن پررنگ
export LESS_TERMCAP_me=$'\E[0m'        # پایان متن
export LESS_TERMCAP_so=$'\E[01;44;33m' # شروع خروجی
export LESS_TERMCAP_se=$'\E[0m'        # پایان خروجی
export LESS_TERMCAP_us=$'\E[1;32m'     # شروع زیرخط
export LESS_TERMCAP_ue=$'\E[0m'        # پایان زیرخط

EOF

echo "تنظیمات رنگ فوق‌العاده خفن به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting اگر قبلاً نصب نشده باشد
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "پلاگین zsh-syntax-highlighting نصب شد."
else
    echo "پلاگین zsh-syntax-highlighting قبلاً نصب شده بود."
fi

echo "پیکربندی ترمینال فوق‌العاده خفن کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید."
