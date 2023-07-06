-- stg_strava__activities.sql

with

source as (

    select * from {{ source('airbyte_raw_strava', 'activities') }}

),

renamed as (

    select

        -- numerics
        distance as distance_meters,
        round(distance / 1000, 2) as distance_kms,
        
        -- convert types
        format_timestamp('%T', timestamp_seconds(moving_time)) AS moving_time_hhmmss,
        moving_time as moving_time_seconds,

        * EXCEPT (distance, moving_time)

    from source

)

select * from renamed