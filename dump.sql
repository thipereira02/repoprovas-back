--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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
-- Name: categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: subjects; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.subjects (
    id integer NOT NULL,
    name character varying NOT NULL,
    "termId" integer NOT NULL
);


--
-- Name: subjectsTeachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."subjectsTeachers" (
    id integer NOT NULL,
    "teacherId" integer NOT NULL,
    "subjectId" integer NOT NULL
);


--
-- Name: subjectsTeachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."subjectsTeachers_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjectsTeachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."subjectsTeachers_id_seq" OWNED BY public."subjectsTeachers".id;


--
-- Name: subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.subjects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.subjects_id_seq OWNED BY public.subjects.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.teachers (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.teachers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.teachers_id_seq OWNED BY public.teachers.id;


--
-- Name: terms; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.terms (
    id integer NOT NULL,
    name character varying NOT NULL
);


--
-- Name: terms_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.terms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: terms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.terms_id_seq OWNED BY public.terms.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tests (
    id integer NOT NULL,
    name character varying NOT NULL,
    "pdfLink" character varying NOT NULL,
    "categoryId" integer NOT NULL,
    "teacherId" integer NOT NULL,
    "subjectId" integer NOT NULL
);


--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.tests_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.tests_id_seq OWNED BY public.tests.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: subjects id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects ALTER COLUMN id SET DEFAULT nextval('public.subjects_id_seq'::regclass);


--
-- Name: subjectsTeachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."subjectsTeachers" ALTER COLUMN id SET DEFAULT nextval('public."subjectsTeachers_id_seq"'::regclass);


--
-- Name: teachers id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers ALTER COLUMN id SET DEFAULT nextval('public.teachers_id_seq'::regclass);


--
-- Name: terms id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms ALTER COLUMN id SET DEFAULT nextval('public.terms_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tests ALTER COLUMN id SET DEFAULT nextval('public.tests_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.categories VALUES (1, 'P1');
INSERT INTO public.categories VALUES (2, 'P2');
INSERT INTO public.categories VALUES (3, 'P3');
INSERT INTO public.categories VALUES (4, '2ch');
INSERT INTO public.categories VALUES (5, 'Outras');


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.migrations VALUES (1, 1639594779540, 'CreateCategoriesTable1639594779540');
INSERT INTO public.migrations VALUES (2, 1639678308790, 'CreateSubjectsTable1639678308790');
INSERT INTO public.migrations VALUES (3, 1639682277560, 'CreateTermsTable1639682277560');
INSERT INTO public.migrations VALUES (4, 1639760661304, 'CreateTermsTable1639760661304');
INSERT INTO public.migrations VALUES (5, 1639762614689, 'CreateTeachersTable1639762614689');
INSERT INTO public.migrations VALUES (6, 1639763775904, 'CreateTestsTable1639763775904');
INSERT INTO public.migrations VALUES (7, 1639765451935, 'CreateSubjectsTeachersTable1639765451935');


--
-- Data for Name: subjects; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.subjects VALUES (1, 'Cálculo 1', 1);
INSERT INTO public.subjects VALUES (2, 'Física 1', 1);
INSERT INTO public.subjects VALUES (3, 'Geometria Analítica', 1);
INSERT INTO public.subjects VALUES (4, 'Cálculo 2', 2);
INSERT INTO public.subjects VALUES (5, 'Física 2', 2);
INSERT INTO public.subjects VALUES (6, 'Química 1', 2);
INSERT INTO public.subjects VALUES (7, 'Álgebra Linear', 2);
INSERT INTO public.subjects VALUES (8, 'Cálculo 3', 3);
INSERT INTO public.subjects VALUES (9, 'Física 3', 3);
INSERT INTO public.subjects VALUES (10, 'Química 2', 3);
INSERT INTO public.subjects VALUES (11, 'Estatística', 3);
INSERT INTO public.subjects VALUES (12, 'Cálculo 4', 4);
INSERT INTO public.subjects VALUES (13, 'Geologia', 4);
INSERT INTO public.subjects VALUES (14, 'Mecânica 1', 4);
INSERT INTO public.subjects VALUES (15, 'Ecologia', 4);
INSERT INTO public.subjects VALUES (16, 'Mecânica 2', 5);
INSERT INTO public.subjects VALUES (17, 'Resistência dos Materiais 1', 5);
INSERT INTO public.subjects VALUES (18, 'Hidráulica', 5);
INSERT INTO public.subjects VALUES (19, 'Arquitetura', 5);
INSERT INTO public.subjects VALUES (20, 'Resistência dos Materiais 2', 6);
INSERT INTO public.subjects VALUES (21, 'Administração', 6);
INSERT INTO public.subjects VALUES (22, 'Hidrologia', 6);
INSERT INTO public.subjects VALUES (23, 'Mecânica dos Solos', 6);
INSERT INTO public.subjects VALUES (24, 'Transportes Urbanos', 7);
INSERT INTO public.subjects VALUES (25, 'Projeto Estrutural', 7);


--
-- Data for Name: subjectsTeachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public."subjectsTeachers" VALUES (1, 1, 1);
INSERT INTO public."subjectsTeachers" VALUES (2, 1, 4);
INSERT INTO public."subjectsTeachers" VALUES (3, 1, 12);
INSERT INTO public."subjectsTeachers" VALUES (4, 2, 1);
INSERT INTO public."subjectsTeachers" VALUES (5, 2, 4);
INSERT INTO public."subjectsTeachers" VALUES (6, 2, 7);
INSERT INTO public."subjectsTeachers" VALUES (7, 2, 12);
INSERT INTO public."subjectsTeachers" VALUES (8, 3, 3);
INSERT INTO public."subjectsTeachers" VALUES (9, 3, 7);
INSERT INTO public."subjectsTeachers" VALUES (10, 4, 2);
INSERT INTO public."subjectsTeachers" VALUES (11, 4, 5);
INSERT INTO public."subjectsTeachers" VALUES (12, 4, 9);
INSERT INTO public."subjectsTeachers" VALUES (13, 5, 2);
INSERT INTO public."subjectsTeachers" VALUES (14, 5, 9);
INSERT INTO public."subjectsTeachers" VALUES (15, 5, 8);
INSERT INTO public."subjectsTeachers" VALUES (16, 6, 6);
INSERT INTO public."subjectsTeachers" VALUES (17, 6, 10);
INSERT INTO public."subjectsTeachers" VALUES (18, 7, 13);
INSERT INTO public."subjectsTeachers" VALUES (19, 7, 15);
INSERT INTO public."subjectsTeachers" VALUES (20, 8, 8);
INSERT INTO public."subjectsTeachers" VALUES (21, 8, 11);
INSERT INTO public."subjectsTeachers" VALUES (22, 9, 14);
INSERT INTO public."subjectsTeachers" VALUES (23, 9, 16);
INSERT INTO public."subjectsTeachers" VALUES (24, 10, 14);
INSERT INTO public."subjectsTeachers" VALUES (25, 10, 17);
INSERT INTO public."subjectsTeachers" VALUES (26, 11, 18);
INSERT INTO public."subjectsTeachers" VALUES (27, 11, 22);
INSERT INTO public."subjectsTeachers" VALUES (28, 12, 19);
INSERT INTO public."subjectsTeachers" VALUES (29, 13, 21);
INSERT INTO public."subjectsTeachers" VALUES (30, 14, 20);
INSERT INTO public."subjectsTeachers" VALUES (31, 14, 25);
INSERT INTO public."subjectsTeachers" VALUES (32, 15, 24);
INSERT INTO public."subjectsTeachers" VALUES (33, 16, 23);
INSERT INTO public."subjectsTeachers" VALUES (34, 16, 25);
INSERT INTO public."subjectsTeachers" VALUES (35, 17, 17);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.teachers VALUES (1, 'Clara Cardoso Gomes');
INSERT INTO public.teachers VALUES (2, 'Arthur Cavalcanti');
INSERT INTO public.teachers VALUES (3, 'Gabriel Ribeiro');
INSERT INTO public.teachers VALUES (4, 'Isabella Oliveira');
INSERT INTO public.teachers VALUES (5, 'Luis Castro Sousa');
INSERT INTO public.teachers VALUES (6, 'Anna Rodrigues');
INSERT INTO public.teachers VALUES (7, 'Thiago Rodrigues');
INSERT INTO public.teachers VALUES (8, 'Lavinia Oliveira');
INSERT INTO public.teachers VALUES (9, 'Ronald S. Nelson');
INSERT INTO public.teachers VALUES (10, 'Igor Castro');
INSERT INTO public.teachers VALUES (11, 'Luiza Lima');
INSERT INTO public.teachers VALUES (12, 'Valentine Rouleau');
INSERT INTO public.teachers VALUES (13, 'Rosa Calabrese');
INSERT INTO public.teachers VALUES (14, 'Lucas Araujo');
INSERT INTO public.teachers VALUES (15, 'Leonor Barbosa');
INSERT INTO public.teachers VALUES (16, 'Raissa Sousa');
INSERT INTO public.teachers VALUES (17, 'Aidan Murphy');


--
-- Data for Name: terms; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.terms VALUES (1, '1º período');
INSERT INTO public.terms VALUES (2, '2º período');
INSERT INTO public.terms VALUES (3, '3º período');
INSERT INTO public.terms VALUES (4, '4º período');
INSERT INTO public.terms VALUES (5, '5º período');
INSERT INTO public.terms VALUES (6, '6º período');
INSERT INTO public.terms VALUES (7, 'Eletivas');


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO public.tests VALUES (1, '2021.1', 'https://www.website.com/sample.pdf', 1, 1, 1);
INSERT INTO public.tests VALUES (2, '2021.1', 'https://www.website.com/sample.pdf', 4, 11, 18);
INSERT INTO public.tests VALUES (3, '2019.2', 'https://www.website.com/sample.pdf', 2, 8, 8);
INSERT INTO public.tests VALUES (4, '2020.1', 'https://www.website.com/sample.pdf', 1, 4, 5);
INSERT INTO public.tests VALUES (5, '2018.1', 'https://www.website.com/sample.pdf', 3, 8, 8);
INSERT INTO public.tests VALUES (6, '2019.2', 'https://www.website.com/sample.pdf', 2, 2, 4);
INSERT INTO public.tests VALUES (7, '2020.1', 'https://www.website.com/sample.pdf', 2, 8, 11);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.categories_id_seq', 5, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 7, true);


--
-- Name: subjectsTeachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."subjectsTeachers_id_seq"', 35, true);


--
-- Name: subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.subjects_id_seq', 25, true);


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.teachers_id_seq', 17, true);


--
-- Name: terms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.terms_id_seq', 7, true);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tests_id_seq', 7, true);


--
-- Name: subjectsTeachers PK_134de7cd001186d40994a38aae3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."subjectsTeachers"
    ADD CONSTRAINT "PK_134de7cd001186d40994a38aae3" PRIMARY KEY (id);


--
-- Name: subjects PK_1a023685ac2b051b4e557b0b280; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT "PK_1a023685ac2b051b4e557b0b280" PRIMARY KEY (id);


--
-- Name: categories PK_24dbc6126a28ff948da33e97d3b; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT "PK_24dbc6126a28ff948da33e97d3b" PRIMARY KEY (id);


--
-- Name: terms PK_33b6fe77d6ace7ff43cc8a65958; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.terms
    ADD CONSTRAINT "PK_33b6fe77d6ace7ff43cc8a65958" PRIMARY KEY (id);


--
-- Name: tests PK_4301ca51edf839623386860aed2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "PK_4301ca51edf839623386860aed2" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: teachers PK_a8d4f83be3abe4c687b0a0093c8; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.teachers
    ADD CONSTRAINT "PK_a8d4f83be3abe4c687b0a0093c8" PRIMARY KEY (id);


--
-- Name: tests FK_7f83dda887820244f729fe7e4c0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "FK_7f83dda887820244f729fe7e4c0" FOREIGN KEY ("teacherId") REFERENCES public.teachers(id);


--
-- Name: tests FK_910215de6563cf9f350eeb60a1d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "FK_910215de6563cf9f350eeb60a1d" FOREIGN KEY ("subjectId") REFERENCES public.subjects(id);


--
-- Name: tests FK_a59dc4db9bd3d8407148a9b214b; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tests
    ADD CONSTRAINT "FK_a59dc4db9bd3d8407148a9b214b" FOREIGN KEY ("categoryId") REFERENCES public.categories(id);


--
-- Name: subjects FK_c30a2867f3d9917aee56d2ef14d; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.subjects
    ADD CONSTRAINT "FK_c30a2867f3d9917aee56d2ef14d" FOREIGN KEY ("termId") REFERENCES public.terms(id);


--
-- Name: subjectsTeachers FK_f7ec49e410fb1c02006540795c8; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."subjectsTeachers"
    ADD CONSTRAINT "FK_f7ec49e410fb1c02006540795c8" FOREIGN KEY ("subjectId") REFERENCES public.subjects(id);


--
-- Name: subjectsTeachers FK_fa96077cc29fa6186147afffdb6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."subjectsTeachers"
    ADD CONSTRAINT "FK_fa96077cc29fa6186147afffdb6" FOREIGN KEY ("teacherId") REFERENCES public.teachers(id);


--
-- PostgreSQL database dump complete
--

