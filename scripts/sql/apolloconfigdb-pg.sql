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
\.


--
-- Data for Name: InstanceConfig; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "InstanceConfig" ("Id", "InstanceId", "ConfigAppId", "ConfigClusterName", "ConfigNamespaceName", "ReleaseKey", "ReleaseDeliveryTime", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
83	82	a2	default	application	20180319143246-3f3faf30fc0e81a1	2018-03-19 14:37:33.603	2018-03-19 14:37:33.603	2018-03-19 14:37:33.603
\.


--
-- Data for Name: Item; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Item" ("Id", "NamespaceId", "Key", "Value", "Comment", "LineNum", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	1	timeout	100	sample timeout配置	1	\N	\N		\N	0
65	54	name1	value1	\N	3	apollo	2018-03-19 14:17:31.939	apollo	2018-03-19 14:17:32.006	0
59	54	timeout	18049	\N	1	apollo	2018-03-19 09:57:27.082	apollo	2018-03-19 14:17:36.886	1
62	54	t	18052	\N	2	apollo	2018-03-19 12:17:44.769	apollo	2018-03-19 14:17:39.434	1
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
77	20180319143246-3f3faf30fc0e81a1	20180319143237-release		a2	default	application	{"name1":"value1"}	0	apollo	2018-03-19 14:32:46.764	apollo	2018-03-19 14:32:46.782	0
1	20161009155425-d3a0749c6e20bc15	20161009155424-release	Sample发布	SampleApp	default	application	{"timeout":"100"}	0	\N	\N		\N	0
\.


--
-- Data for Name: ReleaseHistory; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ReleaseHistory" ("Id", "AppId", "ClusterName", "NamespaceName", "BranchName", "ReleaseId", "PreviousReleaseId", "Operation", "OperationContext", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	SampleApp	default	application	default	1	0	0	{}	apollo	\N	apollo	\N	0
74	a2	default	application	default	72	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 14:18:44.916	apollo	2018-03-19 14:18:44.921	0
79	a2	default	application	default	77	0	0	{"isEmergencyPublish":false}	apollo	2018-03-19 14:32:46.821	apollo	2018-03-19 14:32:46.828	0
\.


--
-- Data for Name: ReleaseMessage; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ReleaseMessage" ("Id", "Message", "DataChange_LastTime") FROM stdin;
81	a2+default+application	2018-03-19 14:32:46.851
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

SELECT pg_catalog.setval('hibernate_sequence', 83, true);


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

