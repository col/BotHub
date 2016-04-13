defmodule BotHub.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/" do
    conn |> send_resp(200, "BotHub")
  end

  post "/bots/:bot_id/messages" do
    {:ok, message, conn} = Plug.Conn.read_body(conn)
    case BotHub.Bot.handle_message({bot_id, message}) do
      :ok -> send_resp(conn, 200, "")
      _ -> send_resp(conn, 404, "Bot Not Found")
    end
  end

  match _ do
    send_resp(conn, 404, "BotHub: 404 - Page not found")
  end

end
