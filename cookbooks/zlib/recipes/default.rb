case node[:platform]
when 'ubuntu'
  package 'zlib1g'
  package 'zlib1g-dev'
when 'fedora'
  package 'zlib'
  package 'zlib-devel'
end
