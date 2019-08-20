`obs: caso não tenha, é necessário instalação do Docker: https://www.docker.com/ e do Maven: https://maven.apache.org/`

## Stack
  - JAVA 8
  - MyBatis 3
  - Spring Boot 2.0.5.RELEASE
  - PostgreSQL 9.6
  - Docker version 18.09.3
  - Apache Maven 3.6.0

## Instalando Dependências
```
  $ cd {ROOT_PROJECT}
  $ mvn install:install-file -Dfile=libs/dbc-to-dbf-1.1.jar -DgroupId=com.datasus -DartifactId=dbc-to-dbf -Dversion=1.1 -Dpackaging=jar
  $ mvn clean install  
```
## Executando a aplicação
```bash
  $ docker-compose up -d
```

## Credenciais acesso ao banco de Dados (caso queira acessar de algum SGBD)

```bash
  - url: jdbc:postgresql://localhost:5432/datasus
  - host: localhost
  - database: datasus
  - user: datasus_user
  - senha: 12345
```

## Melhorias futuras
  - utilizar um banco de dados NOSQL, melhorar desempenho
  - testar utilização um elastic-search ou kibana
  - criação de testes unitários e integração
