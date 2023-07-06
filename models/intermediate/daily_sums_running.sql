-- models/daily_sums_running.sql
with
    activities as (select * from {{ ref("stg_strava__activities") }}),
    running_sums as (
        select
            date(activities.start_date_local) as start_date_local,
            sum(activities.distance_kms) as running_distance_kms
        from activities
        where activities.type = 'Run'
        group by date(activities.start_date_local)
    )
select *
from running_sums
order by start_date_local desc
