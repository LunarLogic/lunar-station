case node[:platform]
when "ubuntu"
  package "ack-grep"
else
  package "ack"
end
