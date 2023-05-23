version: 2

sources:
  - name: RAW_DATA # this is the source_name
    database: DEV
    schema: RAW_DATA
    tables:
      - name: dept
        columns:
          - name: contact_email
            tests:
              - validate_email  
      - name: emp # this is the table_name
        columns:
          - name: job
            tests:
              - accepted_values:
                 values: ['CLERK','SALESMAN','MANAGER','ANALYST','PRESIDENT']
          - name: deptno                 
            tests:
             - relationships:
                 to: RAW_DATA.DEPT
                 field: deptno                         
      - name: products_stg # this is the table_name
        freshness: null      
      - name: sales_stg
        freshness: null      
      - name: emp_stg
        freshness: # make this a little more strict
          warn_after: {count: 2, period: hour}
          error_after: {count: 3, period: day}
          filter: inserted_at >= '2023-01-01 00:00:00'
        loaded_at_field: inserted_at      
  - name: PUBLIC # this is the source_name
    database: DEV
    schema: PUBLIC
    tables:
      - name: T1 # this is the table_name
        freshness: null 
      - name: T2 # this is the table_name
        freshness: null 
                           
