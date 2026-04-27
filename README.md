# Cashier

# Usage (iex terminal)
```
# Start a session (cart a)
iex -S mix
{:ok, a} = Cashier.POS.start_session()
# Scan / Add items
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "GR1")
Cashier.POS.scan(a, "SR1")
# Checkout / Get Total
Cashier.POS.total(a) |> Decimal.to_string()

# Start a session (cart b)
{:ok, b} = Cashier.POS.start_session()
# Scan / Add items
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
Cashier.POS.scan(b, "CF1")
# Checkout / Get Total
Cashier.POS.total(b) |> Decimal.to_string()

# Start a session (cart c)
{:ok, c} = Cashier.POS.start_session()
# Scan / Add items
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
Cashier.POS.scan(c, "SR1")
# Checkout / Get Total
Cashier.POS.total(c) |> Decimal.to_string()
```

# Usage (Rest API)
```
## API Spec
POST   /sessions                    → start session
POST   /sessions/:id/items/add      → add item
GET    /sessions/:id/total          → total
DELETE /sessions/:id/items/remove   → remove item
GET    /health                      → health check

# Create session
curl -X POST localhost:4000/sessions

# Scan / Add item
curl -X POST localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef/items/add \
  -H "Content-Type: application/json" \
  -d '{"code":"GR1"}'

# Checkout / Get Total
curl -X GET localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef/total

# Remove item
curl -X DELETE localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef/items/remove \
  -H "Content-Type: application/json" \
  -d '{"code":"GR1"}'

# View cart
curl -X GET localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef

# Close session
curl -X DELETE localhost:4000/sessions/f8759d63-49c5-4c32-b92d-64ba2b6d5aef
```
