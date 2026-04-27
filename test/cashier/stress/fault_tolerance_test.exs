defmodule Cashier.Stress.FaultToleranceTest do
  use ExUnit.Case

  alias Cashier.Cart

  test "cart recovers after process crash" do
    cart_id = "ft-cart"

    Cart.add_item(cart_id, "GR1")

    pid = GenServer.whereis({:via, Registry, {Cashier.CartRegistry, cart_id}})
    assert Process.alive?(pid)

    # kill process
    Process.exit(pid, :kill)

    # give supervisor time to restart
    :timer.sleep(200)

    new_pid = GenServer.whereis({:via, Registry, {Cashier.CartRegistry, cart_id}})

    assert new_pid != nil
    assert Process.alive?(new_pid)
  end
end