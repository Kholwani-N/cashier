defmodule Cashier.POSTest do
  use ExUnit.Case

  alias Cashier.POS

  test "full session flow" do
    {:ok, session} = POS.start_session()

    POS.scan(session, "GR1")
    POS.scan(session, "SR1")

    items = POS.items(session)
    assert Map.has_key?(items, "GR1")
    assert Map.has_key?(items, "SR1")

    total = POS.total(session)
    assert is_struct(total, Decimal)
  end
end