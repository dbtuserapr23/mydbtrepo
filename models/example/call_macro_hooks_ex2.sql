{{ config(materialized='table',
          alias="EMP_UNIQ",
          pre_hook="{{audit_macro('call_macro_hook','started')}}",
          post_hook="{{audit_macro('call_macro_hook','completed')}}"
   )
}}

select *
from raw_data.emp_stg
qualify row_number() over (partition by empid order by inserted_at desc) = 1