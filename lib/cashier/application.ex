defmodule Cashier.Application do
  use Application

  def start(_type, _args) do
    children = [
      Cashier.Infrastructure.ETSTable,
      {Registry, keys: :unique, name: Cashier.CartRegistry},
      Cashier.Cart.Supervisor,
      {Plug.Cowboy, scheme: :http, plug: Cashier.Web.Router, options: [port: 4000]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end