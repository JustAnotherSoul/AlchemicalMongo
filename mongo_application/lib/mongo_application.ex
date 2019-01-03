defmodule MongoApplication do
  @moduledoc """
  Documentation for MongoApplication.
  """

  @doc """
  Start a mongo connection, and query for the given string

  ## Examples

      iex> MongoApplication.hello()

  """
  def open_connection do
    {:ok, conn} = Mongo.start_link(url: "mongodb://localhost:27017/test")
    conn
  end

  def insert_record(conn, record) do
    Mongo.insert_one(conn, "lines", record)
  end

  def get_record(conn, record) do
    cursor = Mongo.find(conn, "lines", %{"$and" => [record]})
    cursor |> Enum.to_list() 
  end
end
