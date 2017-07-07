select date,
       to_char(date, 'MMDD') as month_day,
       high,
       round(avg(high) over (partition by to_char(date, 'MMDD'))) as avg_high,
       round(min(high) over (partition by to_char(date, 'MMDD'))) as min_high,
       round(max(high) over (partition by to_char(date, 'MMDD'))) as max_high,
       round(avg(low) over (partition by to_char(date, 'MMDD'))) as avg_low,
       round(min(low) over (partition by to_char(date, 'MMDD'))) as min_low,
       round(max(low) over (partition by to_char(date, 'MMDD'))) as max_low,
       low,
       precipitation,
       snow
      from days
       


