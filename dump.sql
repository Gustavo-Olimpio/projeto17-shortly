--
-- PostgreSQL database dump
--

-- Dumped from database version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

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
-- Name: links; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.links (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    url text NOT NULL,
    "shortUrl" text NOT NULL,
    "visitCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: links_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.links_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: links_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.links_id_seq OWNED BY public.links.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    token text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now()
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: links id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links ALTER COLUMN id SET DEFAULT nextval('public.links_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: links; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.links VALUES (3, 1, 'abcd', 'a', 10, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (9, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'Hv_Dk8LBgm2JlBR8ypmf0', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (10, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', '7YBjTcnCzH13TPY5Dhimb', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (11, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'g-ZDvR_hU6ReV5sRkr8BZ', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (12, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'Kx6E_Siwm0eI43ZlzBR0F', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (13, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'GanYBfFlylmjTm82-ONon', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (14, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'LQFISOCpqgpIqbgZe1Rkd', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (15, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'dwXi5UoNCaFfW6TZBnlCX', 0, '2023-05-22 20:14:58.954988');
INSERT INTO public.links VALUES (16, 8, 'https://www.notion.so/bootcampra/Projeto-17-Shortly-API-f228e76e995d48a48cc84e4e5476cb71', 'pY-dAn5nFOaKBMCSjPON_', 0, '2023-05-22 20:14:58.954988');


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tokens VALUES (5, 7, '097007f8-19f4-4424-ac8f-b5f7cd5200d1', '2023-05-22 20:15:50.644128');
INSERT INTO public.tokens VALUES (6, 8, '24467e49-d874-4306-aec2-c17405b81ce8', '2023-05-22 20:15:50.644128');
INSERT INTO public.tokens VALUES (7, 9, '2ee4814e-016d-43ea-ad12-40a015adb1b9', '2023-05-22 20:15:50.644128');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.users VALUES (1, 'Gustavo', 'abc@hotmail.com', '123', '2023-05-22 20:15:38.623703');
INSERT INTO public.users VALUES (6, 'Gustavo', 'abcde@hotmail.com', '123', '2023-05-22 20:15:38.623703');
INSERT INTO public.users VALUES (7, 'Gustavo', 'abcdefg@hotmail.com', '$2b$10$Efn99NDbOZxUyelHmQRiUe7v4xOBmd7PXOQ.zDPFgbJufqwjAkV7W', '2023-05-22 20:15:38.623703');
INSERT INTO public.users VALUES (8, 'Fulano', 'abcdeasfg@hotmail.com', '$2b$10$IRp9TydeqlPLSYHI7evrHeWh2myivhf/AN7636aLYRPTZ33NKMRo2', '2023-05-22 20:15:38.623703');
INSERT INTO public.users VALUES (9, 'QUALQUER UM', 'abcdeasasfg@hotmail.com', '$2b$10$nJR9OahP8qEkHcRN7IyKv.ykgxj/OS3xPbR5zZgQQlU7UV99Kdw6W', '2023-05-22 20:15:38.623703');


--
-- Name: links_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.links_id_seq', 16, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tokens_id_seq', 7, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: links links_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT links_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: links links_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.links
    ADD CONSTRAINT "links_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: tokens tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

