defmodule Cashier.Infrastructure.ETSTable do
  use GenServer

  @table :carts

  def start_link(_),
    do: GenServer.start_link(__MODULE__, :ok, name: __MODULE__)

  def init(:ok) do
    :ets.new(@table, [
      :named_table,
      :set,
      :public,
      read_concurrency: true,
      write_concurrency: true
    ])

    {:ok, %{}}
  end
end