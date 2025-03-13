defmodule Megatrix do
  require Logger

  @moduledoc """
  """


  def start() do
    Logger.info "Starting up megatrix"
  end



  def config() do
    children = [
      # Starts a worker by calling: Megatrix.Worker.start_link(arg)
      {Task, fn -> Importer.Importer.start() end},
      {Task, fn -> Exporter.Exporter.start() end}


    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Megatrix.Supervisor]
    Supervisor.start_link(children, opts)

  end
end
