# install lol in ubuntu gnome 17.04
# doesn't work yet

sudo apt purge wine playonlinux
sudo apt autoremove
sudo apt autoclean
sudo dpkg --add-architecture i386
sudo add-apt-repository ppa:wine/wine-builds
sudo apt update
sudo apt install --install-recommends winehq-staging
sudo apt install winehq-devel:i386
