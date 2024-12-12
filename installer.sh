#!/bin/bash

brew install python3
brew install ansible

# Install Applications
ansible-playbook -i ansible_hosts.txt apps.yml
