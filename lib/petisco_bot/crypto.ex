# 1 parâmetro
defmodule PetiscoBot.Crypto do
  @moduledoc "Consulta o preço de uma criptomoeda em USD usando a CoinGecko API"
  @api_url "https://api.coingecko.com/api/v3/simple/price"

  def run(coin) do #parâmetro
    url = "#{@api_url}?ids=#{coin}&vs_currencies=usd"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get(coin, %{})
        |> Map.get("usd", "desconhecido") #se não encontrar a coin, volta desconhecido
        |> then(&"O preço atual de #{coin} é $#{&1}")
      _ ->
        "Erro ao consultar CoinGecko"
    end
  end
end
