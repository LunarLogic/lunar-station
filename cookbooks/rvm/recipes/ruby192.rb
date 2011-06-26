include_recipe 'build-tools'
include_recipe 'libxml2'
include_recipe 'openssl'
include_recipe 'readline'
include_recipe 'zlib'

include_recipe "rvm::default"

case node[:platform]
when 'ubuntu'
  %w(libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libc6-dev ncurses-dev).each do |pkg|
    package pkg
  end
when 'fedora'
  %w(patch libyaml-devel libffi-devel bzip2).each do |pkg|
    package pkg
  end
end

ruby_version = '1.9.2'

bash "installing ruby #{ruby_version}" do
  user $SUDO_USER
  code "echo installing #{ruby_version}"
  # not_if "rvm list | grep #{ruby_version}"
end
