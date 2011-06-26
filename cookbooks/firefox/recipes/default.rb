case node[:platform]
when 'mac_os_x'
  dmg_package "Firefox" do
    source 'http://mozilla.snt.utwente.nl/firefox/releases/5.0/mac/en-US/Firefox%205.0.dmg'
    action :install
  end

else
  package 'firefox'
end
