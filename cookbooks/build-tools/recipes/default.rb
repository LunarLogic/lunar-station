if node[:platform] == 'mac_os_x'
  bash "checking for gcc (Xcode)" do
    code "gcc -v || { echo 'Please install Xcode' && exit 1; }"
  end
else
  case node[:platform]
  when "ubuntu"
    %w{build-essential binutils-doc}.each do |pkg|
      package pkg
    end

  when "fedora"
    %w{gcc gcc-c++ kernel-devel make}.each do |pkg|
      package pkg
    end
  end

  package "autoconf"
  package "flex"
  package "bison"
end
