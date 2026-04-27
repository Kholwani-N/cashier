defmodule Cashier.Checkout.Engine do
  alias Decimal, as: D
  alias Cashier.Catalogue

  @rules [
    Cashier.Rules.Tea,
    Cashier.Rules.Strawberries,
    Cashier.Rules.Coffee
  ]

  def total(cart) do
    subtotal =
      Enum.reduce(cart, D.new("0"), fn {code, qty}, acc ->
        product = Catalogue.get!(code)
        D.add(acc, D.mult(product.price, D.new(qty)))
      end)

    discounts =
      @rules
      |> Enum.flat_map(& &1.apply(cart))
      |> Enum.reduce(D.new("0"), fn adj, acc ->
        D.add(acc, adj.amount)
      end)

    subtotal
    |> D.sub(discounts)
    |> D.round(2)
  end
end