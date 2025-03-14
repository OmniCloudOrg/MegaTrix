defmodule Exporter.Exporter do
  require Logger

  @moduledoc """
  This exports metrics data to someone else in a specific format.
  """
  def start() do
    loop_exporter()
  end

  defp loop_exporter() do
    loop_exporter()
  end
end
