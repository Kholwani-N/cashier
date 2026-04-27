defmodule Cashier.POS do
  require Logger

  alias Cashier.Cart
  alias Cashier.Checkout

  ## Start Session
  def start_session do
    session_id = UUID.uuid4()
    Logger.info("session_started", session_id: session_id)
    {:ok, session_id}
  end

  ## Scan Item
  def scan(session_id, code, qty \\ 1) do
    Logger.info("scan_item",
      session_id: session_id,
      product: code,
      qty: qty
    )

    Cart.add_item(session_id, code, qty)
  end

  ## Remove Item
  def remove(session_id, code) do
    Logger.info("remove_item",
      session_id: session_id,
      product: code
    )

    Cart.remove_item(session_id, code)
  end

  ## View Items in cart
  def items(session_id) do
    Logger.info("view_cart", session_id: session_id)
    Cart.items(session_id)
  end

  ## Checkout
  def total(session_id) do
    total = Checkout.total(session_id)
    Logger.info("checkout_total",
      session_id: session_id,
      total: total
    )

    total
  end

  ## Close Session
  def close(session_id) do
    Logger.info("session_closed", session_id: session_id)
    Cart.clear(session_id)
    :ok
  end
end