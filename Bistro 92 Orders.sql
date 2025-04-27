--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-04-27 15:32:21

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16602)
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "ID" integer NOT NULL,
    "OrderID" integer NOT NULL,
    "TableNo" integer NOT NULL,
    "Item" text NOT NULL,
    "Quantity" integer NOT NULL,
    "ConfirmedAt" timestamp without time zone,
    "CompletedAt" timestamp without time zone
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16601)
-- Name: Orders_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_ID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_ID_seq" OWNER TO postgres;

--
-- TOC entry 4850 (class 0 OID 0)
-- Dependencies: 217
-- Name: Orders_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_ID_seq" OWNED BY public."Orders"."ID";


--
-- TOC entry 4695 (class 2604 OID 16605)
-- Name: Orders ID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "ID" SET DEFAULT nextval('public."Orders_ID_seq"'::regclass);


--
-- TOC entry 4844 (class 0 OID 16602)
-- Dependencies: 218
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" ("ID", "OrderID", "TableNo", "Item", "Quantity", "ConfirmedAt", "CompletedAt") FROM stdin;
1	1	1	Burger	3	2025-04-27 06:24:32	2025-04-27 06:42:32
2	1	1	Pasta	1	2025-04-27 06:24:32	2025-04-27 06:48:23
3	2	2	Pasta	2	2025-04-27 06:29:46	2025-04-27 06:54:46
4	2	2	Cold Drinks	2	2025-04-27 06:29:46	2025-04-27 06:54:46
5	3	3	Pizza	2	2025-04-27 06:43:11	2025-04-27 07:01:46
6	4	4	Pizza	1	2025-04-27 07:08:02	2025-04-27 07:33:26
7	5	5	Pasta	4	2025-04-27 07:39:08	2025-04-27 08:03:45
8	5	5	Cold Drinks	4	2025-04-27 07:39:08	2025-04-27 08:03:45
9	6	1	Cold Drinks	4	2025-04-27 07:41:27	2025-04-27 07:42:15
10	7	2	Pizza	1	2025-04-27 08:13:35	2025-04-27 08:31:22
11	7	2	Salad	1	2025-04-27 08:13:35	2025-04-27 08:28:07
12	8	6	Burger	5	2025-04-27 08:21:11	2025-04-27 09:02:13
13	9	8	Burger	2	2025-04-27 08:34:52	2025-04-27 08:58:33
14	9	8	Cold Drinks	2	2025-04-27 08:34:52	2025-04-27 08:58:33
15	10	3	Cold Drinks	4	2025-04-27 08:41:21	2025-04-27 08:43:26
16	11	6	Cold Drinks	4	2025-04-27 08:50:54	2025-04-27 08:51:12
17	12	8	Salad	2	2025-04-27 09:10:04	2025-04-27 09:29:55
18	13	7	Pasta	3	2025-04-27 09:29:17	\N
19	13	7	Salad	2	2025-04-27 09:29:17	\N
20	14	9	Pizza	4	2025-04-27 09:44:25	\N
\.


--
-- TOC entry 4851 (class 0 OID 0)
-- Dependencies: 217
-- Name: Orders_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_ID_seq"', 20, true);


--
-- TOC entry 4697 (class 2606 OID 16609)
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("ID");


-- Completed on 2025-04-27 15:32:21

--
-- PostgreSQL database dump complete
--

