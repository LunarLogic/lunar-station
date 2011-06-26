include_recipe 'curl'
include_recipe 'git'

$SUDO_USER = ENV['SUDO_USER']

bash "installing single-user RVM for user #{$SUDO_USER}" do
  code "su #{$SUDO_USER} -c 'bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)'"
  not_if "su #{$SUDO_USER} -c 'which rvm'"

  # user $SUDO_USER
  # code "bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)"
  # not_if "which rvm"
end

# bash "adjusting .bash_profile for rvm" do
#   user $SUDO_USER
#   code "echo '[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\" # Load RVM function' >> ~/.bash_profile"
#   # code "su #{$SUDO_USER} -c 'echo \'[[ -s \"\$HOME/.rvm/scripts/rvm\" ]] && . \"\$HOME/.rvm/scripts/rvm\" # Load RVM function\' >> ~/.bash_profile'"
#   not_if "grep 'scripts/rvm' ~/.bash_profile"
# end
