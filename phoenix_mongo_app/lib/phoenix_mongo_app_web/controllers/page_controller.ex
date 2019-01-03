defmodule PhoenixMongoAppWeb.PageController do
  use PhoenixMongoAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
