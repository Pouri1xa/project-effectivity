--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3 (Debian 15.3-1.pgdg110+1)
-- Dumped by pg_dump version 15.3

-- Started on 2023-10-30 19:59:59 UTC

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

--
-- TOC entry 3395 (class 1262 OID 16384)
-- Name: budibase; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE budibase WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE budibase OWNER TO postgres;

\connect budibase

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

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 3395
-- Name: DATABASE budibase; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE budibase IS 'default administrative connection database';


--
-- TOC entry 7 (class 2615 OID 24645)
-- Name: huett_db; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA huett_db;


ALTER SCHEMA huett_db OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 32874)
-- Name: effort; Type: TABLE; Schema: huett_db; Owner: postgres
--

CREATE TABLE huett_db.effort (
    id integer NOT NULL,
    date timestamp with time zone,
    invested_effort real DEFAULT 0,
    description text,
    id_project real,
    id_employee real,
    id_machine real,
    invested_effort_ma real DEFAULT 0
);


ALTER TABLE huett_db.effort OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 32873)
-- Name: effort_id_seq; Type: SEQUENCE; Schema: huett_db; Owner: postgres
--

CREATE SEQUENCE huett_db.effort_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE huett_db.effort_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 232
-- Name: effort_id_seq; Type: SEQUENCE OWNED BY; Schema: huett_db; Owner: postgres
--

ALTER SEQUENCE huett_db.effort_id_seq OWNED BY huett_db.effort.id;


--
-- TOC entry 227 (class 1259 OID 32838)
-- Name: employee; Type: TABLE; Schema: huett_db; Owner: postgres
--

CREATE TABLE huett_db.employee (
    id integer NOT NULL,
    name text,
    lastname text,
    hourlyrate real DEFAULT 0
);


ALTER TABLE huett_db.employee OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 32837)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: huett_db; Owner: postgres
--

CREATE SEQUENCE huett_db.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE huett_db.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 226
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: huett_db; Owner: postgres
--

ALTER SEQUENCE huett_db.employee_id_seq OWNED BY huett_db.employee.id;


--
-- TOC entry 229 (class 1259 OID 32856)
-- Name: machine; Type: TABLE; Schema: huett_db; Owner: postgres
--

CREATE TABLE huett_db.machine (
    id integer NOT NULL,
    model text,
    hourlyrate real DEFAULT 0
);


ALTER TABLE huett_db.machine OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 32855)
-- Name: machine_id_seq; Type: SEQUENCE; Schema: huett_db; Owner: postgres
--

CREATE SEQUENCE huett_db.machine_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE huett_db.machine_id_seq OWNER TO postgres;

--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 228
-- Name: machine_id_seq; Type: SEQUENCE OWNED BY; Schema: huett_db; Owner: postgres
--

ALTER SEQUENCE huett_db.machine_id_seq OWNED BY huett_db.machine.id;


--
-- TOC entry 235 (class 1259 OID 65606)
-- Name: material; Type: TABLE; Schema: huett_db; Owner: postgres
--

CREATE TABLE huett_db.material (
    id integer NOT NULL,
    name text,
    amount text,
    comment text,
    id_project real,
    offer_price real,
    invoice_price real DEFAULT 0
);


ALTER TABLE huett_db.material OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 65605)
-- Name: material_id_seq; Type: SEQUENCE; Schema: huett_db; Owner: postgres
--

CREATE SEQUENCE huett_db.material_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE huett_db.material_id_seq OWNER TO postgres;

--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 234
-- Name: material_id_seq; Type: SEQUENCE OWNED BY; Schema: huett_db; Owner: postgres
--

ALTER SEQUENCE huett_db.material_id_seq OWNED BY huett_db.material.id;


--
-- TOC entry 231 (class 1259 OID 32865)
-- Name: project; Type: TABLE; Schema: huett_db; Owner: postgres
--

CREATE TABLE huett_db.project (
    id integer NOT NULL,
    name text,
    sell_price real,
    start timestamp with time zone,
    "end" timestamp with time zone,
    scheduled_delivery timestamp with time zone,
    active boolean,
    order_number text,
    job_number text
);


ALTER TABLE huett_db.project OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 32864)
-- Name: project_id_seq; Type: SEQUENCE; Schema: huett_db; Owner: postgres
--

CREATE SEQUENCE huett_db.project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE huett_db.project_id_seq OWNER TO postgres;

