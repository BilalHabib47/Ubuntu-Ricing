#!/bin/bash

# --------- HEADER ---------
echo "🧠 Ubuntu Ricing Setup for Root User"

# --------- Check Root User ---------
if [ "$EUID" -ne 0 ]; then
  echo "❌ Please run this script as root (use sudo or switch to root)."
  exit 1
fi

CONFIG_DIR="/root/.config"
BACKUP_DIR="/root/.config_backup"

# --------- Install Required Packages ---------
echo "📦 Installing required packages..."
apt update && apt install -y i3 rofi alacritty picom feh dex xss-lock network-manager-gnome

# --------- Backup Existing Configs ---------
echo "🗂️ Backing up existing configs to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"
[ -d "$CONFIG_DIR/i3" ] && cp -r "$CONFIG_DIR/i3" "$BACKUP_DIR/i3-$(date +%s)"
[ -d "$CONFIG_DIR/rofi" ] && cp -r "$CONFIG_DIR/rofi" "$BACKUP_DIR/rofi-$(date +%s)"
[ -d "$CONFIG_DIR/alacritty" ] && cp -r "$CONFIG_DIR/alacritty" "$BACKUP_DIR/alacritty-$(date +%s)"

# --------- Create Config Directories ---------
mkdir -p "$CONFIG_DIR/i3"
mkdir -p "$CONFIG_DIR/rofi"
mkdir -p "$CONFIG_DIR/alacritty"

# --------- Symlink New Configs ---------
echo "🔗 Linking new configs into $CONFIG_DIR"
ln -sf "$PWD/i3/config" "$CONFIG_DIR/i3/config"
ln -sf "$PWD/rofi/config.rasi" "$CONFIG_DIR/rofi/config.rasi"
ln -sf "$PWD/alacritty/alacritty.toml" "$CONFIG_DIR/alacritty/alacritty.toml"

# --------- Final Message ---------
echo "✅ Setup complete for root user!"
echo "🔄 Log out or restart your session to apply changes."

