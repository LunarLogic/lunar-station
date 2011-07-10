bash "Install Oracle JDK 6" do
  user "root"
  cwd "/usr/lib"
  code <<-EOH  
    mkdir -p jvm
    cd jvm
    wget -O jdk.bin -c http://download.oracle.com/otn-pub/java/jdk/6u26-b03/jdk-6u26-linux-x64.bin
    chmod +x jdk.bin
    ./jdk.bin
    rm jdk.bin
  EOH
end

bash "Install Oracle JRE 6" do
  user "root"
  cwd "/usr/lib"
  code <<-EOH
    mkdir -p jvm
    cd jvm
    wget -O jre.bin -c http://download.oracle.com/otn-pub/java/jdk/6u26-b03/jre-6u26-linux-x64.bin
    chmod +x jre.bin
    ./jre.bin
    rm jre.bin
  EOH
end

# todo somehow get the user which started this process (his $HOME) and do: 
#open("#{HOME}/.bash_profile", "a") do |f|
#  f.puts "export JAVA_HOME='/usr/lib/jvm/jdk1.6.0_26'"
#end