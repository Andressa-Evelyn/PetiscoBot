# 2 parâmetros
defmodule PetiscoBot.Weather do
  @moduledoc "Consulta a temperatura atual com a Open-Meteo API"
  @api_url "https://api.open-meteo.com/v1/forecast"

  def run(lat, lon) do
    url = "#{@api_url}?latitude=#{lat}&longitude=#{lon}&current=temperature_2m&timezone=America/Fortaleza"

    case Finch.build(:get, url) |> Finch.request(PetiscoBot.Finch) do
      {:ok, %{status: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, %{"current" => %{"temperature_2m" => temp}}} ->
            "A temperatura atual é de #{temp}°C 🌡️"
          _ ->
            "Não foi possível obter os dados de temperatura"
        end
      _ ->
        "Erro ao consultar Open-Meteo"
    end
  end
end
