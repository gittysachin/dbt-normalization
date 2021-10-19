{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    (_airbyte_data ->> 'id') as plan_id,
    (_airbyte_data ->> 'name') as name,
    (_airbyte_data ->> 'price') as price,
    (_airbyte_data ->> 'status') as status,
    (_airbyte_data ->> 'period') as period,
    (_airbyte_data ->> 'taxable') as taxable,
    (_airbyte_data ->> 'giftable') as giftable,
    (_airbyte_data ->> 'period_unit') as period_unit,
    (_airbyte_data ->> 'invoice_name') as invoice_name,
    (_airbyte_data ->> 'currency_code') as currency,
    (_airbyte_data ->> 'pricing_model') as pricing_model,
    (_airbyte_data ->> 'tiers') as tiers,
    (_airbyte_data ->> 'enable_in_portal') as enable_in_portal,
    (_airbyte_data ->> 'billing_cycles') as billing_cycles,
    (_airbyte_data ->> 'resource_version') as resource_version,
    (_airbyte_data ->> 'accounting_code') as accounting_code,
    (_airbyte_data ->> 'free_quantity') as free_quantity,
    (_airbyte_data ->> 'setup_cost') as setup_cost,
    (_airbyte_data ->> 'meta_data') as meta_data
from {{ source('airmeet_chargebee', '_airbyte_raw_plan') }}
-- plans