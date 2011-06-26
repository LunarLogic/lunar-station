description 'LLP ruby developer workstation'

run_list 'role[base]', 'recipe[rvm]', 'recipe[rvm::ruby192]', 'recipe[mysql]'
