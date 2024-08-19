-- intm_pricing__tariffs

SELECT
    rule_id,
    tariff->>'$.price' AS price,
    tariff->>'$.size' AS duration,
    tariff->>'$.applies_on_days[*]' AS applies_on_days,
    tariff->>'$.interval' as duration_interval,
    tariff->>'$.applies_from' as applies_from,
    tariff->>'$.applies_to' as applies_to,
    tariff->>'$.repeat' as repeat,
    tariff->>'$.applies_between[*]' as applies_between
FROM
    {{ ref('base_pricing__rules') }}
