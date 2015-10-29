--
-- PostgreSQL database dump
--

-- Dumped from database version 9.1.19
-- Dumped by pg_dump version 9.1.19
-- Started on 2015-10-29 19:20:05 BRST

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 168 (class 3079 OID 11684)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 1945 (class 0 OID 0)
-- Dependencies: 168
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 166 (class 1259 OID 38618)
-- Dependencies: 5
-- Name: atleta; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE atleta (
    id integer NOT NULL,
    equipe_id integer NOT NULL,
    nome character varying NOT NULL,
    apelido character varying,
    data_nascimento timestamp without time zone,
    foto bytea,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.atleta OWNER TO postgres;

--
-- TOC entry 165 (class 1259 OID 38616)
-- Dependencies: 166 5
-- Name: atleta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE atleta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.atleta_id_seq OWNER TO postgres;

--
-- TOC entry 1946 (class 0 OID 0)
-- Dependencies: 165
-- Name: atleta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE atleta_id_seq OWNED BY atleta.id;


--
-- TOC entry 164 (class 1259 OID 38607)
-- Dependencies: 5
-- Name: competicao; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE competicao (
    id integer NOT NULL,
    nome character varying NOT NULL,
    data_inicio timestamp without time zone,
    data_fim timestamp without time zone
);


ALTER TABLE public.competicao OWNER TO postgres;

--
-- TOC entry 167 (class 1259 OID 38634)
-- Dependencies: 5
-- Name: competicao_equipe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE competicao_equipe (
    equipe_id integer NOT NULL,
    competicao_id integer NOT NULL
);


ALTER TABLE public.competicao_equipe OWNER TO postgres;

--
-- TOC entry 163 (class 1259 OID 38605)
-- Dependencies: 164 5
-- Name: competicao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE competicao_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.competicao_id_seq OWNER TO postgres;

--
-- TOC entry 1947 (class 0 OID 0)
-- Dependencies: 163
-- Name: competicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE competicao_id_seq OWNED BY competicao.id;


--
-- TOC entry 162 (class 1259 OID 38596)
-- Dependencies: 5
-- Name: equipe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE equipe (
    id integer NOT NULL,
    nome character varying(255) NOT NULL,
    sigla character varying(100),
    emblema bytea,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    email character varying(100),
    data_fundacao date
);


ALTER TABLE public.equipe OWNER TO postgres;

--
-- TOC entry 161 (class 1259 OID 38594)
-- Dependencies: 162 5
-- Name: equipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE equipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.equipe_id_seq OWNER TO postgres;

--
-- TOC entry 1948 (class 0 OID 0)
-- Dependencies: 161
-- Name: equipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE equipe_id_seq OWNED BY equipe.id;


--
-- TOC entry 1812 (class 2604 OID 38621)
-- Dependencies: 166 165 166
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atleta ALTER COLUMN id SET DEFAULT nextval('atleta_id_seq'::regclass);


--
-- TOC entry 1811 (class 2604 OID 38610)
-- Dependencies: 164 163 164
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competicao ALTER COLUMN id SET DEFAULT nextval('competicao_id_seq'::regclass);


--
-- TOC entry 1810 (class 2604 OID 38599)
-- Dependencies: 161 162 162
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY equipe ALTER COLUMN id SET DEFAULT nextval('equipe_id_seq'::regclass);


--
-- TOC entry 1936 (class 0 OID 38618)
-- Dependencies: 166 1938
-- Data for Name: atleta; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY atleta (id, equipe_id, nome, apelido, data_nascimento, foto, created_at, updated_at) FROM stdin;
1	1	Kieza	K9	1980-01-01 00:00:00	\N	\N	\N
2	1	Maxi	Primo do Messi	1980-01-02 00:00:00	\N	\N	\N
\.


--
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 165
-- Name: atleta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atleta_id_seq', 1, false);


--
-- TOC entry 1934 (class 0 OID 38607)
-- Dependencies: 164 1938
-- Data for Name: competicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY competicao (id, nome, data_inicio, data_fim) FROM stdin;
\.


--
-- TOC entry 1937 (class 0 OID 38634)
-- Dependencies: 167 1938
-- Data for Name: competicao_equipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY competicao_equipe (equipe_id, competicao_id) FROM stdin;
\.


--
-- TOC entry 1950 (class 0 OID 0)
-- Dependencies: 163
-- Name: competicao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('competicao_id_seq', 1, false);


--
-- TOC entry 1932 (class 0 OID 38596)
-- Dependencies: 162 1938
-- Data for Name: equipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY equipe (id, nome, sigla, emblema, created_at, updated_at, email, data_fundacao) FROM stdin;
1	Esporte Clube Bahia	ECB	\N	\N	\N	\N	\N
4	aaaa	aaa	\N	2015-10-29 13:02:40	2015-10-29 13:02:40	\N	\N
5	aaaa	aaa	\N	2015-10-29 13:20:11	2015-10-29 13:20:11	\N	\N
6	aaaaa	aaa	\N	2015-10-29 13:21:44	2015-10-29 13:21:44	ss@aa.com	\N
7	aaaa	aaa	\N	2015-10-29 13:23:17	2015-10-29 13:23:17	\N	\N
34	aaaa	aaa	\N	2015-10-29 14:15:59	2015-10-29 14:15:59	\N	\N
\.


--
-- TOC entry 1951 (class 0 OID 0)
-- Dependencies: 161
-- Name: equipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('equipe_id_seq', 34, true);


--
-- TOC entry 1818 (class 2606 OID 38626)
-- Dependencies: 166 166 1939
-- Name: atleta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY atleta
    ADD CONSTRAINT atleta_pkey PRIMARY KEY (id);


--
-- TOC entry 1822 (class 2606 OID 38638)
-- Dependencies: 167 167 167 1939
-- Name: competicao_equipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_pkey PRIMARY KEY (equipe_id, competicao_id);


--
-- TOC entry 1816 (class 2606 OID 38615)
-- Dependencies: 164 164 1939
-- Name: competicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY competicao
    ADD CONSTRAINT competicao_pkey PRIMARY KEY (id);


--
-- TOC entry 1814 (class 2606 OID 38604)
-- Dependencies: 162 162 1939
-- Name: equipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY equipe
    ADD CONSTRAINT equipe_pkey PRIMARY KEY (id);


--
-- TOC entry 1823 (class 1259 OID 38649)
-- Dependencies: 167 1939
-- Name: equipe_has_competicao_fkindex1; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX equipe_has_competicao_fkindex1 ON competicao_equipe USING btree (equipe_id);


--
-- TOC entry 1824 (class 1259 OID 38650)
-- Dependencies: 167 1939
-- Name: equipe_has_competicao_fkindex2; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX equipe_has_competicao_fkindex2 ON competicao_equipe USING btree (competicao_id);


--
-- TOC entry 1819 (class 1259 OID 38632)
-- Dependencies: 166 1939
-- Name: idx_fk_atleta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX idx_fk_atleta ON atleta USING btree (equipe_id);


--
-- TOC entry 1820 (class 1259 OID 38633)
-- Dependencies: 166 1939
-- Name: ifk_equipe_atleta; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_equipe_atleta ON atleta USING btree (equipe_id);


--
-- TOC entry 1825 (class 1259 OID 38651)
-- Dependencies: 167 1939
-- Name: ifk_rel_02; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_02 ON competicao_equipe USING btree (equipe_id);


--
-- TOC entry 1826 (class 1259 OID 38652)
-- Dependencies: 167 1939
-- Name: ifk_rel_03; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX ifk_rel_03 ON competicao_equipe USING btree (competicao_id);


--
-- TOC entry 1827 (class 2606 OID 38627)
-- Dependencies: 166 162 1813 1939
-- Name: atleta_equipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY atleta
    ADD CONSTRAINT atleta_equipe_id_fkey FOREIGN KEY (equipe_id) REFERENCES equipe(id);


--
-- TOC entry 1829 (class 2606 OID 38644)
-- Dependencies: 164 1815 167 1939
-- Name: competicao_equipe_competicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_competicao_id_fkey FOREIGN KEY (competicao_id) REFERENCES competicao(id);


--
-- TOC entry 1828 (class 2606 OID 38639)
-- Dependencies: 1813 167 162 1939
-- Name: competicao_equipe_equipe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_equipe_id_fkey FOREIGN KEY (equipe_id) REFERENCES equipe(id);


--
-- TOC entry 1944 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2015-10-29 19:20:05 BRST

--
-- PostgreSQL database dump complete
--

