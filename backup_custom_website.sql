--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: datasports_information; Type: SCHEMA; Schema: -; Owner: denniswong
--

CREATE SCHEMA datasports_information;


ALTER SCHEMA datasports_information OWNER TO denniswong;

--
-- Name: base_cache_signaling_assets; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_cache_signaling_assets
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_cache_signaling_assets OWNER TO denniswong;

--
-- Name: base_cache_signaling_default; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_cache_signaling_default
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_cache_signaling_default OWNER TO denniswong;

--
-- Name: base_cache_signaling_groups; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_cache_signaling_groups
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_cache_signaling_groups OWNER TO denniswong;

--
-- Name: base_cache_signaling_routing; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_cache_signaling_routing
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_cache_signaling_routing OWNER TO denniswong;

--
-- Name: base_cache_signaling_templates; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_cache_signaling_templates
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_cache_signaling_templates OWNER TO denniswong;

--
-- Name: base_registry_signaling; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.base_registry_signaling
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.base_registry_signaling OWNER TO denniswong;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE datasports_information.cache OWNER TO denniswong;

--
-- Name: cache_locks; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE datasports_information.cache_locks OWNER TO denniswong;

--
-- Name: members; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.members (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE datasports_information.members OWNER TO denniswong;

--
-- Name: members_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.members_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.members_id_seq OWNER TO denniswong;

--
-- Name: members_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.members_id_seq OWNED BY datasports_information.members.id;


--
-- Name: migrations; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE datasports_information.migrations OWNER TO denniswong;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.migrations_id_seq OWNER TO denniswong;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.migrations_id_seq OWNED BY datasports_information.migrations.id;


--
-- Name: playlists; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.playlists (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE datasports_information.playlists OWNER TO denniswong;

--
-- Name: playlists_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.playlists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.playlists_id_seq OWNER TO denniswong;

--
-- Name: playlists_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.playlists_id_seq OWNED BY datasports_information.playlists.id;


--
-- Name: scores; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.scores (
    id bigint NOT NULL,
    score integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE datasports_information.scores OWNER TO denniswong;

--
-- Name: scores_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.scores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.scores_id_seq OWNER TO denniswong;

--
-- Name: scores_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.scores_id_seq OWNED BY datasports_information.scores.id;


--
-- Name: sessions; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE datasports_information.sessions OWNER TO denniswong;

--
-- Name: sports; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.sports (
    id bigint NOT NULL,
    sports_name character varying(255) NOT NULL,
    competition_type character varying(255) NOT NULL,
    sports_type character varying(255) NOT NULL,
    description text NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT sports_competition_type_check CHECK (((competition_type)::text = ANY ((ARRAY['Team Match'::character varying, 'Last Man Standing'::character varying])::text[]))),
    CONSTRAINT sports_sports_type_check CHECK (((sports_type)::text = ANY ((ARRAY['indoor'::character varying, 'outdoor'::character varying])::text[])))
);


ALTER TABLE datasports_information.sports OWNER TO denniswong;

--
-- Name: sports_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.sports_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.sports_id_seq OWNER TO denniswong;

--
-- Name: sports_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.sports_id_seq OWNED BY datasports_information.sports.id;


--
-- Name: states; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.states (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE datasports_information.states OWNER TO denniswong;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.states_id_seq OWNER TO denniswong;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.states_id_seq OWNED BY datasports_information.states.id;


--
-- Name: versus; Type: TABLE; Schema: datasports_information; Owner: denniswong
--

CREATE TABLE datasports_information.versus (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE datasports_information.versus OWNER TO denniswong;

--
-- Name: versus_id_seq; Type: SEQUENCE; Schema: datasports_information; Owner: denniswong
--

CREATE SEQUENCE datasports_information.versus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE datasports_information.versus_id_seq OWNER TO denniswong;

--
-- Name: versus_id_seq; Type: SEQUENCE OWNED BY; Schema: datasports_information; Owner: denniswong
--

ALTER SEQUENCE datasports_information.versus_id_seq OWNED BY datasports_information.versus.id;


--
-- Name: members id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.members ALTER COLUMN id SET DEFAULT nextval('datasports_information.members_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.migrations ALTER COLUMN id SET DEFAULT nextval('datasports_information.migrations_id_seq'::regclass);


--
-- Name: playlists id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.playlists ALTER COLUMN id SET DEFAULT nextval('datasports_information.playlists_id_seq'::regclass);


--
-- Name: scores id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.scores ALTER COLUMN id SET DEFAULT nextval('datasports_information.scores_id_seq'::regclass);


--
-- Name: sports id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.sports ALTER COLUMN id SET DEFAULT nextval('datasports_information.sports_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.states ALTER COLUMN id SET DEFAULT nextval('datasports_information.states_id_seq'::regclass);


--
-- Name: versus id; Type: DEFAULT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.versus ALTER COLUMN id SET DEFAULT nextval('datasports_information.versus_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: members; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.members (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.migrations (id, migration, batch) FROM stdin;
9	2025_03_24_083038_create_states_table	1
10	2025_03_24_083046_create_members_table	1
11	2025_03_24_083052_create_scores_table	1
12	2025_03_24_083056_create_versus_table	1
13	2025_03_24_083100_create_playlists_table	1
14	2025_03_24_083621_create_cache_table	1
15	2025_03_25_012626_create_sessions_table	1
16	2025_03_28_003146_create_sports_table	1
\.


--
-- Data for Name: playlists; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.playlists (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: scores; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.scores (id, score, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
gVwIl5BImNBQ8Kn9wtey3tflEjpGFvMLcjydrMol	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEZIWWpJclI0V3hwTHhxdnVmVzFGUVozRWNOcjBDSkF0U1o1R1J5ViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9tYW5hZ2VtZW50Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1743573358
\.


--
-- Data for Name: sports; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.sports (id, sports_name, competition_type, sports_type, description, created_at, updated_at) FROM stdin;
1	BasketBall	Team Match	outdoor	A basketball event is a fast-paced team sport where two teams of five players compete to score points by shooting a ball through a hoop on the opposing team's side, while preventing the other team from doing the same.	2025-04-02 02:00:30	2025-04-02 02:02:37
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.states (id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: versus; Type: TABLE DATA; Schema: datasports_information; Owner: denniswong
--

COPY datasports_information.versus (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: base_cache_signaling_assets; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_cache_signaling_assets', 1, true);


--
-- Name: base_cache_signaling_default; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_cache_signaling_default', 1, true);


--
-- Name: base_cache_signaling_groups; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_cache_signaling_groups', 1, true);


--
-- Name: base_cache_signaling_routing; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_cache_signaling_routing', 1, true);


--
-- Name: base_cache_signaling_templates; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_cache_signaling_templates', 1, true);


--
-- Name: base_registry_signaling; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.base_registry_signaling', 1, true);


--
-- Name: members_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.members_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.migrations_id_seq', 16, true);


--
-- Name: playlists_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.playlists_id_seq', 1, false);


--
-- Name: scores_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.scores_id_seq', 1, false);


--
-- Name: sports_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.sports_id_seq', 1, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.states_id_seq', 1, false);


--
-- Name: versus_id_seq; Type: SEQUENCE SET; Schema: datasports_information; Owner: denniswong
--

SELECT pg_catalog.setval('datasports_information.versus_id_seq', 1, false);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: members members_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.members
    ADD CONSTRAINT members_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: playlists playlists_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.playlists
    ADD CONSTRAINT playlists_pkey PRIMARY KEY (id);


--
-- Name: scores scores_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.scores
    ADD CONSTRAINT scores_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sports sports_name_unique; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.sports
    ADD CONSTRAINT sports_name_unique UNIQUE (sports_name);


--
-- Name: sports sports_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.sports
    ADD CONSTRAINT sports_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: versus versus_pkey; Type: CONSTRAINT; Schema: datasports_information; Owner: denniswong
--

ALTER TABLE ONLY datasports_information.versus
    ADD CONSTRAINT versus_pkey PRIMARY KEY (id);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: datasports_information; Owner: denniswong
--

CREATE INDEX sessions_last_activity_index ON datasports_information.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: datasports_information; Owner: denniswong
--

CREATE INDEX sessions_user_id_index ON datasports_information.sessions USING btree (user_id);


--
-- PostgreSQL database dump complete
--

