defmodule Cashier.Catalogue do
  alias Decimal, as: D

  @products %{
    "GR1" => %{name: "Green tea", price: D.new("3.11")},
    "SR1" => %{name: "Strawberries", price: D.new("5.00")},
    "CF1" => %{name: "Coffee", price: D.new("11.23")}
  }

  def get!(code), do: Map.fetch!(@products, code)
  def exists?(code), do: Map.has_key?(@products, code)
end