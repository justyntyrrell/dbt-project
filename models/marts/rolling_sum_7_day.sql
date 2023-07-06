-- models/rolling_sum_7_days.sql
with
    daily_sums_running as (select * from {{ ref("daily_sums_running") }}),
    calendar_dates as (select * from {{ ref("stg_calendar_dates") }}),
    
    all_days as (
        select
            calendar_dates.dates,
            case
                when daily_sums_running.running_distance_kms is null
                then 0
                else daily_sums_running.running_distance_kms
            end as running_distance_kms
        from calendar_dates
        left join
            daily_sums_running
            on calendar_dates.dates = date(daily_sums_running.start_date_local)
    )
select
    all_days.dates,
    all_days.running_distance_kms,
    sum(all_days.running_distance_kms) over (
        order by dates rows between 6 preceding and current row
    ) as rolling_sum
from all_days
order by dates desc
