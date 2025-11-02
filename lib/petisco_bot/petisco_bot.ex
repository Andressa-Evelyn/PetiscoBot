defmodule PetiscoBot do
  use Nostrum.Consumer
  require Logger

  alias PetiscoBot.{Joke, Crypto, Game, AgePredictor, UselessFacts}

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    Logger.info("Petisco entrou no evento")

    case String.split(msg.content, " ") do
      ["!joke"] ->
        Logger.info("joker deu bom")
        send_message(msg, Joke.run())

      ["!age", age] ->
        Logger.info("age deu bom")
        send_message(msg, AgePredictor.run(age))

      ["!crypto", coin] ->
        Logger.info("crypto deu bom")
        send_message(msg, Crypto.run(coin))

      ["!pokemon", name, level] ->
        Logger.info("pokemon deu bom")
        send_message(msg, Game.run(name, level))

      ["!fact" | rest] ->
        handle_fact_command(msg, rest)

      _ ->
        Logger.info("Mensagem ignorada")
        :ignore
    end
  end


  defp handle_fact_command(msg, rest) do
    case rest do
      [] ->
        Logger.info("fact sem parâmetros — usando padrão (random, en)")
        send_message(msg, UselessFacts.run())

      [tipo] ->
        Logger.info("fact com 1 parâmetro — tipo=#{tipo}")
        send_message(msg, UselessFacts.run(tipo))

      [tipo, idioma | _] ->
        Logger.info("fact com 2 parâmetros — tipo=#{tipo} | idioma=#{idioma}")
        send_message(msg, UselessFacts.run(tipo, idioma))
    end
  end


  defp send_message(msg, response) do
    Logger.debug("Enviando mensagem para canal #{msg.channel_id}...")

    case Nostrum.Api.Message.create(msg.channel_id, response) do
      {:ok, _message} ->
        Logger.info("Mensagem enviada com sucesso para #{msg.author.username}")

      {:error, reason} ->
        Logger.error("Falha ao enviar mensagem: #{inspect(reason)}")
    end
  end
end
