case node[:platform]
when 'fedora'
  yum_repository "skype" do
    name "skype"
    description "Official Skype repository"
    url "http://download.skype.com/linux/repos/fedora/updates/i586"
    action :add
  end

  package 'skype'

when 'ubuntu'
  include_recipe 'init::ubuntu' # for partner repo

  package 'skype'

when 'mac_os_x'
  dmg_package "Skype" do
    source "http://www.skype.com/go/getskype-macosx-samplingb"
    action :install
  end
end
