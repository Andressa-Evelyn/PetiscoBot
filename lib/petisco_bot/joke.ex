# sem parâmetro

defmodule PetiscoBot.Joke do
  @moduledoc "Conta uma piada usando a JokeAPI"
  @api_url "https://v2.jokeapi.dev/joke/Any?type=single"

  def run do
    case Finch.build(:get, @api_url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        body |> Jason.decode!() |> Map.get("joke") #tá pegando apenas a chave joke e passando pra mapa elixir
      _ ->
        "Não consegui encontrar uma piada"
    end
  end
end
