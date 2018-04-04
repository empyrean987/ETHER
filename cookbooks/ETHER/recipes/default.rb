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

apt_update 'update'

apt_package 'nvidia-384' do
  action :install
end

apt_package 'ethereum' do
  action :install
end

apt_package 'cpp-ethereum' do
  action :install
end

apt_package 'xorg' do
  action :install
end

apt_package 'lightdm' do
  action :install
end

#execute 'nvidia_gpus' do
#  command 'nvidia-xconfig --enable-all-gpus'
#end

#execute 'nvidia_cool' do
#  command 'nvidia-xconfig -a --cool-bits=28 --allow-empty-initial-configuration'
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
#remote_file '/home/ubuntu/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64' do
#  source 'https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64'
#  owner 'root'
#  group 'root'
#  mode '0755'
#  action :create
#end

#dpkg_package 'cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64' do
#  source '/home/ubuntu/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64'
#  action :install
#end

#execute 'apt_key' do
#  command 'apt-key add /var/cuda-repo-9-1-local/7fa2af80.pub'
#end

#execute 'aptupdate' do
#  command 'apt-get update'
#end

#apt_package 'cuda' do
#  action :install
#end

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

execute 'untar_electroneum_yam' do
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

directory '/home/ubuntu/Scripts' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

cookbook_file "/home/ubuntu/Scripts/eth.sh" do
  source "eth.sh"
  mode 0755
end

cookbook_file "home/ubuntu/Scripts/elec.sh" do
  source "elec.sh"
  mode 0755
end

cookbook_file 'home/ubuntu/Scripts/zcash.sh' do
  source "zcash.sh"
  mode 0755
end