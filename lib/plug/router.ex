defmodule ElixirServer.Router do
  use Plug.Router
  require Logger

  # alias ElixirServer.Plug.VerifyRequest

  plug Plug.Parsers, parsers: [:urlencoded, :multipart]
  # plug VerifyRequest, fields: ["content", "mimetype"],
  #                     paths:  ["/upload", ""]

  plug :match
  plug :dispatch

  get "/work" do
    send_resp(conn, 200, Application.get_env(:elixir_server, :prefix, 5))
  end
  post "/bitcoin" do
    k = conn.params["k"]
    Logger.info "request for /bitcoin with variable k = " <> k
    Miner.bitcoinMatch(k)
    send_resp(conn, 200, "received #{inspect(conn.params)} Miner is working")
  end

  post "/upload" do
    Logger.info "from worker " <> conn.params["coin"]
    send_resp(conn, 201, "Uploaded\n")
  end
  match _, do: send_resp(conn, 404, "Oops!\n")


end