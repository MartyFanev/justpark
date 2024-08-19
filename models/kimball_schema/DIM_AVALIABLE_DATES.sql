

SELECT rule_id,
        days
FROM (SELECT
       rule_id,
       UNNEST(applies_on_days->'$[*]') AS days
FROM {{ref('intm_pricing__tariffs')}}
)
GROUP BY rule_id,days
ORDER BY rule_id,days ASC
