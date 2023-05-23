
select prod_name, sum(quantity*unit_price) as revenue  from 
{{source('RAW_DATA','products_stg')}} P inner join   {{source('RAW_DATA','sales_stg')}} S
on (P.prod_id=S.prod_id)
group by prod_name