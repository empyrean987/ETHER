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

apt_package 'ethereum' do
  action :install
end

apt_update 'update'

apt_package 'cpp-ethereum' do
  action :install
end

remote_file '/home/ubuntu/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64' do
  source 'https://developer.nvidia.com/compute/cuda/9.1/Prod/local_installers/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

dpkg_package 'cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64' do
  source '/home/ubuntu/cuda-repo-ubuntu1604-9-1-local_9.1.85-1_amd64'
  action :install
end

execute 'apt_key' do
  command 'apt-key add /var/cuda-repo-9-1-local/7fa2af80.pub'
end

apt_update 'update'

apt_package 'cuda' do
  action :install
end