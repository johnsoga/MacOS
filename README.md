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