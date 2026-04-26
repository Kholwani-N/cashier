defmodule Cashier.POS do
  alias Cashier.Cart
  alias Cashier.Checkout

  @doc """
  Starts a new customer session and returns a session_id.
  """
  def start_session do
    session_id = UUID.uuid4()
    {:ok, session_id}
  end

  @doc """
  Scan item into a specific session.
  """
  def scan(session_id, code, qty \\ 1) do
    Cart.add_item(session_id, code, qty)
  end

  @doc """
  Get current basket for a session.
  """
  def items(session_id) do
    Cart.items(session_id)
  end

  @doc """
  Compute total for a session.
  """
  def total(session_id) do
    Checkout.total(session_id)
  end

  @doc """
  Close session and clear cart.
  """
  def close(session_id) do
    Cart.clear(session_id)
    :ok
  end
end