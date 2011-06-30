case node[:platform]
when 'fedora'
  base_url = "http://download.skype.com/linux/"
  skype_version = "2.2.0.35"
  filename = "skype-#{skype_version}-fedora.i586.rpm"

  bash "downloading package #{filename}" do
    cwd "/tmp"
    code "curl -kLsO #{base_url}#{filename}"
    not_if { File.exist? "/tmp/#{filename}" }
  end

  package 'skype' do
    source "/tmp/#{filename}"
    action :install
  end

when 'ubuntu'
  package 'skype'

when 'mac_os_x'
  dmg_package "Skype" do
    source "http://www.skype.com/go/getskype-macosx.dmg"
    action :install
  end
end
