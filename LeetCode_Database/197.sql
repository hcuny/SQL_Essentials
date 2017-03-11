select w1.Id from Weather w1
inner join Weather new_w
on to_days(w1.Date)=to_days(new_w.Date)+1
where w1.Temperature>new_w.Temperature
