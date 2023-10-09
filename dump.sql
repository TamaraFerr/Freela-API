--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2023-10-09 11:31:24

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
-- TOC entry 219 (class 1259 OID 16430)
-- Name: cats; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cats (
    id integer NOT NULL,
    name text NOT NULL,
    caracteries text NOT NULL,
    "tutorId" integer NOT NULL,
    available boolean NOT NULL
);


--
-- TOC entry 218 (class 1259 OID 16429)
-- Name: cats_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3349 (class 0 OID 0)
-- Dependencies: 218
-- Name: cats_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cats_id_seq OWNED BY public.cats.id;


--
-- TOC entry 217 (class 1259 OID 16413)
-- Name: sessions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.sessions (
    id integer NOT NULL,
    token text NOT NULL,
    "userId" integer NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 216 (class 1259 OID 16412)
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.sessions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 216
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.sessions_id_seq OWNED BY public.sessions.id;


--
-- TOC entry 215 (class 1259 OID 16399)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name text NOT NULL,
    cpf character varying(11) NOT NULL,
    phone text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 214 (class 1259 OID 16398)
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
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 214
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3187 (class 2604 OID 16433)
-- Name: cats id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats ALTER COLUMN id SET DEFAULT nextval('public.cats_id_seq'::regclass);


--
-- TOC entry 3185 (class 2604 OID 16416)
-- Name: sessions id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions ALTER COLUMN id SET DEFAULT nextval('public.sessions_id_seq'::regclass);


--
-- TOC entry 3183 (class 2604 OID 16402)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3199 (class 2606 OID 16437)
-- Name: cats cats_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats
    ADD CONSTRAINT cats_pkey PRIMARY KEY (id);


--
-- TOC entry 3195 (class 2606 OID 16421)
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- TOC entry 3197 (class 2606 OID 16423)
-- Name: sessions sessions_token_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_token_key UNIQUE (token);


--
-- TOC entry 3189 (class 2606 OID 16409)
-- Name: users users_cpf_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cpf_key UNIQUE (cpf);


--
-- TOC entry 3191 (class 2606 OID 16411)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 3193 (class 2606 OID 16407)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16438)
-- Name: cats cats_tutorId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cats
    ADD CONSTRAINT "cats_tutorId_fkey" FOREIGN KEY ("tutorId") REFERENCES public.users(id);


--
-- TOC entry 3200 (class 2606 OID 16424)
-- Name: sessions sessions_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT "sessions_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id);


-- Completed on 2023-10-09 11:31:25

--
-- PostgreSQL database dump complete
--

