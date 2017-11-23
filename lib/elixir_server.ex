defmodule ElixirServer do
  use Application
  require Logger

  def start(_type, _args) do
  	port = Application.get_env(:elixir_server, :cowboy_port, 8080)

    children = [
      Plug.Adapters.Cowboy.child_spec(:http, ElixirServer.Router, [], port: port)
    ]

    Logger.info "Started application"

    Supervisor.start_link(children, strategy: :one_for_one)
  end

  defp dispatch do
    [
      {:_, [
        {"/ws", MyApp.SocketHandler, []},
        {:_, Plug.Adapters.Cowboy.Handler, {MyApp.Router, []}}
      ]}
    ]
  end
end
