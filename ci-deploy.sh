
ansible-playbook /home/osboxes/projects/ansible/playbooks/ci-deploy/ci-deploy.yml --extra-vars '{"deploy_env":"test","ansible_sudo_pass":"osboxes.org","workspace":"/home/osboxes/"}' -i '/home/osboxes/projects/ansible/playbooks/ci-deploy/inventory/hosts' -u osboxes
