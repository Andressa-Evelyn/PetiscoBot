#1 parâmetro
defmodule PetiscoBot.Numbers do
  @moduledoc "Retorna curiosidades sobre números usando a Numbers API"
  @api_url "http://numbersapi.com"

  def run(number) do
    url = "#{@api_url}/#{number}?json"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        body |> Jason.decode!() |> Map.get("text")
      {:error, _} ->
        "Erro ao consultar a Numbers API"
    end
  end
end
