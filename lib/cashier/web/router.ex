defmodule Cashier.Web.Router do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers, parsers: [:json], json_decoder: Jason
  plug :dispatch

  ## Health
  get "/health" do
    send_resp(conn, 200, "ok")
  end

  ## Create session
  post "/sessions" do
    {:ok, session} = Cashier.POS.start_session()
    send_json(conn, 201, %{session_id: session})
  end

  ## Add item
  post "/sessions/:id/items" do
    %{"code" => code} = conn.body_params
    qty = Map.get(conn.body_params, "qty", 1)

    Cashier.POS.scan(id, code, qty)

    send_json(conn, 200, %{status: "ok"})
  end

  ## Get cart
  get "/sessions/:id" do
    items = Cashier.POS.items(id)
    send_json(conn, 200, %{items: items})
  end

  ## Checkout
  get "/sessions/:id/total" do
    total = Cashier.POS.total(id)
    send_json(conn, 200, %{total: total})
  end

  ## Delete session
  delete "/sessions/:id" do
    Cashier.POS.close(id)
    send_resp(conn, 204, "")
  end

  match _ do
    send_resp(conn, 404, "not found")
  end

  defp send_json(conn, status, body) do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(status, Jason.encode!(body))
  end
end