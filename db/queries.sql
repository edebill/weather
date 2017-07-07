select date,
       high,
       max(high) over (partition by extract(doy from date)),
       round(avg(high) over (partition by extract(doy from date))) as avg
  from days
  where date > current_date - interval '40 years' and
        date < current_date - interval '20 years'
  order by date
  desc limit 21;


  to_char(date, 'MMDD')
