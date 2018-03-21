--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: app_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE app_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_seq OWNER TO triceed;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: App; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "App" (
    "Id" integer DEFAULT nextval('app_seq'::regclass) NOT NULL,
    "AppId" character varying(500),
    "Name" character varying(500),
    "OrgId" character varying(32),
    "OrgName" character varying(64),
    "OwnerName" character varying(500),
    "OwnerEmail" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."App" OWNER TO triceed;

--
-- Name: app_namespace_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE app_namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_namespace_seq OWNER TO triceed;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "AppNamespace" (
    "Id" integer DEFAULT nextval('app_namespace_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "Format" character varying(32) DEFAULT 'properties'::character varying,
    "IsPublic" integer DEFAULT 0,
    "Comment" character varying(64) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."AppNamespace" OWNER TO triceed;

--
-- Name: App_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE "App_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."App_seq" OWNER TO triceed;

--
-- Name: Audit; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Audit" (
    "Id" integer NOT NULL,
    "EntityName" character varying(50) NOT NULL,
    "EntityId" integer,
    "OpName" character varying(50) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Audit" OWNER TO triceed;

--
-- Name: cluster_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE cluster_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_seq OWNER TO triceed;

--
-- Name: Cluster; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Cluster" (
    "Id" integer DEFAULT nextval('cluster_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying,
    "AppId" character varying(32) DEFAULT ''::character varying,
    "ParentClusterId" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Cluster" OWNER TO triceed;

--
-- Name: Commit; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Commit" (
    "Id" integer NOT NULL,
    "ChangeSets" text NOT NULL,
    "AppId" character varying(500) NOT NULL,
    "ClusterName" character varying(500) NOT NULL,
    "NamespaceName" character varying(500) NOT NULL,
    "Comment" character varying(500) DEFAULT NULL::character varying,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Commit" OWNER TO triceed;

--
-- Name: GrayReleaseRule; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "GrayReleaseRule" (
    "Id" integer NOT NULL,
    "AppId" character varying(32) NOT NULL,
    "ClusterName" character varying(32) NOT NULL,
    "NamespaceName" character varying(32) NOT NULL,
    "BranchName" character varying(32) NOT NULL,
    "Rules" character varying(16000) DEFAULT '[]'::character varying,
    "ReleaseId" integer DEFAULT 0 NOT NULL,
    "BranchStatus" integer DEFAULT 1,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."GrayReleaseRule" OWNER TO triceed;

--
-- Name: Instance; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Instance" (
    "Id" integer NOT NULL,
    "AppId" character varying(32) NOT NULL,
    "ClusterName" character varying(32) NOT NULL,
    "DataCenter" character varying(64) NOT NULL,
    "Ip" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastTime" timestamp without time zone
);


ALTER TABLE public."Instance" OWNER TO triceed;

--
-- Name: InstanceConfig; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "InstanceConfig" (
    "Id" integer NOT NULL,
    "InstanceId" integer,
    "ConfigAppId" character varying(32) NOT NULL,
    "ConfigClusterName" character varying(32) NOT NULL,
    "ConfigNamespaceName" character varying(32) NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying NOT NULL,
    "ReleaseDeliveryTime" timestamp without time zone,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastTime" timestamp without time zone
);


ALTER TABLE public."InstanceConfig" OWNER TO triceed;

--
-- Name: item_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE item_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_seq OWNER TO triceed;

--
-- Name: Item; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Item" (
    "Id" integer DEFAULT nextval('item_seq'::regclass) NOT NULL,
    "NamespaceId" integer DEFAULT 0,
    "Key" character varying(128),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "LineNum" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Item" OWNER TO triceed;

--
-- Name: namespace_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE namespace_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.namespace_seq OWNER TO triceed;

--
-- Name: Namespace; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Namespace" (
    "Id" integer DEFAULT nextval('namespace_seq'::regclass) NOT NULL,
    "AppId" character varying(500),
    "ClusterName" character varying(500),
    "NamespaceName" character varying(500),
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Namespace" OWNER TO triceed;

--
-- Name: NamespaceLock; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "NamespaceLock" (
    "Id" integer NOT NULL,
    "NamespaceId" integer DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(32) NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone NOT NULL,
    "DataChange_LastModifiedBy" character varying(32),
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."NamespaceLock" OWNER TO triceed;

--
-- Name: release_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE release_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_seq OWNER TO triceed;

--
-- Name: Release; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Release" (
    "Id" integer DEFAULT nextval('release_seq'::regclass) NOT NULL,
    "ReleaseKey" character varying(64) DEFAULT ''::character varying,
    "Name" character varying(64),
    "Comment" character varying(256) DEFAULT NULL::character varying,
    "AppId" character varying(500),
    "ClusterName" character varying(500),
    "NamespaceName" character varying(500),
    "Configurations" text,
    "IsAbandoned" integer DEFAULT 0,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."Release" OWNER TO triceed;

--
-- Name: release_history_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE release_history_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.release_history_seq OWNER TO triceed;

--
-- Name: ReleaseHistory; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ReleaseHistory" (
    "Id" integer DEFAULT nextval('release_history_seq'::regclass) NOT NULL,
    "AppId" character varying(32),
    "ClusterName" character varying(32),
    "NamespaceName" character varying(32),
    "BranchName" character varying(32),
    "ReleaseId" integer DEFAULT 0,
    "PreviousReleaseId" integer DEFAULT 0,
    "Operation" integer DEFAULT 0,
    "OperationContext" text,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."ReleaseHistory" OWNER TO triceed;

--
-- Name: ReleaseMessage; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ReleaseMessage" (
    "Id" integer NOT NULL,
    "Message" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "DataChange_LastTime" timestamp without time zone
);


ALTER TABLE public."ReleaseMessage" OWNER TO triceed;

--
-- Name: service_config_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE service_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_config_seq OWNER TO triceed;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('service_config_seq'::regclass) NOT NULL,
    "Key" character varying(64),
    "Cluster" character varying(32),
    "Value" character varying(2048),
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32),
    "DataChange_CreatedTime" timestamp without time zone,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer
);


ALTER TABLE public."ServerConfig" OWNER TO triceed;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO triceed;

--
-- Name: 18034; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18034');


ALTER LARGE OBJECT 18034 OWNER TO triceed;

--
-- Name: 18035; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18035');


ALTER LARGE OBJECT 18035 OWNER TO triceed;

--
-- Name: 18036; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18036');


ALTER LARGE OBJECT 18036 OWNER TO triceed;

--
-- Name: 18037; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18037');


ALTER LARGE OBJECT 18037 OWNER TO triceed;

--
-- Name: 18038; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18038');


ALTER LARGE OBJECT 18038 OWNER TO triceed;

--
-- Name: 18039; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18039');


ALTER LARGE OBJECT 18039 OWNER TO triceed;

--
-- Name: 18047; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18047');


ALTER LARGE OBJECT 18047 OWNER TO triceed;

--
-- Name: 18048; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18048');


ALTER LARGE OBJECT 18048 OWNER TO triceed;

--
-- Name: 18049; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18049');


ALTER LARGE OBJECT 18049 OWNER TO triceed;

--
-- Name: 18050; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18050');


ALTER LARGE OBJECT 18050 OWNER TO triceed;

--
-- Name: 18051; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18051');


ALTER LARGE OBJECT 18051 OWNER TO triceed;

--
-- Name: 18052; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18052');


ALTER LARGE OBJECT 18052 OWNER TO triceed;

--
-- Name: 18053; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18053');


ALTER LARGE OBJECT 18053 OWNER TO triceed;

--
-- Name: 18054; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18054');


ALTER LARGE OBJECT 18054 OWNER TO triceed;

--
-- Name: 18055; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18055');


ALTER LARGE OBJECT 18055 OWNER TO triceed;

--
-- Name: 18056; Type: BLOB; Schema: -; Owner: triceed
--

SELECT pg_catalog.lo_create('18056');


ALTER LARGE OBJECT 18056 OWNER TO triceed;

--
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
92	troy	troy	aps	aps	apollo	apollo@acme.com	apollo	2018-03-19 18:32:43.385	apollo	2018-03-19 18:32:43.385	0
100	common	common	aps	aps	apollo	apollo@acme.com	apollo	2018-03-19 18:32:59.651	apollo	2018-03-19 18:32:59.651	0
260	heron	heron	aps	aps	apollo	apollo@acme.com	apollo	2018-03-20 10:46:29.091	apollo	2018-03-20 10:46:29.091	0
485	falcon	falcon	aps	aps	apollo	apollo@acme.com	apollo	2018-03-20 12:01:31.409	apollo	2018-03-20 12:01:31.409	0
\.


--
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "AppNamespace" ("Id", "Name", "AppId", "Format", "IsPublic", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	application	SampleApp	properties	0	default app namespace		\N		\N	0
15	application	c	properties	0	default app namespace	apollo	2018-03-17 18:38:28.052	apollo	2018-03-17 18:38:28.052	0
23	application	f	properties	0	default app namespace	apollo	2018-03-17 18:53:45.707	apollo	2018-03-17 18:53:45.707	0
31	application	g	properties	0	default app namespace	apollo	2018-03-17 19:00:13.866	apollo	2018-03-17 19:00:13.866	0
39	application	a1	properties	0	default app namespace	apollo	2018-03-17 19:47:36.509	apollo	2018-03-17 19:47:36.509	0
50	application	a2	properties	0	default app namespace	apollo	2018-03-19 09:23:58.93	apollo	2018-03-19 09:23:58.93	0
86	application	troy-2.4	properties	0	default app namespace	apollo	2018-03-19 18:16:53.062	apollo	2018-03-19 18:16:53.062	0
94	application	troy	properties	0	default app namespace	apollo	2018-03-19 18:32:43.561	apollo	2018-03-19 18:32:43.561	0
102	application	common	properties	0	default app namespace	apollo	2018-03-19 18:33:00.03	apollo	2018-03-19 18:33:00.03	0
179	aps.rabbitmq	common	properties	1		apollo	2018-03-20 10:34:28.616	apollo	2018-03-20 10:34:28.616	0
220	aps.postgresql	common	properties	1		apollo	2018-03-20 10:37:18.461	apollo	2018-03-20 10:37:18.461	0
241	aps.redis	common	properties	1		apollo	2018-03-20 10:41:03.018	apollo	2018-03-20 10:41:03.018	0
262	application	heron	properties	0	default app namespace	apollo	2018-03-20 10:46:29.321	apollo	2018-03-20 10:46:29.321	0
487	application	falcon	properties	0	default app namespace	apollo	2018-03-20 12:01:31.57	apollo	2018-03-20 12:01:31.57	0
\.


--
-- Name: App_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('"App_seq"', 1, false);


--
-- Data for Name: Audit; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Audit" ("Id", "EntityName", "EntityId", "OpName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
14	App	13	INSERT	\N	apollo	2018-03-17 18:38:28.018	\N	2018-03-17 18:38:28.018	0
16	AppNamespace	15	INSERT	\N	apollo	2018-03-17 18:38:28.064	\N	2018-03-17 18:38:28.064	0
18	Cluster	17	INSERT	\N	apollo	2018-03-17 18:38:28.094	\N	2018-03-17 18:38:28.094	0
20	Namespace	19	INSERT	\N	apollo	2018-03-17 18:38:28.177	\N	2018-03-17 18:38:28.177	0
22	App	21	INSERT	\N	apollo	2018-03-17 18:53:45.679	\N	2018-03-17 18:53:45.679	0
24	AppNamespace	23	INSERT	\N	apollo	2018-03-17 18:53:45.711	\N	2018-03-17 18:53:45.711	0
26	Cluster	25	INSERT	\N	apollo	2018-03-17 18:53:45.746	\N	2018-03-17 18:53:45.746	0
28	Namespace	27	INSERT	\N	apollo	2018-03-17 18:53:45.82	\N	2018-03-17 18:53:45.82	0
30	App	29	INSERT	\N	apollo	2018-03-17 19:00:13.845	\N	2018-03-17 19:00:13.845	0
32	AppNamespace	31	INSERT	\N	apollo	2018-03-17 19:00:13.869	\N	2018-03-17 19:00:13.869	0
34	Cluster	33	INSERT	\N	apollo	2018-03-17 19:00:13.892	\N	2018-03-17 19:00:13.892	0
36	Namespace	35	INSERT	\N	apollo	2018-03-17 19:00:13.962	\N	2018-03-17 19:00:13.962	0
38	App	37	INSERT	\N	apollo	2018-03-17 19:47:36.453	\N	2018-03-17 19:47:36.453	0
40	AppNamespace	39	INSERT	\N	apollo	2018-03-17 19:47:36.516	\N	2018-03-17 19:47:36.516	0
42	Cluster	41	INSERT	\N	apollo	2018-03-17 19:47:36.564	\N	2018-03-17 19:47:36.564	0
44	Namespace	43	INSERT	\N	apollo	2018-03-17 19:47:37.228	\N	2018-03-17 19:47:37.228	0
46	Item	45	INSERT	\N	apollo	2018-03-17 19:48:03.586	\N	2018-03-17 19:48:03.586	0
49	App	48	INSERT	\N	apollo	2018-03-19 09:23:58.893	\N	2018-03-19 09:23:58.893	0
51	AppNamespace	50	INSERT	\N	apollo	2018-03-19 09:23:58.935	\N	2018-03-19 09:23:58.935	0
53	Cluster	52	INSERT	\N	apollo	2018-03-19 09:23:58.971	\N	2018-03-19 09:23:58.971	0
55	Namespace	54	INSERT	\N	apollo	2018-03-19 09:23:59.035	\N	2018-03-19 09:23:59.035	0
57	Item	56	INSERT	\N	apollo	2018-03-19 09:24:46.983	\N	2018-03-19 09:24:46.983	0
60	Item	59	INSERT	\N	apollo	2018-03-19 09:57:27.104	\N	2018-03-19 09:57:27.104	0
63	Item	62	INSERT	\N	apollo	2018-03-19 12:17:44.793	\N	2018-03-19 12:17:44.793	0
66	Item	65	INSERT	\N	apollo	2018-03-19 14:17:31.961	\N	2018-03-19 14:17:31.961	0
68	Item	59	DELETE	\N	apollo	2018-03-19 14:17:36.857	\N	2018-03-19 14:17:36.857	0
70	Item	62	DELETE	\N	apollo	2018-03-19 14:17:39.408	\N	2018-03-19 14:17:39.408	0
73	Release	72	INSERT	\N	apollo	2018-03-19 14:18:44.905	\N	2018-03-19 14:18:44.905	0
75	ReleaseHistory	74	INSERT	\N	apollo	2018-03-19 14:18:44.923	\N	2018-03-19 14:18:44.923	0
78	Release	77	INSERT	\N	apollo	2018-03-19 14:32:46.813	\N	2018-03-19 14:32:46.813	0
80	ReleaseHistory	79	INSERT	\N	apollo	2018-03-19 14:32:46.831	\N	2018-03-19 14:32:46.831	0
85	App	84	INSERT	\N	apollo	2018-03-19 18:16:53.019	\N	2018-03-19 18:16:53.019	0
87	AppNamespace	86	INSERT	\N	apollo	2018-03-19 18:16:53.064	\N	2018-03-19 18:16:53.064	0
89	Cluster	88	INSERT	\N	apollo	2018-03-19 18:16:53.106	\N	2018-03-19 18:16:53.106	0
91	Namespace	90	INSERT	\N	apollo	2018-03-19 18:16:53.287	\N	2018-03-19 18:16:53.287	0
93	App	92	INSERT	\N	apollo	2018-03-19 18:32:43.506	\N	2018-03-19 18:32:43.506	0
95	AppNamespace	94	INSERT	\N	apollo	2018-03-19 18:32:43.568	\N	2018-03-19 18:32:43.568	0
97	Cluster	96	INSERT	\N	apollo	2018-03-19 18:32:43.596	\N	2018-03-19 18:32:43.596	0
99	Namespace	98	INSERT	\N	apollo	2018-03-19 18:32:43.634	\N	2018-03-19 18:32:43.634	0
101	App	100	INSERT	\N	apollo	2018-03-19 18:33:00.026	\N	2018-03-19 18:33:00.026	0
103	AppNamespace	102	INSERT	\N	apollo	2018-03-19 18:33:00.03	\N	2018-03-19 18:33:00.03	0
105	Cluster	104	INSERT	\N	apollo	2018-03-19 18:33:00.033	\N	2018-03-19 18:33:00.033	0
107	Namespace	106	INSERT	\N	apollo	2018-03-19 18:33:00.048	\N	2018-03-19 18:33:00.048	0
109	Item	108	INSERT	\N	apollo	2018-03-19 19:51:49.248	\N	2018-03-19 19:51:49.248	0
111	Item	110	INSERT	\N	apollo	2018-03-19 19:51:49.25	\N	2018-03-19 19:51:49.25	0
113	Item	112	INSERT	\N	apollo	2018-03-19 19:51:49.251	\N	2018-03-19 19:51:49.251	0
115	Item	114	INSERT	\N	apollo	2018-03-19 19:51:49.253	\N	2018-03-19 19:51:49.253	0
117	Item	116	INSERT	\N	apollo	2018-03-19 19:51:49.254	\N	2018-03-19 19:51:49.254	0
119	Item	118	INSERT	\N	apollo	2018-03-19 19:51:49.256	\N	2018-03-19 19:51:49.256	0
121	Item	120	INSERT	\N	apollo	2018-03-19 19:51:49.258	\N	2018-03-19 19:51:49.258	0
123	Item	122	INSERT	\N	apollo	2018-03-19 19:51:49.26	\N	2018-03-19 19:51:49.26	0
125	Item	124	INSERT	\N	apollo	2018-03-19 19:51:49.262	\N	2018-03-19 19:51:49.262	0
126	ItemSet	\N	INSERT	\N	apollo	2018-03-19 19:51:49.263	\N	2018-03-19 19:51:49.263	0
128	Item	120	UPDATE	\N	apollo	2018-03-19 19:52:15.798	\N	2018-03-19 19:52:15.798	0
129	Item	122	UPDATE	\N	apollo	2018-03-19 19:52:15.813	\N	2018-03-19 19:52:15.813	0
130	Item	124	UPDATE	\N	apollo	2018-03-19 19:52:15.829	\N	2018-03-19 19:52:15.829	0
131	ItemSet	\N	UPDATE	\N	apollo	2018-03-19 19:52:15.832	\N	2018-03-19 19:52:15.832	0
132	Item	118	DELETE	\N	apollo	2018-03-19 19:52:15.837	\N	2018-03-19 19:52:15.837	0
133	Item	112	DELETE	\N	apollo	2018-03-19 19:52:15.839	\N	2018-03-19 19:52:15.839	0
134	Item	110	DELETE	\N	apollo	2018-03-19 19:52:15.841	\N	2018-03-19 19:52:15.841	0
135	Item	108	DELETE	\N	apollo	2018-03-19 19:52:15.843	\N	2018-03-19 19:52:15.843	0
136	Item	114	DELETE	\N	apollo	2018-03-19 19:52:15.845	\N	2018-03-19 19:52:15.845	0
137	Item	116	DELETE	\N	apollo	2018-03-19 19:52:15.847	\N	2018-03-19 19:52:15.847	0
138	ItemSet	\N	DELETE	\N	apollo	2018-03-19 19:52:15.847	\N	2018-03-19 19:52:15.847	0
141	Item	140	INSERT	\N	apollo	2018-03-19 19:52:31.483	\N	2018-03-19 19:52:31.483	0
143	Item	142	INSERT	\N	apollo	2018-03-19 19:52:31.486	\N	2018-03-19 19:52:31.486	0
145	Item	144	INSERT	\N	apollo	2018-03-19 19:52:31.487	\N	2018-03-19 19:52:31.487	0
147	Item	146	INSERT	\N	apollo	2018-03-19 19:52:31.489	\N	2018-03-19 19:52:31.489	0
149	Item	148	INSERT	\N	apollo	2018-03-19 19:52:31.49	\N	2018-03-19 19:52:31.49	0
151	Item	150	INSERT	\N	apollo	2018-03-19 19:52:31.492	\N	2018-03-19 19:52:31.492	0
152	ItemSet	\N	INSERT	\N	apollo	2018-03-19 19:52:31.493	\N	2018-03-19 19:52:31.493	0
155	Release	154	INSERT	\N	apollo	2018-03-19 19:52:53.182	\N	2018-03-19 19:52:53.182	0
157	ReleaseHistory	156	INSERT	\N	apollo	2018-03-19 19:52:53.201	\N	2018-03-19 19:52:53.201	0
160	Release	159	INSERT	\N	apollo	2018-03-19 19:53:02.053	\N	2018-03-19 19:53:02.053	0
162	ReleaseHistory	161	INSERT	\N	apollo	2018-03-19 19:53:02.072	\N	2018-03-19 19:53:02.072	0
165	Item	164	INSERT	\N	apollo	2018-03-19 19:59:56.62	\N	2018-03-19 19:59:56.62	0
167	Item	166	INSERT	\N	apollo	2018-03-19 19:59:56.622	\N	2018-03-19 19:59:56.622	0
169	Item	168	INSERT	\N	apollo	2018-03-19 19:59:56.624	\N	2018-03-19 19:59:56.624	0
171	Item	170	INSERT	\N	apollo	2018-03-19 19:59:56.626	\N	2018-03-19 19:59:56.626	0
172	ItemSet	\N	INSERT	\N	apollo	2018-03-19 19:59:56.627	\N	2018-03-19 19:59:56.627	0
175	Release	174	INSERT	\N	apollo	2018-03-19 19:59:59.823	\N	2018-03-19 19:59:59.823	0
177	ReleaseHistory	176	INSERT	\N	apollo	2018-03-19 19:59:59.825	\N	2018-03-19 19:59:59.825	0
181	Namespace	180	INSERT	\N	apollo	2018-03-20 10:34:29.379	\N	2018-03-20 10:34:29.379	0
182	AppNamespace	179	INSERT	\N	apollo	2018-03-20 10:34:29.38	\N	2018-03-20 10:34:29.38	0
184	Item	183	INSERT	\N	apollo	2018-03-20 10:34:49.788	\N	2018-03-20 10:34:49.788	0
186	Item	185	INSERT	\N	apollo	2018-03-20 10:34:49.836	\N	2018-03-20 10:34:49.836	0
188	Item	187	INSERT	\N	apollo	2018-03-20 10:34:49.838	\N	2018-03-20 10:34:49.838	0
190	Item	189	INSERT	\N	apollo	2018-03-20 10:34:49.842	\N	2018-03-20 10:34:49.842	0
192	Item	191	INSERT	\N	apollo	2018-03-20 10:34:49.843	\N	2018-03-20 10:34:49.843	0
194	Item	193	INSERT	\N	apollo	2018-03-20 10:34:49.846	\N	2018-03-20 10:34:49.846	0
195	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:34:49.848	\N	2018-03-20 10:34:49.848	0
198	Item	197	INSERT	\N	apollo	2018-03-20 10:35:02.302	\N	2018-03-20 10:35:02.302	0
199	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:35:02.312	\N	2018-03-20 10:35:02.312	0
200	Item	150	DELETE	\N	apollo	2018-03-20 10:35:02.327	\N	2018-03-20 10:35:02.327	0
201	Item	144	DELETE	\N	apollo	2018-03-20 10:35:02.33	\N	2018-03-20 10:35:02.33	0
202	Item	142	DELETE	\N	apollo	2018-03-20 10:35:02.336	\N	2018-03-20 10:35:02.336	0
203	Item	140	DELETE	\N	apollo	2018-03-20 10:35:02.338	\N	2018-03-20 10:35:02.338	0
204	Item	146	DELETE	\N	apollo	2018-03-20 10:35:02.366	\N	2018-03-20 10:35:02.366	0
205	Item	148	DELETE	\N	apollo	2018-03-20 10:35:02.369	\N	2018-03-20 10:35:02.369	0
206	ItemSet	\N	DELETE	\N	apollo	2018-03-20 10:35:02.37	\N	2018-03-20 10:35:02.37	0
214	Release	213	INSERT	\N	apollo	2018-03-20 10:35:13.891	\N	2018-03-20 10:35:13.891	0
216	ReleaseHistory	215	INSERT	\N	apollo	2018-03-20 10:35:13.907	\N	2018-03-20 10:35:13.907	0
243	Namespace	242	INSERT	\N	apollo	2018-03-20 10:41:03.303	\N	2018-03-20 10:41:03.303	0
244	AppNamespace	241	INSERT	\N	apollo	2018-03-20 10:41:03.306	\N	2018-03-20 10:41:03.306	0
246	Item	245	INSERT	\N	apollo	2018-03-20 10:41:47.741	\N	2018-03-20 10:41:47.741	0
248	Item	247	INSERT	\N	apollo	2018-03-20 10:41:47.763	\N	2018-03-20 10:41:47.763	0
250	Item	249	INSERT	\N	apollo	2018-03-20 10:41:47.776	\N	2018-03-20 10:41:47.776	0
252	Item	251	INSERT	\N	apollo	2018-03-20 10:41:47.796	\N	2018-03-20 10:41:47.796	0
253	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:41:47.797	\N	2018-03-20 10:41:47.797	0
256	Release	255	INSERT	\N	apollo	2018-03-20 10:41:57.409	\N	2018-03-20 10:41:57.409	0
258	ReleaseHistory	257	INSERT	\N	apollo	2018-03-20 10:41:57.411	\N	2018-03-20 10:41:57.411	0
209	Release	208	INSERT	\N	apollo	2018-03-20 10:35:06.428	\N	2018-03-20 10:35:06.428	0
211	ReleaseHistory	210	INSERT	\N	apollo	2018-03-20 10:35:06.467	\N	2018-03-20 10:35:06.467	0
219	Namespace	218	INSERT	\N	apollo	2018-03-20 10:35:52	\N	2018-03-20 10:35:52	0
222	Namespace	221	INSERT	\N	apollo	2018-03-20 10:37:18.982	\N	2018-03-20 10:37:18.982	0
223	AppNamespace	220	INSERT	\N	apollo	2018-03-20 10:37:18.983	\N	2018-03-20 10:37:18.983	0
225	Item	224	INSERT	\N	apollo	2018-03-20 10:39:29.658	\N	2018-03-20 10:39:29.658	0
227	Item	226	INSERT	\N	apollo	2018-03-20 10:39:29.66	\N	2018-03-20 10:39:29.66	0
229	Item	228	INSERT	\N	apollo	2018-03-20 10:39:29.662	\N	2018-03-20 10:39:29.662	0
231	Item	230	INSERT	\N	apollo	2018-03-20 10:39:29.664	\N	2018-03-20 10:39:29.664	0
233	Item	232	INSERT	\N	apollo	2018-03-20 10:39:29.675	\N	2018-03-20 10:39:29.675	0
234	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:39:29.69	\N	2018-03-20 10:39:29.69	0
237	Release	236	INSERT	\N	apollo	2018-03-20 10:39:34.247	\N	2018-03-20 10:39:34.247	0
239	ReleaseHistory	238	INSERT	\N	apollo	2018-03-20 10:39:34.249	\N	2018-03-20 10:39:34.249	0
261	App	260	INSERT	\N	apollo	2018-03-20 10:46:29.317	\N	2018-03-20 10:46:29.317	0
263	AppNamespace	262	INSERT	\N	apollo	2018-03-20 10:46:29.321	\N	2018-03-20 10:46:29.321	0
265	Cluster	264	INSERT	\N	apollo	2018-03-20 10:46:29.326	\N	2018-03-20 10:46:29.326	0
267	Namespace	266	INSERT	\N	apollo	2018-03-20 10:46:29.393	\N	2018-03-20 10:46:29.393	0
269	Item	268	INSERT	\N	apollo	2018-03-20 10:47:23.068	\N	2018-03-20 10:47:23.068	0
272	Item	271	INSERT	\N	apollo	2018-03-20 10:50:42.973	\N	2018-03-20 10:50:42.973	0
274	Item	273	INSERT	\N	apollo	2018-03-20 10:50:42.976	\N	2018-03-20 10:50:42.976	0
276	Item	275	INSERT	\N	apollo	2018-03-20 10:50:42.977	\N	2018-03-20 10:50:42.977	0
278	Item	277	INSERT	\N	apollo	2018-03-20 10:50:42.979	\N	2018-03-20 10:50:42.979	0
280	Item	279	INSERT	\N	apollo	2018-03-20 10:50:42.98	\N	2018-03-20 10:50:42.98	0
282	Item	281	INSERT	\N	apollo	2018-03-20 10:50:42.982	\N	2018-03-20 10:50:42.982	0
284	Item	283	INSERT	\N	apollo	2018-03-20 10:50:42.983	\N	2018-03-20 10:50:42.983	0
286	Item	285	INSERT	\N	apollo	2018-03-20 10:50:42.985	\N	2018-03-20 10:50:42.985	0
288	Item	287	INSERT	\N	apollo	2018-03-20 10:50:42.986	\N	2018-03-20 10:50:42.986	0
290	Item	289	INSERT	\N	apollo	2018-03-20 10:50:42.988	\N	2018-03-20 10:50:42.988	0
292	Item	291	INSERT	\N	apollo	2018-03-20 10:50:42.989	\N	2018-03-20 10:50:42.989	0
294	Item	293	INSERT	\N	apollo	2018-03-20 10:50:42.991	\N	2018-03-20 10:50:42.991	0
295	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:50:42.992	\N	2018-03-20 10:50:42.992	0
298	Item	297	INSERT	\N	apollo	2018-03-20 10:56:05.438	\N	2018-03-20 10:56:05.438	0
300	Item	299	INSERT	\N	apollo	2018-03-20 10:56:05.441	\N	2018-03-20 10:56:05.441	0
302	Item	301	INSERT	\N	apollo	2018-03-20 10:56:05.462	\N	2018-03-20 10:56:05.462	0
304	Item	303	INSERT	\N	apollo	2018-03-20 10:56:05.464	\N	2018-03-20 10:56:05.464	0
306	Item	305	INSERT	\N	apollo	2018-03-20 10:56:05.476	\N	2018-03-20 10:56:05.476	0
308	Item	307	INSERT	\N	apollo	2018-03-20 10:56:05.487	\N	2018-03-20 10:56:05.487	0
310	Item	309	INSERT	\N	apollo	2018-03-20 10:56:05.489	\N	2018-03-20 10:56:05.489	0
312	Item	311	INSERT	\N	apollo	2018-03-20 10:56:05.491	\N	2018-03-20 10:56:05.491	0
314	Item	313	INSERT	\N	apollo	2018-03-20 10:56:05.497	\N	2018-03-20 10:56:05.497	0
316	Item	315	INSERT	\N	apollo	2018-03-20 10:56:05.499	\N	2018-03-20 10:56:05.499	0
318	Item	317	INSERT	\N	apollo	2018-03-20 10:56:05.5	\N	2018-03-20 10:56:05.5	0
320	Item	319	INSERT	\N	apollo	2018-03-20 10:56:05.509	\N	2018-03-20 10:56:05.509	0
322	Item	321	INSERT	\N	apollo	2018-03-20 10:56:05.51	\N	2018-03-20 10:56:05.51	0
324	Item	323	INSERT	\N	apollo	2018-03-20 10:56:05.512	\N	2018-03-20 10:56:05.512	0
326	Item	325	INSERT	\N	apollo	2018-03-20 10:56:05.519	\N	2018-03-20 10:56:05.519	0
328	Item	327	INSERT	\N	apollo	2018-03-20 10:56:05.521	\N	2018-03-20 10:56:05.521	0
330	Item	329	INSERT	\N	apollo	2018-03-20 10:56:05.53	\N	2018-03-20 10:56:05.53	0
332	Item	331	INSERT	\N	apollo	2018-03-20 10:56:05.54	\N	2018-03-20 10:56:05.54	0
334	Item	333	INSERT	\N	apollo	2018-03-20 10:56:05.542	\N	2018-03-20 10:56:05.542	0
336	Item	335	INSERT	\N	apollo	2018-03-20 10:56:05.543	\N	2018-03-20 10:56:05.543	0
338	Item	337	INSERT	\N	apollo	2018-03-20 10:56:05.545	\N	2018-03-20 10:56:05.545	0
340	Item	339	INSERT	\N	apollo	2018-03-20 10:56:05.547	\N	2018-03-20 10:56:05.547	0
342	Item	341	INSERT	\N	apollo	2018-03-20 10:56:05.548	\N	2018-03-20 10:56:05.548	0
344	Item	343	INSERT	\N	apollo	2018-03-20 10:56:05.55	\N	2018-03-20 10:56:05.55	0
346	Item	345	INSERT	\N	apollo	2018-03-20 10:56:05.551	\N	2018-03-20 10:56:05.551	0
348	Item	347	INSERT	\N	apollo	2018-03-20 10:56:05.553	\N	2018-03-20 10:56:05.553	0
350	Item	349	INSERT	\N	apollo	2018-03-20 10:56:05.554	\N	2018-03-20 10:56:05.554	0
352	Item	351	INSERT	\N	apollo	2018-03-20 10:56:05.556	\N	2018-03-20 10:56:05.556	0
354	Item	353	INSERT	\N	apollo	2018-03-20 10:56:05.558	\N	2018-03-20 10:56:05.558	0
356	Item	355	INSERT	\N	apollo	2018-03-20 10:56:05.562	\N	2018-03-20 10:56:05.562	0
358	Item	357	INSERT	\N	apollo	2018-03-20 10:56:05.564	\N	2018-03-20 10:56:05.564	0
360	Item	359	INSERT	\N	apollo	2018-03-20 10:56:05.565	\N	2018-03-20 10:56:05.565	0
362	Item	361	INSERT	\N	apollo	2018-03-20 10:56:05.566	\N	2018-03-20 10:56:05.566	0
364	Item	363	INSERT	\N	apollo	2018-03-20 10:56:05.57	\N	2018-03-20 10:56:05.57	0
366	Item	365	INSERT	\N	apollo	2018-03-20 10:56:05.571	\N	2018-03-20 10:56:05.571	0
368	Item	367	INSERT	\N	apollo	2018-03-20 10:56:05.572	\N	2018-03-20 10:56:05.572	0
369	ItemSet	\N	INSERT	\N	apollo	2018-03-20 10:56:05.573	\N	2018-03-20 10:56:05.573	0
372	Release	371	INSERT	\N	apollo	2018-03-20 10:56:17.305	\N	2018-03-20 10:56:17.305	0
374	ReleaseHistory	373	INSERT	\N	apollo	2018-03-20 10:56:17.307	\N	2018-03-20 10:56:17.307	0
377	Item	376	INSERT	\N	apollo	2018-03-20 11:00:09.365	\N	2018-03-20 11:00:09.365	0
379	Item	378	INSERT	\N	apollo	2018-03-20 11:00:09.368	\N	2018-03-20 11:00:09.368	0
381	Item	380	INSERT	\N	apollo	2018-03-20 11:00:09.391	\N	2018-03-20 11:00:09.391	0
383	Item	382	INSERT	\N	apollo	2018-03-20 11:00:09.393	\N	2018-03-20 11:00:09.393	0
385	Item	384	INSERT	\N	apollo	2018-03-20 11:00:09.415	\N	2018-03-20 11:00:09.415	0
387	Item	386	INSERT	\N	apollo	2018-03-20 11:00:09.441	\N	2018-03-20 11:00:09.441	0
389	Item	388	INSERT	\N	apollo	2018-03-20 11:00:09.442	\N	2018-03-20 11:00:09.442	0
391	Item	390	INSERT	\N	apollo	2018-03-20 11:00:09.445	\N	2018-03-20 11:00:09.445	0
393	Item	392	INSERT	\N	apollo	2018-03-20 11:00:09.46	\N	2018-03-20 11:00:09.46	0
395	Item	394	INSERT	\N	apollo	2018-03-20 11:00:09.467	\N	2018-03-20 11:00:09.467	0
396	ItemSet	\N	INSERT	\N	apollo	2018-03-20 11:00:09.468	\N	2018-03-20 11:00:09.468	0
397	Item	268	UPDATE	\N	apollo	2018-03-20 11:00:09.492	\N	2018-03-20 11:00:09.492	0
398	Item	271	UPDATE	\N	apollo	2018-03-20 11:00:09.496	\N	2018-03-20 11:00:09.496	0
399	Item	275	UPDATE	\N	apollo	2018-03-20 11:00:09.499	\N	2018-03-20 11:00:09.499	0
400	Item	279	UPDATE	\N	apollo	2018-03-20 11:00:09.504	\N	2018-03-20 11:00:09.504	0
401	Item	281	UPDATE	\N	apollo	2018-03-20 11:00:09.507	\N	2018-03-20 11:00:09.507	0
402	Item	285	UPDATE	\N	apollo	2018-03-20 11:00:09.51	\N	2018-03-20 11:00:09.51	0
403	Item	287	UPDATE	\N	apollo	2018-03-20 11:00:09.521	\N	2018-03-20 11:00:09.521	0
404	Item	289	UPDATE	\N	apollo	2018-03-20 11:00:09.524	\N	2018-03-20 11:00:09.524	0
405	Item	291	UPDATE	\N	apollo	2018-03-20 11:00:09.526	\N	2018-03-20 11:00:09.526	0
406	Item	293	UPDATE	\N	apollo	2018-03-20 11:00:09.53	\N	2018-03-20 11:00:09.53	0
407	Item	299	UPDATE	\N	apollo	2018-03-20 11:00:09.532	\N	2018-03-20 11:00:09.532	0
408	Item	303	UPDATE	\N	apollo	2018-03-20 11:00:09.542	\N	2018-03-20 11:00:09.542	0
409	Item	305	UPDATE	\N	apollo	2018-03-20 11:00:09.544	\N	2018-03-20 11:00:09.544	0
410	Item	307	UPDATE	\N	apollo	2018-03-20 11:00:09.546	\N	2018-03-20 11:00:09.546	0
411	Item	309	UPDATE	\N	apollo	2018-03-20 11:00:09.549	\N	2018-03-20 11:00:09.549	0
412	Item	311	UPDATE	\N	apollo	2018-03-20 11:00:09.552	\N	2018-03-20 11:00:09.552	0
413	Item	313	UPDATE	\N	apollo	2018-03-20 11:00:09.565	\N	2018-03-20 11:00:09.565	0
414	Item	317	UPDATE	\N	apollo	2018-03-20 11:00:09.567	\N	2018-03-20 11:00:09.567	0
415	Item	319	UPDATE	\N	apollo	2018-03-20 11:00:09.571	\N	2018-03-20 11:00:09.571	0
416	Item	321	UPDATE	\N	apollo	2018-03-20 11:00:09.573	\N	2018-03-20 11:00:09.573	0
417	Item	323	UPDATE	\N	apollo	2018-03-20 11:00:09.578	\N	2018-03-20 11:00:09.578	0
418	Item	325	UPDATE	\N	apollo	2018-03-20 11:00:09.58	\N	2018-03-20 11:00:09.58	0
419	Item	327	UPDATE	\N	apollo	2018-03-20 11:00:09.582	\N	2018-03-20 11:00:09.582	0
420	Item	329	UPDATE	\N	apollo	2018-03-20 11:00:09.584	\N	2018-03-20 11:00:09.584	0
421	Item	333	UPDATE	\N	apollo	2018-03-20 11:00:09.587	\N	2018-03-20 11:00:09.587	0
422	Item	335	UPDATE	\N	apollo	2018-03-20 11:00:09.59	\N	2018-03-20 11:00:09.59	0
423	Item	337	UPDATE	\N	apollo	2018-03-20 11:00:09.592	\N	2018-03-20 11:00:09.592	0
424	Item	341	UPDATE	\N	apollo	2018-03-20 11:00:09.594	\N	2018-03-20 11:00:09.594	0
425	Item	343	UPDATE	\N	apollo	2018-03-20 11:00:09.596	\N	2018-03-20 11:00:09.596	0
426	Item	345	UPDATE	\N	apollo	2018-03-20 11:00:09.6	\N	2018-03-20 11:00:09.6	0
427	Item	347	UPDATE	\N	apollo	2018-03-20 11:00:09.605	\N	2018-03-20 11:00:09.605	0
428	Item	349	UPDATE	\N	apollo	2018-03-20 11:00:09.608	\N	2018-03-20 11:00:09.608	0
429	Item	351	UPDATE	\N	apollo	2018-03-20 11:00:09.61	\N	2018-03-20 11:00:09.61	0
430	Item	353	UPDATE	\N	apollo	2018-03-20 11:00:09.612	\N	2018-03-20 11:00:09.612	0
431	Item	357	UPDATE	\N	apollo	2018-03-20 11:00:09.614	\N	2018-03-20 11:00:09.614	0
432	Item	359	UPDATE	\N	apollo	2018-03-20 11:00:09.616	\N	2018-03-20 11:00:09.616	0
433	Item	361	UPDATE	\N	apollo	2018-03-20 11:00:09.618	\N	2018-03-20 11:00:09.618	0
434	Item	365	UPDATE	\N	apollo	2018-03-20 11:00:09.622	\N	2018-03-20 11:00:09.622	0
435	Item	367	UPDATE	\N	apollo	2018-03-20 11:00:09.635	\N	2018-03-20 11:00:09.635	0
436	ItemSet	\N	UPDATE	\N	apollo	2018-03-20 11:00:09.643	\N	2018-03-20 11:00:09.643	0
437	Item	273	DELETE	\N	apollo	2018-03-20 11:00:09.644	\N	2018-03-20 11:00:09.644	0
438	Item	283	DELETE	\N	apollo	2018-03-20 11:00:09.647	\N	2018-03-20 11:00:09.647	0
439	Item	297	DELETE	\N	apollo	2018-03-20 11:00:09.649	\N	2018-03-20 11:00:09.649	0
440	Item	315	DELETE	\N	apollo	2018-03-20 11:00:09.651	\N	2018-03-20 11:00:09.651	0
441	Item	331	DELETE	\N	apollo	2018-03-20 11:00:09.653	\N	2018-03-20 11:00:09.653	0
442	Item	339	DELETE	\N	apollo	2018-03-20 11:00:09.654	\N	2018-03-20 11:00:09.654	0
443	Item	355	DELETE	\N	apollo	2018-03-20 11:00:09.656	\N	2018-03-20 11:00:09.656	0
444	Item	363	DELETE	\N	apollo	2018-03-20 11:00:09.657	\N	2018-03-20 11:00:09.657	0
445	ItemSet	\N	DELETE	\N	apollo	2018-03-20 11:00:09.658	\N	2018-03-20 11:00:09.658	0
448	Release	447	INSERT	\N	apollo	2018-03-20 11:00:14.297	\N	2018-03-20 11:00:14.297	0
450	ReleaseHistory	449	INSERT	\N	apollo	2018-03-20 11:00:14.299	\N	2018-03-20 11:00:14.299	0
453	Namespace	452	INSERT	\N	apollo	2018-03-20 11:00:30.789	\N	2018-03-20 11:00:30.789	0
455	Namespace	454	INSERT	\N	apollo	2018-03-20 11:00:42.052	\N	2018-03-20 11:00:42.052	0
457	Namespace	456	INSERT	\N	apollo	2018-03-20 11:00:49.417	\N	2018-03-20 11:00:49.417	0
459	Release	458	INSERT	\N	apollo	2018-03-20 11:03:06.588	\N	2018-03-20 11:03:06.588	0
461	ReleaseHistory	460	INSERT	\N	apollo	2018-03-20 11:03:06.589	\N	2018-03-20 11:03:06.589	0
465	Item	120	UPDATE	\N	apollo	2018-03-20 11:17:55.699	\N	2018-03-20 11:17:55.699	0
468	Release	467	INSERT	\N	apollo	2018-03-20 11:17:58.44	\N	2018-03-20 11:17:58.44	0
470	ReleaseHistory	469	INSERT	\N	apollo	2018-03-20 11:17:58.441	\N	2018-03-20 11:17:58.441	0
486	App	485	INSERT	\N	apollo	2018-03-20 12:01:31.567	\N	2018-03-20 12:01:31.567	0
488	AppNamespace	487	INSERT	\N	apollo	2018-03-20 12:01:31.57	\N	2018-03-20 12:01:31.57	0
490	Cluster	489	INSERT	\N	apollo	2018-03-20 12:01:31.573	\N	2018-03-20 12:01:31.573	0
492	Namespace	491	INSERT	\N	apollo	2018-03-20 12:01:31.591	\N	2018-03-20 12:01:31.591	0
494	Item	493	INSERT	\N	apollo	2018-03-20 12:01:47.445	\N	2018-03-20 12:01:47.445	0
497	Release	496	INSERT	\N	apollo	2018-03-20 12:01:53.53	\N	2018-03-20 12:01:53.53	0
499	ReleaseHistory	498	INSERT	\N	apollo	2018-03-20 12:01:53.531	\N	2018-03-20 12:01:53.531	0
503	Item	493	UPDATE	\N	apollo	2018-03-20 12:04:28.095	\N	2018-03-20 12:04:28.095	0
506	Release	505	INSERT	\N	apollo	2018-03-20 12:04:32.283	\N	2018-03-20 12:04:32.283	0
508	ReleaseHistory	507	INSERT	\N	apollo	2018-03-20 12:04:32.284	\N	2018-03-20 12:04:32.284	0
511	Namespace	510	INSERT	\N	apollo	2018-03-20 12:05:53.241	\N	2018-03-20 12:05:53.241	0
513	Item	185	UPDATE	\N	apollo	2018-03-20 18:20:04.315	\N	2018-03-20 18:20:04.315	0
516	Release	515	INSERT	\N	apollo	2018-03-20 18:20:06.988	\N	2018-03-20 18:20:06.988	0
518	ReleaseHistory	517	INSERT	\N	apollo	2018-03-20 18:20:06.99	\N	2018-03-20 18:20:06.99	0
520	Item	189	UPDATE	\N	apollo	2018-03-20 18:42:42.043	\N	2018-03-20 18:42:42.043	0
523	Release	522	INSERT	\N	apollo	2018-03-20 18:42:45.723	\N	2018-03-20 18:42:45.723	0
525	ReleaseHistory	524	INSERT	\N	apollo	2018-03-20 18:42:45.724	\N	2018-03-20 18:42:45.724	0
527	Item	164	UPDATE	\N	apollo	2018-03-20 19:01:03.701	\N	2018-03-20 19:01:03.701	0
529	Item	528	INSERT	\N	apollo	2018-03-20 19:01:12.582	\N	2018-03-20 19:01:12.582	0
531	Item	164	DELETE	\N	apollo	2018-03-20 19:01:17.261	\N	2018-03-20 19:01:17.261	0
534	ReleaseHistory	533	INSERT	\N	apollo	2018-03-20 19:01:26.624	\N	2018-03-20 19:01:26.624	0
537	Release	536	INSERT	\N	apollo	2018-03-20 19:01:34.703	\N	2018-03-20 19:01:34.703	0
539	ReleaseHistory	538	INSERT	\N	apollo	2018-03-20 19:01:34.704	\N	2018-03-20 19:01:34.704	0
541	Item	120	UPDATE	\N	apollo	2018-03-20 19:02:06.356	\N	2018-03-20 19:02:06.356	0
544	Release	543	INSERT	\N	apollo	2018-03-20 19:02:08.56	\N	2018-03-20 19:02:08.56	0
546	ReleaseHistory	545	INSERT	\N	apollo	2018-03-20 19:02:08.561	\N	2018-03-20 19:02:08.561	0
560	Item	120	UPDATE	\N	apollo	2018-03-20 21:04:28.57	\N	2018-03-20 21:04:28.57	0
563	Release	562	INSERT	\N	apollo	2018-03-20 21:04:32.108	\N	2018-03-20 21:04:32.108	0
565	ReleaseHistory	564	INSERT	\N	apollo	2018-03-20 21:04:32.109	\N	2018-03-20 21:04:32.109	0
567	Item	185	UPDATE	\N	apollo	2018-03-20 21:04:55.437	\N	2018-03-20 21:04:55.437	0
570	Release	569	INSERT	\N	apollo	2018-03-20 21:04:58.911	\N	2018-03-20 21:04:58.911	0
572	ReleaseHistory	571	INSERT	\N	apollo	2018-03-20 21:04:58.913	\N	2018-03-20 21:04:58.913	0
\.


--
-- Data for Name: Cluster; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Cluster" ("Id", "Name", "AppId", "ParentClusterId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	default	SampleApp	0		\N		\N	0
17	default	c	0	apollo	2018-03-17 18:38:28.089	apollo	2018-03-17 18:38:28.089	0
25	default	f	0	apollo	2018-03-17 18:53:45.743	apollo	2018-03-17 18:53:45.743	0
33	default	g	0	apollo	2018-03-17 19:00:13.889	apollo	2018-03-17 19:00:13.889	0
41	default	a1	0	apollo	2018-03-17 19:47:36.559	apollo	2018-03-17 19:47:36.559	0
52	default	a2	0	apollo	2018-03-19 09:23:58.961	apollo	2018-03-19 09:23:58.961	0
88	default	troy-2.4	0	apollo	2018-03-19 18:16:53.098	apollo	2018-03-19 18:16:53.098	0
96	default	troy	0	apollo	2018-03-19 18:32:43.582	apollo	2018-03-19 18:32:43.582	0
104	default	common	0	apollo	2018-03-19 18:33:00.032	apollo	2018-03-19 18:33:00.032	0
264	default	heron	0	apollo	2018-03-20 10:46:29.325	apollo	2018-03-20 10:46:29.325	0
489	default	falcon	0	apollo	2018-03-20 12:01:31.572	apollo	2018-03-20 12:01:31.572	0
\.


--
-- Data for Name: Commit; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Commit" ("Id", "ChangeSets", "AppId", "ClusterName", "NamespaceName", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
47	18035	a1	default	application	\N	apollo	2018-03-17 19:48:03.638	apollo	2018-03-17 19:48:03.638	0
58	18038	a2	default	application	\N	apollo	2018-03-19 09:24:47.1	apollo	2018-03-19 09:24:47.1	0
61	18048	a2	default	application	\N	apollo	2018-03-19 09:57:27.23	apollo	2018-03-19 09:57:27.23	0
64	18051	a2	default	application	\N	apollo	2018-03-19 12:17:44.94	apollo	2018-03-19 12:17:44.94	0
67	18053	a2	default	application	\N	apollo	2018-03-19 14:17:32.004	apollo	2018-03-19 14:17:32.004	0
69	18054	a2	default	application	\N	apollo	2018-03-19 14:17:36.882	apollo	2018-03-19 14:17:36.882	0
71	18055	a2	default	application	\N	apollo	2018-03-19 14:17:39.431	apollo	2018-03-19 14:17:39.431	0
127	{"createItems":[{"namespaceId":98,"key":"virtualHost","value":"/datacanvas","comment":"","lineNum":1,"id":108,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":110,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"port","value":"5672","comment":"","lineNum":3,"id":112,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":114,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"user","value":"admin","comment":"","lineNum":5,"id":116,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"password","value":"admin","comment":"","lineNum":6,"id":118,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.209:8082","comment":"","lineNum":7,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"checkInterval","value":"10","comment":"","lineNum":8,"id":122,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"},{"namespaceId":98,"key":"retryCheckInterval","value":"10","comment":"","lineNum":9,"id":124,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:51:49"}],"updateItems":[],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-19 19:51:49.278	apollo	2018-03-19 19:51:49.278	0
139	{"createItems":[],"updateItems":[],"deleteItems":[{"namespaceId":98,"key":"password","value":"admin","comment":"","lineNum":6,"id":118,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},{"namespaceId":98,"key":"port","value":"5672","comment":"","lineNum":3,"id":112,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},{"namespaceId":98,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":110,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},{"namespaceId":98,"key":"virtualHost","value":"/datacanvas","comment":"","lineNum":1,"id":108,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},{"namespaceId":98,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":114,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},{"namespaceId":98,"key":"user","value":"admin","comment":"","lineNum":5,"id":116,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"}]}	troy	default	application	\N	apollo	2018-03-19 19:52:15.85	apollo	2018-03-19 19:52:15.85	0
153	{"createItems":[{"namespaceId":106,"key":"virtualHost","value":"/datacanvas","comment":"","lineNum":1,"id":140,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"},{"namespaceId":106,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":142,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"},{"namespaceId":106,"key":"port","value":"5672","comment":"","lineNum":3,"id":144,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"},{"namespaceId":106,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":146,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"},{"namespaceId":106,"key":"user","value":"admin","comment":"","lineNum":5,"id":148,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"},{"namespaceId":106,"key":"password","value":"admin","comment":"","lineNum":6,"id":150,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:31"}],"updateItems":[],"deleteItems":[]}	common	default	application	\N	apollo	2018-03-19 19:52:31.495	apollo	2018-03-19 19:52:31.495	0
173	{"createItems":[{"namespaceId":98,"key":"Log.appenders","value":"console,rolling","comment":"","lineNum":4,"id":164,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:59:56","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:59:56"},{"namespaceId":98,"key":"log.level","value":"debug","comment":"","lineNum":5,"id":166,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:59:56","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:59:56"},{"namespaceId":98,"key":"log.folder","value":"/tmp/log/troy/","comment":"","lineNum":6,"id":168,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:59:56","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:59:56"},{"namespaceId":98,"key":"log.fileName","value":"troy","comment":"","lineNum":7,"id":170,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:59:56","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:59:56"}],"updateItems":[],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-19 19:59:56.628	apollo	2018-03-19 19:59:56.628	0
196	{"createItems":[{"namespaceId":180,"key":"virtualHost","value":"/datacanvas","comment":"","lineNum":1,"id":183,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},{"namespaceId":180,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":185,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},{"namespaceId":180,"key":"port","value":"5672","comment":"","lineNum":3,"id":187,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},{"namespaceId":180,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":189,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},{"namespaceId":180,"key":"user","value":"admin","comment":"","lineNum":5,"id":191,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},{"namespaceId":180,"key":"password","value":"admin","comment":"","lineNum":6,"id":193,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"}],"updateItems":[],"deleteItems":[]}	common	default	aps.rabbitmq	\N	apollo	2018-03-20 10:34:49.943	apollo	2018-03-20 10:34:49.943	0
207	{"createItems":[],"updateItems":[],"deleteItems":[{"namespaceId":106,"key":"password","value":"admin","comment":"","lineNum":6,"id":150,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"},{"namespaceId":106,"key":"port","value":"5672","comment":"","lineNum":3,"id":144,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"},{"namespaceId":106,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":142,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"},{"namespaceId":106,"key":"virtualHost","value":"/datacanvas","comment":"","lineNum":1,"id":140,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"},{"namespaceId":106,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":146,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"},{"namespaceId":106,"key":"user","value":"admin","comment":"","lineNum":5,"id":148,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:52:31","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:35:02"}]}	common	default	application	\N	apollo	2018-03-20 10:35:02.385	apollo	2018-03-20 10:35:02.385	0
235	{"createItems":[{"namespaceId":221,"key":"ip","value":"192.168.20.197","comment":"","lineNum":1,"id":224,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:39:29","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:39:29"},{"namespaceId":221,"key":"port","value":"5432","comment":"","lineNum":2,"id":226,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:39:29","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:39:29"},{"namespaceId":221,"key":"user","value":"triceed","comment":"","lineNum":3,"id":228,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:39:29","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:39:29"},{"namespaceId":221,"key":"password","value":"Server2008!","comment":"","lineNum":4,"id":230,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:39:29","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:39:29"},{"namespaceId":221,"key":"db","value":"datacanvas","comment":"","lineNum":5,"id":232,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:39:29","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:39:29"}],"updateItems":[],"deleteItems":[]}	common	default	aps.postgresql	\N	apollo	2018-03-20 10:39:29.702	apollo	2018-03-20 10:39:29.702	0
254	{"createItems":[{"namespaceId":242,"key":"host","value":"192.168.20.249","comment":"","lineNum":1,"id":245,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:41:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:41:47"},{"namespaceId":242,"key":"port","value":"6379","comment":"","lineNum":2,"id":247,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:41:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:41:47"},{"namespaceId":242,"key":"db","value":"1","comment":"","lineNum":3,"id":249,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:41:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:41:47"},{"namespaceId":242,"key":"secret","value":"123456","comment":"","lineNum":4,"id":251,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:41:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:41:47"}],"updateItems":[],"deleteItems":[]}	common	default	aps.redis	\N	apollo	2018-03-20 10:41:47.799	apollo	2018-03-20 10:41:47.799	0
270	{"createItems":[{"namespaceId":266,"key":"log.folder","value":"/var/log/aps/heron/","lineNum":1,"id":268,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:47:23","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:47:23"}],"updateItems":[],"deleteItems":[]}	heron	default	application	\N	apollo	2018-03-20 10:47:23.098	apollo	2018-03-20 10:47:23.098	0
296	{"createItems":[{"namespaceId":266,"key":"log.fileName","value":"heron","comment":"","lineNum":2,"id":271,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"git.root","value":"/mnt/nfsfile/gitlocal/gitrepo","comment":"","lineNum":4,"id":275,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"server.host","value":"0.0.0.0","comment":"","lineNum":6,"id":279,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"server.port","value":"8081","comment":"","lineNum":7,"id":281,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"dependencies.python.host","value":"http://python.repo.aps.com:8088/simple/","comment":"","lineNum":9,"id":285,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"dependencies.python.trustHost","value":"python.repo.aps.com","comment":"","lineNum":10,"id":287,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"dependencies.python3.host","value":"http://python.repo.aps.com:8088/simple/","comment":"","lineNum":11,"id":289,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"dependencies.python3.trustHost","value":"python.repo.aps.com","comment":"","lineNum":12,"id":291,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"},{"namespaceId":266,"key":"dependencies.r.host","value":"r.repo.aps.com:180","comment":"","lineNum":13,"id":293,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:50:42","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:50:42"}],"updateItems":[],"deleteItems":[]}	heron	default	application	\N	apollo	2018-03-20 10:50:42.993	apollo	2018-03-20 10:50:42.993	0
370	{"createItems":[{"namespaceId":266,"key":"kerberosAuth","value":"true","comment":"","lineNum":15,"id":299,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.ideFrameworkId","value":"001","comment":"","lineNum":17,"id":303,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.ideFrameworkName","value":"IDEFramework1","comment":"","lineNum":18,"id":305,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.ideRole","value":"heron","comment":"","lineNum":19,"id":307,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.appFrameworkId","value":"002","comment":"","lineNum":20,"id":309,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.appFrameworkName","value":"APPFramework","comment":"","lineNum":21,"id":311,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"frameworks.appRole","value":"controller","comment":"","lineNum":22,"id":313,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.resource.cpus","value":"0.5","comment":"","lineNum":24,"id":317,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.resource.mem","value":"1024","comment":"","lineNum":25,"id":319,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.restartNo","value":"3","comment":"","lineNum":26,"id":321,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.taskGc.strategy","value":"time","comment":"","lineNum":27,"id":323,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.taskGc.percent","value":"20","comment":"","lineNum":28,"id":325,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.cmd_out_queue","value":"cmd_out_queue","comment":"","lineNum":29,"id":327,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"ide.spec_queue","value":"spec_queue","comment":"","lineNum":30,"id":329,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"app.resource.cpus","value":"1","comment":"","lineNum":32,"id":333,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"app.resource.mem","value":"1024","comment":"","lineNum":33,"id":335,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"app.jobWorkDir","value":"/mnt/nfsfile/jobWorkDir/","comment":"","lineNum":34,"id":337,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.workDir","value":"/home/apsapp","comment":"","lineNum":36,"id":341,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.userDataDir","value":"/mnt/nfsfile/userdata","comment":"","lineNum":37,"id":343,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.hostPath","value":"D:/host.json","comment":"","lineNum":38,"id":345,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.volumePath","value":"D:/volume.json","comment":"","lineNum":39,"id":347,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.logger.type","value":"logserver","comment":"","lineNum":40,"id":349,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.logger.data","value":"recorder.aps.com:3000","comment":"","lineNum":41,"id":351,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"container.user","value":"apsapp","comment":"","lineNum":42,"id":353,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"heronFalconQueue","value":"falcon_response","comment":"","lineNum":44,"id":357,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"heronPipesQueue","value":"heron_pipes_queue","comment":"","lineNum":45,"id":359,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"heronControllerQueue","value":"heron_controller_queue","comment":"","lineNum":46,"id":361,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"recorder.host","value":"recorder.aps.com","comment":"","lineNum":48,"id":365,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"},{"namespaceId":266,"key":"recorder.port","value":"3000","comment":"","lineNum":49,"id":367,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:56:05","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:56:05"}],"updateItems":[],"deleteItems":[]}	heron	default	application	\N	apollo	2018-03-20 10:56:05.575	apollo	2018-03-20 10:56:05.575	0
446	{"createItems":[{"namespaceId":266,"key":"log.appenders","value":"console,rolling","comment":"","lineNum":1,"id":376,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 11:00:09","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 11:00:09"},{"namespaceId":266,"key":"log.level","value":"info","comment":"","lineNum":2,"id":378,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 11:00:09","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 11:00:09"}],"updateItems":[],"deleteItems":[]}	heron	default	application	\N	apollo	2018-03-20 11:00:09.659	apollo	2018-03-20 11:00:09.659	0
466	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.209:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-19 19:52:15"},"newItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.20912111:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 11:17:55"}}],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-20 11:17:55.727	apollo	2018-03-20 11:17:55.727	0
495	{"createItems":[{"namespaceId":491,"key":"address","value":"0....","lineNum":1,"id":493,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 12:01:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 12:01:47"}],"updateItems":[],"deleteItems":[]}	falcon	default	application	\N	apollo	2018-03-20 12:01:47.451	apollo	2018-03-20 12:01:47.451	0
530	{"createItems":[{"namespaceId":98,"key":"log.appenders","value":"console,rolling","lineNum":8,"id":528,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 19:01:12","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 19:01:12"}],"updateItems":[],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-20 19:01:12.589	apollo	2018-03-20 19:01:12.589	0
561	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.209:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 19:02:06"},"newItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.249:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 21:04:28"}}],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-20 21:04:28.577	apollo	2018-03-20 21:04:28.577	0
568	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":180,"key":"host","value":"192.168.20.209","comment":"","lineNum":2,"id":185,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 18:20:04"},"newItem":{"namespaceId":180,"key":"host","value":"192.168.20.249","comment":"","lineNum":2,"id":185,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 21:04:55"}}],"deleteItems":[]}	common	default	aps.rabbitmq	\N	apollo	2018-03-20 21:04:55.446	apollo	2018-03-20 21:04:55.446	0
504	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":491,"key":"address","value":"0....","lineNum":1,"id":493,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 12:01:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 12:01:47"},"newItem":{"namespaceId":491,"key":"address","value":"a,b,c","comment":"","lineNum":1,"id":493,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 12:01:47","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 12:04:28"}}],"deleteItems":[]}	falcon	default	application	\N	apollo	2018-03-20 12:04:28.121	apollo	2018-03-20 12:04:28.121	0
514	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":180,"key":"host","value":"mq1.aps.com","comment":"","lineNum":2,"id":185,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},"newItem":{"namespaceId":180,"key":"host","value":"192.168.20.209","comment":"","lineNum":2,"id":185,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 18:20:04"}}],"deleteItems":[]}	common	default	aps.rabbitmq	\N	apollo	2018-03-20 18:20:04.35	apollo	2018-03-20 18:20:04.35	0
521	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":180,"key":"saslAuth","value":"false","comment":"","lineNum":4,"id":189,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 10:34:49"},"newItem":{"namespaceId":180,"key":"saslAuth","value":"true","comment":"","lineNum":4,"id":189,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-20 10:34:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 18:42:42"}}],"deleteItems":[]}	common	default	aps.rabbitmq	\N	apollo	2018-03-20 18:42:42.078	apollo	2018-03-20 18:42:42.078	0
532	{"createItems":[],"updateItems":[],"deleteItems":[{"namespaceId":98,"key":"Log.appenders","value":"console,rolling","comment":"","lineNum":4,"id":164,"isDeleted":true,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:59:56","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 19:01:17"}]}	troy	default	application	\N	apollo	2018-03-20 19:01:17.322	apollo	2018-03-20 19:01:17.322	0
542	{"createItems":[],"updateItems":[{"oldItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.20912111:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 11:17:55"},"newItem":{"namespaceId":98,"key":"falconUrl","value":"http://192.168.20.209:8082","comment":"","lineNum":1,"id":120,"isDeleted":false,"dataChangeCreatedBy":"apollo","dataChangeCreatedTime":"2018-03-19 19:51:49","dataChangeLastModifiedBy":"apollo","dataChangeLastModifiedTime":"2018-03-20 19:02:06"}}],"deleteItems":[]}	troy	default	application	\N	apollo	2018-03-20 19:02:06.366	apollo	2018-03-20 19:02:06.366	0
\.


--
-- Data for Name: GrayReleaseRule; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "GrayReleaseRule" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "Rules", "ReleaseId", "BranchStatus", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: Instance; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Instance" ("Id", "AppId", "ClusterName", "DataCenter", "Ip", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
82	a2	default		192.168.4.125	2018-03-19 14:37:34.012	2018-03-19 14:37:34.012
463	heron	default		192.168.85.1	2018-03-20 11:08:12.129	2018-03-20 11:08:12.129
472	APS-Troy-2.4	default		192.168.4.125	2018-03-20 11:24:50.96	2018-03-20 11:24:50.96
474	SampleApp	default		192.168.20.246	2018-03-20 11:29:42.363	2018-03-20 11:29:42.363
476	troy	default		192.168.20.246	2018-03-20 11:30:59.478	2018-03-20 11:30:59.478
478	troy	default		192.168.4.125	2018-03-20 11:34:36.787	2018-03-20 11:34:36.787
481	heron	default		192.168.4.125	2018-03-20 11:40:16.55	2018-03-20 11:40:16.55
501	falcon	default		192.168.4.125	2018-03-20 12:04:09.895	2018-03-20 12:04:09.895
548	troy	default		172.17.0.2	2018-03-20 20:33:58.461	2018-03-20 20:33:58.461
551	troy	default		172.17.0.13	2018-03-20 20:38:44.664	2018-03-20 20:38:44.664
554	troy	default		172.17.0.11	2018-03-20 20:53:54.402	2018-03-20 20:53:54.402
557	troy	default		172.17.0.12	2018-03-20 20:57:37.597	2018-03-20 20:57:37.597
574	troy	default		172.17.0.4	2018-03-20 21:05:44.96	2018-03-20 21:05:44.96
577	troy	default		172.17.0.9	2018-03-20 21:06:20.033	2018-03-20 21:06:20.033
580	troy	default		172.17.0.3	2018-03-20 21:25:00.147	2018-03-20 21:25:00.147
\.


--
-- Data for Name: InstanceConfig; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "InstanceConfig" ("Id", "InstanceId", "ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "ReleaseKey", "ReleaseDeliveryTime", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
83	82	a2	default	application	20180319143246-3f3faf30fc0e81a1	2018-03-19 14:37:33.603	2018-03-19 14:37:33.603	2018-03-19 14:37:33.603
464	463	heron	default	application	20180320110014-7e42bf3e914c66f7	2018-03-20 11:08:11.334	2018-03-20 11:08:11.334	2018-03-20 11:08:11.334
473	472	common	default	aps.rabbitmq	20180320103513-3931bf3e914c66f3	2018-03-20 11:24:50.739	2018-03-20 11:24:50.739	2018-03-20 11:24:50.739
475	474	SampleApp	default	application	20161009155425-d3a0749c6e20bc15	2018-03-20 11:29:41.992	2018-03-20 11:29:41.992	2018-03-20 11:29:41.992
482	481	heron	default	application	20180320110014-7e42bf3e914c66f7	2018-03-20 11:40:16.419	2018-03-20 11:40:16.419	2018-03-20 11:40:16.419
483	463	heron	default	aps.rabbitmq	20180320110306-f0babf3e914c66f8	2018-03-20 11:46:09.218	2018-03-20 11:46:09.218	2018-03-20 11:46:09.218
484	463	common	default	aps.rabbitmq	20180320103513-3931bf3e914c66f3	2018-03-20 11:46:09.218	2018-03-20 11:46:09.218	2018-03-20 11:46:09.218
502	501	falcon	default	application	20180320120432-4c1fbf3e914c66fb	2018-03-20 12:04:54.982	2018-03-20 12:04:09.555	2018-03-20 12:04:56.09
512	501	common	default	aps.rabbitmq	20180320103513-3931bf3e914c66f3	2018-03-20 12:07:20.61	2018-03-20 12:07:20.61	2018-03-20 12:07:20.61
480	478	common	default	aps.rabbitmq	20180320184245-3931bf3e914c66fd	2018-03-20 18:42:54.035	2018-03-20 11:34:38.851	2018-03-20 18:42:54.542
479	478	troy	default	application	20180320190208-4676bf3e914c66ff	2018-03-20 19:02:14.298	2018-03-20 11:34:36.521	2018-03-20 19:02:14.38
552	551	troy	default	application	20180320190208-4676bf3e914c66ff	2018-03-20 20:38:43.998	2018-03-20 20:38:43.998	2018-03-20 20:38:43.998
553	551	common	default	aps.rabbitmq	20180320184245-3931bf3e914c66fd	2018-03-20 20:38:44.206	2018-03-20 20:38:44.206	2018-03-20 20:38:44.206
555	554	troy	default	application	20180320190208-4676bf3e914c66ff	2018-03-20 20:53:53.551	2018-03-20 20:53:53.551	2018-03-20 20:53:53.551
556	554	common	default	aps.rabbitmq	20180320184245-3931bf3e914c66fd	2018-03-20 20:53:53.63	2018-03-20 20:53:53.63	2018-03-20 20:53:53.63
575	574	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:05:44.085	2018-03-20 21:05:44.085	2018-03-20 21:05:44.085
576	574	common	default	aps.rabbitmq	20180320210458-3931bf3e914c6701	2018-03-20 21:05:44.273	2018-03-20 21:05:44.273	2018-03-20 21:05:44.273
558	557	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:06:53.744	2018-03-20 20:57:36.847	2018-03-20 21:06:54.103
559	557	common	default	aps.rabbitmq	20180320210458-3931bf3e914c6701	2018-03-20 21:06:53.937	2018-03-20 20:57:36.95	2018-03-20 21:06:54.109
581	580	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:24:59.519	2018-03-20 21:24:59.519	2018-03-20 21:24:59.519
582	580	common	default	aps.rabbitmq	20180320210458-3931bf3e914c6701	2018-03-20 21:24:59.687	2018-03-20 21:24:59.687	2018-03-20 21:24:59.687
477	476	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:04:32.767	2018-03-20 11:30:58.615	2018-03-21 21:05:59.328
549	548	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:05:10.371	2018-03-20 20:33:58.221	2018-03-21 21:06:17.359
550	548	common	default	aps.rabbitmq	20180320210458-3931bf3e914c6701	2018-03-20 21:05:10.559	2018-03-20 20:33:58.36	2018-03-21 21:06:17.391
578	577	troy	default	application	20180320210432-4676bf3e914c6700	2018-03-20 21:06:19.387	2018-03-20 21:06:19.387	2018-03-21 21:07:23.486
579	577	common	default	aps.rabbitmq	20180320210458-3931bf3e914c6701	2018-03-20 21:06:19.643	2018-03-20 21:06:19.643	2018-03-21 21:07:23.532
\.


--
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Item" ("Id", "NamespaceId", "Key", "Value", "Comment", "LineNum", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	1	timeout	100	sample timeout配置	1	\N	\N		\N	0
187	180	port	5672		3	apollo	2018-03-20 10:34:49.837	apollo	2018-03-20 10:34:49.951	0
65	54	name1	value1	\N	3	apollo	2018-03-19 14:17:31.939	apollo	2018-03-19 14:17:32.006	0
191	180	user	admin		5	apollo	2018-03-20 10:34:49.843	apollo	2018-03-20 10:34:49.952	0
59	54	timeout	18049	\N	1	apollo	2018-03-19 09:57:27.082	apollo	2018-03-19 14:17:36.886	1
193	180	password	admin		6	apollo	2018-03-20 10:34:49.845	apollo	2018-03-20 10:34:49.952	0
62	54	t	18052	\N	2	apollo	2018-03-19 12:17:44.769	apollo	2018-03-19 14:17:39.434	1
197	106				1	apollo	2018-03-20 10:35:02.235	apollo	2018-03-20 10:35:02.235	0
150	106	password	admin		6	apollo	2018-03-19 19:52:31.491	apollo	2018-03-20 10:35:02.387	1
144	106	port	5672		3	apollo	2018-03-19 19:52:31.486	apollo	2018-03-20 10:35:02.388	1
142	106	host	mq1.aps.com		2	apollo	2018-03-19 19:52:31.485	apollo	2018-03-20 10:35:02.388	1
140	106	virtualHost	/datacanvas		1	apollo	2018-03-19 19:52:31.475	apollo	2018-03-20 10:35:02.388	1
146	106	saslAuth	false		4	apollo	2018-03-19 19:52:31.488	apollo	2018-03-20 10:35:02.388	1
148	106	user	admin		5	apollo	2018-03-19 19:52:31.49	apollo	2018-03-20 10:35:02.388	1
122	98	checkInterval	10		2	apollo	2018-03-19 19:51:49.26	apollo	2018-03-19 19:52:15.851	0
124	98	retryCheckInterval	10		3	apollo	2018-03-19 19:51:49.261	apollo	2018-03-19 19:52:15.851	0
118	98	password	admin		6	apollo	2018-03-19 19:51:49.256	apollo	2018-03-19 19:52:15.852	1
112	98	port	5672		3	apollo	2018-03-19 19:51:49.251	apollo	2018-03-19 19:52:15.852	1
110	98	host	mq1.aps.com		2	apollo	2018-03-19 19:51:49.249	apollo	2018-03-19 19:52:15.852	1
108	98	virtualHost	/datacanvas		1	apollo	2018-03-19 19:51:49.246	apollo	2018-03-19 19:52:15.852	1
114	98	saslAuth	false		4	apollo	2018-03-19 19:51:49.252	apollo	2018-03-19 19:52:15.852	1
116	98	user	admin		5	apollo	2018-03-19 19:51:49.254	apollo	2018-03-19 19:52:15.852	1
189	180	saslAuth	true		4	apollo	2018-03-20 10:34:49.841	apollo	2018-03-20 18:42:42.079	0
164	98	Log.appenders	console,rolling		4	apollo	2018-03-19 19:59:56.619	apollo	2018-03-20 19:01:17.331	1
166	98	log.level	debug		5	apollo	2018-03-19 19:59:56.621	apollo	2018-03-19 19:59:56.629	0
168	98	log.folder	/tmp/log/troy/		6	apollo	2018-03-19 19:59:56.623	apollo	2018-03-19 19:59:56.629	0
170	98	log.fileName	troy		7	apollo	2018-03-19 19:59:56.625	apollo	2018-03-19 19:59:56.63	0
183	180	virtualHost	/datacanvas		1	apollo	2018-03-20 10:34:49.786	apollo	2018-03-20 10:34:49.948	0
224	221	ip	192.168.20.197		1	apollo	2018-03-20 10:39:29.656	apollo	2018-03-20 10:39:29.709	0
226	221	port	5432		2	apollo	2018-03-20 10:39:29.659	apollo	2018-03-20 10:39:29.709	0
228	221	user	triceed		3	apollo	2018-03-20 10:39:29.662	apollo	2018-03-20 10:39:29.71	0
230	221	password	Server2008!		4	apollo	2018-03-20 10:39:29.664	apollo	2018-03-20 10:39:29.71	0
232	221	db	datacanvas		5	apollo	2018-03-20 10:39:29.665	apollo	2018-03-20 10:39:29.71	0
245	242	host	192.168.20.249		1	apollo	2018-03-20 10:41:47.731	apollo	2018-03-20 10:41:47.801	0
247	242	port	6379		2	apollo	2018-03-20 10:41:47.755	apollo	2018-03-20 10:41:47.801	0
249	242	db	1		3	apollo	2018-03-20 10:41:47.774	apollo	2018-03-20 10:41:47.801	0
251	242	secret	123456		4	apollo	2018-03-20 10:41:47.79	apollo	2018-03-20 10:41:47.802	0
277	266				5	apollo	2018-03-20 10:50:42.978	apollo	2018-03-20 10:50:42.978	0
120	98	falconUrl	http://192.168.20.249:8082		1	apollo	2018-03-19 19:51:49.257	apollo	2018-03-20 21:04:28.591	0
268	266	log.folder	/var/log/aps/heron/	\N	3	apollo	2018-03-20 10:47:23.067	apollo	2018-03-20 11:00:09.661	0
271	266	log.fileName	heron		4	apollo	2018-03-20 10:50:42.972	apollo	2018-03-20 11:00:09.661	0
275	266	git.root	/mnt/nfsfile/gitlocal/gitrepo		6	apollo	2018-03-20 10:50:42.977	apollo	2018-03-20 11:00:09.661	0
279	266	server.host	0.0.0.0		8	apollo	2018-03-20 10:50:42.98	apollo	2018-03-20 11:00:09.661	0
281	266	server.port	8081		9	apollo	2018-03-20 10:50:42.981	apollo	2018-03-20 11:00:09.661	0
285	266	dependencies.python.host	http://python.repo.aps.com:8088/simple/		11	apollo	2018-03-20 10:50:42.984	apollo	2018-03-20 11:00:09.661	0
287	266	dependencies.python.trustHost	python.repo.aps.com		12	apollo	2018-03-20 10:50:42.986	apollo	2018-03-20 11:00:09.661	0
289	266	dependencies.python3.host	http://python.repo.aps.com:8088/simple/		13	apollo	2018-03-20 10:50:42.987	apollo	2018-03-20 11:00:09.661	0
291	266	dependencies.python3.trustHost	python.repo.aps.com		14	apollo	2018-03-20 10:50:42.989	apollo	2018-03-20 11:00:09.661	0
273	266				3	apollo	2018-03-20 10:50:42.974	apollo	2018-03-20 11:00:09.662	1
283	266				8	apollo	2018-03-20 10:50:42.982	apollo	2018-03-20 11:00:09.662	1
185	180	host	192.168.20.249		2	apollo	2018-03-20 10:34:49.83	apollo	2018-03-20 21:04:55.453	0
301	266				16	apollo	2018-03-20 10:56:05.451	apollo	2018-03-20 10:56:05.451	0
380	266				7	apollo	2018-03-20 11:00:09.379	apollo	2018-03-20 11:00:09.379	0
382	266				10	apollo	2018-03-20 11:00:09.392	apollo	2018-03-20 11:00:09.392	0
384	266				18	apollo	2018-03-20 11:00:09.403	apollo	2018-03-20 11:00:09.403	0
386	266				25	apollo	2018-03-20 11:00:09.44	apollo	2018-03-20 11:00:09.44	0
388	266				33	apollo	2018-03-20 11:00:09.442	apollo	2018-03-20 11:00:09.442	0
390	266				37	apollo	2018-03-20 11:00:09.443	apollo	2018-03-20 11:00:09.443	0
392	266				45	apollo	2018-03-20 11:00:09.452	apollo	2018-03-20 11:00:09.452	0
394	266				49	apollo	2018-03-20 11:00:09.466	apollo	2018-03-20 11:00:09.466	0
376	266	log.appenders	console,rolling		1	apollo	2018-03-20 11:00:09.363	apollo	2018-03-20 11:00:09.66	0
378	266	log.level	info		2	apollo	2018-03-20 11:00:09.367	apollo	2018-03-20 11:00:09.66	0
293	266	dependencies.r.host	r.repo.aps.com:180		15	apollo	2018-03-20 10:50:42.99	apollo	2018-03-20 11:00:09.661	0
299	266	kerberosAuth	true		17	apollo	2018-03-20 10:56:05.44	apollo	2018-03-20 11:00:09.661	0
303	266	frameworks.ideFrameworkId	001		19	apollo	2018-03-20 10:56:05.463	apollo	2018-03-20 11:00:09.661	0
305	266	frameworks.ideFrameworkName	IDEFramework1		20	apollo	2018-03-20 10:56:05.465	apollo	2018-03-20 11:00:09.661	0
307	266	frameworks.ideRole	heron		21	apollo	2018-03-20 10:56:05.486	apollo	2018-03-20 11:00:09.661	0
309	266	frameworks.appFrameworkId	002		22	apollo	2018-03-20 10:56:05.489	apollo	2018-03-20 11:00:09.661	0
311	266	frameworks.appFrameworkName	APPFramework		23	apollo	2018-03-20 10:56:05.49	apollo	2018-03-20 11:00:09.661	0
313	266	frameworks.appRole	controller		24	apollo	2018-03-20 10:56:05.492	apollo	2018-03-20 11:00:09.661	0
317	266	ide.resource.cpus	0.5		26	apollo	2018-03-20 10:56:05.5	apollo	2018-03-20 11:00:09.661	0
319	266	ide.resource.mem	1024		27	apollo	2018-03-20 10:56:05.508	apollo	2018-03-20 11:00:09.661	0
321	266	ide.restartNo	3		28	apollo	2018-03-20 10:56:05.51	apollo	2018-03-20 11:00:09.661	0
323	266	ide.taskGc.strategy	time		29	apollo	2018-03-20 10:56:05.511	apollo	2018-03-20 11:00:09.661	0
325	266	ide.taskGc.percent	20		30	apollo	2018-03-20 10:56:05.519	apollo	2018-03-20 11:00:09.661	0
327	266	ide.cmd_out_queue	cmd_out_queue		31	apollo	2018-03-20 10:56:05.52	apollo	2018-03-20 11:00:09.661	0
329	266	ide.spec_queue	spec_queue		32	apollo	2018-03-20 10:56:05.522	apollo	2018-03-20 11:00:09.661	0
333	266	app.resource.cpus	1		34	apollo	2018-03-20 10:56:05.541	apollo	2018-03-20 11:00:09.661	0
335	266	app.resource.mem	1024		35	apollo	2018-03-20 10:56:05.543	apollo	2018-03-20 11:00:09.661	0
337	266	app.jobWorkDir	/mnt/nfsfile/jobWorkDir/		36	apollo	2018-03-20 10:56:05.544	apollo	2018-03-20 11:00:09.661	0
341	266	container.workDir	/home/apsapp		38	apollo	2018-03-20 10:56:05.548	apollo	2018-03-20 11:00:09.661	0
343	266	container.userDataDir	/mnt/nfsfile/userdata		39	apollo	2018-03-20 10:56:05.549	apollo	2018-03-20 11:00:09.661	0
345	266	container.hostPath	D:/host.json		40	apollo	2018-03-20 10:56:05.551	apollo	2018-03-20 11:00:09.661	0
347	266	container.volumePath	D:/volume.json		41	apollo	2018-03-20 10:56:05.552	apollo	2018-03-20 11:00:09.661	0
349	266	container.logger.type	logserver		42	apollo	2018-03-20 10:56:05.554	apollo	2018-03-20 11:00:09.661	0
351	266	container.logger.data	recorder.aps.com:3000		43	apollo	2018-03-20 10:56:05.555	apollo	2018-03-20 11:00:09.661	0
353	266	container.user	apsapp		44	apollo	2018-03-20 10:56:05.557	apollo	2018-03-20 11:00:09.661	0
357	266	heronFalconQueue	falcon_response		46	apollo	2018-03-20 10:56:05.563	apollo	2018-03-20 11:00:09.662	0
359	266	heronPipesQueue	heron_pipes_queue		47	apollo	2018-03-20 10:56:05.564	apollo	2018-03-20 11:00:09.662	0
361	266	heronControllerQueue	heron_controller_queue		48	apollo	2018-03-20 10:56:05.566	apollo	2018-03-20 11:00:09.662	0
365	266	recorder.host	recorder.aps.com		50	apollo	2018-03-20 10:56:05.57	apollo	2018-03-20 11:00:09.662	0
367	266	recorder.port	3000		51	apollo	2018-03-20 10:56:05.572	apollo	2018-03-20 11:00:09.662	0
297	266				14	apollo	2018-03-20 10:56:05.436	apollo	2018-03-20 11:00:09.662	1
315	266				23	apollo	2018-03-20 10:56:05.498	apollo	2018-03-20 11:00:09.662	1
331	266				31	apollo	2018-03-20 10:56:05.531	apollo	2018-03-20 11:00:09.662	1
339	266				35	apollo	2018-03-20 10:56:05.546	apollo	2018-03-20 11:00:09.662	1
355	266				43	apollo	2018-03-20 10:56:05.559	apollo	2018-03-20 11:00:09.662	1
363	266				47	apollo	2018-03-20 10:56:05.567	apollo	2018-03-20 11:00:09.662	1
493	491	address	a,b,c		1	apollo	2018-03-20 12:01:47.444	apollo	2018-03-20 12:04:28.122	0
528	98	log.appenders	console,rolling	\N	8	apollo	2018-03-20 19:01:12.58	apollo	2018-03-20 19:01:12.59	0
\.


--
-- Data for Name: Namespace; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Namespace" ("Id", "AppId", "ClusterName", "NamespaceName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	SampleApp	default	application	\N	\N		\N	0
19	c	default	application	apollo	2018-03-17 18:38:28.174	apollo	2018-03-17 18:38:28.174	0
27	f	default	application	apollo	2018-03-17 18:53:45.816	apollo	2018-03-17 18:53:45.816	0
35	g	default	application	apollo	2018-03-17 19:00:13.956	apollo	2018-03-17 19:00:13.956	0
43	a1	default	application	apollo	2018-03-17 19:47:37.223	apollo	2018-03-17 19:47:37.223	0
54	a2	default	application	apollo	2018-03-19 09:23:59.032	apollo	2018-03-19 09:23:59.032	0
90	troy-2.4	default	application	apollo	2018-03-19 18:16:53.286	apollo	2018-03-19 18:16:53.286	0
98	troy	default	application	apollo	2018-03-19 18:32:43.622	apollo	2018-03-19 18:32:43.622	0
106	common	default	application	apollo	2018-03-19 18:33:00.047	apollo	2018-03-19 18:33:00.047	0
180	common	default	aps.rabbitmq	apollo	2018-03-20 10:34:29.365	apollo	2018-03-20 10:34:29.365	0
218	troy	default	aps.rabbitmq	apollo	2018-03-20 10:35:51.981	apollo	2018-03-20 10:35:51.981	0
221	common	default	aps.postgresql	apollo	2018-03-20 10:37:18.98	apollo	2018-03-20 10:37:18.98	0
242	common	default	aps.redis	apollo	2018-03-20 10:41:03.301	apollo	2018-03-20 10:41:03.301	0
266	heron	default	application	apollo	2018-03-20 10:46:29.392	apollo	2018-03-20 10:46:29.392	0
452	heron	default	aps.rabbitmq	apollo	2018-03-20 11:00:30.788	apollo	2018-03-20 11:00:30.788	0
454	heron	default	aps.postgresql	apollo	2018-03-20 11:00:42.05	apollo	2018-03-20 11:00:42.05	0
456	heron	default	aps.redis	apollo	2018-03-20 11:00:49.416	apollo	2018-03-20 11:00:49.416	0
491	falcon	default	application	apollo	2018-03-20 12:01:31.587	apollo	2018-03-20 12:01:31.587	0
510	falcon	default	aps.rabbitmq	apollo	2018-03-20 12:05:53.24	apollo	2018-03-20 12:05:53.24	0
\.


--
-- Data for Name: NamespaceLock; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "NamespaceLock" ("Id", "NamespaceId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: Release; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Release" ("Id", "ReleaseKey", "Name", "Comment", "AppId", "ClusterName", "NamespaceName", "Configurations", "IsAbandoned", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
467	20180320111758-4676bf3e914c66f9	20180320111810-release		troy	default	application	{"checkInterval":"10","log.folder":"/tmp/log/troy/","Log.appenders":"console,rolling","log.fileName":"troy","falconUrl":"http://192.168.20.20912111:8082","log.level":"debug","retryCheckInterval":"10"}	1	apollo	2018-03-20 11:17:58.438	apollo	2018-03-20 19:01:26.629	0
77	20180319143246-3f3faf30fc0e81a1	20180319143237-release		a2	default	application	{"name1":"value1"}	0	apollo	2018-03-19 14:32:46.764	apollo	2018-03-19 14:32:46.782	0
1	20161009155425-d3a0749c6e20bc15	20161009155424-release	Sample发布	SampleApp	default	application	{"timeout":"100"}	0	\N	\N		\N	0
154	20180319195253-4676bf3e910f044e	20180319195304-release		troy	default	application	{"checkInterval":"10","falconUrl":"http://192.168.20.209:8082","retryCheckInterval":"10"}	0	apollo	2018-03-19 19:52:53.177	apollo	2018-03-19 19:52:53.178	0
159	20180319195302-c6b9bf3e910f044f	20180319195313-release		common	default	application	{"password":"admin","port":"5672","host":"mq1.aps.com","virtualHost":"/datacanvas","saslAuth":"false","user":"admin"}	0	apollo	2018-03-19 19:53:02.042	apollo	2018-03-19 19:53:02.043	0
174	20180319195959-4676bf3e910f0450	20180319200011-release		troy	default	application	{"checkInterval":"10","log.folder":"/tmp/log/troy/","Log.appenders":"console,rolling","falconUrl":"http://192.168.20.209:8082","log.fileName":"troy","log.level":"debug","retryCheckInterval":"10"}	0	apollo	2018-03-19 19:59:59.819	apollo	2018-03-19 19:59:59.819	0
208	20180320103506-c6b9bf3e914c66f2	20180320103518-release		common	default	application	{}	0	apollo	2018-03-20 10:35:06.42	apollo	2018-03-20 10:35:06.422	0
213	20180320103513-3931bf3e914c66f3	20180320103525-release		common	default	aps.rabbitmq	{"password":"admin","port":"5672","host":"mq1.aps.com","virtualHost":"/datacanvas","saslAuth":"false","user":"admin"}	0	apollo	2018-03-20 10:35:13.86	apollo	2018-03-20 10:35:13.861	0
236	20180320103934-4ec7bf3e914c66f4	20180320103945-release		common	default	aps.postgresql	{"password":"Server2008!","port":"5432","ip":"192.168.20.197","user":"triceed","db":"datacanvas"}	0	apollo	2018-03-20 10:39:34.244	apollo	2018-03-20 10:39:34.244	0
255	20180320104157-e29abf3e914c66f5	20180320104208-release		common	default	aps.redis	{"port":"6379","host":"192.168.20.249","secret":"123456","db":"1"}	0	apollo	2018-03-20 10:41:57.406	apollo	2018-03-20 10:41:57.407	0
371	20180320105617-7e42bf3e914c66f6	20180320105629-release		heron	default	application	{"frameworks.ideFrameworkId":"001","container.workDir":"/home/apsapp","dependencies.python3.host":"http://python.repo.aps.com:8088/simple/","frameworks.appFrameworkName":"APPFramework","log.fileName":"heron","git.root":"/mnt/nfsfile/gitlocal/gitrepo","dependencies.r.host":"r.repo.aps.com:180","frameworks.appFrameworkId":"002","dependencies.python3.trustHost":"python.repo.aps.com","container.user":"apsapp","server.port":"8081","container.logger.type":"logserver","ide.taskGc.percent":"20","ide.resource.cpus":"0.5","frameworks.ideFrameworkName":"IDEFramework1","server.host":"0.0.0.0","ide.resource.mem":"1024","container.userDataDir":"/mnt/nfsfile/userdata","dependencies.python.trustHost":"python.repo.aps.com","log.folder":"/var/log/aps/heron/","ide.restartNo":"3","ide.taskGc.strategy":"time","recorder.host":"recorder.aps.com","dependencies.python.host":"http://python.repo.aps.com:8088/simple/","frameworks.ideRole":"heron","container.volumePath":"D:/volume.json","heronFalconQueue":"falcon_response","app.resource.cpus":"1","container.hostPath":"D:/host.json","heronPipesQueue":"heron_pipes_queue","container.logger.data":"recorder.aps.com:3000","recorder.port":"3000","frameworks.appRole":"controller","app.jobWorkDir":"/mnt/nfsfile/jobWorkDir/","ide.cmd_out_queue":"cmd_out_queue","heronControllerQueue":"heron_controller_queue","app.resource.mem":"1024","kerberosAuth":"true","ide.spec_queue":"spec_queue"}	0	apollo	2018-03-20 10:56:17.302	apollo	2018-03-20 10:56:17.303	0
447	20180320110014-7e42bf3e914c66f7	20180320110028-release		heron	default	application	{"frameworks.ideFrameworkId":"001","container.workDir":"/home/apsapp","dependencies.python3.host":"http://python.repo.aps.com:8088/simple/","frameworks.appFrameworkName":"APPFramework","log.fileName":"heron","git.root":"/mnt/nfsfile/gitlocal/gitrepo","dependencies.r.host":"r.repo.aps.com:180","frameworks.appFrameworkId":"002","dependencies.python3.trustHost":"python.repo.aps.com","container.user":"apsapp","server.port":"8081","container.logger.type":"logserver","log.level":"info","ide.taskGc.percent":"20","ide.resource.cpus":"0.5","frameworks.ideFrameworkName":"IDEFramework1","server.host":"0.0.0.0","ide.resource.mem":"1024","container.userDataDir":"/mnt/nfsfile/userdata","log.folder":"/var/log/aps/heron/","dependencies.python.trustHost":"python.repo.aps.com","ide.restartNo":"3","ide.taskGc.strategy":"time","recorder.host":"recorder.aps.com","log.appenders":"console,rolling","dependencies.python.host":"http://python.repo.aps.com:8088/simple/","frameworks.ideRole":"heron","container.volumePath":"D:/volume.json","heronFalconQueue":"falcon_response","app.resource.cpus":"1","container.hostPath":"D:/host.json","heronPipesQueue":"heron_pipes_queue","container.logger.data":"recorder.aps.com:3000","recorder.port":"3000","frameworks.appRole":"controller","app.jobWorkDir":"/mnt/nfsfile/jobWorkDir/","ide.cmd_out_queue":"cmd_out_queue","heronControllerQueue":"heron_controller_queue","app.resource.mem":"1024","kerberosAuth":"true","ide.spec_queue":"spec_queue"}	0	apollo	2018-03-20 11:00:14.294	apollo	2018-03-20 11:00:14.295	0
458	20180320110306-f0babf3e914c66f8	20180320110321-release		heron	default	aps.rabbitmq	{}	0	apollo	2018-03-20 11:03:06.585	apollo	2018-03-20 11:03:06.586	0
496	20180320120153-4c1fbf3e914c66fa	20180320120204-release		falcon	default	application	{"address":"0...."}	0	apollo	2018-03-20 12:01:53.528	apollo	2018-03-20 12:01:53.528	0
505	20180320120432-4c1fbf3e914c66fb	20180320120444-release		falcon	default	application	{"address":"a,b,c"}	0	apollo	2018-03-20 12:04:32.281	apollo	2018-03-20 12:04:32.281	0
515	20180320182006-3931bf3e914c66fc	20180320182019-release		common	default	aps.rabbitmq	{"password":"admin","port":"5672","host":"192.168.20.209","virtualHost":"/datacanvas","saslAuth":"false","user":"admin"}	0	apollo	2018-03-20 18:20:06.986	apollo	2018-03-20 18:20:06.986	0
522	20180320184245-3931bf3e914c66fd	20180320184257-release		common	default	aps.rabbitmq	{"password":"admin","port":"5672","host":"192.168.20.209","virtualHost":"/datacanvas","user":"admin","saslAuth":"true"}	0	apollo	2018-03-20 18:42:45.721	apollo	2018-03-20 18:42:45.721	0
536	20180320190134-4676bf3e914c66fe	20180320190146-release		troy	default	application	{"checkInterval":"10","log.folder":"/tmp/log/troy/","log.appenders":"console,rolling","log.fileName":"troy","falconUrl":"http://192.168.20.20912111:8082","log.level":"debug","retryCheckInterval":"10"}	0	apollo	2018-03-20 19:01:34.701	apollo	2018-03-20 19:01:34.701	0
543	20180320190208-4676bf3e914c66ff	20180320190220-release		troy	default	application	{"checkInterval":"10","log.folder":"/tmp/log/troy/","log.appenders":"console,rolling","log.fileName":"troy","falconUrl":"http://192.168.20.209:8082","log.level":"debug","retryCheckInterval":"10"}	0	apollo	2018-03-20 19:02:08.535	apollo	2018-03-20 19:02:08.535	0
562	20180320210432-4676bf3e914c6700	20180320210443-release		troy	default	application	{"checkInterval":"10","log.folder":"/tmp/log/troy/","log.appenders":"console,rolling","log.fileName":"troy","falconUrl":"http://192.168.20.249:8082","log.level":"debug","retryCheckInterval":"10"}	0	apollo	2018-03-20 21:04:32.106	apollo	2018-03-20 21:04:32.106	0
569	20180320210458-3931bf3e914c6701	20180320210510-release		common	default	aps.rabbitmq	{"password":"admin","port":"5672","host":"192.168.20.249","virtualHost":"/datacanvas","user":"admin","saslAuth":"true"}	0	apollo	2018-03-20 21:04:58.909	apollo	2018-03-20 21:04:58.909	0
\.


--
-- Data for Name: ReleaseHistory; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	SampleApp	default	application	default	1	0	0	{}	apollo	\N	apollo	\N	0
74	a2	default	application	default	72	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 14:18:44.916	apollo	2018-03-19 14:18:44.921	0
79	a2	default	application	default	77	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 14:32:46.821	apollo	2018-03-19 14:32:46.828	0
156	troy	default	application	default	154	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 19:52:53.192	apollo	2018-03-19 19:52:53.2	0
161	common	default	application	default	159	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 19:53:02.056	apollo	2018-03-19 19:53:02.056	0
176	troy	default	application	default	174	154	0	{"isEmergencyPublish":false}	apollo	2018-03-19 19:59:59.824	apollo	2018-03-19 19:59:59.824	0
210	common	default	application	default	208	159	0	{"isEmergencyPublish":false}	apollo	2018-03-20 10:35:06.439	apollo	2018-03-20 10:35:06.465	0
215	common	default	aps.rabbitmq	default	213	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 10:35:13.892	apollo	2018-03-20 10:35:13.893	0
238	common	default	aps.postgresql	default	236	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 10:39:34.248	apollo	2018-03-20 10:39:34.248	0
257	common	default	aps.redis	default	255	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 10:41:57.41	apollo	2018-03-20 10:41:57.41	0
373	heron	default	application	default	371	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 10:56:17.306	apollo	2018-03-20 10:56:17.306	0
449	heron	default	application	default	447	371	0	{"isEmergencyPublish":false}	apollo	2018-03-20 11:00:14.298	apollo	2018-03-20 11:00:14.298	0
460	heron	default	aps.rabbitmq	default	458	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 11:03:06.589	apollo	2018-03-20 11:03:06.589	0
469	troy	default	application	default	467	174	0	{"isEmergencyPublish":false}	apollo	2018-03-20 11:17:58.441	apollo	2018-03-20 11:17:58.441	0
498	falcon	default	application	default	496	0	0	{"isEmergencyPublish":false}	apollo	2018-03-20 12:01:53.53	apollo	2018-03-20 12:01:53.53	0
507	falcon	default	application	default	505	496	0	{"isEmergencyPublish":false}	apollo	2018-03-20 12:04:32.284	apollo	2018-03-20 12:04:32.284	0
517	common	default	aps.rabbitmq	default	515	213	0	{"isEmergencyPublish":false}	apollo	2018-03-20 18:20:06.989	apollo	2018-03-20 18:20:06.989	0
524	common	default	aps.rabbitmq	default	522	515	0	{"isEmergencyPublish":false}	apollo	2018-03-20 18:42:45.723	apollo	2018-03-20 18:42:45.723	0
533	troy	default	application	default	174	467	1	{}	apollo	2018-03-20 19:01:26.624	apollo	2018-03-20 19:01:26.624	0
538	troy	default	application	default	536	174	0	{"isEmergencyPublish":false}	apollo	2018-03-20 19:01:34.703	apollo	2018-03-20 19:01:34.704	0
545	troy	default	application	default	543	536	0	{"isEmergencyPublish":false}	apollo	2018-03-20 19:02:08.56	apollo	2018-03-20 19:02:08.56	0
564	troy	default	application	default	562	543	0	{"isEmergencyPublish":false}	apollo	2018-03-20 21:04:32.108	apollo	2018-03-20 21:04:32.108	0
571	common	default	aps.rabbitmq	default	569	522	0	{"isEmergencyPublish":false}	apollo	2018-03-20 21:04:58.912	apollo	2018-03-20 21:04:58.912	0
\.


--
-- Data for Name: ReleaseMessage; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ReleaseMessage" ("Id", "Message", "DataChange_LastTime") FROM stdin;
81	a2+default+application	2018-03-19 14:32:46.851
163	common+default+application	2018-03-19 19:53:02.096
212	common+default+application	2018-03-20 10:35:06.495
240	common+default+aps.postgresql	2018-03-20 10:39:34.252
259	common+default+aps.redis	2018-03-20 10:41:57.424
451	heron+default+application	2018-03-20 11:00:14.301
462	heron+default+aps.rabbitmq	2018-03-20 11:03:06.591
509	falcon+default+application	2018-03-20 12:04:32.288
566	troy+default+application	2018-03-20 21:04:32.113
573	common+default+aps.rabbitmq	2018-03-20 21:04:58.914
\.


--
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ServerConfig" ("Id", "Key", "Cluster", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	eureka.service.url	default	http://localhost:8080/eureka/	Eureka服务Url，多个service以英文逗号分隔	\N	\N		\N	0
2	namespace.lock.switch	default	false	一次发布只能有一个人修改开关	\N	\N		\N	0
3	item.value.length.limit	default	20000	item value最大长度限制	\N	\N		\N	0
4	config-service.cache.enabled	default	false	ConfigService是否开启缓存，开启后能提高性能，但是会增大内存消耗！	\N	\N		\N	0
5	item.key.length.limit	default	128	item key 最大长度限制	\N	\N		\N	0
\.


--
-- Name: app_namespace_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('app_namespace_seq', 1, true);


--
-- Name: app_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('app_seq', 2, true);


--
-- Name: cluster_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('cluster_seq', 1, true);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('hibernate_sequence', 582, true);


--
-- Name: item_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('item_seq', 1, true);


--
-- Name: namespace_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('namespace_seq', 1, false);


--
-- Name: release_history_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('release_history_seq', 1, true);


--
-- Name: release_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('release_seq', 1, true);


--
-- Name: service_config_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('service_config_seq', 5, true);


--
-- Data for Name: BLOBS; Type: BLOBS; Schema: -; Owner: 
--

SET search_path = pg_catalog;

BEGIN;

SELECT pg_catalog.lo_open('18034', 131072);
SELECT pg_catalog.lowrite(0, '\x56');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18035', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a34332c226b6579223a224b6579222c2276616c7565223a2256222c226c696e654e756d223a312c226964223a34352c22697344656c65746564223a66616c73652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31372031393a34383a3033222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31372031393a34383a3033227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18036', 131072);
SELECT pg_catalog.lowrite(0, '\x56');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18037', 131072);
SELECT pg_catalog.lowrite(0, '\x6c6f63616c686f7374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18038', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a22686f7374222c2276616c7565223a226c6f63616c686f7374222c226c696e654e756d223a312c226964223a35362c22697344656c65746564223a66616c73652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392030393a32343a3436222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392030393a32343a3437227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18039', 131072);
SELECT pg_catalog.lowrite(0, '\x6c6f63616c686f7374');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18047', 131072);
SELECT pg_catalog.lowrite(0, '\x313030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18048', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a2274696d656f7574222c2276616c7565223a22313030222c226c696e654e756d223a312c226964223a35392c22697344656c65746564223a66616c73652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392030393a35373a3237222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392030393a35373a3237227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18049', 131072);
SELECT pg_catalog.lowrite(0, '\x313030');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18050', 131072);
SELECT pg_catalog.lowrite(0, '\x76');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18051', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a2274222c2276616c7565223a2276222c226c696e654e756d223a322c226964223a36322c22697344656c65746564223a66616c73652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392031323a31373a3434222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392031323a31373a3434227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18052', 131072);
SELECT pg_catalog.lowrite(0, '\x76');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18053', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a226e616d6531222c2276616c7565223a2276616c756531222c226c696e654e756d223a332c226964223a36352c22697344656c65746564223a66616c73652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392031343a31373a3331222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392031343a31373a3331227d5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18054', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a2274696d656f7574222c2276616c7565223a223138303439222c226c696e654e756d223a312c226964223a35392c22697344656c65746564223a747275652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392030393a35373a3237222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392031343a31373a3336227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18055', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226372656174654974656d73223a5b5d2c227570646174654974656d73223a5b5d2c2264656c6574654974656d73223a5b7b226e616d6573706163654964223a35342c226b6579223a2274222c2276616c7565223a223138303532222c226c696e654e756d223a322c226964223a36322c22697344656c65746564223a747275652c22646174614368616e6765437265617465644279223a2261706f6c6c6f222c22646174614368616e67654372656174656454696d65223a22323031382d30332d31392031323a31373a3434222c22646174614368616e67654c6173744d6f6469666965644279223a2261706f6c6c6f222c22646174614368616e67654c6173744d6f64696669656454696d65223a22323031382d30332d31392031343a31373a3339227d5d7d');
SELECT pg_catalog.lo_close(0);

SELECT pg_catalog.lo_open('18056', 131072);
SELECT pg_catalog.lowrite(0, '\x7b226e616d6531223a2276616c756531227d');
SELECT pg_catalog.lo_close(0);

COMMIT;

SET search_path = public, pg_catalog;

--
-- Name: AppNamespace_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "AppNamespace"
    ADD CONSTRAINT "AppNamespace_pkey" PRIMARY KEY ("Id");


--
-- Name: App_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "App"
    ADD CONSTRAINT "App_pkey" PRIMARY KEY ("Id");


--
-- Name: Audit_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Audit"
    ADD CONSTRAINT "Audit_pkey" PRIMARY KEY ("Id");


--
-- Name: Cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Cluster"
    ADD CONSTRAINT "Cluster_pkey" PRIMARY KEY ("Id");


--
-- Name: Commit_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Commit"
    ADD CONSTRAINT "Commit_pkey" PRIMARY KEY ("Id");


--
-- Name: GrayReleaseRule_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "GrayReleaseRule"
    ADD CONSTRAINT "GrayReleaseRule_pkey" PRIMARY KEY ("Id");


--
-- Name: InstanceConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "InstanceConfig"
    ADD CONSTRAINT "InstanceConfig_pkey" PRIMARY KEY ("Id");


--
-- Name: Instance_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Instance"
    ADD CONSTRAINT "Instance_pkey" PRIMARY KEY ("Id");


--
-- Name: Item_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Item"
    ADD CONSTRAINT "Item_pkey" PRIMARY KEY ("Id");


--
-- Name: NamespaceLock_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "NamespaceLock"
    ADD CONSTRAINT "NamespaceLock_pkey" PRIMARY KEY ("Id");


--
-- Name: Namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Namespace"
    ADD CONSTRAINT "Namespace_pkey" PRIMARY KEY ("Id");


--
-- Name: ReleaseHistory_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ReleaseHistory"
    ADD CONSTRAINT "ReleaseHistory_pkey" PRIMARY KEY ("Id");


--
-- Name: ReleaseMessage_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ReleaseMessage"
    ADD CONSTRAINT "ReleaseMessage_pkey" PRIMARY KEY ("Id");


--
-- Name: Release_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Release"
    ADD CONSTRAINT "Release_pkey" PRIMARY KEY ("Id");


--
-- Name: ServerConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ServerConfig"
    ADD CONSTRAINT "ServerConfig_pkey" PRIMARY KEY ("Id");


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

