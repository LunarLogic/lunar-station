base_url = "https://dl-ssl.google.com/linux/direct/"

case node[:platform]
when 'fedora', 'ubuntu'
  if node[:platform] == 'fedora'
    filename = "google-chrome-stable_current_i386.rpm"
  else
    filename = "google-chrome-stable_current_i386.deb"
  end

  bash "downloading package #{filename}" do
    cwd "/tmp"
    code "curl -kLsO #{base_url}#{filename}"
    not_if { File.exist? "/tmp/#{filename}" }
  end

  package 'google-chrome-stable' do
    source "/tmp/#{filename}"
    action :install
  end

when 'mac_os_x'
  dmg_package "Google Chrome" do
    dmg_name "googlechrome"
    source "https://dl-ssl.google.com/chrome/mac/stable/GGRM/googlechrome.dmg"
    action :install
  end
end
