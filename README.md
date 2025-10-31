# 🤖 PetiscoBot REST em Elixir — Comandos via APIs públicas

Este projeto implementa uma API REST em Elixir que consome diversas APIs públicas para gerar comandos dinâmicos e interativos. Desenvolvido como parte da disciplina de **Programação Funcional**, o sistema utiliza conceitos de imutabilidade, funções puras e composição para integrar dados externos de forma elegante e funcional. A aplicação permite consultar curiosidades, previsões do tempo, informações sobre criptomoedas, Pokémon e até piadas — tudo via requisições HTTP.

---

## 🚀 Tecnologias utilizadas

- **Elixir** — linguagem funcional robusta e escalável
- **Plug** — para roteamento e construção da API REST
- **Finch** — cliente HTTP moderno e eficiente
- **Jason** — para decodificação de JSON
- **Nostrum** *(opcional)* — integração com bots Discord

---

## 🌐 APIs integradas

### 🔢 Numbers API — Curiosidades sobre números
- **Endpoint:** `http://numbersapi.com/{number}?json`
- **Parâmetro:** `number` (ex: `42`)
- Retorna fatos curiosos sobre números inteiros.

### 🌤️ Open-Meteo API — Previsão do tempo
- **Endpoint:** `https://api.open-meteo.com/v1/forecast`
- **Parâmetros:**
  - `latitude` e `longitude`: localização
  - `hourly`: dados por hora (ex: `temperature_2m`)
  - `daily`: dados diários (ex: `sunrise`, `temperature_2m_max`)
  - `timezone`: fuso horário (ex: `America/Fortaleza`)

### 🎮 PokéAPI — Dados sobre Pokémon
- **Endpoint:** `https://pokeapi.co/api/v2/pokemon/{nome}`
- **Parâmetro:** `nome` ou `id` do Pokémon (ex: `pikachu`)
- Retorna tipos, habilidades, stats e movimentos.

### 🪙 CoinGecko API — Preço de criptomoedas
- **Endpoint:** `https://api.coingecko.com/api/v3/simple/price`
- **Parâmetros:**
  - `ids`: nome da moeda (ex: `bitcoin`)
  - `vs_currencies`: moeda de conversão (ex: `usd`)
- Retorna o preço atual da criptomoeda.

### 😂 JokeAPI — Piadas programáveis
- **Endpoint:** `https://v2.jokeapi.dev/joke/Any?type=single`
- **Parâmetro:** `type=single`
- Retorna uma piada aleatória em inglês.

---

## 📦 Como rodar o projeto

```bash
# Instale as dependências
mix deps.get

# Inicie o servidor local
mix run --no-halt
