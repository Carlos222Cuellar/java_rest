--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.4
-- Dumped by pg_dump version 9.6.4

-- Started on 2017-11-23 17:13:02 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2329 (class 1262 OID 17982)
-- Name: posts; Type: DATABASE; Schema: -; Owner: mortal2017
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 17983)
-- Name: categoria; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE categoria (
    id_categoria integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE categoria OWNER TO mortal2017;

--
-- TOC entry 186 (class 1259 OID 17990)
-- Name: categoria_id_categoria_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE categoria_id_categoria_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categoria_id_categoria_seq OWNER TO mortal2017;

--
-- TOC entry 2332 (class 0 OID 0)
-- Dependencies: 186
-- Name: categoria_id_categoria_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE categoria_id_categoria_seq OWNED BY categoria.id_categoria;


--
-- TOC entry 187 (class 1259 OID 17992)
-- Name: cometario; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE cometario (
    id_comentario integer NOT NULL,
    id_post integer,
    fecha timestamp without time zone NOT NULL,
    id_usuario integer NOT NULL,
    comentario text,
    aprobado boolean DEFAULT false
);


ALTER TABLE cometario OWNER TO mortal2017;

--
-- TOC entry 188 (class 1259 OID 17999)
-- Name: cometario_id_comentario_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE cometario_id_comentario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cometario_id_comentario_seq OWNER TO mortal2017;

--
-- TOC entry 2333 (class 0 OID 0)
-- Dependencies: 188
-- Name: cometario_id_comentario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE cometario_id_comentario_seq OWNED BY cometario.id_comentario;


--
-- TOC entry 189 (class 1259 OID 18001)
-- Name: meta; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE meta (
    id_meta integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE meta OWNER TO mortal2017;

--
-- TOC entry 190 (class 1259 OID 18008)
-- Name: meta_id_meta_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE meta_id_meta_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE meta_id_meta_seq OWNER TO mortal2017;

--
-- TOC entry 2334 (class 0 OID 0)
-- Dependencies: 190
-- Name: meta_id_meta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE meta_id_meta_seq OWNED BY meta.id_meta;


--
-- TOC entry 191 (class 1259 OID 18010)
-- Name: paso; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE paso (
    id_paso integer NOT NULL,
    id_tipo_paso integer,
    id_categoria integer,
    id_rol integer,
    nombre character varying(150) NOT NULL,
    comentarios text
);


ALTER TABLE paso OWNER TO mortal2017;

--
-- TOC entry 192 (class 1259 OID 18016)
-- Name: paso_id_paso_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE paso_id_paso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE paso_id_paso_seq OWNER TO mortal2017;

--
-- TOC entry 2335 (class 0 OID 0)
-- Dependencies: 192
-- Name: paso_id_paso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE paso_id_paso_seq OWNED BY paso.id_paso;


--
-- TOC entry 193 (class 1259 OID 18018)
-- Name: post; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE post (
    id_post integer NOT NULL,
    id_tipo_post integer,
    id_categoria integer,
    fecha timestamp without time zone NOT NULL,
    aprobacion_comentarios boolean DEFAULT false,
    titulo character varying(150) NOT NULL,
    descripcion text
);


ALTER TABLE post OWNER TO mortal2017;

--
-- TOC entry 194 (class 1259 OID 18025)
-- Name: post_id_post_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE post_id_post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE post_id_post_seq OWNER TO mortal2017;

--
-- TOC entry 2336 (class 0 OID 0)
-- Dependencies: 194
-- Name: post_id_post_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE post_id_post_seq OWNED BY post.id_post;


--
-- TOC entry 195 (class 1259 OID 18027)
-- Name: post_meta; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE post_meta (
    id_post integer NOT NULL,
    id_meta integer NOT NULL
);


ALTER TABLE post_meta OWNER TO mortal2017;

--
-- TOC entry 196 (class 1259 OID 18030)
-- Name: post_paso; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE post_paso (
    id_post integer NOT NULL,
    id_paso integer NOT NULL,
    id_usuario integer,
    id_categoria integer,
    id_rol integer,
    aprobado boolean DEFAULT false,
    comentarios text
);


ALTER TABLE post_paso OWNER TO mortal2017;

--
-- TOC entry 197 (class 1259 OID 18037)
-- Name: post_seccion; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE post_seccion (
    id_post integer NOT NULL,
    id_seccion integer NOT NULL,
    valor text NOT NULL
);


ALTER TABLE post_seccion OWNER TO mortal2017;

--
-- TOC entry 198 (class 1259 OID 18043)
-- Name: rol; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE rol (
    id_rol integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE rol OWNER TO mortal2017;

--
-- TOC entry 199 (class 1259 OID 18050)
-- Name: rol_categoria; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE rol_categoria (
    id_rol integer NOT NULL,
    id_categoria integer NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE rol_categoria OWNER TO mortal2017;

--
-- TOC entry 200 (class 1259 OID 18054)
-- Name: rol_id_rol_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE rol_id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rol_id_rol_seq OWNER TO mortal2017;

--
-- TOC entry 2337 (class 0 OID 0)
-- Dependencies: 200
-- Name: rol_id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE rol_id_rol_seq OWNED BY rol.id_rol;


--
-- TOC entry 201 (class 1259 OID 18056)
-- Name: seccion; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE seccion (
    id_seccion integer NOT NULL,
    id_tipo_seccion integer,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE seccion OWNER TO mortal2017;

--
-- TOC entry 202 (class 1259 OID 18063)
-- Name: seccion_id_seccion_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE seccion_id_seccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seccion_id_seccion_seq OWNER TO mortal2017;

--
-- TOC entry 2338 (class 0 OID 0)
-- Dependencies: 202
-- Name: seccion_id_seccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE seccion_id_seccion_seq OWNED BY seccion.id_seccion;


--
-- TOC entry 203 (class 1259 OID 18065)
-- Name: tipo_paso; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE tipo_paso (
    id_tipo_paso integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE tipo_paso OWNER TO mortal2017;

--
-- TOC entry 204 (class 1259 OID 18072)
-- Name: tipo_paso_id_tipo_paso_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE tipo_paso_id_tipo_paso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_paso_id_tipo_paso_seq OWNER TO mortal2017;

--
-- TOC entry 2339 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_paso_id_tipo_paso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE tipo_paso_id_tipo_paso_seq OWNED BY tipo_paso.id_tipo_paso;


--
-- TOC entry 205 (class 1259 OID 18074)
-- Name: tipo_post; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE tipo_post (
    id_tipo_post integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE tipo_post OWNER TO mortal2017;

--
-- TOC entry 206 (class 1259 OID 18081)
-- Name: tipo_post_id_tipo_post_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE tipo_post_id_tipo_post_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_post_id_tipo_post_seq OWNER TO mortal2017;

--
-- TOC entry 2340 (class 0 OID 0)
-- Dependencies: 206
-- Name: tipo_post_id_tipo_post_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE tipo_post_id_tipo_post_seq OWNED BY tipo_post.id_tipo_post;


--
-- TOC entry 207 (class 1259 OID 18083)
-- Name: tipo_post_seccion; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE tipo_post_seccion (
    id_seccion integer NOT NULL,
    id_tipo_post integer NOT NULL,
    activo boolean DEFAULT true,
    obligatorio boolean DEFAULT false,
    peso integer DEFAULT 0 NOT NULL
);


ALTER TABLE tipo_post_seccion OWNER TO mortal2017;

--
-- TOC entry 208 (class 1259 OID 18089)
-- Name: tipo_seccion; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE tipo_seccion (
    id_tipo_seccion integer NOT NULL,
    nombre character varying(150) NOT NULL,
    activo boolean DEFAULT true,
    descripcion text
);


ALTER TABLE tipo_seccion OWNER TO mortal2017;

--
-- TOC entry 209 (class 1259 OID 18096)
-- Name: tipo_seccion_id_tipo_seccion_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE tipo_seccion_id_tipo_seccion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_seccion_id_tipo_seccion_seq OWNER TO mortal2017;

--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_seccion_id_tipo_seccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE tipo_seccion_id_tipo_seccion_seq OWNED BY tipo_seccion.id_tipo_seccion;


--
-- TOC entry 210 (class 1259 OID 18098)
-- Name: usuario; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE usuario (
    id_usuario integer NOT NULL,
    apellidos character varying(150) NOT NULL,
    nombres character varying(150) NOT NULL,
    fecha_nacimiento date NOT NULL,
    activo boolean DEFAULT true,
    comentarios text,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL
);


ALTER TABLE usuario OWNER TO mortal2017;

--
-- TOC entry 211 (class 1259 OID 18105)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: mortal2017
--

CREATE SEQUENCE usuario_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuario_id_usuario_seq OWNER TO mortal2017;

--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mortal2017
--

ALTER SEQUENCE usuario_id_usuario_seq OWNED BY usuario.id_usuario;


--
-- TOC entry 212 (class 1259 OID 18107)
-- Name: usuario_rol_categoria; Type: TABLE; Schema: public; Owner: mortal2017
--

CREATE TABLE usuario_rol_categoria (
    id_usuario integer NOT NULL,
    id_categoria integer NOT NULL,
    id_rol integer NOT NULL,
    activo boolean DEFAULT true
);


ALTER TABLE usuario_rol_categoria OWNER TO mortal2017;

--
-- TOC entry 2103 (class 2604 OID 18111)
-- Name: categoria id_categoria; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY categoria ALTER COLUMN id_categoria SET DEFAULT nextval('categoria_id_categoria_seq'::regclass);


--
-- TOC entry 2105 (class 2604 OID 18112)
-- Name: cometario id_comentario; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY cometario ALTER COLUMN id_comentario SET DEFAULT nextval('cometario_id_comentario_seq'::regclass);


--
-- TOC entry 2107 (class 2604 OID 18113)
-- Name: meta id_meta; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY meta ALTER COLUMN id_meta SET DEFAULT nextval('meta_id_meta_seq'::regclass);


--
-- TOC entry 2108 (class 2604 OID 18114)
-- Name: paso id_paso; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY paso ALTER COLUMN id_paso SET DEFAULT nextval('paso_id_paso_seq'::regclass);


--
-- TOC entry 2110 (class 2604 OID 18115)
-- Name: post id_post; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post ALTER COLUMN id_post SET DEFAULT nextval('post_id_post_seq'::regclass);


--
-- TOC entry 2113 (class 2604 OID 18116)
-- Name: rol id_rol; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY rol ALTER COLUMN id_rol SET DEFAULT nextval('rol_id_rol_seq'::regclass);


--
-- TOC entry 2116 (class 2604 OID 18117)
-- Name: seccion id_seccion; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY seccion ALTER COLUMN id_seccion SET DEFAULT nextval('seccion_id_seccion_seq'::regclass);


--
-- TOC entry 2118 (class 2604 OID 18118)
-- Name: tipo_paso id_tipo_paso; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_paso ALTER COLUMN id_tipo_paso SET DEFAULT nextval('tipo_paso_id_tipo_paso_seq'::regclass);


--
-- TOC entry 2120 (class 2604 OID 18119)
-- Name: tipo_post id_tipo_post; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_post ALTER COLUMN id_tipo_post SET DEFAULT nextval('tipo_post_id_tipo_post_seq'::regclass);


--
-- TOC entry 2125 (class 2604 OID 18120)
-- Name: tipo_seccion id_tipo_seccion; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_seccion ALTER COLUMN id_tipo_seccion SET DEFAULT nextval('tipo_seccion_id_tipo_seccion_seq'::regclass);


--
-- TOC entry 2127 (class 2604 OID 18121)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2297 (class 0 OID 17983)
-- Dependencies: 185
-- Data for Name: categoria; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO categoria VALUES (1, 'ingenieria en sistemas', true, 'los meros buenos');
INSERT INTO categoria VALUES (2, 'ingenieria industrial', true, 'los caes mal');
INSERT INTO categoria VALUES (3, 'ingenieria civil', false, 'caen mas o menos');


--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 186
-- Name: categoria_id_categoria_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('categoria_id_categoria_seq', 1, false);


--
-- TOC entry 2299 (class 0 OID 17992)
-- Dependencies: 187
-- Data for Name: cometario; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO cometario VALUES (1, 1, '2017-09-09 00:00:00', 1, 'mis amigos', true);
INSERT INTO cometario VALUES (2, 2, '2017-10-09 00:00:00', 2, 'probando base de datos', true);
INSERT INTO cometario VALUES (3, 1, '2017-01-01 00:00:00', 1, 'que bonita morrita', true);


--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 188
-- Name: cometario_id_comentario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('cometario_id_comentario_seq', 2, true);


--
-- TOC entry 2301 (class 0 OID 18001)
-- Dependencies: 189
-- Data for Name: meta; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO meta VALUES (1, 'mas like', true, 'se cumplio ');
INSERT INTO meta VALUES (2, 'menos like', true, 'no se cumplio');


--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 190
-- Name: meta_id_meta_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('meta_id_meta_seq', 1, false);


--
-- TOC entry 2303 (class 0 OID 18010)
-- Dependencies: 191
-- Data for Name: paso; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO paso VALUES (1, 1, 1, 1, 'aprobado', 'ya se hizo la validacion');
INSERT INTO paso VALUES (2, 2, 2, 2, 'no aprobado', 'nno se realizo la aprobacion');


--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 192
-- Name: paso_id_paso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('paso_id_paso_seq', 1, false);


--
-- TOC entry 2305 (class 0 OID 18018)
-- Dependencies: 193
-- Data for Name: post; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO post VALUES (1, 1, 1, '2017-09-09 00:00:00', true, 'publico', NULL);
INSERT INTO post VALUES (2, 2, 2, '2017-09-10 00:00:00', true, 'privado', NULL);
INSERT INTO post VALUES (5, 1, 1, '2017-02-10 00:00:00', true, 'holis', NULL);


--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 194
-- Name: post_id_post_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('post_id_post_seq', 5, true);


--
-- TOC entry 2307 (class 0 OID 18027)
-- Dependencies: 195
-- Data for Name: post_meta; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO post_meta VALUES (1, 1);
INSERT INTO post_meta VALUES (2, 2);


--
-- TOC entry 2308 (class 0 OID 18030)
-- Dependencies: 196
-- Data for Name: post_paso; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO post_paso VALUES (1, 1, 1, 1, 1, true, 'ya se hizo la aprobacion');
INSERT INTO post_paso VALUES (2, 2, 2, 2, 2, false, 'nno se hizo la aprobacion');
INSERT INTO post_paso VALUES (5, 1, 1, 1, 1, true, NULL);


--
-- TOC entry 2309 (class 0 OID 18037)
-- Dependencies: 197
-- Data for Name: post_seccion; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO post_seccion VALUES (1, 1001, '20');
INSERT INTO post_seccion VALUES (2, 1002, '10');


--
-- TOC entry 2310 (class 0 OID 18043)
-- Dependencies: 198
-- Data for Name: rol; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO rol VALUES (1, 'karen', true, 'permisos');
INSERT INTO rol VALUES (2, 'mauricio', true, 'mas permisos');
INSERT INTO rol VALUES (3, 'julio', true, 'mas o menos ');


--
-- TOC entry 2311 (class 0 OID 18050)
-- Dependencies: 199
-- Data for Name: rol_categoria; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO rol_categoria VALUES (1, 1, true);
INSERT INTO rol_categoria VALUES (2, 2, true);
INSERT INTO rol_categoria VALUES (3, 3, true);


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 200
-- Name: rol_id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('rol_id_rol_seq', 1, false);


--
-- TOC entry 2313 (class 0 OID 18056)
-- Dependencies: 201
-- Data for Name: seccion; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO seccion VALUES (1001, 100, 'ciencias', true, 'ciencias');
INSERT INTO seccion VALUES (1002, 101, 'politicas', true, 'manosos');
INSERT INTO seccion VALUES (1003, 102, 'tecnologia', true, 'amantes de lo electronicos');


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 202
-- Name: seccion_id_seccion_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('seccion_id_seccion_seq', 1, false);


--
-- TOC entry 2315 (class 0 OID 18065)
-- Dependencies: 203
-- Data for Name: tipo_paso; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO tipo_paso VALUES (1, 'validado', true, 'se ha validado la publicacion');
INSERT INTO tipo_paso VALUES (2, 'no validado', true, 'nno se valido su publicacion');


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 204
-- Name: tipo_paso_id_tipo_paso_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('tipo_paso_id_tipo_paso_seq', 1, false);


--
-- TOC entry 2317 (class 0 OID 18074)
-- Dependencies: 205
-- Data for Name: tipo_post; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO tipo_post VALUES (1, 'publico', true, 'publicacion para todos');
INSERT INTO tipo_post VALUES (2, 'privado', true, 'ssolo para amigos');
INSERT INTO tipo_post VALUES (3, 'mejores amigos', true, 'solo para la lista de mejores amigos');
INSERT INTO tipo_post VALUES (4, 'jola mundo', true, 'un hola mundo muy bonito');
INSERT INTO tipo_post VALUES (5, 'Aloh', false, 'ME mordi la uña weh');
INSERT INTO tipo_post VALUES (6, 'hola', false, 'que tal :)');
INSERT INTO tipo_post VALUES (7, '         ', false, '');
INSERT INTO tipo_post VALUES (8, 'juela weh', false, 'dawdsa');


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 206
-- Name: tipo_post_id_tipo_post_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('tipo_post_id_tipo_post_seq', 8, true);


--
-- TOC entry 2319 (class 0 OID 18083)
-- Dependencies: 207
-- Data for Name: tipo_post_seccion; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO tipo_post_seccion VALUES (1001, 1, true, true, 20);
INSERT INTO tipo_post_seccion VALUES (1002, 2, true, false, 21);
INSERT INTO tipo_post_seccion VALUES (1003, 3, true, true, 22);
INSERT INTO tipo_post_seccion VALUES (1001, 2, true, false, 10);


--
-- TOC entry 2320 (class 0 OID 18089)
-- Dependencies: 208
-- Data for Name: tipo_seccion; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO tipo_seccion VALUES (100, 'noticias', true, 'para el publico en general');
INSERT INTO tipo_seccion VALUES (101, 'ciencias', true, 'para los amantes de cosas cientificas');
INSERT INTO tipo_seccion VALUES (102, 'politica', true, 'ppara los manosos');


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 209
-- Name: tipo_seccion_id_tipo_seccion_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('tipo_seccion_id_tipo_seccion_seq', 1, false);


--
-- TOC entry 2322 (class 0 OID 18098)
-- Dependencies: 210
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO usuario VALUES (1, 'flores quintanilla', 'karen idalia', '1993-12-05', true, 'usuario derecho a postear', 'mamasota', '1234');
INSERT INTO usuario VALUES (2, 'flores quintanilla', 'marian nataly', '1996-09-05', true, 'usuario normal', 'naty', 'naty123');
INSERT INTO usuario VALUES (3, 'flores quintanilla', 'mario edwin', '1997-04-13', false, 'usuario casi normal ', 'mariobueno', 'papasote');


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 211
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: mortal2017
--

SELECT pg_catalog.setval('usuario_id_usuario_seq', 1, false);


--
-- TOC entry 2324 (class 0 OID 18107)
-- Dependencies: 212
-- Data for Name: usuario_rol_categoria; Type: TABLE DATA; Schema: public; Owner: mortal2017
--

INSERT INTO usuario_rol_categoria VALUES (1, 1, 1, true);
INSERT INTO usuario_rol_categoria VALUES (2, 2, 2, true);
INSERT INTO usuario_rol_categoria VALUES (3, 3, 3, false);


--
-- TOC entry 2130 (class 2606 OID 18123)
-- Name: categoria pk_categoria; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY categoria
    ADD CONSTRAINT pk_categoria PRIMARY KEY (id_categoria);


--
-- TOC entry 2132 (class 2606 OID 18125)
-- Name: cometario pk_comentario; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY cometario
    ADD CONSTRAINT pk_comentario PRIMARY KEY (id_comentario);


--
-- TOC entry 2134 (class 2606 OID 18127)
-- Name: meta pk_meta; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY meta
    ADD CONSTRAINT pk_meta PRIMARY KEY (id_meta);


--
-- TOC entry 2136 (class 2606 OID 18129)
-- Name: paso pk_paso; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT pk_paso PRIMARY KEY (id_paso);


--
-- TOC entry 2138 (class 2606 OID 18131)
-- Name: post pk_post; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post
    ADD CONSTRAINT pk_post PRIMARY KEY (id_post);


--
-- TOC entry 2146 (class 2606 OID 18133)
-- Name: rol pk_rol; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY rol
    ADD CONSTRAINT pk_rol PRIMARY KEY (id_rol);


--
-- TOC entry 2150 (class 2606 OID 18135)
-- Name: seccion pk_seccion; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY seccion
    ADD CONSTRAINT pk_seccion PRIMARY KEY (id_seccion);


--
-- TOC entry 2152 (class 2606 OID 18137)
-- Name: tipo_paso pk_tipo_paso; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_paso
    ADD CONSTRAINT pk_tipo_paso PRIMARY KEY (id_tipo_paso);


--
-- TOC entry 2154 (class 2606 OID 18139)
-- Name: tipo_post pk_tipo_post; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_post
    ADD CONSTRAINT pk_tipo_post PRIMARY KEY (id_tipo_post);


--
-- TOC entry 2158 (class 2606 OID 18141)
-- Name: tipo_seccion pk_tipo_seccion; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_seccion
    ADD CONSTRAINT pk_tipo_seccion PRIMARY KEY (id_tipo_seccion);


--
-- TOC entry 2160 (class 2606 OID 18143)
-- Name: usuario pk_usuario; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT pk_usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2140 (class 2606 OID 18145)
-- Name: post_meta post_meta_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_meta
    ADD CONSTRAINT post_meta_pk PRIMARY KEY (id_post, id_meta);


--
-- TOC entry 2142 (class 2606 OID 18147)
-- Name: post_paso post_paso_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_paso
    ADD CONSTRAINT post_paso_pk PRIMARY KEY (id_paso, id_post);


--
-- TOC entry 2144 (class 2606 OID 18149)
-- Name: post_seccion post_seccion_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_seccion
    ADD CONSTRAINT post_seccion_pk PRIMARY KEY (id_post, id_seccion);


--
-- TOC entry 2148 (class 2606 OID 18151)
-- Name: rol_categoria rol_categoria_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY rol_categoria
    ADD CONSTRAINT rol_categoria_pk PRIMARY KEY (id_categoria, id_rol);


--
-- TOC entry 2156 (class 2606 OID 18153)
-- Name: tipo_post_seccion tipo_post_seccion_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_post_seccion
    ADD CONSTRAINT tipo_post_seccion_pk PRIMARY KEY (id_seccion, id_tipo_post);


--
-- TOC entry 2162 (class 2606 OID 18155)
-- Name: usuario_rol_categoria usuario_rol_categoria_pk; Type: CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY usuario_rol_categoria
    ADD CONSTRAINT usuario_rol_categoria_pk PRIMARY KEY (id_usuario, id_categoria, id_rol);


--
-- TOC entry 2173 (class 2606 OID 18156)
-- Name: rol_categoria categoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY rol_categoria
    ADD CONSTRAINT categoria_fk FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2166 (class 2606 OID 18161)
-- Name: post categoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post
    ADD CONSTRAINT categoria_fk FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2168 (class 2606 OID 18166)
-- Name: post_meta meta_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_meta
    ADD CONSTRAINT meta_fk FOREIGN KEY (id_meta) REFERENCES meta(id_meta) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2170 (class 2606 OID 18171)
-- Name: post_paso paso_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_paso
    ADD CONSTRAINT paso_fk FOREIGN KEY (id_paso) REFERENCES paso(id_paso) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2171 (class 2606 OID 18176)
-- Name: post_paso post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_paso
    ADD CONSTRAINT post_fk FOREIGN KEY (id_post) REFERENCES post(id_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2172 (class 2606 OID 18181)
-- Name: post_seccion post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_seccion
    ADD CONSTRAINT post_fk FOREIGN KEY (id_post) REFERENCES post(id_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2169 (class 2606 OID 18186)
-- Name: post_meta post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post_meta
    ADD CONSTRAINT post_fk FOREIGN KEY (id_post) REFERENCES post(id_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2163 (class 2606 OID 18191)
-- Name: cometario post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY cometario
    ADD CONSTRAINT post_fk FOREIGN KEY (id_post) REFERENCES post(id_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2178 (class 2606 OID 18196)
-- Name: usuario_rol_categoria rol_categoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY usuario_rol_categoria
    ADD CONSTRAINT rol_categoria_fk FOREIGN KEY (id_categoria, id_rol) REFERENCES rol_categoria(id_categoria, id_rol) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2164 (class 2606 OID 18201)
-- Name: paso rol_categoria_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT rol_categoria_fk FOREIGN KEY (id_categoria, id_rol) REFERENCES rol_categoria(id_categoria, id_rol) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2174 (class 2606 OID 18206)
-- Name: rol_categoria rol_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY rol_categoria
    ADD CONSTRAINT rol_fk FOREIGN KEY (id_rol) REFERENCES rol(id_rol) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2176 (class 2606 OID 18211)
-- Name: tipo_post_seccion seccion_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_post_seccion
    ADD CONSTRAINT seccion_fk FOREIGN KEY (id_seccion) REFERENCES seccion(id_seccion) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2165 (class 2606 OID 18216)
-- Name: paso tipo_paso_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY paso
    ADD CONSTRAINT tipo_paso_fk FOREIGN KEY (id_tipo_paso) REFERENCES tipo_paso(id_tipo_paso) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2167 (class 2606 OID 18221)
-- Name: post tipo_post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY post
    ADD CONSTRAINT tipo_post_fk FOREIGN KEY (id_tipo_post) REFERENCES tipo_post(id_tipo_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2177 (class 2606 OID 18226)
-- Name: tipo_post_seccion tipo_post_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY tipo_post_seccion
    ADD CONSTRAINT tipo_post_fk FOREIGN KEY (id_tipo_post) REFERENCES tipo_post(id_tipo_post) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2175 (class 2606 OID 18231)
-- Name: seccion tipo_seccion_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY seccion
    ADD CONSTRAINT tipo_seccion_fk FOREIGN KEY (id_tipo_seccion) REFERENCES tipo_seccion(id_tipo_seccion) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


--
-- TOC entry 2179 (class 2606 OID 18236)
-- Name: usuario_rol_categoria usuario_fk; Type: FK CONSTRAINT; Schema: public; Owner: mortal2017
--

ALTER TABLE ONLY usuario_rol_categoria
    ADD CONSTRAINT usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) MATCH FULL ON UPDATE CASCADE ON DELETE SET NULL;


-- Completed on 2017-11-23 17:13:04 CST

--
-- PostgreSQL database dump complete
--

