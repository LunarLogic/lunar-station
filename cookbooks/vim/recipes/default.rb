case node[:platform]
when "ubuntu"
  package "vim"
  package "vim-gnome"
when "fedora"
  package "vim-enhanced"
  package "vim-X11"
when 'mac_os_x'
  package "macvim"
end
