description 'Basic LLP workstation'

run_list 'recipe[curl]', 'recipe[wget]', 'recipe[git]', 'recipe[ack]', 'recipe[firefox]', 'recipe[google-chrome]', 'recipe[skype]'
