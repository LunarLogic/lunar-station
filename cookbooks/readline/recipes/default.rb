case node[:platform]
when 'ubuntu'
  package 'libreadline6'
  package 'libreadline6-dev'

when 'fedora'
  package 'readline'
  package 'readline-devel'

when 'mac_os_x'
  package 'readline'
end
