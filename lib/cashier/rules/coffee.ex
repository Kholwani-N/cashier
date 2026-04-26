defmodule Cashier.Rules.Coffee do
  alias Decimal, as: D
  @behaviour Cashier.Checkout.PricingRule

  def apply(cart) do
    case Map.get(cart, "CF1", 0) do
      count when count >= 3 ->
        discount_per =
          D.sub(
            D.new("11.23"),
            D.mult(D.new("11.23"), D.div(D.new("2"), D.new("3")))
          )

        [%{amount: D.mult(discount_per, count)}]

      _ ->
        []
    end
  end
end