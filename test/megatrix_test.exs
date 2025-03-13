defmodule MegatrixTest do
  use ExUnit.Case
  doctest Megatrix

  test "greets the world" do
    assert Megatrix.hello() == :world
  end
end
