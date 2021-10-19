{{ config( tags=["top-level-intermediate"]) }}
-- SQL model to parse JSON blob stored in a single column and extract into separated field columns as described by the JSON Schema
select
    (_airbyte_data ->> 'id') as subscription_id,
    (_airbyte_data ->> 'status') as status,
    (_airbyte_data ->> 'mrr') as mrr,
    (_airbyte_data ->> 'channel') as channel,
    (_airbyte_data ->> 'deleted') as deleted,
    (_airbyte_data ->> 'plan_id') as plan_id,
    (_airbyte_data ->> 'created_at') as created_at,
    (_airbyte_data ->> 'updated_at') as updated_at,
    (_airbyte_data ->> 'started_at') as started_at,
    (_airbyte_data ->> 'activated_at') as activated_at,
    (_airbyte_data ->> 'cancelled_at') as cancelled_at,
    (_airbyte_data ->> 'customer_id') as customer_id,
    (_airbyte_data ->> 'plan_amount') as plan_amount,
    (_airbyte_data ->> 'plan_quantity') as plan_quantity,
    (_airbyte_data ->> 'billing_period') as billing_period,
    (_airbyte_data ->> 'plan_unit_price') as plan_unit_price,
    (_airbyte_data ->> 'current_term_start') as current_term_start,
    (_airbyte_data ->> 'current_term_end') as current_term_end,
    (_airbyte_data ->> 'shipping_address') as shipping_address,
    (_airbyte_data ->> 'due_invoices_count') as due_invoices_count,
    (_airbyte_data ->> 'billing_period_unit') as billing_period_unit,
    (_airbyte_data ->> 'event_based_addons') as event_based_addons,
    (_airbyte_data ->> 'charged_event_based_addons') as charged_event_based_addons
from {{ source('airmeet_chargebee', '_airbyte_raw_subscription') }}
-- subscriptions