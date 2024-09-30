#!/bin/bash

echo "شروع نصب و پیکربندی ترمینال..."

# نصب curl
sudo apt update
sudo apt install -y curl
echo "curl نصب شد."

# نصب oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo "oh-my-zsh نصب شد."

# نصب تم Powerlevel10k (اگر قبلاً نصب نشده باشد)
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    echo "تم Powerlevel10k نصب شد."
else
    echo "تم Powerlevel10k قبلاً نصب شده بود."
fi

# تنظیم .zshrc
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# اضافه کردن تنظیمات اضافی به .zshrc
cat << 'EOF' >> ~/.zshrc

# رنگ‌های مشابه کالی لینوکس
PROMPT_COLOR="cyan"
PROMPT_SYMBOL="↳"

# تنظیم prompt
PROMPT='%F{$PROMPT_COLOR}┌──(%B%F{red}%n%F{$PROMPT_COLOR}%b㉿%B%F{red}%m%F{$PROMPT_COLOR}%b)-[%B%F{white}%~%F{$PROMPT_COLOR}%b]
%F{$PROMPT_COLOR}└─%B%F{red}$PROMPT_SYMBOL%F{$PROMPT_COLOR}%b '

# اضافه کردن نمایش شاخه گیت
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT='$vcs_info_msg_0_'
zstyle ':vcs_info:git:*' formats '%F{yellow}(%b)%r%f'
zstyle ':vcs_info:*' enable git
EOF

echo "فایل .zshrc تنظیم شد."

# تغییر شل پیش‌فرض به zsh
chsh -s $(which zsh)
echo "شل پیش‌فرض به zsh تغییر کرد."

echo "نصب و پیکربندی کامل شد. لطفاً ترمینال را بسته و دوباره باز کنید یا سیستم را ریبوت کنید."
