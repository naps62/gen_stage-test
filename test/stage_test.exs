defmodule StageTest do
  use ExUnit.Case
  doctest Stage

  test "greets the world" do
    assert Stage.hello() == :world
  end
end
