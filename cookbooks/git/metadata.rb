description "Installs git"

%w{ ubuntu debian arch fedora}.each do |os|
  supports os
end
