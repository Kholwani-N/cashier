defmodule Cashier.Cart do
  alias Cashier.Cart.{Server, Supervisor}

  defp ensure_started(cart_id) do
    case Registry.lookup(Cashier.CartRegistry, cart_id) do
      [] -> Supervisor.start_cart(cart_id)
      _ -> :ok
    end
  end

  def add_item(cart_id, code, qty \\ 1) do
    ensure_started(cart_id)
    Server.add_item(cart_id, code, qty)
  end

  def remove_item(cart_id, code) do
  ensure_started(cart_id)
  Server.remove_item(cart_id, code)
  end

  def items(cart_id) do
    ensure_started(cart_id)
    Server.items(cart_id)
  end

  def clear(cart_id) do
    ensure_started(cart_id)
    Server.clear(cart_id)
  end
end