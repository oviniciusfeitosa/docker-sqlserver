#!/bin/bash
# wait for database to start...

if [ ! -z "$SA_PASSWORD" ]; then
  echo "$0: inicializando dump da estrutura"
  for i in {30..0}; do
    if sqlcmd -U SA -P $SA_PASSWORD -Q 'SELECT 1;' &> /dev/null; then
      echo "$0: SQL Server started"
      break
    fi
    echo "$0: SQL Server startup in progress..."
    sleep 1
  done
fi

if [ "$RESTAURAR_BACKUP" == "true" ]; then
  ## subir estrutura e dados
  echo "$0: inicializando dump da estrutura e dados"
  for entry in $(ls restore/*.bak)
  do
    echo importando $entry
    shortname=$(echo $entry | cut -f 1 -d '.' | cut -f 2 -d '/')
    echo executing $shortname
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE FILELISTONLY FROM DISK = "/tmp/restore/'$shortname'.bak"' | tr -s ' ' | cut -d ' ' -f 1-2
    /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P $SA_PASSWORD -Q 'RESTORE DATABASE '$shortname' FROM DISK = "/tmp/restore/'$shortname'.bak" WITH MOVE "'$shortname'" TO "/var/opt/mssql/data/'$shortname'.mdf", MOVE "'$shortname'_log" TO "/var/opt/mssql/data/'$shortname'_log.ldf"'
  done
fi
