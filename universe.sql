--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    distance_from_earth_mly numeric(7,3),
    diameter_ly integer
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    sidereal_orbital_period_days numeric(7,3),
    is_spherical boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_sun_mkm bigint,
    orbital_period_years numeric(8,4),
    has_rings boolean,
    number_of_moons integer,
    volume_earths numeric(16,4),
    mass_earths numeric(30,4),
    star_id integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_type OWNER TO postgres;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO postgres;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_from_earth_ly numeric(15,9),
    description text,
    mass_solor_mass numeric(7,3),
    radius_solar_radius numeric(7,3),
    age_million_years numeric(6,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Home galaxy of Earth', 0.027, 87400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Largest Galaxy in the local Group. Barred spiral galaxy', 2.538, 152000);
INSERT INTO public.galaxy VALUES (3, 'Large Megellanic Cloud', 'Largest satellite galaxy of the Milky Way', 0.163, 32200);
INSERT INTO public.galaxy VALUES (4, 'Small Megellanic Cloud', 'Satellite galaxy of Milky Way', 0.205, 18900);
INSERT INTO public.galaxy VALUES (5, 'Triangulum Galaxy', 'Closest unbarred spiral', 2.730, 61100);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Brightest and nearest radio galaxy', 12.010, 60000);
INSERT INTO public.galaxy VALUES (7, 'Sculptor Galaxy', 'Intermediate spiral galaxy', 11.400, 90000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'Moon', 27.322, true, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.319, false, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 1.262, false, 4);
INSERT INTO public.moon VALUES (4, 'Io', 1.769, true, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 3.551, true, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 7.155, true, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 16.690, true, 5);
INSERT INTO public.moon VALUES (8, 'Amalthea', 0.498, false, 5);
INSERT INTO public.moon VALUES (9, 'Enceladus', 1.370, true, 6);
INSERT INTO public.moon VALUES (10, 'Titan', 15.950, true, 6);
INSERT INTO public.moon VALUES (11, 'Hyperion', 21.280, false, 6);
INSERT INTO public.moon VALUES (12, 'Phoebe', 550.310, false, 6);
INSERT INTO public.moon VALUES (13, 'Atlas', 0.602, false, 6);
INSERT INTO public.moon VALUES (14, 'Methone', 1.010, false, 6);
INSERT INTO public.moon VALUES (15, 'Ariel', 2.520, true, 7);
INSERT INTO public.moon VALUES (16, 'Titania', 8.706, true, 7);
INSERT INTO public.moon VALUES (17, 'Triton', 5.877, true, 8);
INSERT INTO public.moon VALUES (18, 'Proteus', 1.122, false, 8);
INSERT INTO public.moon VALUES (19, 'Charon', 6.387, true, 10);
INSERT INTO public.moon VALUES (20, 'Nix', 24.850, false, 10);
INSERT INTO public.moon VALUES (21, 'Hydra', 38.200, false, 10);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 57909175, 0.2408, false, 0, 0.0560, 0.0550, 1, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 108208930, 0.6152, false, 0, 0.8570, 0.8150, 1, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 149597890, 1.0000, false, 1, 1.0000, 1.0000, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 227936640, 1.8808, false, 2, 0.1510, 0.1070, 1, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 778412010, 11.8618, true, 95, 1321.3000, 318.0000, 1, 2);
INSERT INTO public.planet VALUES (6, 'Saturn', 1426725400, 29.4566, true, 83, 763.6200, 95.0000, 1, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 2870972200, 84.0191, true, 27, 63.1020, 14.5000, 1, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 4498252900, 164.7665, true, 14, 57.7470, 17.0000, 1, 3);
INSERT INTO public.planet VALUES (9, 'Ceres', 413700000, 4.5990, false, 0, 421000000.0000, 939000000000000000000.0000, 1, 4);
INSERT INTO public.planet VALUES (10, 'Pluto', 5906380000, 247.9000, false, 5, 6990000000.0000, 13000000000000000000000.0000, 1, 4);
INSERT INTO public.planet VALUES (11, 'Haumea', 6484000000, 283.8000, true, 2, 1980000000.0000, 4010000000000000000000.0000, 1, 4);
INSERT INTO public.planet VALUES (12, 'Quaoar', 6540000000, 287.9700, true, 1, 737591000.0000, 1410000000000000000000.0000, 1, 4);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial planet', 'Inner rocky planets');
INSERT INTO public.planet_type VALUES (2, 'Gas giant', 'Massive planets. Normally have thick atmospheres of hydrogen and helium.');
INSERT INTO public.planet_type VALUES (3, 'Ice giant', 'Smaller than gas giants, but still much larger than Earth.');
INSERT INTO public.planet_type VALUES (4, 'Dwarf planet', 'Smaller than any of the eight classical planets');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 0.000015813, 'The star at the center of the Solar System', 1.000, 1.000, 4600.00, 1);
INSERT INTO public.star VALUES (2, 'Sirius', 8.600000000, 'The brightest star in the night sky', 2.063, 1.710, 242.00, 1);
INSERT INTO public.star VALUES (3, 'Canopus', 310.000000000, 'The second-brightest star in the night sky', 8.000, 73.300, 25.10, 1);
INSERT INTO public.star VALUES (4, 'Vega', 25.040000000, 'The fifth-brightest star in the night sky', 2.135, 2.362, 455.00, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 863.000000000, 'Appear as a single blue-white point of light to the naked eye.', 21.000, 78.900, 8.00, 1);
INSERT INTO public.star VALUES (6, 'Alpha Andromedae', 97.000000000, 'The brightest star in Andromeda Galaxy', 3.800, 2.700, 60.00, 2);
INSERT INTO public.star VALUES (7, 'Gamma Andromedae', 390.000000000, 'A colorful binary and a popular target for amateur astronomers', 23.700, 80.000, 6.50, 2);
INSERT INTO public.star VALUES (8, 'Beta Andromedae', 197.000000000, 'A red giant, it''s color visible to the naked eye', 2.490, 100.000, NULL, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_planet_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_type_id_fkey FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA public TO freecodecamp;


--
-- Name: TABLE galaxy; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.galaxy TO freecodecamp;


--
-- Name: SEQUENCE galaxy_galaxy_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.galaxy_galaxy_id_seq TO freecodecamp;


--
-- Name: TABLE moon; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.moon TO freecodecamp;


--
-- Name: SEQUENCE moon_moon_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.moon_moon_id_seq TO freecodecamp;


--
-- Name: TABLE planet; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planet TO freecodecamp;


--
-- Name: SEQUENCE planet_planet_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.planet_planet_id_seq TO freecodecamp;


--
-- Name: TABLE planet_type; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.planet_type TO freecodecamp;


--
-- Name: SEQUENCE planet_type_planet_type_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.planet_type_planet_type_id_seq TO freecodecamp;


--
-- Name: TABLE star; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.star TO freecodecamp;


--
-- Name: SEQUENCE star_star_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON SEQUENCE public.star_star_id_seq TO freecodecamp;


--
-- PostgreSQL database dump complete
--


