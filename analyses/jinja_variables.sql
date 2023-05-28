{{ config(materialized='table',alias='payament_method_aggr')}}

{% set v_payment_methods = ["credit_card/debit_card", "UPI", "Net Banking","Mobile Wallet"] %}

select
order_id,
{% for payment_method in v_payment_methods %}
sum(case when payment_method = '{{payment_method}}' then amount end) as "{{payment_method}}_amount",
{% endfor %}
sum(amount) as total_amount
from raw_data.payments
group by 1