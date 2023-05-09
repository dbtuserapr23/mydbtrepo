
select prod_name, sum(quantity*unit_price) as revenue  from RAW_DATA.PRODUCTS_STG P inner join RAW_DATA.SALES_STG S
on (P.prod_id=S.prod_id)
group by prod_name