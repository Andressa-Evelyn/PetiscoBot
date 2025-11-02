#  PetiscoBot REST em Elixir — Comandos via APIs públicas

Este projeto implementa uma API REST em Elixir que consome diversas APIs públicas para gerar comandos dinâmicos e interativos. Desenvolvido como parte da disciplina de **Programação Funcional**, o sistema utiliza conceitos de imutabilidade, funções puras e composição para integrar dados externos de forma elegante e funcional. A aplicação permite consultar curiosidades aletórias, adivinhação de idade com base no nome, informações sobre criptomoedas, Pokémon e até piadas — tudo via requisições HTTP.

---

## Tecnologias utilizadas

- **Elixir** — linguagem funcional robusta e escalável
- **Plug** — para roteamento e construção da API REST
- **Finch** — cliente HTTP moderno e eficiente
- **Jason** — para decodificação de JSON
- **Nostrum** *(opcional)* — integração com bots Discord

---

## APIs integradas

### Useless Facts API — Fatos curiosos e inúteis
- **Endpoint:** `https://uselessfacts.jsph.pl/api/v2/facts`
- **Parâmetro:** `tipo`: "random" ou "today" e `language`: "en" (inglês) ou "de" (alemão)
-Retorna um fato curioso aleatório ou o fato do dia.


### PokéAPI — Dados sobre Pokémon
- **Endpoint:** `https://pokeapi.co/api/v2/pokemon/{nome}`
- **Parâmetro:** `nome` e `level` do Pokémon (ex: `pikachu 25`)
- Retorna tipos, habilidades, stats e movimentos.

### Agify.io — Estimativa de idade por nome
- **Endpoint:** `https://api.agify.io`
- **Parâmetros:** nome
-Retorna uma estimativa de idade média com base no nome informado.

### CoinGecko API — Preço de criptomoedas
- **Endpoint:** `https://api.coingecko.com/api/v3/simple/price`
- **Parâmetros:**
  - `ids`: nome da moeda (ex: `bitcoin`)
  - `vs_currencies`: moeda de conversão (ex: `usd`)
- Retorna o preço atual da criptomoeda.

### JokeAPI — Piadas programáveis
- **Endpoint:** `https://v2.jokeapi.dev/joke/Any?type=single`
- **Parâmetro:** `type=single`
- Retorna uma piada aleatória em inglês.

---

##  Exemplo

![Imagem exemplo do bot](img\PetiscoBot.png)

## Como rodar o projeto

```bash
# Instale as dependências
mix deps.get

# Inicie o servidor local
mix run --no-halt

