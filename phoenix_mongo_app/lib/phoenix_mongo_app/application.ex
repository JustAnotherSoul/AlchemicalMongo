defmodule PhoenixMongoApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def get_from_mongo(actor) do
    connection = MongoApplication.open_connection
    list = MongoApplication.get_record(connection, %{orator: actor})
    list
  end

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Start the endpoint when the application starts
      PhoenixMongoAppWeb.Endpoint
      # Starts a worker by calling: PhoenixMongoApp.Worker.start_link(arg)
      # {PhoenixMongoApp.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PhoenixMongoApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    PhoenixMongoAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
