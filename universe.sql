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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    galaxy_type character varying(30) NOT NULL
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
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    planet_type character varying(30) NOT NULL,
    distance_from_earth numeric(10,2),
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_on_star_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_on_star_system (
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    planet_on_star_system_id integer NOT NULL,
    name character varying(30),
    description text
);


ALTER TABLE public.planet_on_star_system OWNER TO freecodecamp;

--
-- Name: planet_on_star_system_planet_on_star_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_on_star_system_planet_on_star_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_on_star_system_planet_on_star_system_id_seq OWNER TO freecodecamp;

--
-- Name: planet_on_star_system_planet_on_star_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_on_star_system_planet_on_star_system_id_seq OWNED BY public.planet_on_star_system.planet_on_star_system_id;


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
    name character varying(30) NOT NULL,
    description character varying(30) NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(10,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


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
-- Name: planet_on_star_system planet_on_star_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_on_star_system ALTER COLUMN planet_on_star_system_id SET DEFAULT nextval('public.planet_on_star_system_planet_on_star_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth', true, true, 1361, 'SBdc');
INSERT INTO public.galaxy VALUES (2, 'Ursa Major III', 'Satellite of the Milky Way', false, false, 1340, 'unknown');
INSERT INTO public.galaxy VALUES (3, 'Tucana III', ' tidally disrupted', false, false, 1110, 'unknown');
INSERT INTO public.galaxy VALUES (4, 'Segue I', 'Satellite of the Milky Way', false, true, 15000000, 'dSph');
INSERT INTO public.galaxy VALUES (6, 'Saquitarius Dwarf I', 'Accre Milky Way', false, true, 1500000, 'dSph/E7');
INSERT INTO public.galaxy VALUES (5, 'Patricius II', 'Accre Milky Way', false, true, 1500000, 'dSph/E7');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The moon', 'Our moon', false, true, 4530, 384400.00, 1, 4);
INSERT INTO public.moon VALUES (2, 'Io', 'Galilean satellite', false, true, 4500, 897430.00, 1, 2);
INSERT INTO public.moon VALUES (3, 'Fobos', 'Satellite of fear', false, true, 4000, 7513460.00, 1, 3);
INSERT INTO public.moon VALUES (4, 'Deimos', 'Satellite of terror', false, true, 4000, 7517460.00, 1, 3);
INSERT INTO public.moon VALUES (5, 'Titan', 'Thanos home', false, true, 2000, 1221000.00, 1, 1);
INSERT INTO public.moon VALUES (6, 'Ganimedes', 'The biggest moon', false, true, 3500, 1454000.00, 1, 2);
INSERT INTO public.moon VALUES (7, 'Triton', 'Fish name moon', false, true, 9100, 8784000.00, 1, 8);
INSERT INTO public.moon VALUES (8, 'Caronte', 'The boatman satellite', false, true, 3200, 9914000.00, 1, 12);
INSERT INTO public.moon VALUES (9, 'Nix', 'Weird rock', false, true, 3200, 9917000.00, 1, 12);
INSERT INTO public.moon VALUES (10, 'Hydra', 'Snake head moon', false, true, 3200, 9917070.00, 1, 12);
INSERT INTO public.moon VALUES (11, 'Kerberos', 'Three dog head moon', false, true, 3200, 9997070.00, 1, 12);
INSERT INTO public.moon VALUES (12, 'Styx', 'Pharaoh moon', false, true, 3200, 9997010.00, 1, 12);
INSERT INTO public.moon VALUES (13, 'Europe', 'Galilean satellite', false, true, 4500, 8874500.00, 1, 2);
INSERT INTO public.moon VALUES (14, 'Callisto', 'Galilean satellite', false, true, 4500, 8734500.00, 1, 2);
INSERT INTO public.moon VALUES (15, 'Himalia', 'Himalian group', false, true, 4500, 8788300.00, 1, 2);
INSERT INTO public.moon VALUES (16, 'Leda', 'Himalian group', false, true, 4500, 8788300.00, 1, 2);
INSERT INTO public.moon VALUES (17, 'Lisitea', 'Himalian group', false, true, 4500, 8781200.00, 1, 2);
INSERT INTO public.moon VALUES (18, 'Elara', 'Himalian group', false, true, 4500, 8781360.00, 1, 2);
INSERT INTO public.moon VALUES (19, 'Dia', 'Himalian group', false, true, 4500, 8781540.00, 1, 2);
INSERT INTO public.moon VALUES (20, 'Euante', 'Ananke group', false, true, 4500, 8781234.00, 1, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Saturn', 'The planet with many moons', false, true, 4503, 'Gaseous planet', 1426000.00, 1, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 'Biggest of the solar system', false, true, 4603, 'Cloud planet', 5900000.00, 1, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 'The red planet', false, true, 4603, 'Teluric planet', 5460000.00, 1, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 'Our home', true, true, 4543, 'Blue marble planet', 0.00, 1, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 'The brightest planet', false, true, 4503, 'White marble planet', 6100000.00, 1, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 'Closest to the sun', false, true, 4503, 'Rock planet', 7700000.00, 1, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Joke name planet', false, true, 4503, 'Gaseous planet', 2723000.00, 1, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Uranus twin', false, true, 4503, 'Frost Giant planet', 4345400.00, 1, 1);
INSERT INTO public.planet VALUES (9, 'Alfa centauri Bb', 'Exoplanet of Toliman', false, true, 1000, 'Exoplanet', 4130000.00, 1, 3);
INSERT INTO public.planet VALUES (10, 'Lalande21185b', 'First of its system', false, true, 1000, 'unknown', 9700000.00, 1, 6);
INSERT INTO public.planet VALUES (11, 'Lalande21185c', 'Second of its system', false, true, 1000, 'unknown', 9740000.00, 1, 6);
INSERT INTO public.planet VALUES (12, 'Pluto', 'Dwarf planet', false, true, 4503, 'Former planet', 600000.00, 1, 1);


--
-- Data for Name: planet_on_star_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_on_star_system VALUES (1, 1, 1, NULL, NULL);
INSERT INTO public.planet_on_star_system VALUES (1, 2, 2, NULL, NULL);
INSERT INTO public.planet_on_star_system VALUES (1, 3, 3, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Earth goes around it', false, true, 4600, 150000.00, 1);
INSERT INTO public.star VALUES (2, 'ALFA CENTAURI A', 'Closest star system to the Sun', false, true, 5600, 750000.00, 1);
INSERT INTO public.star VALUES (3, 'ALFA CENTAURI B', 'Closest to ALFA CENTAURI A', false, true, 450, 950000.00, 1);
INSERT INTO public.star VALUES (4, 'Barnard Star', 'Ofiuco constellation star', false, false, 4120, 590000.00, 1);
INSERT INTO public.star VALUES (5, 'WISE0855-7144', 'very similar to the sun', false, true, 470, 7.20, 1);
INSERT INTO public.star VALUES (6, 'Lalande21185', 'fouth closest to the sun', false, true, 8970, 8.31, 1);
INSERT INTO public.star VALUES (7, 'Wolf359', 'fifth closest to the sun', false, true, 3510, 9.80, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_on_star_system_planet_on_star_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_on_star_system_planet_on_star_system_id_seq', 3, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet_on_star_system planet_on_star_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_on_star_system
    ADD CONSTRAINT planet_on_star_system_pkey PRIMARY KEY (planet_on_star_system_id);


--
-- Name: planet_on_star_system planet_on_star_system_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_on_star_system
    ADD CONSTRAINT planet_on_star_system_planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet_on_star_system planet_on_star_system_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_on_star_system
    ADD CONSTRAINT planet_on_star_system_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_on_star_system planet_on_star_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_on_star_system
    ADD CONSTRAINT planet_on_star_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

