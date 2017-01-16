%dw 1.0
%output application/json skipNullOn="everywhere"
---
("nodes":  flatten payload.nodes unless payload.nodes == null otherwise null)

++

("edges": flatten payload..*edges unless payload..*edges == null otherwise null)
