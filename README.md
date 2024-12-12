# MacOS Setup Guide

### GUI Apps:
- [Cyberduck](https://cyberduck.io/)
- [Firefox](https://www.mozilla.org/en-US/firefox/)
- [Google Chrome](https://www.google.com/chrome/)
- [iTerm2](https://www.iterm2.com/)
- [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html)
- [Microsoft Office](https://products.office.com/en-us/mac/microsoft-office-for-mac)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VLC](https://www.videolan.org/vlc/)
- [Wireshark](https://www.wireshark.org/)
- [balenaEthcer](https://etcher.balena.io/)
- [Ableton Live Suite](https://www.ableton.com/)
- [Muse Score 4](https://musescore.org/)
- [RaspberryPi Imager](https://github.com/raspberrypi/rpi-imager)
- [Yubikey Manager](https://www.yubico.com/support/download/yubikey-manager/)

### CLI APPS:
- [dockutil](https://github.com/kcrawford/dockutil)
- [iperf3](https://iperf.fr/iperf-download.php)
- [bash](https://tiswww.case.edu/php/chet/bash/bashtop.html)
- [check](https://libcheck.github.io/check/)

### AppStore Apps:
- [Xcode](https://apps.apple.com/us/app/xcode/id497799835)
- [Bitwarden](https://apps.apple.com/us/app/bitwarden-password-manager/id1137397744)

### Browser Plugins
Chrome
- Bitwarden

***

## Prerequisite
It's best practice to start from a clean slate when possible this means a clean wipe of the machine to ensure a fresh install of the OS. Depending on your level of paranoia this would apply to a brand new (purchase) machine as well. Ensure you turn on Filevault. You'll be prompted for this during the inital machine setup, after you've entered your iCloud credentials or you can enable it after setup as well; see [here](https://support.apple.com/en-us/HT204837). After installing the OS perform the following:

1. Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) or Xcode Tools as it's required for Homebrew.
    ```
    xcode-select --install
    ```
2. Install [Homebrew](https://docs.brew.sh/Installation), the [Package Installer(.pkg)](https://github.com/Homebrew/brew/releases) is currently the preferred installation method

3. Clone this repo:
   ```
    mkdir ~/Documents/Code
    cd ~/Documents/Code
    git clone https://github.com/johnsoga/MacOS.git
    cd MacOS
    ```
4. Clone dotfiles repo:
   #TODO: create dotfiles repo
      
    Update `$PATH` in `.bashrc` to include Homebrew binaries. Ensure Homebrew binaries come first as this will be important to ensure packages such as `python3` and `pip3` use the Homebrew binaries for these over the built-in system versions

    ```
    export PATH=/opt/homebrew/bin:$PATH
    ```
    then
    ```
    source ~/.bashrc
    ```
5. Run the `installer.sh` to install Python3 and Ansible and Mac Applications (GUI & CLI)

## Installation
#### Configuring the Dock
Customizations on the docks animations & layout are done using the `dock.yml` playbook
```
ansible-playbook -i ansible_hosts.txt dock.yml
```

## Customizations
Most scripting tools to change System Settings in an automated way in my opinion are buggy and unreliable. Simply easier to just set them manually and be done with it:

##### Track Pad
* System Settings -> Trackpad -> Tap to Click (Enable)
* System Settings -> Trackpad -> Look up & data detectors (Disable)

##### MenuBar
* Control Center -> Battery -> Show Percentage (Enable)
* Control Center -> Menu Bar Only -> Spotlight -> Don't Show in Menu Bar

##### Security
* System Settings -> Lock Screen -> Require password after screen saver begins or display is turned off (Immediately)
* System Settings -> Network -> Firewall: (Enable)

## Post-Installation
* Open Little Snitch to finish installation and activate
#### Disable Game Center
Personally I don't use it outside of my phone, navigate to: `System Settings > Game Center > Sign Out`
