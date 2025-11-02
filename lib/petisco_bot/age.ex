#1 parâmetro
defmodule PetiscoBot.AgePredictor do
  @moduledoc """
  Retorna uma estimativa de idade com base em um nome, através do comando !age <nome>. Exemplo: !age Maria
  """

  @api_url "https://api.agify.io"

  def run(name) do
    url = "#{@api_url}?name=#{URI.encode(name)}"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        response = Jason.decode!(body)
        age = Map.get(response, "age")

        if age do
          "#{String.capitalize(name)} tem uma idade estimada de #{age} anos "
        else
          "Não consegui estimar a idade de #{name} "
        end

      {:error, _} ->
        "Erro ao consultar a Agify API"
    end
  end
end
