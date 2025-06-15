#!/bin/bash

echo "🎨 Installing Polybar with adi1090x's themes..."

# Step 1: Install dependencies
echo "📦 Installing required packages..."
sudo apt update
sudo apt install -y polybar git curl unzip fonts-font-awesome

# Step 2: Clone the polybar themes repo
echo "🔽 Cloning polybar-themes..."
git clone --depth=1 https://github.com/adi1090x/polybar-themes ~/.config/polybar-themes

# Step 3: Make setup executable and run
cd ~/.config/polybar-themes
chmod +x setup.sh

# Step 4: Launch theme selector
echo "🧠 Follow the prompt to choose your theme..."
./setup.sh

# Optional: Add to i3 autostart if not already present
if ! grep -q "polybar/launch.sh" ~/.config/i3/config; then
  echo "📌 Adding Polybar to i3 config..."
  echo 'exec_always --no-startup-id $HOME/.config/polybar/launch.sh' >> ~/.config/i3/config
fi

echo "✅ Polybar is installed with your selected theme!"
echo "🔁 Restart i3 with Mod+Shift+R to see the changes."

