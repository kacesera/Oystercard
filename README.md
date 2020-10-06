# Oystercard
## Domain models

Object | Behaviour
-------|----------
Oystercard|Can have money, #add_money up to £90, @status
User | #touch_in, #touch_out, #in_journey?

## How to use
``` card = Oystercard.new
card.top_up(30)
=> 30```

```card.deduct_fare(3)
=> 27```
