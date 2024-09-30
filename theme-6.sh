#!/bin/bash

echo "🎨 شروع بهبود حرفه‌ای و هنری تنظیمات ترمینال... 🎨"

# اضافه کردن تنظیمات جدید به .zshrc
cat << 'EOF' >> ~/.zshrc

# تنظیمات رنگ برای هایلایت سینتکس حرفه‌ای 🌈
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[command]='fg=#00ffcc,bold'               # دستورات با رنگ فیروزه‌ای خیره‌کننده
ZSH_HIGHLIGHT_STYLES[alias]='fg=#00ffcc,bold'                 # Alias ها با رنگ فیروزه‌ای
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#00ffcc,bold'               # دستورات داخلی با فیروزه‌ای
ZSH_HIGHLIGHT_STYLES[function]='fg=#ff66cc,bold'              # توابع با رنگ صورتی روشن و شیک
ZSH_HIGHLIGHT_STYLES[command-substitution]='fg=#ffcc00,italic' # جایگزینی دستورات زرد طلایی
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=#ff33cc,bold'       # جداکننده‌ها صورتی شارپ
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#ff00ff,bold'           # ریدایرکت‌ها بنفش متالیک
ZSH_HIGHLIGHT_STYLES[argument]='fg=#ffff66,bold'              # آرگومان‌ها زرد روشن با تاکید
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#66ff66,bold' # آرگومان‌های تک‌نقل قولی سبز درخشان
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#66ff66,bold' # آرگومان‌های دو‌نقل قولی سبز
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=#ff6699' # آرگومان‌های $ صورتی تیره
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=#33ccff'  # آرگومان‌های بک‌تیک آبی روشن
ZSH_HIGHLIGHT_STYLES[assign]='fg=#ff33ff,bold'                # تخصیص‌ها با بنفش زنده

# طراحی ویژه برای prompt زیبا و خاص 😎
PROMPT_COLOR="cyan"
PROMPT_SYMBOL="⚙️"

# تنظیم prompt با جزئیات زیبا و نمادهای خلاقانه ✨
PROMPT='%F{$PROMPT_COLOR}╭──(%B%F{#ff6666}%n%F{$PROMPT_COLOR}%b@%B%F{#ffcc00}%m%F{$PROMPT_COLOR}%b)-[%B%F{#66ccff}%~%F{$PROMPT_COLOR}%b]
%F{$PROMPT_COLOR}╰─%B%F{#ff3399}$PROMPT_SYMBOL%F{$PROMPT_COLOR}%b '

# نمایش وضعیت گیت زیبا با تم حرفه‌ای 🚀
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='%F{#66ff99}⎇ %F{#ffcc66}($vcs_info_msg_0_)'

# فعال کردن هایلایت سینتکس با پشتیبانی کامل 🖌️
source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
EOF

echo "🌟 تنظیمات حرفه‌ای و هنری رنگ به .zshrc اضافه شد."

# نصب پلاگین zsh-syntax-highlighting اگر موجود نیست
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "🖌️ پلاگین zsh-syntax-highlighting نصب شد."

echo "🎉 تنظیمات حرفه‌ای کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید تا از زیبایی لذت ببرید!"
