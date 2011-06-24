case node[:platform]
when "ubuntu"
  package "ack-grep"
when "fedora"
  package "ack"
end
