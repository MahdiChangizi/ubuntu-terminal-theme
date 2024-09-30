#!/bin/bash

echo "🔄 شروع بازنشانی تنظیمات ترمینال..."

# حذف تنظیمات شخصی از .bashrc
if [ -f ~/.bashrc ]; then
    echo "حذف تنظیمات شخصی از .bashrc..."
    sed -i '/# تنظیمات رنگ/,$d' ~/.bashrc
fi

# حذف تنظیمات شخصی از .zshrc
if [ -f ~/.zshrc ]; then
    echo "حذف تنظیمات شخصی از .zshrc..."
    sed -i '/# تنظیمات رنگ/,$d' ~/.zshrc
fi

# در صورت وجود، حذف پلاگین zsh-syntax-highlighting
if [ -d "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
    echo "حذف پلاگین zsh-syntax-highlighting..."
    rm -rf "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"
fi

echo "✅ تنظیمات ترمینال به حالت اولیه بازگشت. لطفاً ترمینال را ببندید و دوباره باز کنید."
