
ansible-playbook /home/osboxes/projects/ansible/playbooks/ci-deploy/ci-deploy.yml --vvv --extra-vars '{"deploy_env":"qa","ansible_sudo_pass":"osboxes.org","workspace:"$WORKSPACE"}' -i '/home/osboxes/projects/ansible/playbooks/ci-deploy/inventory/hosts' -u osboxes
