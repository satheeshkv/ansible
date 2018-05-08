##################################################################################
# This script should be sourced from the Jenkins shell execution environment.
# It will set up the needed variables, use them to build the necessary 
# configuration files *including* the ansible hosts file, and then execute the
# ansible playbook to do the install.
# It is included here so that it gets versioned and backed up in git.
################################################################################## 

set +x

echo "STARTING $(date)"

echo "
[jdkServers]
$jdkServers
" >| hosts

ansible-playbook -i hosts -v main.yml --extra-vars "JDKV=$JDKV ansible_ssh_user=$USER ansible_ssh_pass=$PSWD"

echo "DONE $(date)"

