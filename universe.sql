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
    name character varying(40) NOT NULL,
    description text,
    age integer,
    galaxy_type character varying(40) NOT NULL,
    CONSTRAINT galaxy_age_check CHECK ((age > 0))
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
    name character varying(40) NOT NULL,
    has_life boolean,
    description text,
    age integer,
    mass_coefficient numeric(5,4),
    mass_power integer,
    planet_id integer,
    moon_type character varying(40) NOT NULL,
    CONSTRAINT moon_age_check CHECK ((age > 0)),
    CONSTRAINT moon_mass_coefficient_check CHECK ((mass_coefficient > (0)::numeric)),
    CONSTRAINT moon_mass_power_check CHECK ((mass_power > 0))
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
    name character varying(40) NOT NULL,
    has_life boolean,
    description text,
    age integer,
    mass_coefficient numeric(5,4),
    mass_power integer,
    star_id integer,
    planet_type character varying(40) NOT NULL,
    CONSTRAINT planet_age_check CHECK ((age > 0)),
    CONSTRAINT planet_mass_coefficient_check CHECK ((mass_coefficient > (0)::numeric)),
    CONSTRAINT planet_mass_power_check CHECK ((mass_power > 0))
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_composition; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_composition (
    planet_composition_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    layer integer NOT NULL,
    concentration_coefficient numeric(5,4),
    conecntration_power integer,
    CONSTRAINT planet_composition_layer_check CHECK ((layer > 0))
);


ALTER TABLE public.planet_composition OWNER TO freecodecamp;

--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_composition_planet_composition_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_composition_planet_composition_id_seq OWNER TO freecodecamp;

