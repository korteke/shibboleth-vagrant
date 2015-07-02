#!/bin/bash

TOMCAT_VERSION="7.0.62"
IDP_VERSION="3.1.2"

if [ ! -d downloads ];
then
	mkdir downloads
fi

cd downloads

if [ ! -f apache-tomcat-$TOMCAT_VERSION.tar.gz ];
  then
    curl -O http://mirror.netinch.com/pub/apache/tomcat/tomcat-7/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
fi

if [ ! -f jdk-8u45-linux-x64.tar.gz ];
  then
curl -L -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz -O
fi

if [ ! -f jce_policy-8.zip ];
  then
curl -L -b "oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip -O
fi

if [ ! -f shibboleth-identity-provider-$IDP_VERSION.tar.gz ];
  then
curl http://shibboleth.net/downloads/identity-provider/latest/shibboleth-identity-provider-$IDP_VERSION.tar.gz -O
fi

cd ..

sed -i.bak 's/local_install\: 0/local_install\: 1/' provisioning/vars/variables.yml
