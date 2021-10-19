{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    (_airbyte_data ->> 'total') as amount,
    (_airbyte_data ->> 'subscription_id') as subscription_id,
    (_airbyte_data ->> 'id') as invoice_id,
    (_airbyte_data ->> 'id') as invoice_number,
    (_airbyte_data ->> 'date') as date_created,
    (_airbyte_data ->> 'paid_at') as date_paid,
    (_airbyte_data ->> 'currency_code') as currency,
    (_airbyte_data ->> 'sub_total') as subtotal,
    (_airbyte_data ->> 'amount_paid') as amount_paid
from {{ source('airmeet_chargebee', '_airbyte_raw_invoice') }}
-- invoices