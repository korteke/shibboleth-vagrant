#!/bin/bash

sed -i.bak 's/local_install\: 1/local_install\: 0/' provisioning/vars/variables.yml
