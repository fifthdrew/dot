#!/bin/bash

sudo apt-get install default-jre &&
cd /tmp &&
#wget http://ftp.yz.yamagata-u.ac.jp/pub/eclipse/oomph/epp/2023-06/R/eclipse-inst-jre-linux64.tar.gz &&
#wget http://ftp.yz.yamagata-u.ac.jp/pub/eclipse/oomph/epp/2024-03/R/eclipse-inst-jre-linux64.tar.gz &&
#wget https://www.eclipse.org/downloads/download.php?file=/oomph/epp/2024-03/R/eclipse-inst-jre-linux64.tar.gz &&
wget https://mirror.umd.edu/eclipse/oomph/products/latest/eclipse-inst-jre-linux64.tar.gz &&
tar -xvf eclipse-inst-jre-linux64.tar.gz &&
cd eclipse-installer &&
sudo ./eclipse-inst
