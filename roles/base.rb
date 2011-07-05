description 'Basic LLP workstation'

run_list 'recipe[curl]', 'recipe[wget]', 'recipe[git]', 'recipe[ack]', 'recipe[vim]', 'recipe[ctags]', 'recipe[firefox]', 'recipe[google-chrome]', 'recipe[skype]'
