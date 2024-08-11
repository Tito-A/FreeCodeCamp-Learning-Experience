--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying NOT NULL,
    diameter integer,
    planet_id integer
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_types text,
    description text,
    age_in_millions numeric,
    num_of_stars_in_billions integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    diameter_in_km numeric,
    distance_from_planet_in_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    star_id integer,
    planet_type text,
    has_life boolean,
    has_rings boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    age_in_millions numeric,
    temperature_in_celsius integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.stars_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stars_star_id_seq OWNER TO freecodecamp;

--
-- Name: stars_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.stars_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.stars_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 940, 16);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 525, 16);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 512, 17);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andomeda', 'spiral', 'The Andromeda Galaxy is the closest spiral galaxy to the Milky Way and is on a collision course with our galaxy. It is a large, bright galaxy with a well-defined spiral structure.', 10000, 1000000);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Spiral', 'The Milky Way is the galaxy that contains our Solar System. It is a barred spiral galaxy with a central bar structure and a prominent spiral arm structure.', 13800, 300);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'spiral', 'The Triangulum Galaxy is a smaller spiral galaxy and is one of the closest galaxies to the Milky Way. It features a clear spiral structure and is visible in the constellation Triangulum.', 8000, 40);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 'The Whirlpool Galaxy is a classic spiral galaxy known for its well-defined spiral arms and an active region of star formation. It is located in the constellation Canes Venatici.', 10000, 100);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'spiral', 'The Sombrero Galaxy, also known as M104, is named for its appearance, which resembles a sombrero hat. It features a bright central bulge and a relatively large halo of stars.', 12000, 800);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 'Elliptical', 'M87 is a massive elliptical galaxy located in the Virgo Cluster. It is known for its large central supermassive black hole and extensive halo of globular clusters.', 12000, 1000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 3474, 384400);
INSERT INTO public.moon VALUES (2, 'Phobos', 16, 22.4, 9377);
INSERT INTO public.moon VALUES (3, 'Ganymede', 17, 5268, 1070000);
INSERT INTO public.moon VALUES (4, 'Titan', 18, 5151.8, 1222000);
INSERT INTO public.moon VALUES (5, 'Titania', 19, 1578.8, 436300);
INSERT INTO public.moon VALUES (6, 'Triton', 20, 2710, 354800);
INSERT INTO public.moon VALUES (7, 'Andomeda A b I', 1, 1200, 450000);
INSERT INTO public.moon VALUES (8, 'Andomeda B c I', 2, 900, 600000);
INSERT INTO public.moon VALUES (9, 'Proxima Centauri B I', 4, 1000, 300000);
INSERT INTO public.moon VALUES (10, 'Triangulum X d', 5, 800, 500000);
INSERT INTO public.moon VALUES (11, 'Triangulum Y e I', 6, 950, 550000);
INSERT INTO public.moon VALUES (12, 'whirlpool Alpha f I', 7, 1100, 600000);
INSERT INTO public.moon VALUES (13, 'whirlpool Beta g I', 8, 1050, 650000);
INSERT INTO public.moon VALUES (14, 'Sombrero 1 h I', 9, 1000, 550000);
INSERT INTO public.moon VALUES (15, 'Sombrero 2 i I', 10, 900, 600000);
INSERT INTO public.moon VALUES (16, 'M87 Alpha j I', 12, 1200, 650000);
INSERT INTO public.moon VALUES (17, 'M87 Beta K I', 13, 950, 550000);
INSERT INTO public.moon VALUES (18, 'Europa', 17, 3121, 670900);
INSERT INTO public.moon VALUES (19, 'Io', 17, 3643, 421700);
INSERT INTO public.moon VALUES (20, 'Rhea', 18, 1527.6, 527600);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Andromeda A b', 1, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (2, 'Andomeda B c', 2, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (3, 'Earth', 3, 'terrestrial', true, false);
INSERT INTO public.planet VALUES (4, 'Proxima Centauri b', 4, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (5, 'Triangulum X d', 5, 'Super-Earth', false, false);
INSERT INTO public.planet VALUES (6, 'Triangulum Y e', 6, 'Ice Giant', false, false);
INSERT INTO public.planet VALUES (7, 'Whirlpool Alpha f', 7, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (8, 'Whirlpool Beta g', 8, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (9, 'Sombrero 1 h', 9, 'terrestrial', false, false);
INSERT INTO public.planet VALUES (10, 'Sombrero 2 i', 10, 'Ice Giant', false, false);
INSERT INTO public.planet VALUES (12, 'M87 Alpha j', 11, 'Gas Giant', false, false);
INSERT INTO public.planet VALUES (13, 'M87 Beta k', 12, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (14, 'Mercury', 3, 'terrestrial', false, false);
INSERT INTO public.planet VALUES (15, 'Venus', 3, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (16, 'Mars', 3, 'Terrestrial', false, false);
INSERT INTO public.planet VALUES (17, 'Jupiter', 3, 'Gas Giant', false, true);
INSERT INTO public.planet VALUES (18, 'Saturn', 3, 'Gas Giant', false, true);
INSERT INTO public.planet VALUES (19, 'Uranus', 3, 'Ice Giant', false, true);
INSERT INTO public.planet VALUES (20, 'Neptune', 3, 'Ice Giant', false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Andromeda A', 1, 5000, 6000);
INSERT INTO public.star VALUES (2, 'Andomeda B', 1, 8000, 5000);
INSERT INTO public.star VALUES (3, 'Sol', 2, 4600, 5778);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 4500, 3050);
INSERT INTO public.star VALUES (5, 'Triangulum X', 3, 4000, 6500);
INSERT INTO public.star VALUES (6, 'Triangulum Y', 3, 6000, 5700);
INSERT INTO public.star VALUES (7, 'Whirlpool Alpha', 4, 9000, 4800);
INSERT INTO public.star VALUES (8, 'Whirlpool Beta', 4, 9000, 4800);
INSERT INTO public.star VALUES (9, 'Sombrero 1', 5, 6000, 6200);
INSERT INTO public.star VALUES (10, 'Sombrero 2', 5, 8000, 5300);
INSERT INTO public.star VALUES (11, 'M87 Alpha', 6, 10000, 4900);
INSERT INTO public.star VALUES (12, 'M87 Beta', 6, 12000, 4600);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: stars_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.stars_star_id_seq', 12, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star stars_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT stars_pkey PRIMARY KEY (star_id);


--
-- Name: asteroid unique_asteroid; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid UNIQUE (name);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (name);


--
-- Name: galaxy unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (name);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (name);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

