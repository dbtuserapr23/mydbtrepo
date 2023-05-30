

select current_role() as role ,convert_timezone('{{var('my_tz')}}',current_timestamp) :: timestamp as run_ts