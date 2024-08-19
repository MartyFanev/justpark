-- Data structured in a way that deleted_at = NULL
-- is the current price


SELECT PRICING.price_id
  ,location_id
  ,created_at
  ,deleted_at
  ,rule_id
  ,pricing_mode
  ,CASE WHEN CURRENT_PRICES.price_id IS NOT NULL THEN 'Y'
ELSE 'N'
END AS CURRENT_FLAG


FROM {{ref('base_pricing__prices')}} AS PRICING

LEFT JOIN (
  SELECT price_id
  FROM {{ref('base_pricing__prices')}}
  WHERE deleted_at IS NULL) AS CURRENT_PRICES

ON PRICING.price_id = CURRENT_PRICES.price_id
