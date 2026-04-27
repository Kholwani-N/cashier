defmodule Cashier.Rules.Tea do
  alias Decimal, as: D
  @behaviour Cashier.Checkout.PricingRule

  def apply(cart) do
    case Map.get(cart, "GR1", 0) do
      count when count > 1 ->
        free = div(count, 2)
        [%{amount: D.mult(D.new("3.11"), free)}]

      _ ->
        []
    end
  end
end