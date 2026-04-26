defmodule Cashier.Cart.Supervisor do
  use DynamicSupervisor

  alias Cashier.Cart.Server

  def start_link(_),
    do: DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)

  def init(:ok),
    do: DynamicSupervisor.init(strategy: :one_for_one)

  def start_cart(cart_id) do
    spec = {Server, cart_id}
    DynamicSupervisor.start_child(__MODULE__, spec)
  end
end