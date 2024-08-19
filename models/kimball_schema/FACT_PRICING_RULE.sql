SELECT RULE.rule_id,
       price,
       duration,

FROM {{ref('intm_pricing__tariffs')}} AS RULE

