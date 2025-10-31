defmodule PetiscoBot do
  use Nostrum.Consumer

  alias PetiscoBot.{Joke, Numbers, Weather, Crypto, Game}

  def handle_event({:MESSAGE_CREATE, msg, _ws_state}) do
    case String.split(msg.content, " ") do #se o usuario nao mandar nd
      ["!joke"] ->
        send_message(msg, Joke.run()) #sem parametro

      ["!number", number] -> #se o usuario mandar !number
        send_message(msg, Numbers.run(number)) #1 parametro

      ["!crypto", coin] -> #se o usuario mandar !crypto
        send_message(msg, Crypto.run(coin)) #1 parametro

      ["!weather", lat, lon] -> #se o usuario mandar !weather
        send_message(msg, Weather.run(lat, lon)) #2 parametros

      ["!pokemon", name, level] -> #se o usuario mandar !pokemon
        send_message(msg, Game.run(name, level)) #2 parametros

      _ -> :ignore
    end
  end

  defp send_message(msg, response),
    do: Nostrum.Api.create_message(msg.channel_id, response)
end
