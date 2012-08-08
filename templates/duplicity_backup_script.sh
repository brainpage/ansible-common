#!/bin/sh
export PASSPHRASE={{ s3_duplicity_passphrase }}
{% if mysql_user %}
 MYSQLDUMP="$(which mysqldump)"
 GZIP="$(which gzip)"
 MYSQL="$(which mysql)"
 # Get all databases name
 DBS="$($MYSQL -u {{ mysql_user }} -h {{ mysql_host }} -p{{ mysql_password }} -Bse 'show databases')"
 for db in $DBS
 do
  if [ "$db" != "information_schema" ]; then
   $MYSQLDUMP -u {{ mysql_user }} -h {{ mysql_host }} -p{{ mysql_password }} $db | $GZIP -9 > {{ backup_path }}/mysql-$db
  fi
 done
 
{% endif %}

AWS_ACCESS_KEY_ID="{{ s3_access_code }}" AWS_SECRET_ACCESS_KEY="{{ s3_secret_key }}" duplicity {{ backup_path }} s3+http://{{ s3_backup_path }}
unset PASSPHRASE

