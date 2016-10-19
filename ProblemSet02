Problem 3: Find the titles of movies that include a character called "Batman", that do not include the word "Batman" in their title:

select title from movies m
inner join cast c
on m.mid=c.mid
where c.role like "%Batman%"
And m.title not like "%Batman%";


Problem 4: Find the names of actors that played characters called "Batman" and "Catwoman" in the same Movie:

select x.name Batman, y.name Catwoman from
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where c.role like "%Batman%") x
inner join
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where c.role like "%Catwoman%") y
on x.mid=y.mid;


Problem 5: Find all the actors that have played the role "Batman" in a movie more than once:

select name from actors a
inner join cast c
on a.aid=c.aid
where c.role like "%Batman%"
group by a.aid
having count(*)>1;



Problem 6: Find all the actors that have reprised a role in more than one "Batman" movie:

select a.name from actors a
inner join cast c
on a.aid=c.aid
inner join movies m
on c.mid=m.mid
where m.mid in
(select m.mid from movies m
where m.title like '%Batman%')
group by c.aid
having count(c.role)>1;


Problem 7: What actor appeared in the most movies grossing over $10 millon dollars?:

select a.name from actors a
inner join cast c
on a.aid=c.aid
inner join movies m
on m.mid=c.mid
where m.revenue>10000000
group by a.aid
having count(m.mid) =(select max(y.num)
from ( select count(m.mid) num
from actors a
inner join cast c
on a.aid=c.aid
inner join movies m
on m.mid=c.mid
where m.revenue>10000000
group by a.aid) y);


Problem 8: How many movies were released in each year? (Hint: SELECT DISTINCT strftime('%Y',release) FROM Movies)

select count(m.mid) number, strftime('%Y', release) year 
from movies m
group by strftime('%Y', release); 


Problem 9: What actor-actress pair appear in the most Movies together?

select x.name Actor, y.name Actress, count(x.mid) number from
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where a.gender='M') x
inner join
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where a.gender='F') y
on x.mid=y.mid
group by Actor, Actress
having number= (select max(z.number) from
(select count(x.mid) number from
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where a.gender='M') x
inner join
(select a.name,c.mid from actors a
inner join cast c 
on a.aid=c.aid
where a.gender='F') y
on x.mid=y.mid
group by x.name,y.name) z);


Problem 10: What movie title is the most repeated?

select m.title from movies m
group by m.title
having count(m.mid) =
(select max(y.num) from 
(select count(m.mid) num
from movies m
group by m.title) y);


Problem 11: What role is the most common across all movies?

select c.role, count(c.mid) from Cast c
group by c.mid
having count(c.mid)=(select max(y.num)
from (select count(c.mid) num from Cast c group by c.mid) y);



Problem 12: What actor's movie career has spanned the longest number of years?

select a.name
from movies m
inner join cast c 
on m.mid=c.mid
inner join actors a
on a.aid=c.aid
group by c.aid
having (max(m.release)-min(m.release))=(select max(y.num) from
(select  max(m.release)-min(m.release) num
from movies m
inner join cast c 
on m.mid=c.mid
inner join actors a
on a.aid=c.aid
group by c.aid) y);


