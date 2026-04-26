# Cashier

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `cashier` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:cashier, "~> 0.1.0"}
  ]
end
```

# Usage
```
{:ok, a} = Cashier.POS.start_session()
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "SR1")
Cashier.POS.total(a)

{:ok, b} = Cashier.POS.start_session()
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
Cashier.POS.total(b)

{:ok, c} = Cashier.POS.start_session()
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
Cashier.POS.total(c)
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/cashier>.

