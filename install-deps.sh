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
yum install -y ninja-build

yum install -y python36
yum install -y python36-devel
yum install -y python36-setuptools
easy_install-3.6 pip

pip3 install meson
meson --version