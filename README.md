# Shibboleth-vagrant
Vagrant box - Shibboleth IdP3 + SP 2.x testing environment

Shibboleth SP / IdP are almost on factory settings. So IdP wont release any attributes to the SP.

## Prereqs
* Virtualbox (or other vagrant compliant virtualization "engine")

## This Vagrant box includes following packages / applications:
* CentOS 6.4
* httpd 2.2
* Oracle Java 8
* Tomcat 7
* Shibboleth Service Provider (SP) 2.5.x
* Shibboleth Identity Provider (IdP) 3.1.2
* OpenLDAP
* phpLdapAdmin

All programs are provisioned to vagrant box with [Ansible](https://www.google.com)

# Installation

Before you can run this box you need to install Vagrant and Ansible to your host computer:
### Ansible

#### Mac
* https://valdhaus.co/writings/ansible-mac-osx/

#### Linux
* http://docs.ansible.com/intro_installation.html

#### Windows (Not tested) w\ cygwin
* https://servercheck.in/blog/running-ansible-within-windows

### Vagrant
* http://www.vagrantup.com/downloads

# Configuration
* execute "sh install_local.sh" if you want to download packages to your host machine --> easier to develop, because you don't have to download the packages every time you reload the Vagrant box

* execute "sh install_web.sh" to revert to normal situation --> ansible tries to download packages from internet

You need to add Vagrant box ip address to the hosts-file (linux /etc/hosts, windows c:\windows\system32\drivers\etc\hosts)

```
192.168.0.120 vagrant.local
```

# Usage

* Execute "vagrant up" and wait that the ansible run has completed, expected outcome:

```
  PLAY RECAP ********************************************************************
  default                    : ok=43   changed=42   unreachable=0    failed=0
```

Open browser and navigate to the address "https://vagrant.local/secure/" this URL is secured with Shibboleth SP, so that will redirect you to the Shibboleth IdP where you need to authenticate.

You can use following users to test this setup:
* johnd / Password1
* janed / Password1

After authentication you will be redirected back to https://vagrant.local/secure/. There is asimple PHP site which will show your environment variables and http headers.

# Manage
You can use phpLdapAdmin application to manage users that are allowed to authenticate. It can be found https://vagrant.local/ldapadmin. Authenticate with user: "cn=manager,dc=vagrant,dc=local" password: "Password1"

# File locations

* Shibboleth IdP - /opt/shibboleth-idp
* Shibboleth SP - /etc/shibboleth
* Apache httpd - /etc/httpd
* Java - /opt/jdk1.8.0_45/
* Tomcat - /opt/apache-tomcat-7.0.62
* OpenLDAP - /etc/openldap
