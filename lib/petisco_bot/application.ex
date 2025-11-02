defmodule PetiscoBot.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  require Logger

  @impl true
  def start(_type, _args) do
     Logger.info("Iniciando PetiscoBot.Application...")

    children = [
      PetiscoBot,
      {Finch, name: MyFinch},
      {Finch, name: PetiscoBot.Finch}
    ]

    opts = [strategy: :one_for_one, name: PetiscoBot.Supervisor]
    #Supervisor.start_link(children, opts)
    result = Supervisor.start_link(children, opts)

    Logger.info("✅ Supervisor PetiscoBot iniciado com sucesso!")
    result
  end
end
