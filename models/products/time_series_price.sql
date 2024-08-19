SELECT FACT_PRICING_RULE.rule_id
       ,FACT_PRICING_RULE.price
       ,FACT_PRICING_RULE.duration
       ,FACT_PRICE.price_id
       ,FACT_PRICE.location_id
       ,FACT_PRICE.created_at
       ,FACT_PRICE.deleted_at

FROM {{ref('FACT_PRICE')}} AS FACT_PRICE
INNER JOIN {{ref('FACT_PRICING_RULE')}} AS FACT_PRICING_RULE
ON FACT_PRICE.rule_id = FACT_PRICING_RULE.rule_id

WHERE FACT_PRICE.location_id = 524686 
     AND FACT_PRICING_RULE.duration = 1
ORDER BY FACT_PRICE.created_at
      

