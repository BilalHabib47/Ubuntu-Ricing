#!/bin/bash

echo "🚀 Starting fresh Ubuntu Ricing setup..."

# Step 1: Install Required Packages
echo "📦 Installing dependencies..."
sudo apt update
sudo apt install -y i3 rofi alacritty picom feh dex xss-lock network-manager-gnome \
                    libgl1-mesa-dri libxcomposite1 libxrender1 libxcb1 rofi-themes

# Step 2: Backup old configs
echo "🗂️ Backing up existing configs to ~/.config_backup..."
mkdir -p ~/.config_backup
cp -r ~/.config/i3 ~/.config_backup/i3-$(date +%s) 2>/dev/null
cp -r ~/.config/rofi ~/.config_backup/rofi-$(date +%s) 2>/dev/null
cp -r ~/.config/alacritty ~/.config_backup/alacritty-$(date +%s) 2>/dev/null
cp -r ~/.config/picom ~/.config_backup/picom-$(date +%s) 2>/dev/null

# Step 3: Create config directories
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty
mkdir -p ~/.config/picom

# Step 4: Symlink new configs
echo "🔗 Linking config files..."
ln -sf "$PWD/i3/config" ~/.config/i3/config
ln -sf "$PWD/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$PWD/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -sf "$PWD/picom/picom.conf" ~/.config/picom/picom.conf

echo "✅ All done!"
echo "🎉 Please restart your session or log out/in to apply changes."

