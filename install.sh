#!/bin/bash

echo "🔧 Setting up i3, Rofi, and Alacritty configuration..."

# Backup existing configs
mkdir -p ~/.config_backup
cp -r ~/.config/i3 ~/.config_backup/i3-$(date +%s) 2>/dev/null
cp -r ~/.config/rofi ~/.config_backup/rofi-$(date +%s) 2>/dev/null
cp -r ~/.config/alacritty ~/.config_backup/alacritty-$(date +%s) 2>/dev/null

# Ensure config directories exist
mkdir -p ~/.config/i3
mkdir -p ~/.config/rofi
mkdir -p ~/.config/alacritty

# Symlink config files
ln -sf "$PWD/i3/config" ~/.config/i3/config
ln -sf "$PWD/rofi/config.rasi" ~/.config/rofi/config.rasi
ln -sf "$PWD/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml

echo "✅ Configurations linked successfully!"
echo "🚀 You may now restart i3 or logout/login to see the changes."

