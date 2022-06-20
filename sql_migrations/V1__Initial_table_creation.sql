--User Statuses
CREATE TABLE public.user_statuses (
	id int NOT NULL,
	CONSTRAINT user_statuses_pkey PRIMARY KEY (id),
	"name" varchar(30) NOT NULL
);
INSERT INTO public.user_statuses
(id, "name")
VALUES(1, 'Active'),(2, 'Paused'),(3, 'Deleted');

--Users
CREATE TABLE IF NOT EXISTS public.users (
	id bigserial NOT NULL,
	CONSTRAINT users_pkey PRIMARY KEY (id),
	"name" varchar(50) NOT NULL,
	age int4 NOT NULL,
	last_long float8 NULL,
	last_lat float8 NULL,
	status_id int4 NOT NULL,
    FOREIGN KEY (status_id) REFERENCES user_statuses(id)
);

--User Relationship Types
CREATE TABLE public.user_relationship_types (
	id bigserial NOT NULL,
	CONSTRAINT user_relationship_types_pkey PRIMARY KEY (id),
	"name" varchar(30) NOT NULL
);
INSERT INTO public.user_relationship_types
(id, "name")
VALUES(1, 'Like'), (2, 'Skip'), (3, 'Match');

--User Relationships
CREATE TABLE public.user_relationships (
	user_a_id int NOT NULL,
    FOREIGN KEY (user_a_id) REFERENCES users(id),
	user_relationship_type_id int NOT NULL,
    FOREIGN KEY (user_relationship_type_id) REFERENCES user_relationship_types(id),
    user_b_id int NOT NULL,
    FOREIGN KEY (user_b_id) REFERENCES users(id),
    CONSTRAINT user_relationships_pkey PRIMARY KEY (user_a_id, user_b_id)
);