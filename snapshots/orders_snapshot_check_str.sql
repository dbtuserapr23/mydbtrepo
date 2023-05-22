{% snapshot products_snapshot %}

{{
    config(
      target_database='DEV',
      target_schema='CURATED_DATA',
      unique_key='PROD_id',
      strategy='check',
      check_cols=['PROD_NAME','UNIT_PRICE'],
      invalidate_hard_deletes=True
    )
}}

select * from DEV.CURATED_DATA.PRODUCTS

{% endsnapshot %}