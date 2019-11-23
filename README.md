# docker-sqlserver
Repositório com a responsibilidade de fornecer um container contendo SQLServer que permite restaurar o banco de dados de 
acordo com parâmetros informados.

## Requisitos
- Docker
- DockerCompose

## Como utilizar
```command
docker-compose up -d
```

# Como acessar
Para acessar o banco de dados basta inserir as informações a seguir:
- host: `localhost` ou `database-mssql`
- user: `sa`
- pasword: `root@Abcd11` (mesmo definido no arquivo docker-compose.yml)

## Restauração do banco de dados
Para que a restauração seja feita, é encessário definir a variável de ambiente `RESTAURAR_BACKUP` como `true` no arquivo
`docker-compose.yml`.
 
Todos os arquivos que estiverem no formato `.bak` no diretório diretório `database/restore` serão considerados.

##### Referências
- [SALIC](https://github.com/culturagovbr/docker-salic-mssql/tree/master/schemas)
- [Docker Hub](https://hub.docker.com/_/microsoft-mssql-server)
- [Commit Messages Convention (CMC)](https://github.com/devbrotherhood/cmc)
