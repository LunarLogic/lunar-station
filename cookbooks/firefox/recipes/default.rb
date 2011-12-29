case node[:platform]
when 'mac_os_x'
  dmg_package "Firefox" do
    source 'http://releases.mozilla.org/pub/mozilla.org/firefox/releases/9.0.1/mac/en-US/Firefox%209.0.1.dmg'
    action :install
  end

else
  package 'firefox'
end
