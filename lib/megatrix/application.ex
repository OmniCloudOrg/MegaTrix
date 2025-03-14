defmodule Megatrix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      {Task.Supervisor, name: Megatrix.Importers},
      # Starts a worker by calling: Megatrix.Worker.start_link(arg)
      Supervisor.child_spec({Task, fn -> Megatrix.start() end}, restart: :temporary)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Megatrix.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
