#!/bin/bash

# mettre a jour les paquets et installer proftpd (filezilla est généralement déjà présent)

sudo apt-get update && sudo apt-get install proftpd-*

sudo cp /home/jiyel_test/FTP/job-07/proftpd-backup.conf /etc/proftpd/proftpd.conf

sudo cp /etc/proftpd/proftpd.conf /etc/proftpd/proftpd-backup.conf
# creation de dossier ssl
sudo mkdir -p /etc/proftpd/ssl
# creation du certificat et de la clé
sudo openssl req -new -x509 -days 365 -nodes -out /etc/proftpd/ssl/proftpd.cert.pem -keyout /etc/proftpd/ssl/proftpd.key.pem
# donner des droit au dossier ssl recursivement
sudo chmod -R 750 /etc/proftpd/ssl
sudo cp /home/jiyel_test/FTP/job-07/tls.backup.conf /etc/proftpd/tls.conf
sudo cp /home/jiyel_test/FTP/job-07/modules.backup.conf /etc/proftpd/modules.conf

# Restart proftpd
sudo service proftpd restart

