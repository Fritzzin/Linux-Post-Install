# linuxinstall
These are some scripts that I use to setup my Debian based distros and WSL environment alongside the [dotfiles](https://github.com/Fritzzin/dotfiles) repo. The scripts are meant for my personal use, so I won't be responsible for any damage or harm done to your system.

## Installation
Clone the repository into your system, open the folder and then run the install.sh script to start the process.
```bash
git clone https://github.com/fritzzin/linuxinstall
```
```bash
cd linuxinstall/
```
```bash
./install.sh
```

One-liner
```bash
git clone https://github.com/fritzzin/linuxinstall && cd linuxinstall/ && ./install.sh
```

## Usage
After the ```install.sh``` runs, all the other scripts will be located at the ```$HOME/.scripts/``` folder. The ```install.sh``` script also adds an alias for each script, so it can run directly from the terminal at any place.

### update.sh
Updates the repositories and then upgrades the packages via apt.
To run, simply type ```update``` on the terminal.

### clean.sh
Uses maintenance commands to keep apt clean such as autoremove and autoclean.
To run, simply type ```clean``` on the terminal.

### monoaudio.sh
One of my laptop speakers died, so this is a fix I've found for it.
If required, should add as an autostart for your system.
```bash
crontab -e
```
Then add at the end of the file.
```
@reboot sh $HOME/.scripts/monoaudio.sh
```
