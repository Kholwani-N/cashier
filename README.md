# Cashier

# Usage (iex terminal)
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

# Usage (Rest API)
```
#Create session
curl -X POST localhost:4000/sessions

#Add items
curl -X POST localhost:4000/sessions/abc-123/items \
  -H "Content-Type: application/json" \
  -d '{"code":"GR1"}'

#View cart
curl localhost:4000/sessions/abc-123

#Checkout
curl localhost:4000/sessions/abc-123/total

#Close session
curl -X DELETE localhost:4000/sessions/abc-123
```
