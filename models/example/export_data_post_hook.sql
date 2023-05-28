{{ config(materialized='table',
post_hook=["COPY INTO 's3://snowflake76541/raw_data/dbt_export/'
FROM {{this}}
CREDENTIALS=(AWS_KEY_ID = 'AKIAT47ARMT3HCNISSUL' 
AWS_SECRET_KEY = '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')
FILE_FORMAT=(TYPE=CSV COMPRESSION=NONE) OVERWRITE=TRUE"]
   )
}}

select *
from raw_data.emp_stg
qualify row_number() over (partition by empid order by inserted_at desc) = 1