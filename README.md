# Desafio

## Especificações
- Docker (docker-compose)
- Ruby On Rails
- PostgresQL
## Setup

1 - Executa e monta os containers

```  docker-compose up --build ```


2 - Em outro terminal execute o compando para:

```  docker exec api rails db:setup ```
- Criar um Banco de Dados 
- Enviar as migrations 
- Adicionar os tipos de transações no BD (local: /db/seeds.rb)

## Abrir a aplicação

http://localhost:4000/

## Estrutura do projeto

### Arquitetura do projeto

![](/docs/arq.jpg)

### Entidade e Relacionamento

![](/docs/er.jpg)

### Rotas

- POST /transactions - Responsável por inserir uma lista de transações a partir de um arquito de texto com padrao CNAB proposto

- GET /transactions/by_store - Retorna todas as transações por loja e seu saldo (total)

###  Diretórios

- Api: Pasta raíz
- Frontend: /frontend

### Regras de negócio da aplicação

- /app/services
  * FormatTransactionService - Responsável por normalizar os dados e adionar os registro no BD

  * FilterByStoreService - Responsável por filtrar as transações por loja e calcular o saldo





