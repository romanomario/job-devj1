CREATE TABLE actors (
  id varchar(190) NOT NULL,
  image mediumtext NOT NULL,
  name varchar(255) NOT NULL,
  creation_time int(15) NOT NULL,
  modification_time int(15) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE genres (
  id varchar(190) NOT NULL,
  value varchar(190) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE movies (
  id varchar(190) NOT NULL,
  rank int(4) NOT NULL,
  title varchar(255) NOT NULL,
  year int(4) NOT NULL,
  release_date date NULL,
  duration varchar(255) NULL,
  image mediumtext NOT NULL,
  plot text NOT NULL,
  rating int(2) DEFAULT NULL,
  wikipedia_url varchar(255) NULL,
  creation_time int(15) NOT NULL,
  modification_time int(15) NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB;

CREATE TABLE movies_actors (
  movie_id varchar(190) NOT NULL,
  actor_id varchar(190) NOT NULL,
  as_character varchar(255) NOT NULL,
  star enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB;

CREATE TABLE movies_genres (
  movie_id varchar(190) NOT NULL,
  genre_id varchar(190) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE movies_keywords (
  movie_id varchar(190) NOT NULL,
  keyword varchar(190) NOT NULL
) ENGINE=InnoDB;

ALTER TABLE movies_actors
  ADD CONSTRAINT actors_fk FOREIGN KEY (actor_id) REFERENCES actors (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT movies_fk FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE movies_genres
  ADD CONSTRAINT genres_fk FOREIGN KEY (genre_id) REFERENCES genres (id) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT movies_id FOREIGN KEY (movie_id) REFERENCES movies (id) ON DELETE CASCADE ON UPDATE CASCADE;
