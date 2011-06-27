description 'Basic LLP workstation'

run_list 'recipe[ack]', 'recipe[curl]', 'recipe[git]', 'recipe[firefox]', 'recipe[google-chrome]', 'recipe[skype]'
