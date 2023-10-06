##To Start The nginx Server in monitor node
ansible -i inventory all -m ansible.builtin.service -a "name=nginx state=started"

