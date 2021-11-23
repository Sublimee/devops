## Commands
Запуск единичных команд:
> ansible -i hosts -m ping all

> ansible -i hosts -m shell -a 'id' all

Запуск манифестов:
> ansible-playbook -i hosts manifest
