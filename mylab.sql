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


ALTER TABLE public.atleta OWNER TO "Ronald";

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


ALTER TABLE public.atleta_id_seq OWNER TO "Ronald";

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


ALTER TABLE public.competicao OWNER TO "Ronald";

--
-- TOC entry 167 (class 1259 OID 38634)
-- Dependencies: 5
-- Name: competicao_equipe; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE competicao_equipe (
    equipe_id integer NOT NULL,
    competicao_id integer NOT NULL
);


ALTER TABLE public.competicao_equipe OWNER TO "Ronald";

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


ALTER TABLE public.competicao_id_seq OWNER TO "Ronald";

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


ALTER TABLE public.equipe OWNER TO "Ronald";

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


ALTER TABLE public.equipe_id_seq OWNER TO "Ronald";

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
-- TOC entry 1949 (class 0 OID 0)
-- Dependencies: 165
-- Name: atleta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('atleta_id_seq', 1, false);


SELECT pg_catalog.setval('competicao_id_seq', 1, false);


SELECT pg_catalog.setval('equipe_id_seq', 1, true);


ALTER TABLE ONLY atleta
    ADD CONSTRAINT atleta_pkey PRIMARY KEY (id);


ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_pkey PRIMARY KEY (equipe_id, competicao_id);


ALTER TABLE ONLY competicao
    ADD CONSTRAINT competicao_pkey PRIMARY KEY (id);



ALTER TABLE ONLY equipe
    ADD CONSTRAINT equipe_pkey PRIMARY KEY (id);


CREATE INDEX equipe_has_competicao_fkindex1 ON competicao_equipe USING btree (equipe_id);


CREATE INDEX equipe_has_competicao_fkindex2 ON competicao_equipe USING btree (competicao_id);



CREATE INDEX idx_fk_atleta ON atleta USING btree (equipe_id);



CREATE INDEX ifk_equipe_atleta ON atleta USING btree (equipe_id);


CREATE INDEX ifk_rel_02 ON competicao_equipe USING btree (equipe_id);


CREATE INDEX ifk_rel_03 ON competicao_equipe USING btree (competicao_id);


ALTER TABLE ONLY atleta
    ADD CONSTRAINT atleta_equipe_id_fkey FOREIGN KEY (equipe_id) REFERENCES equipe(id);


ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_competicao_id_fkey FOREIGN KEY (competicao_id) REFERENCES competicao(id);


ALTER TABLE ONLY competicao_equipe
    ADD CONSTRAINT competicao_equipe_equipe_id_fkey FOREIGN KEY (equipe_id) REFERENCES equipe(id);


