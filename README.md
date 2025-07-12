# Urban Air Pollution in Lagos – SQL Project
This project looks at simulated air quality data from a few urban areas in Lagos, Nigeria. I used SQLite to clean the data and ran my analysis in Jupyter Notebook using ipython-sql. It’s part of my process of learning SQL while building a portfolio around environmental data. 

## Project Overview
**Goal**: Clean and analyze air quality data to explore pollution trends in Lagos.
**Tools Used:**
* SQLite (for data cleaning)
* Jupyter Notebook + `ipython-sql` (for analysis)

## Dataset Description
The dataset includes 60+ records collected over 10 days from 6 Lagos locations.

| Column              | Description                                                                |
| ------------------- | -------------------------------------------------------------------------- |
| `Date`              | Day of measurement                                                         |
| `Location`          | Lagos area (e.g., Ikeja, Lekki)                                            |
| `PM2.5 (µg/m³)`     | Fine particulate matter — a harmful pollutant linked to respiratory issues |
| `CO (ppm)`          | Carbon monoxide — a gas from cars, generators, etc.                        |
| `Temperature (°C)`  | Affects how pollutants behave in the air                                   |
| `Wind Speed (km/h)` | Influences how pollution spreads or stagnates                              |

This data is fictional but modeled on realistic environmental behavior.

## Data Cleaning (SQLite)
See: `cleaning_script.sql`

Key steps:
* Fixed inconsistent casing in `Location`
* Handled missing `CO` values
* Removed duplicate rows
* Confirmed expected ranges for pollutants and weather.

Output file: `cleaned_air_pollution_lagos.csv`

## Data Analysis (Jupyter + ipython-sql)
Questions explored:
* Which location had the highest average PM2.5?
* Which locations consistently stay below the WHO PM2.5 limit (15 µg/m³)?
* What’s the average CO level across all locations?
* Do higher temperatures correlate with higher PM2.5 levels?
* Rank all locations by average pollution level
* which locations have the worst overall pollution?

See: `analysis.ipynb`

## Only SQL concepts used:
* SELECT, WHERE, GROUP BY
* CASE statements
* CTEs (Common Table Expressions)
* Temp tables
