defmodule BotHub.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test
  alias BotHub.Router

  @opts Router.init([])

  @json_request "{ \"message\": { \"chat\": { \"id\": 1 }, \"text\": \"unknown_command\" } }"

  test "POST /bots/SampleBot/messages with valid params returns an empty response" do
    conn = conn(:post, "/bots/SampleBot/messages", @json_request)
      |> put_req_header("content-type", "application/json")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == ""
  end

  test "POST /bots/SampleBot/messages with invalid params returns an empty response" do
    conn = conn(:post, "/bots/SampleBot/messages", "{}")
      |> put_req_header("content-type", "application/json")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == ""
  end

  test "POST /bots/unknown_bot/messages with unknown bot returns 404 error" do
    conn = conn(:post, "/bots/unknown_bot/messages", "{}")
      |> put_req_header("content-type", "application/json")
      |> Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Bot Not Found"
  end

  test "GET /anything_else returns a 404 error" do
    conn = conn(:post, "/anything_else")
    conn = Router.call(conn, @opts)

    assert conn.state == :sent
    assert conn.status == 404
  end

end
