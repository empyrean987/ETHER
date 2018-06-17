#
# Cookbook:: ETHER
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.
apt_package 'software-properties-common' do
  action :install
end

apt_repository 'ethereum-qt' do
  uri        'ppa:ethereum/ethereum-qt'
end

apt_repository 'ethereum' do
  uri        'ppa:ethereum/ethereum'
end

apt_repository 'ethereum-dev' do
  uri        'ppa:ethereum/ethereum-dev'
end

apt_package 'ethereum' do
  action :install
end

apt_package 'cpp-ethereum' do
  action :install
end

#####NVIDIA Section, uncomment
#apt_update 'update'

#apt_package 'nvidia-384' do
#  action :install
#end

#apt_package 'xorg' do
#  action :install
#end

#apt_package 'lightdm' do
#  action :install
#end


#execute 'nvidia_gpus' do
#  command 'nvidia-xconfig --enable-all-gpus'
#end

#execute 'nvidia_cool' do
#  command 'nvidia-xconfig -a --force-generate --allow-empty-initial-configuration --cool-bits=28 --no-sli --connected-monitor="DFP-0"'
#end

#directory '/var/run/nvidia-persistenced' do
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#service 'lightdm' do
#  action :start
#end

#AMD SECTION


apt_package 'awscli' do
  action :install
end

directory '/home/ubuntu/electroneum' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/home/ubuntu/electroneum/linux-x64-0.11.0.0.zip' do
  source 'https://github.com/electroneum/electroneum/releases/download/v0.11.0.0/linux-x64-0.11.0.0.zip'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

apt_package 'unzip' do
  action :install
end

execute 'unzip_electroneum' do
  command 'unzip -o /home/ubuntu/electroneum/linux-x64-0.11.0.0.zip -d /home/ubuntu/electroneum'
end

directory '/home/ubuntu/ethereum' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/home/ubuntu/ethereum/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz' do
  source 'https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v10.0/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'untar_claymore' do
  command 'tar xvf /home/ubuntu/ethereum/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v10.0.-.LINUX.tar.gz -C /home/ubuntu/ethereum/'
end

directory '/home/ubuntu/electroneum/yam' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "/home/ubuntu/electroneum/yam/Archive-9383.zip" do
  source "Archive-9383.zip"
  mode 0755
end

execute 'unzip_archive' do
  command 'unzip -o /home/ubuntu/electroneum/yam/Archive-9383.zip -d /home/ubuntu/electroneum/yam/'
end


execute 'untar_electroneum_yam' do
  command 'tar xvf /home/ubuntu/electroneum/yam/yam-yvg1900-M7v-linux64-generic.tgz -C /home/ubuntu/electroneum/yam/'
end

directory '/home/ubuntu/zcash' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

remote_file '/home/ubuntu/zcash/Zec.miner.0.3.4b.zip' do
  source 'https://github.com/nanopool/ewbf-miner/releases/download/v0.3.4b/Zec.miner.0.3.4b.zip'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'unzip_zcash' do
  command 'unzip -o /home/ubuntu/zcash/Zec.miner.0.3.4b.zip -d /home/ubuntu/zcash'
end

directory '/home/ubuntu/scripts' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "/home/ubuntu/scripts/eth.sh" do
  source "eth.sh"
  mode 0755
end

cookbook_file "home/ubuntu/scripts/elec.sh" do
  source "elec.sh"
  mode 0755
end

cookbook_file 'home/ubuntu/scripts/zcash.sh' do
  source "zcash.sh"
  mode 0755
end