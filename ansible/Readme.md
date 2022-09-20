## Commands
execute single command:
> ansible -i hosts -m ping all

> ansible -i hosts -m shell -a 'id' all

> ansible -i hosts -m shell -a 'ls -la /' all

execute manifest:
> ansible-playbook -i hosts manifest.yml

run ansible in venv:
> virtualenv my-custom-venv --python=/usr/bin/python2.6

> source ./my-custom-venv/bin/activate

> pip install ansible==2.5.0
