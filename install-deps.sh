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

scl enable devtoolset-10 bash
gcc --version
gfortran --version

gcc-10 --version
gfortran-10 --version

echo 'source scl_source enable devtoolset-10' >> ~/.bash_profile
source ~/.bash_profile
