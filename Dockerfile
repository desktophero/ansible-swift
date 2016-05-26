FROM centos:7
MAINTAINER Jason Walker <desktophero@gmail.com>

# yum setup, and keep it clean
RUN yum -y install epel-release; yum clean all
RUN yum -y update; yum clean all
RUN yum -y upgrade; yum clean all
RUN yum -y install kernel-devel ansible jq; yum clean all
RUN yum groupinstall -y 'Development Tools'; yum clean all
RUN yum -y install python-pip python-setuptools python-devel; yum clean all
RUN yum -y install ruby ruby-devel ruby-bundler; yum clean all

# terraform install
RUN yum -y install unzip; yum clean all
RUN curl -o terraform.zip https://releases.hashicorp.com/terraform/0.6.16/terraform_0.6.16_linux_amd64.zip
RUN unzip terraform.zip -d /usr/bin

# python installs
RUN pip install --upgrade pip
RUN pip install python-swiftclient
RUN pip install python-novaclient
RUN pip install python-neutronclient
RUN pip install python-openstackclient

# including serverspec for future needs
RUN gem install serverspec
RUN gem install rake
