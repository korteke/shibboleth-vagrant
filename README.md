# Shibboleth-vagrant
Vagrant box - Shibboleth IdP3 + SP 2.x testing environment

## Prereqs
* Virtualbox (or other vagrant compliant virtualization "engine")

## This Vagrant box includes following packages / applications:
* CentOS 6.4
* httpd 2.2
* Oracle Java 8
* Tomcat 7
* Shibboleth Service Provider (SP) 2.5.x
* Shibboleth Identity Provider (IdP) 3.1.2

All programs are provisioned to vagrant box with [Ansible](https://www.google.com)

# Installation

Before you can run this box you need to install Vagrant and Ansible to your host computer:
### Ansible

#### Mac
* https://valdhaus.co/writings/ansible-mac-osx/

#### Linux
* http://docs.ansible.com/intro_installation.html

### Vagrant
* http://www.vagrantup.com/downloads

# Configuration
execute "sh install_local.sh" if you want to download packages to your host machine --> easier to develop, because you don't have to download the packages every time you reload the Vagrant box
execute "sh install_web.sh" to revert to normal situation --> ansible tries to download packages from internet

You need to add Vagrant box ip address to hosts-file (linux /etc/hosts, windows c:\windows\system32\drivers\etc\hosts)
192.168.0.100 varant.local

# Usage
Open browser and navigate to the address "https://vagrant.local/secure/"

WIP
