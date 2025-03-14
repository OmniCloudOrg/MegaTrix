defmodule Megatrix do
  require Logger

  @moduledoc """
  """

  def start() do
    Logger.info("Starting up megatrix")

    config()
  end

  def config() do
    importer_port = 60000

    {:ok, base_importer} = Task.Supervisor.start_child(Megatrix.Importers, fn -> Importer.Importer.start(importer_port) end)
  end
end
