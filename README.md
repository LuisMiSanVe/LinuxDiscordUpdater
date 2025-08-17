> [See in spanish/Ver en español](https://github.com/LuisMiSanVe/LinuxDiscordUpdater/blob/main/README.es.md)
# 📥 Linux Discord Updater
[![image](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)]()

Script that checks if a new Discord Client version is avaliable and updates it automaticly (for the DPKG version).

## 🛠️ Setup
I recommend putting the script on the Startup Programs list so it checks if a new version is avaliable at startup.

You can also run the script anytime to check.

The Script runs Discord after the version check, so if you put the Script into the Startup Programs I recommend disabling the Run in Startup option inside Discord's settings.

## 📖 About the Project
The Script is intended for those who have installed Discord through DPKG (.deb) as this version can't update by its own and prompt the user to download the latest version.

Other Discord Clients version are Snap's and Flatpak's versions, this version does update itselves.

The script detects which version of the Discord Client is used and checks for updates for them.

## 💻 Technologies Used
- Programming Language: Bash Script
- Tested OS: [Ubuntu](https://ubuntu.com/)
- Recommended IDE: [Gedit](https://help.gnome.org/users/gedit/stable/gedit-quickstart.html.en)
