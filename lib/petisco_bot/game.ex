#2 parâmetro
defmodule PetiscoBot.Game do
  @moduledoc "Mostra informações sobre Pokémon através do comando !pokemon <nome> <nível>. Exemplo: !pokemon pikachu 25"
  
  @api_url "https://pokeapi.co/api/v2/pokemon"

  def run(pokemon, level) do
    url = "#{@api_url}/#{pokemon}"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        data = Jason.decode!(body)
        name = data["name"]
        types = data["types"] |> Enum.map(& &1["type"]["name"]) |> Enum.join(", ")
        base_exp = data["base_experience"]
        " #{String.capitalize(name)} (nível #{level}) — tipos: #{types} | base XP: #{base_exp}"
      _ ->
        "Erro ao buscar Pokémon"
    end
  end
end
