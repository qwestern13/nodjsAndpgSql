CREATE TABLE person
(
	person_id integer PRIMARY KEY,
	first_name varchar(128) NOT NULL,
	last_name varchar (128) NOT NULL
)

CREATE TABLE genre 
(
	genre_id integer PRIMARY KEY,
	genre_name varchar(128) NOT NULL
)

CREATE TABLE country
(
	country_id integer PRIMARY KEY,
	country_name varchar(128) NOT NULL
)

CREATE TABLE film
(
	film_id integer PRIMARY KEY,
	film_name varchar(128) NOT NULL,
	release_year integer NOT NULL,
	country_id integer REFERENCES country(country_id),
	slogan text,
	director_id integer REFERENCES person(person_id),
	screenwriter_id integer REFERENCES person(person_id),
	producer_id integer REFERENCES person(person_id),
	composer_id integer REFERENCES person(person_id),
	designer_id integer REFERENCES person(person_id),
	filmeditor_id integer REFERENCES person(person_id),
	budget integer NOT NULL,
	marketing integer NOT NULL,
	boxoffice_usa integer NOT NULL,
	boxoffice_world integer NOT NULL,
	premiere_rus date NOT NULL,
	premiere_world date NOT NULL,
	age_limit integer NOT NULL,
	rating_mpaa varchar(8) NOT NULL,
	timing integer NOT NULL,
	oscars integer 
)

CREATE TABLE movieactors
(
	film_id integer REFERENCES film(film_id),
	person_id integer REFERENCES person(person_id),
	
	CONSTRAINT movieactors_pkey PRIMARY KEY (film_id, person_id)
)

CREATE TABLE audience
(
	film_id integer REFERENCES film(film_id),
	country_id integer REFERENCES country(country_id),
	viewers integer NOT NULL,
	
	CONSTRAINT audience_pkey PRIMARY KEY (film_id, country_id, viewers)
)

CREATE TABLE filmgenre
(
	film_id integer REFERENCES film(film_id),
	genre_id integer REFERENCES genre(genre_id),
	
	CONSTRAINT filmgenre_pkey PRIMARY KEY (film_id, genre_id)
)