defmodule MongoApplicationTest do
  use ExUnit.Case
  doctest MongoApplication

  test "greets the world" do
    assert MongoApplication.hello() == :world
  end
end
