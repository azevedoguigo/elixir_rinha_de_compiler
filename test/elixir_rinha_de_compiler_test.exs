defmodule ElixirRinhaDeCompilerTest do
  use ExUnit.Case
  doctest ElixirRinhaDeCompiler

  test "greets the world" do
    assert ElixirRinhaDeCompiler.hello() == :world
  end
end