--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_composition_planet_composition_id_seq OWNED BY public.planet_composition.planet_composition_id;


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
    name character varying(40) NOT NULL,
    description text,
    age integer,
    mass_coefficient numeric(5,4),
    mass_power integer,
    galaxy_id integer,
    star_type character varying(40) NOT NULL,
    CONSTRAINT star_age_check CHECK ((age > 0)),
    CONSTRAINT star_mass_coefficient_check CHECK ((mass_coefficient > (0)::numeric)),
    CONSTRAINT star_mass_power_check CHECK ((mass_power > 0))
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
-- Name: planet_composition planet_composition_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition ALTER COLUMN planet_composition_id SET DEFAULT nextval('public.planet_composition_planet_composition_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'It is our galaxy', 9999, 'human-containing');
INSERT INTO public.galaxy VALUES (2, 'Cerial', 'Not real one', 898, 'wheat-containing');
INSERT INTO public.galaxy VALUES (3, 'Bricky', 'Made out of bricks', 8716, 'bricky-type');
INSERT INTO public.galaxy VALUES (4, 'Persephone', 'Ancient lady', 789, 'greek-fashion');
INSERT INTO public.galaxy VALUES (5, 'Hercules', 'With Zeus vibe', 987, 'greek-fashion');
INSERT INTO public.galaxy VALUES (6, 'Zeus', 'Old greek god vibe', 3452, 'greek-fashion');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (24, 'PH1.1', true, 'Small science station from PH1', 1234, 2.2222, 1, 1, 'soil');
INSERT INTO public.moon VALUES (25, 'PH1.2', false, 'Nothing interesting here', 1236, 3.2222, 2, 1, 'soil');
INSERT INTO public.moon VALUES (26, 'PH2.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 2, 'soil');
INSERT INTO public.moon VALUES (27, 'PH3.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 3, 'soil');
INSERT INTO public.moon VALUES (28, 'PH4.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 4, 'soil');
INSERT INTO public.moon VALUES (29, 'PH5.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 5, 'soil');
INSERT INTO public.moon VALUES (30, 'PH6.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 6, 'soil');
INSERT INTO public.moon VALUES (31, 'PH6.2', false, 'Nothing interesting here', 1236, 3.2222, 2, 6, 'soil');
INSERT INTO public.moon VALUES (32, 'PH7.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 7, 'soil');
INSERT INTO public.moon VALUES (33, 'PH8.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 8, 'soil');
INSERT INTO public.moon VALUES (34, 'PH9.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 9, 'soil');
INSERT INTO public.moon VALUES (35, 'PH10.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 10, 'soil');
INSERT INTO public.moon VALUES (36, 'PH11.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 11, 'soil');
INSERT INTO public.moon VALUES (37, 'PH12.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 12, 'soil');
INSERT INTO public.moon VALUES (38, 'PH13.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 13, 'soil');
INSERT INTO public.moon VALUES (39, 'PH14.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 14, 'soil');
INSERT INTO public.moon VALUES (40, 'PH15.1', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (41, 'PH15.2', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (42, 'PH15.3', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (43, 'PH15.4', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (44, 'PH15.5', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (45, 'PH15.6', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');
INSERT INTO public.moon VALUES (46, 'PH15.7', false, 'Nothing interesting here', 1236, 3.2222, 2, 15, 'soil');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'PH1', true, 'Outer civilization', 3245, 3.6457, 12, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (2, 'PH2', false, 'Ferrite full', 3235, 3.6457, 12, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (3, 'PH3', false, 'Ferrite full', 3657, 3.6457, 23, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (4, 'PH4', false, 'Ferrite full', 3234, 3.6457, 54, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (5, 'PH5', false, 'Ferrite full', 3235, 3.6457, 23, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (6, 'PH6', false, 'Ferrite full', 3457, 3.6457, 63, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (7, 'PH7', false, 'Ferrite full', 3124, 3.6457, 13, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (8, 'PH8', false, 'Ferrite full', 3987, 3.6457, 53, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (9, 'PH9', false, 'Ferrite full', 3324, 3.6457, 76, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (10, 'PH10', true, 'Quite nice planet', 3132, 3.0924, 75, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (11, 'PH11', false, 'Ferrite full', 3987, 3.9864, 12, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (12, 'PH12', false, 'Ferrite full', 3124, 3.3248, 34, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (13, 'PH13', false, 'Ferrite full', 3097, 3.0984, 54, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (14, 'PH14', false, 'Ferrite full', 3123, 3.3284, 65, 2, 'Earth-alike');
INSERT INTO public.planet VALUES (15, 'PH15', false, 'Ferrite full', 3985, 3.9845, 76, 2, 'Earth-alike');


--
-- Data for Name: planet_composition; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_composition VALUES (1, 'ferrite', 1, 1, 0.9998, 1);
INSERT INTO public.planet_composition VALUES (2, 'phosphorus', 1, 2, 0.9998, 1);
INSERT INTO public.planet_composition VALUES (3, 'hydrogen', 1, 3, 0.9998, -2);
INSERT INTO public.planet_composition VALUES (4, 'oxygen', 1, 3, 0.9598, -1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'Our Sun', 8888, 1.2345, 12, 1, 'human-feeding');
INSERT INTO public.star VALUES (2, 'ZetaBeta', 'Generic star', 8500, 1.7338, 42, 3, 'generic');
INSERT INTO public.star VALUES (3, 'GammaYpsilon', 'Generic star', 4546, 6.3452, 34, 3, 'generic');
INSERT INTO public.star VALUES (4, 'TetaGamma', 'Generic star', 7346, 6.2356, 67, 3, 'generic');
INSERT INTO public.star VALUES (5, 'AlphaBeta', 'Generic star', 2345, 4.3753, 43, 3, 'generic');
INSERT INTO public.star VALUES (6, 'BetaTeta', 'Generic star', 776, 2.3876, 41, 3, 'generic');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 46, true);


--
-- Name: planet_composition_planet_composition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_composition_planet_composition_id_seq', 4, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: planet_composition planet_composition_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT planet_composition_pkey PRIMARY KEY (planet_composition_id);


--
-- Name: planet_composition planet_composition_planet_id_layer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT planet_composition_planet_id_layer_name_key UNIQUE (planet_id, layer, name);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet_composition planet_composition_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_composition
    ADD CONSTRAINT planet_composition_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

