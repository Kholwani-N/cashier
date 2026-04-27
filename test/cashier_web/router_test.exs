defmodule Cashier.Web.RouterTest do
  use ExUnit.Case, async: true
  import Plug.Test
  import Plug.Conn

  alias Cashier.Web.Router

  @opts Router.init([])

  test "health endpoint" do
    conn = conn(:get, "/health") |> Router.call(@opts)

    assert conn.status == 200
    assert conn.resp_body == "ok"
  end

  test "session lifecycle" do
    conn =
      conn(:post, "/sessions")
      |> Router.call(@opts)

    assert conn.status == 201

    %{"session_id" => id} = Jason.decode!(conn.resp_body)

    conn =
      conn(:post, "/sessions/#{id}/items", Jason.encode!(%{code: "GR1"}))
      |> put_req_header("content-type", "application/json")
      |> Router.call(@opts)

    assert conn.status == 404

    conn =
      conn(:get, "/sessions/#{id}/total")
      |> Router.call(@opts)

    assert conn.status == 200
    assert String.contains?(conn.resp_body, "total")
  end
end