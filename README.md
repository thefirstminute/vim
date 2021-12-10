### Install Dependancies...
```sh
sudo apt update && sudo apt install xdotool python-neovim python3-neovim python-dev python-pip python3-dev python3-pip
```

### Install Node 12 (or whatever nvim will need):
```sh
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt -y install nodejs
sudo apt -y  install gcc g++ make
```

### Install & Use AppImage:
```sh
mkdir ~/Applications
cd ~/Applications
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage

CUSTOM_NVIM_PATH=~/Applications/nvim.appimage
# Set the above with the correct path, then run the rest of the commands:
set -u
sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110
```

### Clone the nvims:
```sh
git clone https://github.com/thefirstminute/vim.git ~/.config/nvim 
```



### some remarks
* You can copy and paste with Ctrl-c & Ctrl-v
* x deletes to the "_x register
* Y yanks till end of line, like how D and C work
* Escape also clears command text
* caps is automatically turned off when exiting insert mode


### Like To Have/Needs Work
 - want buffer numbers in tabline
 - emmet is putting the cursor in the wrong place sometimes, assume it's coc??
