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
