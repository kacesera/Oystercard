# Oystercard
## Domain models

Object | Behaviour
-------|----------
Oystercard|Can have money, #add_money up to £90

## How to use
``` card = Oystercard.new
card.top_up(30)
=> 30```

```card.deduct_fare(3)
=> 27```
