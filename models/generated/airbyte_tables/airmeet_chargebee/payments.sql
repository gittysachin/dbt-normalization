{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select 

    (_airbyte_data ->> 'id') as invoice_number,
    (_airbyte_data ->> 'currency_code') as currency,
    (payments ->> 'txn_amount') as value,
    (payments ->> 'txn_date') as date,
    (payments ->> 'txn_id') as charge_number

from {{ source('airmeet_chargebee', '_airbyte_raw_invoice') }},
jsonb_array_elements(_airbyte_data -> 'linked_payments') payments

-- payments