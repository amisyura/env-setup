#!/bin/bash
echo "Check mac command line tools"
if [ ! -d "/Library/Developer/CommandLineTools/" ]; then
  xcode-select --install
  sudo xcodebuild -license
else
  echo " * Command line tools installed"
fi

echo "Find homebrew:"
if [ ! which brew 2> /dev/null ]; then
  echo " * Homebrew not found: install"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo " * Homebrew installed"
fi

echo "Find ansible:"
if [ ! which ansible 2> /dev/null ]; then
  echo " * Ansible not found: install"
  brew install ansible
else
  echo " * Ansible installed"
fi

# todo: get ansible playbooks to tmp folder and run it!
ansible-playbook playbook.yml -i inventory.ini
