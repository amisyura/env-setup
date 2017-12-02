# Директория проекта
export PRJ_ROOT := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

BASHFILE_PATH = ~/.bashrc
ANSIBLE_PLAYBOOK_RUN := ansible-playbook $(PRJ_ROOT)/playbook.yml -i $(PRJ_ROOT)/inventory.ini

.PHONY: all
all: deps backup ansible.run.all refresh

.PHONY: tags
tags: 

.PHONY: install
install: backup ansible.run.no-packages refresh

.PHONY: deps
deps: clt.get brew.get ansible.get

# Mac Command Line Tools install
.PHONY: clt.get
clt.get:
	$(info ==> Check mac command line tools)
	@ if [ ! -d "/Library/Developer/CommandLineTools/" ]; then \
		xcode-select --install; \
		sudo xcodebuild -license; \
		echo "====> Mac command line tools is installed"; \
	else \
		echo "====> Mac command line tools already exists"; \
	fi

.PHONY: brew.get
brew.get:
	$(info ==> Check mac homebrew)
	@ if [ ! which brew 2> /dev/null ]; then \
		echo "====> Homebrew not found try install"; \
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; \
		echo "====> Homebrew is installed"; \
	else \
		echo "====> Homebrew already exists"; \
	fi

.PHONY: ansible.get
ansible.get:
	$(info ==> Check ansible)
	@ if [ ! which ansible 2> /dev/null ]; then \
		echo "====> Ansible not found try install"; \
		brew install ansible; \
	else \
		echo "====> Ansible already exists"; \
	fi

# Ansible targets
.PHONY: ansible.run.all ansible.run.tags ansible.run.skip-tags ansible.run.no-packages

ansible.run.all:
	$(ANSIBLE_PLAYBOOK_RUN)

ansible.run.tags:
	$(ANSIBLE_PLAYBOOK_RUN) --tags "$(tags)"

ansible.run.skip-tags:
	$(ANSIBLE_PLAYBOOK_RUN) --skip-tags "$(tags)"

ansible.run.no-packages:
	$(ANSIBLE_PLAYBOOK_RUN) --skip-tags "brew"

# Service
.PHONY: restore backup refresh

restore:
	$(info ==> Restore bash file)
	$(eval BASHFILE_BACKUP_PATH := $(shell find ~/ -name ".bashrc_*" | sort -r | head -n 1))
	@ if [ -f $(BASHFILE_BACKUP_PATH) ]; then \
		rm -f $(BASHFILE_PATH); \
		mv $(BASHFILE_BACKUP_PATH) $(BASHFILE_PATH); \
		echo "====> Restore $(BASHFILE_BACKUP_PATH)"; \
	else \
		echo "====> Nothing restore..."; \
	fi

backup:
	$(info ==> Backup bash file)
	@ if [ -f $(BASHFILE_PATH) ]; then \
		$(eval BASHFILE_BACKUP_PATH := $(BASHFILE_PATH)_$(shell date "+%Y-%m-%d_%H:%M:%S")) \
		echo "====> Backup $(BASHFILE_PATH) to $(BASHFILE_BACKUP_PATH)"; \
		cp $(BASHFILE_PATH) $(BASHFILE_BACKUP_PATH); \
	else \
		echo "====> Nothing to backup"; \
	fi

refresh:
	exec bash
	echo "Refresh"

