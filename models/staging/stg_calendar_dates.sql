-- models/calendar_dates.sql
with
    calendar_dates as (
        select date(date_sub(current_date(), interval offset day)) as dates
        from unnest(generate_array(0, 60)) as
        offset
    )
select dates
from calendar_dates

