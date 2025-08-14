#!/bin/bash
printf '\033[8;10;41t'
PROMPT_COMMAND=
echo -en "\033]0;Linux Discord Updater\a"
echo "========================================="
echo "Welcome to the Discord Updater!"
echo "========================================="
echo "Checking versions..."
released=$(curl -sI https://discord.com/api/download?platform=linux\&format=deb \
| grep -i location \
| grep -oP '/\K[0-9]+\.[0-9]+\.[0-9]+')
echo "Latest version: $released"

installed=$(dpkg -l | grep '^ii' | grep discord | awk '{print $3}')
echo "Installed version: $installed"

echo "========================================="

if [[ -z "$installed" ]]; then
  echo "Discord is not installed with Debian Package Manager!"
  echo "Trying with Snap..."
  if snap list discord &> /dev/null; then
    echo "Updating Snap package..."
    echo "========================================="
    sudo snap refresh discord
    echo "========================================="
    update_needed=false
  else
    echo "Discord is not installed with Snap!"
    echo "Trying with Flatpak..."
    if flatpak list | grep -qi discord; then
      echo "Updating Flatpak package..."
      echo "========================================="
      flatpak update com.discordapp.Discord
      echo "========================================="
      update_needed=false
    else
      echo "Discord is not installed!"
      update_needed=true
    fi
  fi

elif [[ "$(printf '%s\n' "$released" "$installed" | sort -V | head -n1)" == "$released" && "$released" != "$installed" ]]; then
  echo "Update available!"
  update_needed=true
else
	echo "The last version is already installed!"
  update_needed=false
fi

if $update_needed; then
  echo "Downloading last version..."
  echo "========================================="
  wget -O ~/discord.deb "https://discord.com/api/download?platform=linux&format=deb";
  echo "========================================="
  echo "Installing version..."
  echo "========================================="
  sudo dpkg -i ~/discord.deb;
  echo "========================================="
  echo "Deleting installer files..."
  rm ~/discord.deb
  echo "Searching for dependencies..."
  echo "========================================="
  sudo apt-get install -f;
  echo "========================================="
  echo "Discord has been succesfully updated!"
fi

echo "========================================="

echo "Launching Discord..."
discord
