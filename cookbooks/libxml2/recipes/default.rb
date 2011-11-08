case node[:platform]
when 'ubuntu'
  package 'libxml2-dev'
  package 'libxslt-dev'

when 'fedora'
  package 'libxml2-devel'
  package 'libxslt-devel'

when 'mac_os_x'
  package 'libxml2'
end
