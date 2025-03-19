defmodule Importer.Importer do
  require Logger

  @moduledoc """
  This is the default Importer for Megatrix.

  It is a tcp socket acceptor.
  """

  def start(port) do
    importer_name = "mega_importer"
    Logger.info("Starting the importer - #{importer_name}")

    {:ok, socket} =
      :gen_tcp.listen(port, [:binary, packet: :line, active: false, reuseaddr: true])

    Logger.info("#{importer_name} listening on #{port}")

    loop_acceptor(socket)
  end

  def loop_acceptor(socket) do
    # TODO use genserver obvi
    {:ok, client_socket} = :gen_tcp.accept(socket)

    Task.start_link(fn ->
      serve(client_socket)
    end)

    loop_acceptor(socket)
  end

  defp serve(socket) do
    case read_line(socket) do
      {:ok, line} ->
        write_line(socket, line)
        serve(socket)
      {:error, :closed} ->
        Logger.info("Client disconnected")
        :ok
      {:error, reason} ->
        Logger.error("Error serving client: #{reason}")
        :ok
    end
  end

  defp read_line(socket) do
    case :gen_tcp.recv(socket, 0) do
      {:ok, data} ->
        {:ok, data}
      {:error, :closed} ->
        {:error, :closed}
      {:error, reason} ->
        {:error, reason}
    end
  end

  defp write_line(socket, line) do
    Logger.info("Writing line to client: #{line}")
    better_line = "SRV: " <> line
    :gen_tcp.send(socket, better_line)
  end
end
