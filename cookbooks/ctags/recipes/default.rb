case node[:platform]
when "ubuntu"
  package "exuberant-ctags"
else
  package "ctags"
end
