defmodule Cashier.Rules.Strawberries do
  alias Decimal, as: D
  @behaviour Cashier.Checkout.PricingRule

  def apply(cart) do
    case Map.get(cart, "SR1", 0) do
      count when count >= 3 ->
        [%{amount: D.mult(D.new("0.50"), count)}]

      _ ->
        []
    end
  end
end