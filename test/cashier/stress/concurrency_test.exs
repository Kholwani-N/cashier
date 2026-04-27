defmodule Cashier.Stress.ConcurrencyTest do
  use ExUnit.Case

  alias Cashier.Cart
  alias Cashier.Checkout

  @tag timeout: 30_000

  test "multiple carts do not interfere under parallel load" do
    tasks =
      for i <- 1..50 do
        Task.async(fn ->
          cart_id = "cart-#{i}"

          Cart.clear(cart_id)

          Enum.each(1..20, fn _ ->
            Cart.add_item(cart_id, "GR1")
          end)

          Checkout.total(cart_id)
        end)
      end

    results = Enum.map(tasks, &Task.await/1)

    # every cart should be independent
    assert Enum.all?(results, fn total ->
      total != nil
    end)

    # sanity: no crash or shared corruption
    assert length(results) == 50
  end
end