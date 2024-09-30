#!/bin/bash

echo "شروع بازگرداندن تنظیمات به حالت اولیه..."

# پشتیبان‌گیری از فایل فعلی .zshrc
if [ -f ~/.zshrc ]; then
    cp ~/.zshrc ~/.zshrc.backup
    echo "پشتیبان‌گیری از فایل .zshrc انجام شد."
fi

# بازگرداندن فایل .zshrc به حالت اولیه
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
echo "فایل .zshrc به تنظیمات اولیه بازگردانده شد."

# حذف پلاگین zsh-syntax-highlighting در صورت وجود
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    rm -rf ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    echo "پلاگین zsh-syntax-highlighting حذف شد."
fi

echo "شروع بهبود تنظیمات رنگ ترمینال..."

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=yellow,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='fg=blue,bold'

# تنظیم رنگ prompt
PROMPT_COLOR="cyan"
PROMPT_SYMBOL="➜"

# تنظیم prompt با رنگ‌های جدید
PROMPT='%F{$PROMPT_COLOR}┌──(%B%F{red}%n%F{$PROMPT_COLOR}%b㉿%B%F{red}%m%F{$PROMPT_COLOR}%b)-[%B%F{blue}%~%F{$PROMPT_COLOR}%b]
%F{$PROMPT_COLOR}└─%B%F{magenta}$PROMPT_SYMBOL%F{$PROMPT_COLOR}%b '

# اضافه کردن نمایش شاخه گیت با رنگ جدید
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# فعال کردن هایلایت سینتکس
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

echo "تنظیمات رنگ به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting در صورتی که وجود نداشته باشد
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "پلاگین zsh-syntax-highlighting نصب شد."
else
    echo "پلاگین zsh-syntax-highlighting قبلاً نصب شده است."
fi

echo "بهبود تنظیمات رنگ کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید."