--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 230
-- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: huett_db; Owner: postgres
--

ALTER SEQUENCE huett_db.project_id_seq OWNED BY huett_db.project.id;


--
-- TOC entry 3223 (class 2604 OID 32877)
-- Name: effort id; Type: DEFAULT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.effort ALTER COLUMN id SET DEFAULT nextval('huett_db.effort_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 32841)
-- Name: employee id; Type: DEFAULT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.employee ALTER COLUMN id SET DEFAULT nextval('huett_db.employee_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 32859)
-- Name: machine id; Type: DEFAULT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.machine ALTER COLUMN id SET DEFAULT nextval('huett_db.machine_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 65609)
-- Name: material id; Type: DEFAULT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.material ALTER COLUMN id SET DEFAULT nextval('huett_db.material_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 32868)
-- Name: project id; Type: DEFAULT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.project ALTER COLUMN id SET DEFAULT nextval('huett_db.project_id_seq'::regclass);


--
-- TOC entry 3387 (class 0 OID 32874)
-- Dependencies: 233
-- Data for Name: effort; Type: TABLE DATA; Schema: huett_db; Owner: postgres
--

INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (3, '2023-10-06 10:00:00+00', 2, NULL, 1, 3, 2, 4);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (1, '2023-10-06 10:00:00+00', 0.5, 'test3', 1, 1, 1, 5);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (4, '2023-10-07 10:00:00+00', 8, NULL, 2, 1, 2, 5);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (9, '2023-10-26 10:00:00+00', 2, NULL, 2, 3, 2, 2);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (10, '2023-10-26 10:00:00+00', 2, NULL, 2, 3, NULL, 0);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (2, '2023-10-06 10:00:00+00', 5, 'test2', 1, 2, NULL, 0);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (8, '2023-10-11 10:00:00+00', 4, NULL, 3, 4, NULL, 0);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (7, '2023-10-17 10:00:00+00', 5, NULL, 2, 2, NULL, 0);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (12, '2023-11-01 11:00:00+00', 0, NULL, 4, NULL, 4, 10);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (11, '2023-10-29 11:00:00+00', 50, NULL, 4, 5, NULL, 0);
INSERT INTO huett_db.effort (id, date, invested_effort, description, id_project, id_employee, id_machine, invested_effort_ma) VALUES (13, '2023-10-10 10:00:00+00', 10, NULL, 3, 2, 4, 20);


--
-- TOC entry 3381 (class 0 OID 32838)
-- Dependencies: 227
-- Data for Name: employee; Type: TABLE DATA; Schema: huett_db; Owner: postgres
--

INSERT INTO huett_db.employee (id, name, lastname, hourlyrate) VALUES (3, 'Jackob', 'Batman', 20);
INSERT INTO huett_db.employee (id, name, lastname, hourlyrate) VALUES (2, 'Mario', 'Karte', 50);
INSERT INTO huett_db.employee (id, name, lastname, hourlyrate) VALUES (4, 'Lara', 'Kraft', 80);
INSERT INTO huett_db.employee (id, name, lastname, hourlyrate) VALUES (1, 'Jackson', 'Martinez', 100);
INSERT INTO huett_db.employee (id, name, lastname, hourlyrate) VALUES (5, 'new', 'new', 150);


--
-- TOC entry 3383 (class 0 OID 32856)
-- Dependencies: 229
-- Data for Name: machine; Type: TABLE DATA; Schema: huett_db; Owner: postgres
--

INSERT INTO huett_db.machine (id, model, hourlyrate) VALUES (2, 'FAREX 100', 200);
INSERT INTO huett_db.machine (id, model, hourlyrate) VALUES (1, 'TREX 5000', 100);
INSERT INTO huett_db.machine (id, model, hourlyrate) VALUES (4, 'JAREX 600', 200);


--
-- TOC entry 3389 (class 0 OID 65606)
-- Dependencies: 235
-- Data for Name: material; Type: TABLE DATA; Schema: huett_db; Owner: postgres
--

INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (28, 'Rubber', '7 YG', 'diam vitae quam suspendisse potenti', 2, 200, 300);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (30, 'Plastic', '0 BO', 'in blandit', 2, 200, 300);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (32, 'Plexiglass', '6 OX', 'fringilla rhoncus', 2, 200, 300);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (24, 'Steel', '6 KO', 'habitasse platea dictumst morbi vestibulum velit id', 1, 100, 200);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (33, 'Plastic', '6 KW', 'duis bibendum', 1, 100, 200);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (36, 'Aluminum', '8 OG', 'convallis', 1, 100, 200);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (54, 'Öl', '50 Li', NULL, 3, 100, 150);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (55, 'Holz', '4 St', NULL, 3, 100, 150);
INSERT INTO huett_db.material (id, name, amount, comment, id_project, offer_price, invoice_price) VALUES (56, 'Öl', '50 Li', 'bla bla', 4, 9000, 0);


--
-- TOC entry 3385 (class 0 OID 32865)
-- Dependencies: 231
-- Data for Name: project; Type: TABLE DATA; Schema: huett_db; Owner: postgres
--

INSERT INTO huett_db.project (id, name, sell_price, start, "end", scheduled_delivery, active, order_number, job_number) VALUES (2, 'MD', 15000.5, '2023-11-08 11:00:00+00', '2023-11-29 11:00:00+00', '2023-12-20 11:00:00+00', NULL, '68F42A', 'AG5486');
INSERT INTO huett_db.project (id, name, sell_price, start, "end", scheduled_delivery, active, order_number, job_number) VALUES (1, 'Siemens', 5500.5, '2023-10-17 10:00:00+00', '2023-10-31 11:00:00+00', '2023-11-01 11:00:00+00', true, '864AfW', '642186B');
INSERT INTO huett_db.project (id, name, sell_price, start, "end", scheduled_delivery, active, order_number, job_number) VALUES (3, 'Schaeffler', 10000, '2023-10-02 10:00:00+00', '2023-10-19 10:00:00+00', '2023-10-31 11:00:00+00', true, 'AB6546', 'BC8797');
INSERT INTO huett_db.project (id, name, sell_price, start, "end", scheduled_delivery, active, order_number, job_number) VALUES (4, 'new projekt', 4500, '2023-10-28 10:00:00+00', '2023-11-07 11:00:00+00', '2023-11-15 11:00:00+00', true, '1111111', '222222');


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 232
-- Name: effort_id_seq; Type: SEQUENCE SET; Schema: huett_db; Owner: postgres
--

SELECT pg_catalog.setval('huett_db.effort_id_seq', 13, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 226
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: huett_db; Owner: postgres
--

SELECT pg_catalog.setval('huett_db.employee_id_seq', 5, true);


--
-- TOC entry 3406 (class 0 OID 0)
-- Dependencies: 228
-- Name: machine_id_seq; Type: SEQUENCE SET; Schema: huett_db; Owner: postgres
--

SELECT pg_catalog.setval('huett_db.machine_id_seq', 4, true);


--
-- TOC entry 3407 (class 0 OID 0)
-- Dependencies: 234
-- Name: material_id_seq; Type: SEQUENCE SET; Schema: huett_db; Owner: postgres
--

SELECT pg_catalog.setval('huett_db.material_id_seq', 56, true);


--
-- TOC entry 3408 (class 0 OID 0)
-- Dependencies: 230
-- Name: project_id_seq; Type: SEQUENCE SET; Schema: huett_db; Owner: postgres
--

SELECT pg_catalog.setval('huett_db.project_id_seq', 4, true);


--
-- TOC entry 3235 (class 2606 OID 32879)
-- Name: effort effort_pkey; Type: CONSTRAINT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.effort
    ADD CONSTRAINT effort_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 32843)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 32861)
-- Name: machine machine_pkey; Type: CONSTRAINT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.machine
    ADD CONSTRAINT machine_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 65611)
-- Name: material material_pkey; Type: CONSTRAINT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.material
    ADD CONSTRAINT material_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 32870)
-- Name: project project_pkey; Type: CONSTRAINT; Schema: huett_db; Owner: postgres
--

ALTER TABLE ONLY huett_db.project
    ADD CONSTRAINT project_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 3395
-- Name: DATABASE budibase; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE budibase FROM PUBLIC;
GRANT ALL ON DATABASE budibase TO PUBLIC;
GRANT ALL ON DATABASE budibase TO pg_write_all_data;
GRANT ALL ON DATABASE budibase TO pg_read_all_data;


--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA huett_db; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA huett_db TO pg_database_owner;
GRANT ALL ON SCHEMA huett_db TO PUBLIC;


-- Completed on 2023-10-30 19:59:59 UTC

--
-- PostgreSQL database dump complete
--

