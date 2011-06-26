description 'LLP ruby developer workstation'

run_list 'role[base]', 'recipe[mysql]'
# 'recipe[rvm]', 'recipe[rvm::ruby192]', 
