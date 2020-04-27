#!/usr/bin/env bash

echo 'Firts update and install wget'
apt update
apt install wget

## Do not forget to ubuntu change the version number if needed!!
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
add-apt-repository universe
apt-get update
apt-get install apt-transport-https
apt-get update

echo 'Then download the dotnet sdk'
wget https://download.visualstudio.microsoft.com/download/pr/f65a8eb0-4537-4e69-8ff3-1a80a80d9341/cc0ca9ff8b9634f3d9780ec5915c1c66/dotnet-sdk-3.1.201-linux-x64.tar.gz
mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-3.1.201-linux-x64.tar.gz -C $HOME/dotnet

echo 'Update the env variables'
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

echo 'PATH should be updated'
echo $PATH

echo 'Now update the bash rc to make the env variables permanent'
echo '' >> /etc/bash.bashrc
echo 'export DOTNET_ROOT=$HOME/dotnet' >> /etc/bash.bashrc
echo 'export PATH=$PATH:$HOME/dotnet' >> /etc/bash.bashrc

echo 'Finished script. Type "dotnet" to verify if the installation succeeded. A restart of you machine may be needed'

