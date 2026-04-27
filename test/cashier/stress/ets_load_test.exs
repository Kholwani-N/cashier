defmodule Cashier.Stress.ETSLoadTest do
  use ExUnit.Case

  alias Cashier.Cart

  @tag timeout: 30_000

  test "ETS handles heavy concurrent writes safely" do
    tasks =
      for _i <- 1..100 do
        Task.async(fn ->
          cart = "ets-cart"

          Enum.each(1..100, fn _ ->
            Cart.add_item(cart, "GR1")
          end)
        end)
      end

    Enum.each(tasks, &Task.await/1)

    result = Cart.items("ets-cart")

    assert result["GR1"] == 10_000
  end
end