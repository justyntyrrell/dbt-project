# Strava Data Pipeline with dbt

This project provides a data pipeline solution for processing and analyzing Strava data using dbt (data build tool). It consists of SQL models organized into staging, intermediate, and mart folders, allowing for modularity and ease of maintenance. The pipeline includes small conversions, renaming, and advanced metric calculations to enhance the analysis of Strava data.

## Table of Contents
- [Introduction](#introduction)
- [Project Structure](#project-structure)
- [Data Visualization](#data-visualization)
- [Strava Profile](#strava-profile)

## Introduction

Strava is a popular platform used by athletes and fitness enthusiasts to track their activities, including running, cycling, and swimming. This project aims to facilitate the processing and analysis of Strava data by providing a robust data pipeline using dbt.

The pipeline consists of several SQL models that transform raw Strava data into meaningful insights. It addresses the need for small conversions, renaming of data fields, and advanced metric calculations. The pipeline includes staging models for initial data ingestion and renaming, intermediate models for additional transformations, and mart models for calculating advanced metrics.

## Project Structure

The project structure is organized as follows:

```
├── dbt_project.yml
├── models
│   ├── staging
│   │   ├── stg_strava__activities.sql
│   │   ├── stg_calendar_dates.sql
│   ├── intermediate
│   │   ├── daily_sums_running.sql
│   ├── marts
│   │   ├── rolling_sum_7_days.sql
```

- `dbt_project.yml`: The project configuration file for dbt.
- `models`: The main directory containing all the SQL models.
  - `staging`: Contains models responsible for initial data ingestion and renaming.
    - `stg_strava__activities.sql`: Ingests data from the `airbyte_raw_strava` source and performs small conversions and renaming on fields such as distance and moving time.
    - `stg_calendar_dates.sql`: Generates a calendar table with dates for analysis.
  - `intermediate`: Contains models for additional transformations.
    - `daily_sums_running.sql`: Calculates the daily sums of running distance in kilometers based on the activities from the staging model.
  - `marts`: Contains models for calculating advanced metrics and building data marts.
    - `rolling_sum_7_days.sql`: Calculates the rolling sum of running distance over a 7-day period using the daily sums from the intermediate model.

## Data Visualization

The resulting data from the pipeline can be visualized and explored using Looker Studio. Access the [Looker Studio Strava Dashboard](https://lookerstudio.google.com/reporting/70012388-cb65-4c41-9468-c3acfe25e9dc/page/p_fq2qro0q7c?s=s4HhdJ5mqBQ) to view interactive visualizations and gain insights into your Strava data.

## Strava Profile

Check out my [Strava profile](https://www.strava.com/athletes/22060093) to see my athletic activities and achievements.
