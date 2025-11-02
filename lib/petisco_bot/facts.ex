#2 parâmetros
defmodule PetiscoBot.UselessFacts do

    @moduledoc """
    Retorna um fato inútil. Seu comando é !fact <tipo> <idioma>. Onde tipo pode ser "random", "today",
     e idioma pode ser "en" ou "de".
    """

  @api_url "https://uselessfacts.jsph.pl/api/v2/facts"


  def run(tipo \\ "random", idioma \\ "en") do
    url = "#{@api_url}/#{tipo}?language=#{idioma}"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        body
        |> Jason.decode!()
        |> Map.get("text", "Fato não encontrado")

      {:error, _} ->
        "Erro ao consultar a Useless Facts API"
    end
  end
end
