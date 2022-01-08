# MacOS Setup Guide

### GUI Apps:
- [Cyberduck](https://cyberduck.io/)
- [Firefox](https://www.mozilla.org/en-US/firefox/)
- [Google Chrome](https://www.google.com/chrome/)
- [iTerm2](https://www.iterm2.com/)
- [Little Snitch](https://www.obdev.at/products/littlesnitch/index.html)
- [Microsoft Office](https://products.office.com/en-us/mac/microsoft-office-for-mac)
- [Visual Studio Code](https://code.visualstudio.com/)
- [VLC](https://www.videolan.org/vlc/index.html)
- [Wireshark](https://www.wireshark.org/) - temporarily removed new build required to fix issue requiring Rosetta 2 see [here](https://gitlab.com/wireshark/wireshark/-/issues/17757)

### CLI APPS:
- [dockutil](https://github.com/kcrawford/dockutil)
- [iperf3](https://iperf.fr/iperf-download.php)

### AppStore Apps:
- [Xcode](https://apps.apple.com/us/app/xcode/id497799835)

***

## Prerequisite
It is best practice to start from a clean slate which include a clean wipe of the machine to ensure a clean/fresh install. Depending on your level of paranoia this would include wiping a brand new machine as well. Possibly the most important detail would be to turn on Filevault. You will only be prompted for this during the inital machine setup after you've entered you iCloud details otherwise after going through the intial setup prompts you can enable afterwards see [here](https://support.apple.com/en-us/HT204837). Afterwards, perform the following to setup the machine:

1. Install [Xcode](https://itunes.apple.com/us/app/xcode/id497799835) or Xcode Tools (Homebrew Requirement)
    ```
    xcode-select --install
    ```
2. Install [Homebrew](https://docs.brew.sh/Installation)
3. Install [Python3](https://www.python.org/)
    ```
    brew install python3
    ```
4. Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
    ```
    python3.9 -m pip install --user ansible
    ```
    Update `$PATH` in `.bashrc` as this is where the Ansible binaries are installed
    
    ```
    export PATH=$PATH:~/Library/Python/3.9/bin
    ```
5. Create a directory to store repositories in and clone the repo
    ```
    mkdir ~/Documents/Code
    cd ~/Documents/Code
    git clone https://github.com/johnsoga/MacOS.git
    cd MacOS
    ```

## Installation
#### Installing Applications
All applications listed above will be installed using the `apps.yml` playbook
```
ansible-playbook -i ansible_hosts.txt apps.yml
```
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
* [Remove](https://discussions.apple.com/thread/252093642) Game Center account, personally I don't use it on Laptops/Desktops
