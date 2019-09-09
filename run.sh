#!/bin/bash
# Install ansible if not yet installed
if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
  sudo apt-get install -y software-properties-common
  sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
  sudo apt-add-repository ppa:ansible/ansible
  sudo apt-get update
  sudo apt-get install -y ansible
fi

#ansible workstations -m ping -i hosts --ask-pass --extra-vars "ansible_python_interpreter=/usr/bin/python3"
#ansible-playbook --ask-pass -K -i hosts workstations.yml
ansible-playbook -K -i hosts workstations.yml
