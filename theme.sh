#!/bin/bash

# گرفتن پروفایل فعلی ترمینال
profile=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")

# تنظیم پس‌زمینه (Background)
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#0D1117'

# تنظیم متن اصلی (Primary Text)
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color '#C5C8C6'

# غیرفعال کردن تم پیش‌فرض برای امکان تنظیم رنگ‌های سفارشی
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false

# تنظیم رنگ‌های برجسته (Highlight, Errors, Success)
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['#0D1117', '#FF5555', '#50FA7B', '#F1FA8C', '#8BE9FD', '#BD93F9', '#00FF41', '#C5C8C6', '#6272A4', '#FF6E6E', '#69FF94', '#FFFFA5', '#D6ACFF', '#FF92DF', '#8AFFFC', '#F8F8F2']"

# تنظیم رنگ کلمات کلیدی و دستورها (نئونی سبز)
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-color '#00FF41'

# استفاده از رنگ‌های سفارشی برای متن بولد
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" bold-color-same-as-fg false

# اضافه کردن فلش هکری به Bash Prompt
echo "
# تنظیمات فلش هکری برای Bash Prompt
export PS1='\[\e[0;36m\]\u\[\e[0m\]@\[\e[0;34m\]\h\[\e[0m\]:\[\e[0;32m\]\w\[\e[0m\] \[\e[0;31m\]➤\[\e[0m\] '
" >> ~/.bashrc

# بارگذاری مجدد .bashrc برای اعمال تغییرات
source ~/.bashrc
