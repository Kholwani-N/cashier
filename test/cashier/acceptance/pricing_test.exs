defmodule Cashier.Acceptance.PricingTest do
  use ExUnit.Case

  alias Cashier.Cart
  alias Cashier.Checkout
  alias Decimal, as: D

  defp basket(items) do
    id = "acc-#{System.unique_integer([:positive])}"
    Cart.clear(id)

    Enum.each(items, fn code ->
      Cart.add_item(id, code)
    end)

    Checkout.total(id)
  end

  test "GR1,SR1,GR1,GR1,CF1 => 22.45" do
    assert basket(["GR1","SR1","GR1","GR1","CF1"]) == D.new("22.45")
  end

  test "GR1,GR1 => 3.11" do
    assert basket(["GR1","GR1"]) == D.new("3.11")
  end

  test "SR1,SR1,GR1,SR1 => 16.61" do
    assert basket(["SR1","SR1","GR1","SR1"]) == D.new("16.61")
  end

  test "GR1,CF1,SR1,CF1,CF1 => 30.57" do
    assert basket(["GR1","CF1","SR1","CF1","CF1"]) == D.new("30.57")
  end
end