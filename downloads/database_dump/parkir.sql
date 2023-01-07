--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5
-- Dumped by pg_dump version 14.5

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
-- Name: gate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gate (
    id integer NOT NULL,
    no_pos character varying(10),
    tipe_pos character varying(30),
    jns_kendaraan character varying(50),
    ip_cam character varying(60)
);


ALTER TABLE public.gate OWNER TO postgres;

--
-- Name: gate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gate_id_seq OWNER TO postgres;

--
-- Name: gate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gate_id_seq OWNED BY public.gate.id;


--
-- Name: karcis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.karcis (
    id integer NOT NULL,
    barcode character varying(150),
    datetime timestamp(6) with time zone,
    gate character varying(20),
    images_path character varying(255)
);


ALTER TABLE public.karcis OWNER TO postgres;

--
-- Name: karcis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.karcis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.karcis_id_seq OWNER TO postgres;

--
-- Name: karcis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.karcis_id_seq OWNED BY public.karcis.id;


--
-- Name: kasir; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.kasir (
    id integer NOT NULL,
    nik character varying(100),
    nama character varying(80),
    hp character varying(15),
    alamat character varying(255),
    jm_masuk character varying(10),
    jm_keluar character varying(10),
    no_pos character varying(10)
);


ALTER TABLE public.kasir OWNER TO postgres;

--
-- Name: kasir_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.kasir_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kasir_id_seq OWNER TO postgres;

--
-- Name: kasir_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.kasir_id_seq OWNED BY public.kasir.id;


--
-- Name: rfid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rfid (
    id integer NOT NULL,
    rfid character varying(100),
    nama character varying(80)
);


ALTER TABLE public.rfid OWNER TO postgres;

--
-- Name: rfid_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.rfid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rfid_id_seq OWNER TO postgres;

--
-- Name: rfid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.rfid_id_seq OWNED BY public.rfid.id;


--
-- Name: tarif; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tarif (
    id integer NOT NULL,
    no_pos character varying(10),
    tarif_perjam integer NOT NULL,
    tarif_per24jam integer NOT NULL,
    jns_kendaraan character varying(50)
);


ALTER TABLE public.tarif OWNER TO postgres;

--
-- Name: tarif_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarif_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarif_id_seq OWNER TO postgres;

--
-- Name: tarif_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarif_id_seq OWNED BY public.tarif.id;


--
-- Name: tarif_tarif_per24jam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarif_tarif_per24jam_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarif_tarif_per24jam_seq OWNER TO postgres;

--
-- Name: tarif_tarif_per24jam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarif_tarif_per24jam_seq OWNED BY public.tarif.tarif_per24jam;


--
-- Name: tarif_tarif_perjam_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tarif_tarif_perjam_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tarif_tarif_perjam_seq OWNER TO postgres;

--
-- Name: tarif_tarif_perjam_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tarif_tarif_perjam_seq OWNED BY public.tarif.tarif_perjam;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(100),
    user_level character varying(80),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: gate id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gate ALTER COLUMN id SET DEFAULT nextval('public.gate_id_seq'::regclass);


--
-- Name: karcis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karcis ALTER COLUMN id SET DEFAULT nextval('public.karcis_id_seq'::regclass);


--
-- Name: kasir id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasir ALTER COLUMN id SET DEFAULT nextval('public.kasir_id_seq'::regclass);


--
-- Name: rfid id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rfid ALTER COLUMN id SET DEFAULT nextval('public.rfid_id_seq'::regclass);


--
-- Name: tarif id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif ALTER COLUMN id SET DEFAULT nextval('public.tarif_id_seq'::regclass);


--
-- Name: tarif tarif_perjam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif ALTER COLUMN tarif_perjam SET DEFAULT nextval('public.tarif_tarif_perjam_seq'::regclass);


