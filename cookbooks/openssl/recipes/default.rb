package 'openssl'

case node[:platform]
when 'ubuntu'
  package 'libssl-dev'
when 'fedora'
  package 'openssl-devel'
end
