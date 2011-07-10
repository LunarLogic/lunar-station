description 'LLP Java developer workstation'

run_list 'role[base]', 'recipe[mysql]', 'recipe[java]'
