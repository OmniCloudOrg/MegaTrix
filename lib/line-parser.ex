defmodule LineParser do
  require Logger
  def line_to_cmds(line) do
    String.split(line, " ")
  end

  def valid_cmds?(cmds) do
    case cmds do
      [time, _msg] ->
        Logger.info("time #{time}")
        {:ok, cmds}
    end
  end
end
