{{ config(materialized='table',
          alias="EMP_NO_DUPS",
          pre_hook=["USE WAREHOUSE {{env_var('DBT_SNOWFLAKE_WH')}}",
            "insert into curated_data.audit_tbl select 'unique records model','started',current_timestamp :: timestamp_ntz"],
          post_hook=["insert into curated_data.audit_tbl select 'unique records model','completed',current_timestamp :: timestamp_ntz",
                     "GRANT SELECT ON TABLE CURATED_DATA.EMP_NO_DUPS TO ROLE ROLE_REPORTING"]
   )
}}

select *
from raw_data.emp_stg
qualify row_number() over (partition by empid order by inserted_at desc) = 1