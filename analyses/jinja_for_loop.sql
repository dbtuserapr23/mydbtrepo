{{ config(materialized='table',
alias='payament_method_aggregation')}}

{% set pmlist=["credit_card/debit_card", "UPI", "Net Banking","Mobile Wallet"] %}

select
order_id,
{% for payment_method in pmlist %}
sum(case when payment_method = '{{payment_method}}' then amount end) as "{{payment_method}}_amount"
{% if not loop.last %},{% endif %}
{% endfor %}
from raw_data.payments
group by 1
