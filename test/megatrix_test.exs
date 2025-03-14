defmodule MegatrixTest do
  use ExUnit.Case
  doctest Megatrix

  test "line->cmds list test" do
    ["abc", "xyz"] = LineParser.line_to_cmds("abc xyz")
  end

  test "line->cmds list validate test" do
    cmds = LineParser.line_to_cmds("abc xyz")
    {:ok, _} = LineParser.valid_cmds?(cmds)
  end
end
