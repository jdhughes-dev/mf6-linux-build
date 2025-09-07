#!/bin/bash
set -e

sed -i 's/mirror\.centos\.org/vault.centos.org/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's/^#.*baseurl=http/baseurl=http/g' /etc/yum.repos.d/CentOS-*.repo
sed -i 's/^mirrorlist=http/#mirrorlist=http/g' /etc/yum.repos.d/CentOS-*.repo

yum update -y 
yum install -y git
yum install -y gcc-gfortran
yum install -y centos-release-scl
yum install -y devtoolset-10

yum -y groupinstall "Development Tools"
yum install -y openssl-devel bzip2-devel libffi-devel zlib-devel wget

source /opt/rh/devtoolset-10/enable
alias gcc='/opt/rh/devtoolset-10/root/usr/bin/gcc'
alias g++='/opt/rh/devtoolset-10/root/usr/bin/g++'
alias gfortran='/opt/rh/devtoolset-10/root/usr/bin/gfortran'

export CC=gcc
export CXX=g++
export FC=gfortran

wget https://www.python.org/ftp/python/3.13.7/Python-3.13.7.tgz
tar xzf Python-3.13.7.tgz

cd Python-3.13.7
./configure --enable-optimizations
make altinstall
python3.13 -V

cd ../
rm Python-3.13.7.tgz

python3.13 -m ensurepip --default-pip

pip install --user meson ninja
meson --version