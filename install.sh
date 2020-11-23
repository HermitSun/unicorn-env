#!/usr/bin/env sh

# zlib
sudo apt-get install -y zlib1g-dev

# gcc 4.9 & g++ 4.9
sudo apt-get install -y gcc-4.9 g++-4.9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 100

# pip for py2
sudo python get-pip.py pip==18.1
# virtual env
sudo apt-get install -y virtualenv

# dependencies for modeling
sudo pip install -r requirements.txt

# git lfs
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install -y git-lfs
