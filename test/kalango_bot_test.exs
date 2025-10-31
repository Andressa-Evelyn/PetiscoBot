defmodule KalangoBotTest do
  use ExUnit.Case
  doctest KalangoBot

  test "greets the world" do
    assert KalangoBot.hello() == :world
  end
end
