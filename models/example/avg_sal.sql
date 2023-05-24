{{ config(materialized='table') }}

select deptno,avg(sal) as avg_sal from RAW_DATA.emp group by 1
