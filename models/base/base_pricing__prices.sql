-- Load in prices model, these describe the location of a parking space, the pricing model and the time that this pricing
-- was created and destroyed, alongside a conneciton to the rule that this pricing currently uses

SELECT price_id
,location_id
,pricing_mode
,created_at
,deleted_at
,rule_id

FROM {{source('pricing','prices')}}
