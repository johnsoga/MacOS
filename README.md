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

## Automator Automations
In general trying to automate setting MacOS/OSX System Preferences is a bit of a hit-or-miss game filled with trial and error. While some options can be reliably set using the `defaults` command, a popular example [here](https://github.com/mathiasbynens/dotfiles/blob/main/.macos), this can involve logging out or resetting the machine which is not desirable. Even more so there is not a 1-to-1 mapping of System Preferences to plist's to be updated via `defaults` leaving some configurations that seemingly cannot be set that way. To me this leaves the better approach to be using the tools(however irritating they maybe) that Apple has provided, put simply Automator. I've created an Automator application that can be double-clicked to install that will go through and set various System Preferences namely:

##### Track Pad 
* Look up & data detectors (Disable)
* Secondary click/Two-finger right-click (Enable)
* Tap to click (Enable)
* Scroll direction: Natural (Disable)
* App Expose (Enable)

##### MenuBar
* Battery Percentage in Menu Bar (Enable)
* Show Spotlight in Menu Bar (Disable)

##### Security
* Require password immediately after sleep (Enable)
* Firewall: Turn on (Enable)

```
cd automator
unzip SystemPreferencesSetup.zip
open SystemPreferencesSetup.app
```

## Post-Installation
* Open Little Snitch to finish installation and activate
#### Disable Game Center
Personally I don't use it outside of my phone, navigate to: `System Settings > Game Center > Sign Out`
