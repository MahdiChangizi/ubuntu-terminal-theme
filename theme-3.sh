#!/bin/bash

echo "شروع بهبود تنظیمات رنگ ترمینال..."

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=magenta,bold'
ZSH_HIGHLIGHT_STYLES[argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=green'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[assign]='fg=blue,bold'

# تنظیم رنگ prompt
PROMPT_COLOR="green"
PROMPT_SYMBOL="➜"

# تنظیم prompt با رنگ‌های جدید
PROMPT='%F{$PROMPT_COLOR}┌──(%B%F{cyan}%n%F{$PROMPT_COLOR}%b㉿%B%F{cyan}%m%F{$PROMPT_COLOR}%b)-[%B%F{yellow}%~%F{$PROMPT_COLOR}%b]
%F{$PROMPT_COLOR}└─%B%F{green}$PROMPT_SYMBOL%F{$PROMPT_COLOR}%b '

# اضافه کردن نمایش شاخه گیت با رنگ جدید
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%r%f'
zstyle ':vcs_info:*' enable git

# فعال کردن هایلایت سینتکس
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

echo "تنظیمات رنگ به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "پلاگین zsh-syntax-highlighting نصب شد."

echo "بهبود تنظیمات رنگ کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید."
