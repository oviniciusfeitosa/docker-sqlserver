# docker-sqlserver
Repositório com a responsibilidade de fornecer um container contendo SQLServer que permite restaurar o banco de dados de 
acordo com parâmetros informados.

## Como utilizar
```command
docker-compose up -d
```
## Restauração do banco de dados
Para que a restauração seja feita, é encessário definir a variável de ambiente `RESTAURAR_BACKUP` como `true` no arquivo
`docker-compose.yml`.
 
Todos os arquivos que estiverem no formato `.bak` no diretório diretório `database/restore` serão considerados.

##### Referências
- [SALIC](https://github.com/culturagovbr/docker-salic-mssql/tree/master/schemas)
- [Docker Hub](https://hub.docker.com/_/microsoft-mssql-server)
