#!/bin/bash

DATE=$(date +%Y%m%d)
ARCHIVE_NAME="backup_${DATE}.tar.gz"

# Créer une archive contenant les dossiers à sauvegarder
tar -czf /tmp/$ARCHIVE_NAME /etc /home /var/www /var/log

# Envoyer l’archive vers S3
aws s3 cp /tmp/$ARCHIVE_NAME s3://sauvegarde-makan-keita/

# Nettoyer le fichier local après envoi (optionnel)
rm /tmp/$ARCHIVE_NAME
