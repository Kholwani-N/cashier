defmodule Cashier.Acceptance.PricingTest do
  use ExUnit.Case

  alias Cashier.{Cart, Checkout}
  alias Decimal, as: D

  defp run_basket(cart_id, items) do
    Cart.clear(cart_id)

    Enum.each(items, fn code ->
      Cart.add_item(cart_id, code)
    end)

    Checkout.total(cart_id)
  end

  test "GR1,SR1,GR1,GR1,CF1 => 22.45" do
    total =
      run_basket("basket-1", [
        "GR1", "SR1", "GR1", "GR1", "CF1"
      ])

    assert total == D.new("22.45")
  end

  test "GR1,GR1 => 3.11" do
    total =
      run_basket("basket-2", [
        "GR1", "GR1"
      ])

    assert total == D.new("3.11")
  end

  test "SR1,SR1,GR1,SR1 => 16.61" do
    total =
      run_basket("basket-3", [
        "SR1", "SR1", "GR1", "SR1"
      ])

    assert total == D.new("16.61")
  end

  test "GR1,CF1,SR1,CF1,CF1 => 30.57" do
    total =
      run_basket("basket-4", [
        "GR1", "CF1", "SR1", "CF1", "CF1"
      ])

    assert total == D.new("30.57")
  end
end