defmodule PhoenixMongoAppWeb.PageController do
  use PhoenixMongoAppWeb, :controller

  def index(conn, _params) do
    list = PhoenixMongoApp.Application.get_from_mongo("Grevious")
    lines = Enum.map(list, fn x -> x["line"] end)
    render(conn, "index.html", lines: lines)
  end
end
