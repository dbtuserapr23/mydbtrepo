
{{ config(materialized='table',
          pre_hook=["{{remove_dups('PRODUCTS_STG','PRODUCTS', 'PROD_ID')}}",
          "{{remove_dups('SALES_STG','SALES', 'TXN_ID')}}"]
          )
}}
select prod_name, sum(quantity*unit_price) as revenue  from CURATED_DATA.PRODUCTS P inner join CURATED_DATA.SALES S
on (P.prod_id=S.prod_id)
group by prod_name
