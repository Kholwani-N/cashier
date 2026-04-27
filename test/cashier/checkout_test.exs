defmodule Cashier.CheckoutTest do
  use ExUnit.Case

  alias Cashier.Checkout
  alias Cashier.Cart

  test "empty cart returns 0" do
    assert Decimal.equal?(Checkout.total("unknown"), Decimal.new("0"))
  end

  test "calculates single item correctly" do
    Cart.add_item("t1", "GR1")

    total = Checkout.total("t1")

    assert Decimal.compare(total, Decimal.new("3.11")) == :eq
  end
end