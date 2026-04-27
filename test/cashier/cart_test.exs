defmodule Cashier.CartTest do
  use Cashier.CartCase, async: true

  alias Cashier.Cart

  test "adds items to cart", %{cart_id: id} do
    Cart.add_item(id, "GR1")

    assert Cart.items(id) == %{"GR1" => 1}
  end

  test "increments quantity", %{cart_id: id} do
    Cart.add_item(id, "GR1")
    Cart.add_item(id, "GR1")

    assert Cart.items(id) == %{"GR1" => 2}
  end

  test "clears cart", %{cart_id: id} do
    Cart.add_item(id, "GR1")
    Cart.clear(id)

    assert Cart.items(id) == %{}
  end
end