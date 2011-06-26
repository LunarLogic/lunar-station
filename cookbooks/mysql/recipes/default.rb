case node[:platform]
when 'ubuntu'
  package "mysql-server"
  package 'mysql-client'
  package 'libmysqlclient-dev'
  package 'libmysql-ruby'

when 'fedora'
  package "mysql-server"
  package 'mysql'
  package 'mysql-devel'
  package 'ruby-mysql'

when 'mac_os_x'
  package 'mysql'
end
