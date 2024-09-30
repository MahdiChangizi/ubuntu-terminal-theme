#!/bin/bash

echo "🔥 شروع شیطانی‌سازی تنظیمات رنگ ترمینال... 🔥"

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس شیطانی 😈
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=green,bold,underline'         # دستورات با رنگ سبز شیطانی
ZSH_HIGHLIGHT_STYLES[alias]='fg=green,bold,underline'           # Alias ها با رنگ سبز
ZSH_HIGHLIGHT_STYLES[builtin]='fg=green,bold,underline'         # دستورات داخلی با رنگ سبز
ZSH_HIGHLIGHT_STYLES[function]='fg=green,bold,underline'        # توابع با رنگ سبز
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=red,bold,italic' # جایگزینی دستورات قرمز جهنمی
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=cyan,bold,italic'    # جداکننده‌ها با فیروزه‌ای
ZSH_HIGHLIGHT_STYLES[redirection]='fg=purple,bold,italic'       # ریدایرکت‌ها با بنفش تاریک
ZSH_HIGHLIGHT_STYLES[argument]='fg=yellow,bold'                 # آرگومان‌ها زرد هشداری
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=magenta,bold'  # آرگومان‌های تک‌نقل قولی بنفش
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=magenta,bold'  # آرگومان‌های دو‌نقل قولی بنفش
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=red'    # آرگومان‌های $ قرمز خشمگین
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=cyan'     # آرگومان‌های بک‌تیک فیروزه‌ای
ZSH_HIGHLIGHT_STYLES[assign]='fg=yellow,bold'                   # تخصیص‌ها زرد هشدارآمیز

# تنظیم رنگ prompt تاریک و وحشتناک 🖤
PROMPT_COLOR="red"
PROMPT_SYMBOL="💀"  # نماد جذاب و قدرت‌مند

# تنظیم prompt با تم جدید و شیطانی 😈
PROMPT='%F{$PROMPT_COLOR}┌──(%B%F{green}%n%F{$PROMPT_COLOR}%b𖤐 %B%F{green}%m%F{$PROMPT_COLOR}%b)-[%B%F{purple}%~%F{$PROMPT_COLOR}%b]
%F{$PROMPT_COLOR}└─%B%F{red}$PROMPT_SYMBOL%F{$PROMPT_COLOR}%b '

# اضافه کردن نمایش شاخه گیت شیطانی با تم آتشین 🔥
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{yellow}🔥(%b)%r🔥%f'
zstyle ':vcs_info:*' enable git

# فعال کردن هایلایت سینتکس
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

echo "😈 تنظیمات شیطانی رنگ به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting اگر موجود نیست
if [ ! -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    echo "🔥 پلاگین zsh-syntax-highlighting نصب شد."
else
    echo "✅ پلاگین zsh-syntax-highlighting از قبل نصب شده است."
fi

echo "👿 تنظیمات شیطانی کامل شد. ترمینال را ببندید و دوباره باز کنید تا تاریکی را احساس کنید! 💀"

