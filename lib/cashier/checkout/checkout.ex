defmodule Cashier.Checkout do
  alias Cashier.Cart
  alias Cashier.Checkout.Engine

  def total(cart_id) do
    cart_id
    |> Cart.items()
    |> Engine.total()
  end
end