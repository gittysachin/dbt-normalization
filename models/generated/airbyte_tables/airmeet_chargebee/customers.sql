{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    (_airbyte_data ->> 'id') as customer_id,
    (_airbyte_data ->> 'email') as email,
    (_airbyte_data ->> 'channel') as channel,
    (_airbyte_data ->> 'first_name') as first_name,
    (_airbyte_data ->> 'last_name') as last_name,
    (_airbyte_data ->> 'cf_source') as cf_source,
    (_airbyte_data ->> 'deleted') as deleted,
    (_airbyte_data ->> 'taxability') as taxability,
    (_airbyte_data ->> 'card_status') as card_status,
    (_airbyte_data ->> 'pii_cleared') as pii_cleared,
    (_airbyte_data ->> 'pricing_model') as pricing_model,
    (_airbyte_data ->> 'payment_method') as payment_method,
    (_airbyte_data ->> 'enable_in_portal') as enable_in_portal,
    (_airbyte_data ->> 'auto_collection') as auto_collection,
    (_airbyte_data ->> 'billing_address') as billing_address,
    (_airbyte_data ->> 'cf_community_id') as cf_community_id,
    (_airbyte_data ->> 'preferred_currency_code') as currency,
    (_airbyte_data ->> 'primary_payment_source_id') as primary_payment_source_id,
    (_airbyte_data ->> 'resource_version') as resource_version,
    (_airbyte_data ->> 'meta_data') as meta_data,
    (_airbyte_data ->> 'unbilled_charges') as unbilled_charges,
    (_airbyte_data ->> 'refundable_credits') as refundable_credits,
    (_airbyte_data ->> 'promotional_credits') as promotional_credits,
    (_airbyte_data ->> 'excess_payments') as excess_payments,
    (_airbyte_data ->> 'created_at') as created_at,
    (_airbyte_data ->> 'updated_at') as updated_at
from {{ source('airmeet_chargebee', '_airbyte_raw_customer') }}
-- customers