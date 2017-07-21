select station_id,
       date,
       to_char(date, 'MMDD') as month_day,
       extract("year" from date) as year,
       extract("month" from date) as month,
       extract("day" from date) as day,
       high,
       round(avg(high) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as avg_high,
       round(avg(high) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999') order by date asc rows between 10 preceding and 0 following)) as recent_avg_high, 
       round(min(high) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as min_high,
       round(max(high) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as max_high,
       round(avg(low) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as avg_low,
       round(avg(low) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999') order by date asc rows between 10 preceding and 0 following)) as recent_avg_low, 
       round(min(low) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as min_low,
       round(max(low) over (partition by to_char(date, 'MMDD') || to_char(station_id, '999'))) as max_low,
       low,
       high - low as swing,
       precipitation,
       snow
      from days
      where low <> -9999 and high <> -9999
       


