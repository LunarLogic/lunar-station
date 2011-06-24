case node[:platform]
when "debian", "ubuntu"
  package "git-core"
else
  package "git"
end
