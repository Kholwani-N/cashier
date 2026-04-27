# Cashier

# Usage (iex terminal)
```
# Start a session (cart a)
{:ok, a} = Cashier.POS.start_session()
# Add / Scan items
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "SR1")
# Compute total
Cashier.POS.total(a) |> Decimal.to_string()

# Start a session (cart b)
{:ok, b} = Cashier.POS.start_session()
# Add / Scan items
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
# Compute total
Cashier.POS.total(b) |> Decimal.to_string()

# Start a session (cart c)
{:ok, c} = Cashier.POS.start_session()
# Add / Scan items
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
# Compute total
Cashier.POS.total(c) |> Decimal.to_string()
```

# Usage (Rest API)
```
#Create session
curl -X POST localhost:4000/sessions

# Add items
curl -X POST localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef/items \
  -H "Content-Type: application/json" \
  -d '{"code":"GR1"}'

# View cart
curl localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef

# Checkout
curl localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef/total

# Close session
curl -X DELETE localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef
```