--
-- Name: tarif tarif_per24jam; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif ALTER COLUMN tarif_per24jam SET DEFAULT nextval('public.tarif_tarif_per24jam_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: gate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gate (id, no_pos, tipe_pos, jns_kendaraan, ip_cam) FROM stdin;
1	1	masuk	motor	192.168.100.10#192.168.100.12
2	1	keluar	motor	192.168.100.16#192.168.100.18
3	3	Keluar	Mobil	192.168.100.7#192.168.100.8
5	12	Masuk	Motor	456456456
6	10	Masuk	Mobil	192.168.100.10#192.168.100.14
\.


--
-- Data for Name: karcis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.karcis (id, barcode, datetime, gate, images_path) FROM stdin;
1	20230105142234434431	2023-01-05 14:22:34.434431+07	2	\N
4	20230105143348041938	2023-01-05 14:33:48.041938+07	2	\N
5	20230106182714575579	2023-01-06 18:27:14.575579+07	2	\N
6	20230106182738619343	2023-01-06 18:27:38.619343+07	2	\N
7	20230106183010557731	2023-01-06 18:30:10.557731+07	2	\N
8	20230106193606553328	2023-01-06 19:36:06.553328+07	2	\N
9	20230106193720182892	2023-01-06 19:37:20.182892+07	2	\N
10	20230106193919747379	2023-01-06 19:39:19.747379+07	2	\N
11	20230106193953804596	2023-01-06 19:39:53.804596+07	2	\N
12	20230106193953937085	2023-01-06 19:39:53.937085+07	2	\N
13	20230106202129277839	2023-01-06 20:21:29.277839+07	2	\N
14	20230106202129394625	2023-01-06 20:21:29.394625+07	2	\N
15	20230106202152937044	2023-01-06 20:21:52.937044+07	2	\N
16	20230106202812116232	2023-01-06 20:28:12.116232+07	2	\N
17	20230106202939066717	2023-01-06 20:29:39.066717+07	2	\N
18	20230106202939572065	2023-01-06 20:29:39.572065+07	2	\N
19	20230106203030161221	2023-01-06 20:30:30.161221+07	2	\N
20	20230106210134382287	2023-01-06 21:01:34.382287+07	2	\N
21	20230106210325568503	2023-01-06 21:03:25.568503+07	2	\N
22	20230106210352115868	2023-01-06 21:03:52.115868+07	2	\N
23	20230106210848902748	2023-01-06 21:08:48.902748+07	2	\N
\.


--
-- Data for Name: kasir; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.kasir (id, nik, nama, hp, alamat, jm_masuk, jm_keluar, no_pos) FROM stdin;
1	111223344	susi	085263636	darussalam	08:00	12:00	1
2	1144523344	budi	0852636234	darussalam	12:00	18:00	1
\.


--
-- Data for Name: rfid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rfid (id, rfid, nama) FROM stdin;
1	0014832825	razi
6	123123123	sdfsdf
10	123	sasdfdsf
11	213123123	sdfsdfsdf
14	11233	sdfsdfsdf
15	11111111111	sdfsdf
16	123123123	sadfsdfsd
17	111	sdfsdfsdf
18	22222	sfdsdf
19	123123	sdfsdf
20	121123	sdfsdfsd
21	123123	sdfsdfsd
23	34323423	dfgdf
24	12312	sfdsdf
26	123	sdfsdf
27	123123	sdfsdfs
28	24234	nfgjhg
30	1111111	sanusi
5	14323423	anto
13	1231	santi
\.


--
-- Data for Name: tarif; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tarif (id, no_pos, tarif_perjam, tarif_per24jam, jns_kendaraan) FROM stdin;
1	1	1000	4000	motor
2	1	2000	8000	mobil
3	345	345	345	Motor
4	1230000	123	123	Motor
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, user_level, password) FROM stdin;
1	andi	pegawai	123
2	susi	Kasir	123
\.


--
-- Name: gate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gate_id_seq', 6, true);


--
-- Name: karcis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.karcis_id_seq', 23, true);


--
-- Name: kasir_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.kasir_id_seq', 2, true);


--
-- Name: rfid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.rfid_id_seq', 30, true);


--
-- Name: tarif_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarif_id_seq', 4, true);


--
-- Name: tarif_tarif_per24jam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarif_tarif_per24jam_seq', 1, false);


--
-- Name: tarif_tarif_perjam_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tarif_tarif_perjam_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- Name: gate gate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gate
    ADD CONSTRAINT gate_pkey PRIMARY KEY (id);


--
-- Name: karcis karcis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.karcis
    ADD CONSTRAINT karcis_pkey PRIMARY KEY (id);


--
-- Name: kasir kasir_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.kasir
    ADD CONSTRAINT kasir_pkey PRIMARY KEY (id);


--
-- Name: rfid rfid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rfid
    ADD CONSTRAINT rfid_pkey PRIMARY KEY (id);


--
-- Name: tarif tarif_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tarif
    ADD CONSTRAINT tarif_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

