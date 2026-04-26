defmodule Cashier.Cart.Server do
  use GenServer

  alias Cashier.Cart.Store
  alias Cashier.Catalog

  def start_link(cart_id) do
    GenServer.start_link(__MODULE__, cart_id, name: via(cart_id))
  end

  def add_item(cart_id, code, qty \\ 1) do
    GenServer.call(via(cart_id), {:add_item, code, qty})
  end

  def items(cart_id) do
    GenServer.call(via(cart_id), :items)
  end

  def clear(cart_id) do
    GenServer.call(via(cart_id), :clear)
  end

  def init(cart_id), do: {:ok, cart_id}

  def handle_call({:add_item, code, qty}, _from, cart_id) do
    if Catalog.exists?(code) do
      cart =
        Store.update(cart_id, fn cart ->
          Map.update(cart, code, qty, &(&1 + qty))
        end)

      {:reply, {:ok, cart}, cart_id}
    else
      {:reply, {:error, :invalid_product}, cart_id}
    end
  end

  def handle_call(:items, _from, cart_id) do
    {:reply, Store.get(cart_id), cart_id}
  end

  def handle_call(:clear, _from, cart_id) do
    Store.clear(cart_id)
    {:reply, :ok, cart_id}
  end

  defp via(id),
    do: {:via, Registry, {Cashier.CartRegistry, id}}
end