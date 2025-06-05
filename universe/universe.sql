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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    galaxy_id integer,
    name character varying(50) NOT NULL,
    event_horizon_radius_km bigint,
    distance_pc bigint,
    description text
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_pc numeric,
    description text,
    num_of_stars bigint,
    discovery_time integer,
    discovered_by character varying(50)
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    orbit_period_days numeric(10,4),
    has_atmosphere boolean,
    discovery_year smallint,
    discovered_by character varying(50),
    description text
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
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_type character varying(50),
    mass_earth numeric(10,4),
    radius_earth numeric(8,4),
    orbital_period_days numeric(12,4),
    rotation_period_hours numeric(10,2),
    has_atmosphere boolean,
    is_in_habitable_zone boolean,
    number_of_moons integer,
    discovery_year integer,
    description text
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
    galaxy_id integer,
    name character varying(50) NOT NULL,
    distance_pc numeric(10,4),
    temperature_k integer,
    mass_solar numeric(8,4),
    radius_solar numeric(8,4),
    description text
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.blackhole (blackhole_id, galaxy_id, name, event_horizon_radius_km, distance_pc, description) FROM stdin;
1	1	Sagittarius A*	12700000	8200	The supermassive black hole at the center of the Milky Way galaxy. Its mass is about 4.3 million times that of the Sun.
2	2	P3 (Andromeda's SMBH)	440000000	780000	The supermassive black hole at the center of the Andromeda Galaxy (M31). Estimated to be significantly more massive than Sagittarius A*.
3	3	M87*	19000000000	16400000	The supermassive black hole at the center of the Messier 87 galaxy. This was the first black hole to be directly imaged by the Event Horizon Telescope.
4	1	Cygnus X-1	62	1860	One of the first stellar-mass black hole candidates to be widely accepted. It is part of an X-ray binary system, accreting matter from a blue supergiant companion star.
5	1	V616 Monocerotis (A0620-00)	20	1000	A binary system containing a stellar-mass black hole and a K-type main-sequence star. It is one of the closest known black holes to Earth.
6	1	Gaia BH1	29	480	A stellar-mass black hole in a binary system with a Sun-like star. Notable for being relatively close and having a wide orbit, making it a dormant black hole.
7	3	NGC 4889 Central Black Hole	62000000000	94000000	One of the most massive black holes ever discovered, located at the center of the supergiant elliptical galaxy NGC 4889 in the Coma Cluster.
\.


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.galaxy (galaxy_id, name, galaxy_type, distance_pc, description, num_of_stars, discovery_time, discovered_by) FROM stdin;
1	Milky Way	Barred Spiral	0	Our home galaxy, a barred spiral containing our Solar System. It has a central bar-shaped structure composed of stars.	200000000000	1610	Galileo Galilei (telescopic observation)
2	Andromeda Galaxy	Spiral	780000	The nearest major galaxy to the Milky Way, and the largest galaxy of the Local Group. It is on a collision course with the Milky Way.	1000000000000	964	Abd al-Rahman al-Sufi
3	Triangulum Galaxy	Spiral	920000	The third-largest member of the Local Group of galaxies, after the Milky Way and Andromeda. It is a spiral galaxy.	40000000000	1654	Giovanni Battista Hodierna
4	Whirlpool Galaxy	Spiral (Grand Design)	7050000	A classic grand design spiral galaxy in the constellation Canes Venatici. It is famous for its well-defined spiral arms and its interacting companion galaxy NGC 5195.	100000000000	1773	Charles Messier
5	Sombrero Galaxy	Spiral (Unclear type, possibly Sa/Sb)	9550000	A spiral galaxy in the constellation Virgo. It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its inclined disk, giving it the appearance of a sombrero.	800000000000	1781	Pierre Méchain
6	Large Magellanic Cloud	Irregular (Satellite Dwarf)	49970	A satellite dwarf galaxy of the Milky Way. It is the second- or third-closest galaxy to the Milky Way and is visible from the Southern Hemisphere.	30000000000	1519	Ferdinand Magellan (popularized)
7	Hoag's Object	Ring Galaxy (Peculiar)	184000000	A rare and peculiar non-barred ring galaxy. It consists of a nearly perfect ring of young, hot blue stars surrounding an older yellow nucleus.	8000000000	1950	Art Hoag
\.


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.moon (moon_id, planet_id, name, orbit_period_days, has_atmosphere, discovery_year, discovered_by, description) FROM stdin;
1	3	Moon	27.3217	f	\N	Antiquity	Earth's only natural satellite. The fifth largest moon in the Solar System.
2	4	Phobos	0.3189	f	1877	Asaph Hall	The larger and innermost of Mars' two natural satellites. Likely a captured asteroid.
3	4	Deimos	1.2620	f	1877	Asaph Hall	The smaller and outermost of Mars' two natural satellites. Also likely a captured asteroid.
4	5	Io	1.7690	t	1610	Galileo Galilei	The most volcanically active world in the Solar System, one of the four Galilean moons.
5	5	Europa	3.5510	t	1610	Galileo Galilei	A Galilean moon with a smooth, icy surface, believed to harbor a subsurface ocean.
6	5	Ganymede	7.1550	t	1610	Galileo Galilei	The largest moon in the Solar System (larger than Mercury), a Galilean moon with its own magnetic field.
7	5	Callisto	16.6900	t	1610	Galileo Galilei	A heavily cratered Galilean moon, possibly with a subsurface ocean.
8	5	Amalthea	0.4980	f	1892	E. E. Barnard	An inner moon of Jupiter, irregularly shaped and reddish in color.
9	6	Titan	15.9450	t	1655	Christiaan Huygens	The largest moon of Saturn, the only moon known to have a dense atmosphere, and the only known body in space other than Earth where clear evidence of stable bodies of surface liquid has been found.
10	6	Rhea	4.5180	t	1672	Giovanni Cassini	The second-largest moon of Saturn, an icy body with a heavily cratered surface.
11	6	Iapetus	79.3215	f	1671	Giovanni Cassini	Known for its dramatic two-tone coloration, with one hemisphere being very dark and the other bright.
12	6	Dione	2.7370	t	1684	Giovanni Cassini	An icy moon of Saturn with prominent ice cliffs and a tenuous atmosphere.
13	6	Tethys	1.8880	f	1684	Giovanni Cassini	An icy moon of Saturn, notable for its large impact crater Odysseus and a vast canyon system Ithaca Chasma.
14	6	Enceladus	1.3700	t	1789	William Herschel	A small icy moon of Saturn known for its geysers erupting water ice and vapor from its south polar region, indicating a subsurface ocean.
15	6	Mimas	0.9420	f	1789	William Herschel	Notable for its very large impact crater, Herschel, which gives it an appearance similar to the Death Star.
16	7	Titania	8.7060	f	1787	William Herschel	The largest moon of Uranus, composed of roughly equal amounts of ice and rock.
17	7	Oberon	13.4600	f	1787	William Herschel	The outermost major moon of Uranus, with an old, heavily cratered, and icy surface.
18	7	Umbriel	4.1440	f	1851	William Lassell	A dark and heavily cratered moon of Uranus.
19	7	Ariel	2.5200	f	1851	William Lassell	The brightest of Uranus's larger moons, shows signs of more recent geological activity.
20	8	Triton	-5.8770	t	1846	William Lassell	The largest natural satellite of Neptune, unique for its retrograde orbit. It is geologically active with cryovolcanoes.
21	8	Nereid	360.1300	f	1949	Gerard P. Kuiper	One of Neptune's outermost moons, known for its highly eccentric orbit.
\.


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.planet (planet_id, star_id, name, planet_type, mass_earth, radius_earth, orbital_period_days, rotation_period_hours, has_atmosphere, is_in_habitable_zone, number_of_moons, discovery_year, description) FROM stdin;
1	1	Mercury	Terrestrial	0.0550	0.3830	87.9700	1407.60	f	f	0	1631	The smallest planet in our Solar System and closest to the Sun.
2	1	Venus	Terrestrial	0.8150	0.9490	224.7000	-5832.60	t	f	0	1610	Known for its thick, toxic atmosphere and extreme greenhouse effect. Rotates retrograde.
3	1	Earth	Terrestrial	1.0000	1.0000	365.2500	23.93	t	t	1	\N	Our home planet, the only known celestial body to harbor life.
4	1	Mars	Terrestrial	0.1070	0.5320	686.9800	24.62	t	f	2	1610	The "Red Planet", known for its rusty appearance and potential for past liquid water.
5	1	Jupiter	Gas Giant	317.8000	11.2090	4332.5900	9.93	t	f	95	1610	The largest planet in our Solar System, a gas giant with a Great Red Spot.
6	1	Saturn	Gas Giant	95.1600	9.4490	10759.2200	10.66	t	f	146	1610	Known for its prominent and extensive ring system, composed mainly of ice particles.
7	1	Uranus	Ice Giant	14.5400	4.0070	30688.5000	-17.24	t	f	27	1781	An ice giant with a unique axial tilt, causing it to rotate nearly on its side.
8	1	Neptune	Ice Giant	17.1500	3.8830	60182.0000	16.11	t	f	14	1846	The farthest known planet from the Sun in our Solar System, an ice giant with strong winds.
9	2	Proxima Centauri b	Terrestrial	1.0700	1.1000	11.1800	\N	t	t	0	2016	An exoplanet orbiting within the habitable zone of Proxima Centauri, the closest star to the Sun.
10	1	Ceres	Dwarf Planet	0.0002	0.0746	1681.6300	9.07	t	f	0	1801	The largest object in the asteroid belt between Mars and Jupiter, classified as a dwarf planet.
11	2	Kepler-62f	Super-Earth	2.8000	1.4100	267.2900	\N	t	t	0	2013	An exoplanet orbiting the star Kepler-62, located within the habitable zone. It is considered one of the more promising candidates for habitability.
12	2	OGLE-2005-BLG-390Lb	Super-Earth	5.5000	\N	3500.0000	\N	t	f	0	2006	A relatively cool exoplanet discovered via gravitational microlensing orbiting the star OGLE-2005-BLG-390L. Likely an ice world.
13	3	Kepler-22b	Super-Earth	2.4000	2.3800	289.9000	\N	t	t	0	2011	An exoplanet orbiting within the habitable zone of the Sun-like star Kepler-22. Potentially an ocean world.
14	4	Gliese 581g	Super-Earth	3.1000	1.5000	36.5600	\N	t	t	0	2010	A controversial exoplanet candidate orbiting the red dwarf star Gliese 581, potentially in its habitable zone. Its existence is debated.
15	5	HD 209458 b (Osiris)	Gas Giant	219.2820	15.4684	3.5200	\N	t	f	0	1999	A "hot Jupiter" exoplanet orbiting the star HD 209458. Notable for being one of the first transiting exoplanets discovered and having its atmosphere studied.
\.


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

COPY public.star (star_id, galaxy_id, name, distance_pc, temperature_k, mass_solar, radius_solar, description) FROM stdin;
1	1	Sun	0.0000	5778	1.0000	1.0000	The star at the center of our Solar System. A G2V main-sequence star.
2	1	Alpha Centauri A	1.3470	5790	1.1000	1.2234	The primary star of the closest star system to the Sun, part of a triple star system.
3	1	Sirius A	2.6370	9940	2.0630	1.7110	The brightest star in the night sky, a main-sequence star of spectral type A0 or A1.
4	2	PA-99-N2	780000.0000	6000	1.5000	1.3000	A star in the Andromeda Galaxy that was the subject of a gravitational microlensing event, allowing for study.
5	2	AE Andromedae	780000.0000	20000	40.0000	200.0000	A Luminous Blue Variable star in the Andromeda Galaxy, one of the brightest stars known.
6	3	Var 83 (M33)	920000.0000	18000	35.0000	150.0000	A well-known Luminous Blue Variable (LBV) star located in the Triangulum Galaxy.
\.


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name_key UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


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
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

