defmodule Cashier.CartCase do
  use ExUnit.CaseTemplate

  alias Cashier.Cart

  setup do
    cart_id = "test-cart-#{System.unique_integer([:positive])}"
    Cart.clear(cart_id)

    %{cart_id: cart_id}
  end
end