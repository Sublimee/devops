## Commands
execute single command:
> ansible -i hosts -m ping all

> ansible -i hosts -m shell -a 'id' all

> ansible -i hosts -m shell -a 'ls -la /' all

execute manifest:
> ansible-playbook -i hosts manifest.yml
