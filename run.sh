#!/bin/bash
# Install ansible if not yet installed
if [[ "$OSTYPE" == "darwin"* ]]; then
  # TODO: Install osx dependencies
    ./bin/bootstrap_osx
  true
else
  if [ $(dpkg-query -W -f='${Status}' ansible 2>/dev/null | grep -c "ok installed") -eq 0 ]; then
    ./bin/bootstrap_debian
  fi
fi

ansible-galaxy install --roles-path ./roles -r requirements.yml

#ansible workstations -m ping -i hosts --ask-pass --extra-vars "ansible_python_interpreter=/usr/bin/python3"
#ansible-playbook --ask-pass -K -i hosts site.yml
#ansible-playbook -vvv -K -i hosts site.yml
#ansible-playbook -vvv -K -k -i hosts site.yml -f 2
ansible-playbook -vvv -K -i hosts site.yml -f 2
#ansible-playbook -i hosts site.yml -f 2
