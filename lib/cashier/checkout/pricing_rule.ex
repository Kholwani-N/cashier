defmodule Cashier.Checkout.PricingRule do
  @callback apply(map()) :: [map()]
end