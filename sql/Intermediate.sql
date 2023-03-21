## Common

```sql
select count(*) from Movies
select sum(cost) from Movies
select avg(tickets) from Movies
select max(tickets) from Movies
select min(tickets) from Movies
select max(tickets), min(tickets) from Movies
```

## With Clauses

```sql
select genre, sum(cost) from Movies group by genre;
select genre, sum(cost) from Movies group by genre having count(*) > 1;
select country, sum(salary) from Actors where role = 'supporting' group by country having count(*) > 1;
```

---

# Constraints

## Identifying Constraints

```sql
create table Promotions(
	id int PRIMARY KEY, 
	name varchar(50) NOT NULL UNIQUE**,**
	category varchar(15),
	-- CONSTRAINT unique_name UNIQUE(name)
	-- CONSTRAINT unique_name_category UNIQUE(name, category)
);
```

## Value Constraints

```sql
create table Promotions(
	id int PRIMARY KEY, 
	movie_id int REFERENCES movies,
	name varchar(50) NOT NULL UNIQUE**,**
	category varchar(15)
	-- FOREIGN KEY (movie_id) REFERENCES movies
);
```

```sql
create table Movies(
	id int PRIMARY KEY, 
	title varchar(20) NOT NULL UNIQUE**,**
	genre varchar(100),
	****duration int CHECK(duration > 0)
);

CREATE TABLE Actors (
  id int PRIMARY KEY,
  name varchar(50) NOT NULL UNIQUE,
  salary integer check(salary >= 500),
  bonus integer check(bonus < salary),
  country_id int REFERENCES Countries(id)
);
```

---

# Normalization & Relationships

---

# Joins & Aliases

## Inner Joins

```sql
SELECT movies.title, rooms.id, rooms.seats 
FROM Movies 
inner join rooms 
on movies.id = rooms.movie_id
where rooms.seats > 75
order by rooms.seats desc;

SELECT actors.name, movies.title FROM Actors
inner join actors_movies
on actors.id = actors_movies.actor_id
inner join movies
on actors_movies.movie_id = movies.id
order by movie.title;
```

## Aliases

```sql
select movies.title films, reviews.review reviews
from movies
inner join reviews
on movies.id=revies.movie_id;

select movies.title "weekly movies"
from movies
inner join reviews
on movies.id=revies.movie_id;

select m.title, g.name
from movies
inner join movies_genres mg
on m.id = mg.movie_id
inner join genres
on mg.genre_id = g.id
where m.title = 'Peter Pan';
```

## Outer Joins

```sql
select *
from movies
left outer join reviews
on movies.id = reviews.movie_id

select *
from movies
right outer join reviews
on movies.id = reviews.movie_id
```

---

# Subqueries

```sql
select sum(sales)
from movies
where id in
	(selec movie_id
	from promotions
	where category = 'Non-Cash');

select sum(m.sales)
from movies m
inner join promotions p
on m.id = p.movie_id
where p.category = 'Non-cash';

select movie.title from movies where duration > (select avg(duration) from movies);
```

---