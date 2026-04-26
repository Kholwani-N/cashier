defmodule Cashier.Cart.Store do
  @table :carts

  def get(cart_id) do
    case :ets.lookup(@table, cart_id) do
      [{^cart_id, cart}] -> cart
      [] -> %{}
    end
  end

  def put(cart_id, cart) do
    :ets.insert(@table, {cart_id, cart})
    cart
  end

  def update(cart_id, fun) do
    current = get(cart_id)
    new_cart = fun.(current)
    put(cart_id, new_cart)
  end

  def clear(cart_id) do
    :ets.delete(@table, cart_id)
    :ok
  end
end