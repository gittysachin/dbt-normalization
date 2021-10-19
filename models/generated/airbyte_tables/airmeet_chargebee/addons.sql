{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    (_airbyte_data ->> 'id') as addon_id,
    (_airbyte_data ->> 'name') as name,
    (_airbyte_data ->> 'type') as type,
    (_airbyte_data ->> 'price') as price,
    (_airbyte_data ->> 'period') as period,
    (_airbyte_data ->> 'status') as status,
    (_airbyte_data ->> 'channel') as channel,
    (_airbyte_data ->> 'taxable') as taxable,
    (_airbyte_data ->> 'updated_at') as updated_at,
    (_airbyte_data ->> 'charge_type') as charge_type,
    (_airbyte_data ->> 'period_unit') as period_unit,
    (_airbyte_data ->> 'invoice_name') as invoice_name,
    (_airbyte_data ->> 'is_shippable') as is_shippable,
    (_airbyte_data ->> 'currency_code') as currency,
    (_airbyte_data ->> 'pricing_model') as pricing_model,
    (_airbyte_data ->> 'cf_access_type') as cf_access_type,
    (_airbyte_data ->> 'accounting_code') as accounting_code,
    (_airbyte_data ->> 'cf_service_type') as cf_service_type,
    (_airbyte_data ->> 'resource_version') as resource_version
from {{ source('airmeet_chargebee', '_airbyte_raw_addon') }}
-- addons