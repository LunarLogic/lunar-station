case node[:platform]
when 'mac_os_x'
  dmg_package "Firefox" do
    source 'http://mozilla.snt.utwente.nl/firefox/releases/latest-9.0/mac/en-US/Firefox%209.0.1.dmg'
    action :install
  end

else
  package 'firefox'
end
