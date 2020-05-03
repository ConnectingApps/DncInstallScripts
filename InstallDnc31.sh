#!/usr/bin/env bash

echo 'Firts update and install wget'
apt -y update
apt -y install wget

## Do not forget to change the ubuntu version number if needed!!
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
add-apt-repository universe
apt-get -y update
apt-get -y install apt-transport-https
apt-get -y update

echo 'Then download the dotnet sdk'
wget https://download.visualstudio.microsoft.com/download/pr/f65a8eb0-4537-4e69-8ff3-1a80a80d9341/cc0ca9ff8b9634f3d9780ec5915c1c66/dotnet-sdk-3.1.201-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.201-linux-x64.tar.gz -C $HOME/dotnet

echo 'Update the env variables'
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

echo 'PATH should be updated now'
echo $PATH

echo 'Now update the bash rc to make the env variables permanent'
echo '' >> /etc/bash.bashrc
echo 'export DOTNET_ROOT=$HOME/dotnet' >> /etc/bash.bashrc
echo 'export PATH=$PATH:$HOME/dotnet' >> /etc/bash.bashrc

echo 'Finished installation. Type "dotnet" to verify if the installation succeeded. A restart of your machine may be needed'
echo 'These sdks are installed now'
/root/dotnet/dotnet --list-sdks
echo 'Finished installation checks'

echo 'Remove redundant files'
rm packages-microsoft-prod.deb
rm dotnet-sdk-3.1.201-linux-x64.tar.gz
echo 'End of script'
