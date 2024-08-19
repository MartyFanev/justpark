-- Data structured in a way that deleted_at = NULL
-- is the current price

SELECT price_id
,location_id
,pricing_mode
,created_at
,deleted_at
,rule_id

FROM {{ref('base_pricing__prices')}}
WHERE deleted_at IS NULL
