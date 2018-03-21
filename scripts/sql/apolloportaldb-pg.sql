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
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Name" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OrgId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "OrgName" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "OwnerName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OwnerEmail" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "IsDeleted" integer DEFAULT 0 NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone
);


ALTER TABLE public."App" OWNER TO triceed;

--
-- Name: app_name_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE app_name_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.app_name_seq OWNER TO triceed;

--
-- Name: AppNamespace; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "AppNamespace" (
    "Id" integer DEFAULT nextval('app_name_seq'::regclass) NOT NULL,
    "Name" character varying(32) DEFAULT ''::character varying NOT NULL,
    "AppId" character varying(32) DEFAULT ''::character varying NOT NULL,
    "Format" character varying(32) DEFAULT 'properties'::character varying NOT NULL,
    "Comment" character varying(64) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" integer,
    "IsPublic" integer
);


ALTER TABLE public."AppNamespace" OWNER TO triceed;

--
-- Name: authorities_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE authorities_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.authorities_seq OWNER TO triceed;

--
-- Name: Authorities; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Authorities" (
    "Id" integer DEFAULT nextval('authorities_seq'::regclass) NOT NULL,
    "Username" character varying(50) NOT NULL,
    "Authority" character varying(50) NOT NULL
);


ALTER TABLE public."Authorities" OWNER TO triceed;

--
-- Name: consumer_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE consumer_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_seq OWNER TO triceed;

--
-- Name: Consumer; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Consumer" (
    "Id" integer DEFAULT nextval('consumer_seq'::regclass) NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Name" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OrgId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "OrgName" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "OwnerName" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "OwnerEmail" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."Consumer" OWNER TO triceed;

--
-- Name: consumer_audit_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE consumer_audit_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_audit_seq OWNER TO triceed;

--
-- Name: ConsumerAudit; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ConsumerAudit" (
    "Id" integer DEFAULT nextval('consumer_audit_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "Uri" character varying(1024) DEFAULT ''::character varying NOT NULL,
    "Method" character varying(16) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastTime" timestamp without time zone
);


ALTER TABLE public."ConsumerAudit" OWNER TO triceed;

--
-- Name: consumer_role_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE consumer_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_role_seq OWNER TO triceed;

--
-- Name: ConsumerRole; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ConsumerRole" (
    "Id" integer DEFAULT nextval('consumer_role_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."ConsumerRole" OWNER TO triceed;

--
-- Name: consumer_token_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE consumer_token_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consumer_token_seq OWNER TO triceed;

--
-- Name: ConsumerToken; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ConsumerToken" (
    "Id" integer DEFAULT nextval('consumer_token_seq'::regclass) NOT NULL,
    "ConsumerId" integer,
    "Token" character varying(128) DEFAULT ''::character varying NOT NULL,
    "Expires" timestamp without time zone DEFAULT '2099-01-01 00:00:00'::timestamp without time zone NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."ConsumerToken" OWNER TO triceed;

--
-- Name: favorite_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE favorite_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.favorite_seq OWNER TO triceed;

--
-- Name: Favorite; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Favorite" (
    "Id" integer DEFAULT nextval('favorite_seq'::regclass) NOT NULL,
    "UserId" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "AppId" character varying(500) DEFAULT 'default'::character varying NOT NULL,
    "Position" bigint DEFAULT 10000::bigint NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."Favorite" OWNER TO triceed;

--
-- Name: permission_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permission_seq OWNER TO triceed;

--
-- Name: Permission; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Permission" (
    "Id" integer DEFAULT nextval('permission_seq'::regclass) NOT NULL,
    "PermissionType" character varying(32) DEFAULT ''::character varying NOT NULL,
    "TargetId" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."Permission" OWNER TO triceed;

--
-- Name: role_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_seq OWNER TO triceed;

--
-- Name: Role; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Role" (
    "Id" integer DEFAULT nextval('role_seq'::regclass) NOT NULL,
    "RoleName" character varying(256) DEFAULT ''::character varying NOT NULL,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."Role" OWNER TO triceed;

--
-- Name: role_permission_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE role_permission_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_permission_seq OWNER TO triceed;

--
-- Name: RolePermission; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "RolePermission" (
    "Id" integer DEFAULT nextval('role_permission_seq'::regclass) NOT NULL,
    "RoleId" integer,
    "PermissionId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."RolePermission" OWNER TO triceed;

--
-- Name: server_config_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE server_config_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.server_config_seq OWNER TO triceed;

--
-- Name: ServerConfig; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "ServerConfig" (
    "Id" integer DEFAULT nextval('server_config_seq'::regclass) NOT NULL,
    "Key" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Value" character varying(2048) DEFAULT 'default'::character varying NOT NULL,
    "Comment" character varying(1024) DEFAULT ''::character varying,
    "DataChange_CreatedBy" character varying(32) DEFAULT 'default'::character varying NOT NULL,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."ServerConfig" OWNER TO triceed;

--
-- Name: user_role_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE user_role_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_seq OWNER TO triceed;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "UserRole" (
    "Id" integer DEFAULT nextval('user_role_seq'::regclass) NOT NULL,
    "UserId" character varying(128) DEFAULT ''::character varying,
    "RoleId" integer,
    "DataChange_CreatedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_CreatedTime" timestamp without time zone DEFAULT now() NOT NULL,
    "DataChange_LastModifiedBy" character varying(32) DEFAULT ''::character varying,
    "DataChange_LastTime" timestamp without time zone,
    "IsDeleted" character varying
);


ALTER TABLE public."UserRole" OWNER TO triceed;

--
-- Name: users_seq; Type: SEQUENCE; Schema: public; Owner: triceed
--

CREATE SEQUENCE users_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_seq OWNER TO triceed;

--
-- Name: Users; Type: TABLE; Schema: public; Owner: triceed; Tablespace: 
--

CREATE TABLE "Users" (
    "Id" integer DEFAULT nextval('users_seq'::regclass) NOT NULL,
    "Username" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Password" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Email" character varying(64) DEFAULT 'default'::character varying NOT NULL,
    "Enabled" integer
);


ALTER TABLE public."Users" OWNER TO triceed;

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
-- Data for Name: App; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "App" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "IsDeleted", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime") FROM stdin;
307	troy	troy	aps	aps	apollo	apollo@acme.com	0	apollo	2018-03-19 18:32:43.385	apollo	2018-03-19 18:32:43.385
309	common	common	aps	aps	apollo	apollo@acme.com	0	apollo	2018-03-19 18:32:59.651	apollo	2018-03-19 18:32:59.651
362	heron	heron	aps	aps	apollo	apollo@acme.com	0	apollo	2018-03-20 10:46:29.091	apollo	2018-03-20 10:46:29.091
404	falcon	falcon	aps	aps	apollo	apollo@acme.com	0	apollo	2018-03-20 12:01:31.409	apollo	2018-03-20 12:01:31.409
\.


--
-- Data for Name: AppNamespace; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "AppNamespace" ("Id", "Name", "AppId", "Format", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted", "IsPublic") FROM stdin;
290	application	troy-2.4	properties	default app namespace	apollo	2018-03-19 18:16:52.163	apollo	2018-03-19 18:16:52.163	0	0
308	application	troy	properties	default app namespace	apollo	2018-03-19 18:32:43.408	apollo	2018-03-19 18:32:43.408	0	0
310	application	common	properties	default app namespace	apollo	2018-03-19 18:32:59.666	apollo	2018-03-19 18:32:59.666	0	0
327	aps.rabbitmq	common	properties		apollo	2018-03-20 10:34:28.616	apollo	2018-03-20 10:34:28.616	0	1
344	aps.postgresql	common	properties		apollo	2018-03-20 10:37:18.461	apollo	2018-03-20 10:37:18.461	0	1
353	aps.redis	common	properties		apollo	2018-03-20 10:41:03.018	apollo	2018-03-20 10:41:03.018	0	1
363	application	heron	properties	default app namespace	apollo	2018-03-20 10:46:29.121	apollo	2018-03-20 10:46:29.121	0	0
405	application	falcon	properties	default app namespace	apollo	2018-03-20 12:01:31.413	apollo	2018-03-20 12:01:31.413	0	0
\.


--
-- Data for Name: Authorities; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Authorities" ("Id", "Username", "Authority") FROM stdin;
1	apollo	ROLE_user
\.


--
-- Data for Name: Consumer; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Consumer" ("Id", "AppId", "Name", "OrgId", "OrgName", "OwnerName", "OwnerEmail", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: ConsumerAudit; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ConsumerAudit" ("Id", "ConsumerId", "Uri", "Method", "DataChange_CreatedTime", "DataChange_LastTime") FROM stdin;
\.


--
-- Data for Name: ConsumerRole; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ConsumerRole" ("Id", "ConsumerId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: ConsumerToken; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ConsumerToken" ("Id", "ConsumerId", "Token", "Expires", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: Favorite; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Favorite" ("Id", "UserId", "AppId", "Position", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
\.


--
-- Data for Name: Permission; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Permission" ("Id", "PermissionType", "TargetId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
111	CreateCluster	a	apollo	2018-03-17 18:11:04.204	apollo	2018-03-17 18:11:04.204	0
112	CreateNamespace	a	apollo	2018-03-17 18:11:04.213	apollo	2018-03-17 18:11:04.213	0
113	AssignRole	a	apollo	2018-03-17 18:11:04.221	apollo	2018-03-17 18:11:04.221	0
119	ModifyNamespace	a+application	apollo	2018-03-17 18:11:04.456	apollo	2018-03-17 18:11:04.456	0
122	ReleaseNamespace	a+application	apollo	2018-03-17 18:11:04.492	apollo	2018-03-17 18:11:04.492	0
129	CreateCluster	troy	apollo	2018-03-17 18:15:50.943	apollo	2018-03-17 18:15:50.943	0
130	CreateNamespace	troy	apollo	2018-03-17 18:15:50.947	apollo	2018-03-17 18:15:50.947	0
131	AssignRole	troy	apollo	2018-03-17 18:15:50.95	apollo	2018-03-17 18:15:50.95	0
137	ModifyNamespace	troy+application	apollo	2018-03-17 18:15:51.035	apollo	2018-03-17 18:15:51.035	0
140	ReleaseNamespace	troy+application	apollo	2018-03-17 18:15:51.078	apollo	2018-03-17 18:15:51.078	0
147	CreateCluster	b	apollo	2018-03-17 18:26:13.12	apollo	2018-03-17 18:26:13.12	0
148	CreateNamespace	b	apollo	2018-03-17 18:26:13.124	apollo	2018-03-17 18:26:13.124	0
149	AssignRole	b	apollo	2018-03-17 18:26:13.157	apollo	2018-03-17 18:26:13.157	0
155	ModifyNamespace	b+application	apollo	2018-03-17 18:26:13.442	apollo	2018-03-17 18:26:13.442	0
158	ReleaseNamespace	b+application	apollo	2018-03-17 18:26:13.643	apollo	2018-03-17 18:26:13.643	0
165	CreateCluster	c	apollo	2018-03-17 18:38:27.474	apollo	2018-03-17 18:38:27.474	0
166	CreateNamespace	c	apollo	2018-03-17 18:38:27.481	apollo	2018-03-17 18:38:27.481	0
167	AssignRole	c	apollo	2018-03-17 18:38:27.486	apollo	2018-03-17 18:38:27.486	0
173	ModifyNamespace	c+application	apollo	2018-03-17 18:38:27.658	apollo	2018-03-17 18:38:27.658	0
176	ReleaseNamespace	c+application	apollo	2018-03-17 18:38:27.73	apollo	2018-03-17 18:38:27.73	0
183	CreateCluster	d	apollo	2018-03-17 18:42:52.768	apollo	2018-03-17 18:42:52.768	0
184	CreateNamespace	d	apollo	2018-03-17 18:42:52.771	apollo	2018-03-17 18:42:52.771	0
185	AssignRole	d	apollo	2018-03-17 18:42:52.773	apollo	2018-03-17 18:42:52.773	0
191	ModifyNamespace	d+application	apollo	2018-03-17 18:42:52.849	apollo	2018-03-17 18:42:52.849	0
194	ReleaseNamespace	d+application	apollo	2018-03-17 18:42:52.899	apollo	2018-03-17 18:42:52.899	0
201	CreateCluster	e	apollo	2018-03-17 18:49:08.847	apollo	2018-03-17 18:49:08.847	0
202	CreateNamespace	e	apollo	2018-03-17 18:49:08.852	apollo	2018-03-17 18:49:08.852	0
203	AssignRole	e	apollo	2018-03-17 18:49:08.86	apollo	2018-03-17 18:49:08.86	0
209	ModifyNamespace	e+application	apollo	2018-03-17 18:49:09.005	apollo	2018-03-17 18:49:09.005	0
212	ReleaseNamespace	e+application	apollo	2018-03-17 18:49:09.047	apollo	2018-03-17 18:49:09.047	0
219	CreateCluster	f	apollo	2018-03-17 18:53:45.271	apollo	2018-03-17 18:53:45.271	0
220	CreateNamespace	f	apollo	2018-03-17 18:53:45.274	apollo	2018-03-17 18:53:45.274	0
221	AssignRole	f	apollo	2018-03-17 18:53:45.277	apollo	2018-03-17 18:53:45.277	0
227	ModifyNamespace	f+application	apollo	2018-03-17 18:53:45.405	apollo	2018-03-17 18:53:45.405	0
230	ReleaseNamespace	f+application	apollo	2018-03-17 18:53:45.442	apollo	2018-03-17 18:53:45.442	0
237	CreateCluster	g	apollo	2018-03-17 19:00:13.47	apollo	2018-03-17 19:00:13.47	0
238	CreateNamespace	g	apollo	2018-03-17 19:00:13.472	apollo	2018-03-17 19:00:13.472	0
239	AssignRole	g	apollo	2018-03-17 19:00:13.474	apollo	2018-03-17 19:00:13.474	0
245	ModifyNamespace	g+application	apollo	2018-03-17 19:00:13.582	apollo	2018-03-17 19:00:13.582	0
248	ReleaseNamespace	g+application	apollo	2018-03-17 19:00:13.615	apollo	2018-03-17 19:00:13.615	0
255	CreateCluster	a1	apollo	2018-03-17 19:47:35.921	apollo	2018-03-17 19:47:35.921	0
256	CreateNamespace	a1	apollo	2018-03-17 19:47:35.923	apollo	2018-03-17 19:47:35.923	0
257	AssignRole	a1	apollo	2018-03-17 19:47:35.926	apollo	2018-03-17 19:47:35.926	0
263	ModifyNamespace	a1+application	apollo	2018-03-17 19:47:36.119	apollo	2018-03-17 19:47:36.119	0
266	ReleaseNamespace	a1+application	apollo	2018-03-17 19:47:36.168	apollo	2018-03-17 19:47:36.168	0
273	CreateCluster	a2	apollo	2018-03-19 09:23:58.011	apollo	2018-03-19 09:23:58.011	0
274	CreateNamespace	a2	apollo	2018-03-19 09:23:58.02	apollo	2018-03-19 09:23:58.02	0
275	AssignRole	a2	apollo	2018-03-19 09:23:58.04	apollo	2018-03-19 09:23:58.04	0
281	ModifyNamespace	a2+application	apollo	2018-03-19 09:23:58.521	apollo	2018-03-19 09:23:58.521	0
284	ReleaseNamespace	a2+application	apollo	2018-03-19 09:23:58.665	apollo	2018-03-19 09:23:58.665	0
291	CreateCluster	troy-2.4	apollo	2018-03-19 18:16:52.272	apollo	2018-03-19 18:16:52.272	0
292	CreateNamespace	troy-2.4	apollo	2018-03-19 18:16:52.278	apollo	2018-03-19 18:16:52.278	0
293	AssignRole	troy-2.4	apollo	2018-03-19 18:16:52.287	apollo	2018-03-19 18:16:52.287	0
299	ModifyNamespace	troy-2.4+application	apollo	2018-03-19 18:16:52.641	apollo	2018-03-19 18:16:52.641	0
302	ReleaseNamespace	troy-2.4+application	apollo	2018-03-19 18:16:52.684	apollo	2018-03-19 18:16:52.684	0
311	CreateCluster	common	apollo	2018-03-19 18:32:59.685	apollo	2018-03-19 18:32:59.685	0
312	CreateNamespace	common	apollo	2018-03-19 18:32:59.689	apollo	2018-03-19 18:32:59.689	0
313	AssignRole	common	apollo	2018-03-19 18:32:59.69	apollo	2018-03-19 18:32:59.69	0
319	ModifyNamespace	common+application	apollo	2018-03-19 18:32:59.831	apollo	2018-03-19 18:32:59.831	0
322	ReleaseNamespace	common+application	apollo	2018-03-19 18:32:59.855	apollo	2018-03-19 18:32:59.855	0
328	ModifyNamespace	common+aps.rabbitmq	apollo	2018-03-20 10:34:28.681	apollo	2018-03-20 10:34:28.681	0
331	ReleaseNamespace	common+aps.rabbitmq	apollo	2018-03-20 10:34:28.991	apollo	2018-03-20 10:34:28.991	0
336	ModifyNamespace	troy+aps.rabbitmq	apollo	2018-03-20 10:35:51.767	apollo	2018-03-20 10:35:51.767	0
339	ReleaseNamespace	troy+aps.rabbitmq	apollo	2018-03-20 10:35:51.947	apollo	2018-03-20 10:35:51.947	0
345	ModifyNamespace	common+aps.postgresql	apollo	2018-03-20 10:37:18.546	apollo	2018-03-20 10:37:18.546	0
348	ReleaseNamespace	common+aps.postgresql	apollo	2018-03-20 10:37:18.689	apollo	2018-03-20 10:37:18.689	0
354	ModifyNamespace	common+aps.redis	apollo	2018-03-20 10:41:03.031	apollo	2018-03-20 10:41:03.031	0
357	ReleaseNamespace	common+aps.redis	apollo	2018-03-20 10:41:03.17	apollo	2018-03-20 10:41:03.17	0
364	CreateCluster	heron	apollo	2018-03-20 10:46:29.17	apollo	2018-03-20 10:46:29.17	0
365	CreateNamespace	heron	apollo	2018-03-20 10:46:29.17	apollo	2018-03-20 10:46:29.17	0
366	AssignRole	heron	apollo	2018-03-20 10:46:29.171	apollo	2018-03-20 10:46:29.171	0
372	ModifyNamespace	heron+application	apollo	2018-03-20 10:46:29.22	apollo	2018-03-20 10:46:29.22	0
375	ReleaseNamespace	heron+application	apollo	2018-03-20 10:46:29.232	apollo	2018-03-20 10:46:29.232	0
380	ModifyNamespace	heron+aps.rabbitmq	apollo	2018-03-20 11:00:30.734	apollo	2018-03-20 11:00:30.734	0
383	ReleaseNamespace	heron+aps.rabbitmq	apollo	2018-03-20 11:00:30.747	apollo	2018-03-20 11:00:30.747	0
388	ModifyNamespace	heron+aps.postgresql	apollo	2018-03-20 11:00:42.018	apollo	2018-03-20 11:00:42.018	0
391	ReleaseNamespace	heron+aps.postgresql	apollo	2018-03-20 11:00:42.029	apollo	2018-03-20 11:00:42.029	0
396	ModifyNamespace	heron+aps.redis	apollo	2018-03-20 11:00:49.353	apollo	2018-03-20 11:00:49.353	0
399	ReleaseNamespace	heron+aps.redis	apollo	2018-03-20 11:00:49.375	apollo	2018-03-20 11:00:49.375	0
422	ModifyNamespace	falcon+aps.rabbitmq	apollo	2018-03-20 12:05:53.151	apollo	2018-03-20 12:05:53.151	0
425	ReleaseNamespace	falcon+aps.rabbitmq	apollo	2018-03-20 12:05:53.195	apollo	2018-03-20 12:05:53.195	0
406	CreateCluster	falcon	apollo	2018-03-20 12:01:31.428	apollo	2018-03-20 12:01:31.428	0
407	CreateNamespace	falcon	apollo	2018-03-20 12:01:31.429	apollo	2018-03-20 12:01:31.429	0
408	AssignRole	falcon	apollo	2018-03-20 12:01:31.43	apollo	2018-03-20 12:01:31.43	0
414	ModifyNamespace	falcon+application	apollo	2018-03-20 12:01:31.472	apollo	2018-03-20 12:01:31.472	0
417	ReleaseNamespace	falcon+application	apollo	2018-03-20 12:01:31.492	apollo	2018-03-20 12:01:31.492	0
\.


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Role" ("Id", "RoleName", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
114	Master+a	apollo	2018-03-17 18:11:04.236	apollo	2018-03-17 18:11:04.236	0
120	ModifyNamespace+a+application	apollo	2018-03-17 18:11:04.463	apollo	2018-03-17 18:11:04.463	0
123	ReleaseNamespace+a+application	apollo	2018-03-17 18:11:04.501	apollo	2018-03-17 18:11:04.501	0
132	Master+troy	apollo	2018-03-17 18:15:50.964	apollo	2018-03-17 18:15:50.964	0
138	ModifyNamespace+troy+application	apollo	2018-03-17 18:15:51.041	apollo	2018-03-17 18:15:51.041	0
141	ReleaseNamespace+troy+application	apollo	2018-03-17 18:15:51.084	apollo	2018-03-17 18:15:51.084	0
150	Master+b	apollo	2018-03-17 18:26:13.175	apollo	2018-03-17 18:26:13.175	0
156	ModifyNamespace+b+application	apollo	2018-03-17 18:26:13.49	apollo	2018-03-17 18:26:13.49	0
159	ReleaseNamespace+b+application	apollo	2018-03-17 18:26:13.666	apollo	2018-03-17 18:26:13.666	0
168	Master+c	apollo	2018-03-17 18:38:27.501	apollo	2018-03-17 18:38:27.501	0
174	ModifyNamespace+c+application	apollo	2018-03-17 18:38:27.671	apollo	2018-03-17 18:38:27.671	0
177	ReleaseNamespace+c+application	apollo	2018-03-17 18:38:27.736	apollo	2018-03-17 18:38:27.736	0
186	Master+d	apollo	2018-03-17 18:42:52.779	apollo	2018-03-17 18:42:52.779	0
192	ModifyNamespace+d+application	apollo	2018-03-17 18:42:52.854	apollo	2018-03-17 18:42:52.854	0
195	ReleaseNamespace+d+application	apollo	2018-03-17 18:42:52.927	apollo	2018-03-17 18:42:52.927	0
204	Master+e	apollo	2018-03-17 18:49:08.877	apollo	2018-03-17 18:49:08.877	0
210	ModifyNamespace+e+application	apollo	2018-03-17 18:49:09.015	apollo	2018-03-17 18:49:09.015	0
213	ReleaseNamespace+e+application	apollo	2018-03-17 18:49:09.055	apollo	2018-03-17 18:49:09.055	0
222	Master+f	apollo	2018-03-17 18:53:45.288	apollo	2018-03-17 18:53:45.288	0
228	ModifyNamespace+f+application	apollo	2018-03-17 18:53:45.412	apollo	2018-03-17 18:53:45.412	0
231	ReleaseNamespace+f+application	apollo	2018-03-17 18:53:45.447	apollo	2018-03-17 18:53:45.447	0
240	Master+g	apollo	2018-03-17 19:00:13.485	apollo	2018-03-17 19:00:13.485	0
246	ModifyNamespace+g+application	apollo	2018-03-17 19:00:13.587	apollo	2018-03-17 19:00:13.587	0
249	ReleaseNamespace+g+application	apollo	2018-03-17 19:00:13.622	apollo	2018-03-17 19:00:13.622	0
258	Master+a1	apollo	2018-03-17 19:47:35.949	apollo	2018-03-17 19:47:35.949	0
264	ModifyNamespace+a1+application	apollo	2018-03-17 19:47:36.125	apollo	2018-03-17 19:47:36.125	0
267	ReleaseNamespace+a1+application	apollo	2018-03-17 19:47:36.176	apollo	2018-03-17 19:47:36.176	0
276	Master+a2	apollo	2018-03-19 09:23:58.062	apollo	2018-03-19 09:23:58.062	0
282	ModifyNamespace+a2+application	apollo	2018-03-19 09:23:58.557	apollo	2018-03-19 09:23:58.557	0
285	ReleaseNamespace+a2+application	apollo	2018-03-19 09:23:58.703	apollo	2018-03-19 09:23:58.703	0
294	Master+troy-2.4	apollo	2018-03-19 18:16:52.318	apollo	2018-03-19 18:16:52.318	0
300	ModifyNamespace+troy-2.4+application	apollo	2018-03-19 18:16:52.658	apollo	2018-03-19 18:16:52.658	0
303	ReleaseNamespace+troy-2.4+application	apollo	2018-03-19 18:16:52.698	apollo	2018-03-19 18:16:52.698	0
314	Master+common	apollo	2018-03-19 18:32:59.693	apollo	2018-03-19 18:32:59.693	0
320	ModifyNamespace+common+application	apollo	2018-03-19 18:32:59.836	apollo	2018-03-19 18:32:59.836	0
323	ReleaseNamespace+common+application	apollo	2018-03-19 18:32:59.857	apollo	2018-03-19 18:32:59.857	0
329	ModifyNamespace+common+aps.rabbitmq	apollo	2018-03-20 10:34:28.706	apollo	2018-03-20 10:34:28.706	0
332	ReleaseNamespace+common+aps.rabbitmq	apollo	2018-03-20 10:34:28.997	apollo	2018-03-20 10:34:28.997	0
337	ModifyNamespace+troy+aps.rabbitmq	apollo	2018-03-20 10:35:51.818	apollo	2018-03-20 10:35:51.818	0
340	ReleaseNamespace+troy+aps.rabbitmq	apollo	2018-03-20 10:35:51.952	apollo	2018-03-20 10:35:51.952	0
346	ModifyNamespace+common+aps.postgresql	apollo	2018-03-20 10:37:18.564	apollo	2018-03-20 10:37:18.564	0
349	ReleaseNamespace+common+aps.postgresql	apollo	2018-03-20 10:37:18.694	apollo	2018-03-20 10:37:18.694	0
355	ModifyNamespace+common+aps.redis	apollo	2018-03-20 10:41:03.034	apollo	2018-03-20 10:41:03.034	0
358	ReleaseNamespace+common+aps.redis	apollo	2018-03-20 10:41:03.173	apollo	2018-03-20 10:41:03.173	0
367	Master+heron	apollo	2018-03-20 10:46:29.175	apollo	2018-03-20 10:46:29.175	0
373	ModifyNamespace+heron+application	apollo	2018-03-20 10:46:29.222	apollo	2018-03-20 10:46:29.222	0
376	ReleaseNamespace+heron+application	apollo	2018-03-20 10:46:29.234	apollo	2018-03-20 10:46:29.234	0
381	ModifyNamespace+heron+aps.rabbitmq	apollo	2018-03-20 11:00:30.737	apollo	2018-03-20 11:00:30.737	0
384	ReleaseNamespace+heron+aps.rabbitmq	apollo	2018-03-20 11:00:30.75	apollo	2018-03-20 11:00:30.75	0
389	ModifyNamespace+heron+aps.postgresql	apollo	2018-03-20 11:00:42.02	apollo	2018-03-20 11:00:42.02	0
392	ReleaseNamespace+heron+aps.postgresql	apollo	2018-03-20 11:00:42.031	apollo	2018-03-20 11:00:42.031	0
397	ModifyNamespace+heron+aps.redis	apollo	2018-03-20 11:00:49.361	apollo	2018-03-20 11:00:49.361	0
400	ReleaseNamespace+heron+aps.redis	apollo	2018-03-20 11:00:49.377	apollo	2018-03-20 11:00:49.377	0
409	Master+falcon	apollo	2018-03-20 12:01:31.443	apollo	2018-03-20 12:01:31.443	0
415	ModifyNamespace+falcon+application	apollo	2018-03-20 12:01:31.479	apollo	2018-03-20 12:01:31.479	0
418	ReleaseNamespace+falcon+application	apollo	2018-03-20 12:01:31.494	apollo	2018-03-20 12:01:31.494	0
423	ModifyNamespace+falcon+aps.rabbitmq	apollo	2018-03-20 12:05:53.177	apollo	2018-03-20 12:05:53.177	0
426	ReleaseNamespace+falcon+aps.rabbitmq	apollo	2018-03-20 12:05:53.197	apollo	2018-03-20 12:05:53.197	0
\.


--
-- Data for Name: RolePermission; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "RolePermission" ("Id", "RoleId", "PermissionId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
115	114	111	apollo	2018-03-17 18:11:04.252	apollo	2018-03-17 18:11:04.252	0
116	114	112	apollo	2018-03-17 18:11:04.259	apollo	2018-03-17 18:11:04.259	0
117	114	113	apollo	2018-03-17 18:11:04.268	apollo	2018-03-17 18:11:04.268	0
121	120	119	apollo	2018-03-17 18:11:04.465	apollo	2018-03-17 18:11:04.465	0
124	123	122	apollo	2018-03-17 18:11:04.505	apollo	2018-03-17 18:11:04.505	0
133	132	129	apollo	2018-03-17 18:15:50.967	apollo	2018-03-17 18:15:50.967	0
134	132	130	apollo	2018-03-17 18:15:50.974	apollo	2018-03-17 18:15:50.974	0
135	132	131	apollo	2018-03-17 18:15:50.976	apollo	2018-03-17 18:15:50.976	0
139	138	137	apollo	2018-03-17 18:15:51.044	apollo	2018-03-17 18:15:51.044	0
142	141	140	apollo	2018-03-17 18:15:51.087	apollo	2018-03-17 18:15:51.087	0
151	150	147	apollo	2018-03-17 18:26:13.185	apollo	2018-03-17 18:26:13.185	0
152	150	148	apollo	2018-03-17 18:26:13.189	apollo	2018-03-17 18:26:13.189	0
153	150	149	apollo	2018-03-17 18:26:13.191	apollo	2018-03-17 18:26:13.191	0
157	156	155	apollo	2018-03-17 18:26:13.505	apollo	2018-03-17 18:26:13.505	0
160	159	158	apollo	2018-03-17 18:26:13.669	apollo	2018-03-17 18:26:13.669	0
169	168	165	apollo	2018-03-17 18:38:27.507	apollo	2018-03-17 18:38:27.507	0
170	168	166	apollo	2018-03-17 18:38:27.51	apollo	2018-03-17 18:38:27.51	0
171	168	167	apollo	2018-03-17 18:38:27.515	apollo	2018-03-17 18:38:27.515	0
175	174	173	apollo	2018-03-17 18:38:27.677	apollo	2018-03-17 18:38:27.677	0
178	177	176	apollo	2018-03-17 18:38:27.751	apollo	2018-03-17 18:38:27.751	0
187	186	183	apollo	2018-03-17 18:42:52.783	apollo	2018-03-17 18:42:52.783	0
188	186	184	apollo	2018-03-17 18:42:52.785	apollo	2018-03-17 18:42:52.785	0
189	186	185	apollo	2018-03-17 18:42:52.787	apollo	2018-03-17 18:42:52.787	0
193	192	191	apollo	2018-03-17 18:42:52.859	apollo	2018-03-17 18:42:52.859	0
196	195	194	apollo	2018-03-17 18:42:52.93	apollo	2018-03-17 18:42:52.93	0
205	204	201	apollo	2018-03-17 18:49:08.886	apollo	2018-03-17 18:49:08.886	0
206	204	202	apollo	2018-03-17 18:49:08.888	apollo	2018-03-17 18:49:08.888	0
207	204	203	apollo	2018-03-17 18:49:08.891	apollo	2018-03-17 18:49:08.891	0
211	210	209	apollo	2018-03-17 18:49:09.017	apollo	2018-03-17 18:49:09.017	0
214	213	212	apollo	2018-03-17 18:49:09.057	apollo	2018-03-17 18:49:09.057	0
223	222	219	apollo	2018-03-17 18:53:45.296	apollo	2018-03-17 18:53:45.296	0
224	222	220	apollo	2018-03-17 18:53:45.298	apollo	2018-03-17 18:53:45.298	0
225	222	221	apollo	2018-03-17 18:53:45.301	apollo	2018-03-17 18:53:45.301	0
229	228	227	apollo	2018-03-17 18:53:45.417	apollo	2018-03-17 18:53:45.417	0
232	231	230	apollo	2018-03-17 18:53:45.455	apollo	2018-03-17 18:53:45.455	0
241	240	237	apollo	2018-03-17 19:00:13.489	apollo	2018-03-17 19:00:13.489	0
242	240	238	apollo	2018-03-17 19:00:13.494	apollo	2018-03-17 19:00:13.494	0
243	240	239	apollo	2018-03-17 19:00:13.496	apollo	2018-03-17 19:00:13.496	0
247	246	245	apollo	2018-03-17 19:00:13.589	apollo	2018-03-17 19:00:13.589	0
250	249	248	apollo	2018-03-17 19:00:13.652	apollo	2018-03-17 19:00:13.652	0
259	258	255	apollo	2018-03-17 19:47:35.959	apollo	2018-03-17 19:47:35.959	0
260	258	256	apollo	2018-03-17 19:47:35.968	apollo	2018-03-17 19:47:35.968	0
261	258	257	apollo	2018-03-17 19:47:35.971	apollo	2018-03-17 19:47:35.971	0
265	264	263	apollo	2018-03-17 19:47:36.127	apollo	2018-03-17 19:47:36.127	0
268	267	266	apollo	2018-03-17 19:47:36.183	apollo	2018-03-17 19:47:36.183	0
277	276	273	apollo	2018-03-19 09:23:58.072	apollo	2018-03-19 09:23:58.072	0
278	276	274	apollo	2018-03-19 09:23:58.105	apollo	2018-03-19 09:23:58.105	0
279	276	275	apollo	2018-03-19 09:23:58.205	apollo	2018-03-19 09:23:58.205	0
283	282	281	apollo	2018-03-19 09:23:58.575	apollo	2018-03-19 09:23:58.575	0
286	285	284	apollo	2018-03-19 09:23:58.712	apollo	2018-03-19 09:23:58.712	0
295	294	291	apollo	2018-03-19 18:16:52.391	apollo	2018-03-19 18:16:52.391	0
296	294	292	apollo	2018-03-19 18:16:52.394	apollo	2018-03-19 18:16:52.394	0
297	294	293	apollo	2018-03-19 18:16:52.395	apollo	2018-03-19 18:16:52.395	0
301	300	299	apollo	2018-03-19 18:16:52.66	apollo	2018-03-19 18:16:52.66	0
304	303	302	apollo	2018-03-19 18:16:52.703	apollo	2018-03-19 18:16:52.703	0
315	314	311	apollo	2018-03-19 18:32:59.698	apollo	2018-03-19 18:32:59.698	0
316	314	312	apollo	2018-03-19 18:32:59.708	apollo	2018-03-19 18:32:59.708	0
317	314	313	apollo	2018-03-19 18:32:59.709	apollo	2018-03-19 18:32:59.709	0
321	320	319	apollo	2018-03-19 18:32:59.844	apollo	2018-03-19 18:32:59.844	0
324	323	322	apollo	2018-03-19 18:32:59.858	apollo	2018-03-19 18:32:59.858	0
330	329	328	apollo	2018-03-20 10:34:28.733	apollo	2018-03-20 10:34:28.733	0
333	332	331	apollo	2018-03-20 10:34:28.998	apollo	2018-03-20 10:34:28.998	0
338	337	336	apollo	2018-03-20 10:35:51.853	apollo	2018-03-20 10:35:51.853	0
341	340	339	apollo	2018-03-20 10:35:51.953	apollo	2018-03-20 10:35:51.953	0
347	346	345	apollo	2018-03-20 10:37:18.585	apollo	2018-03-20 10:37:18.585	0
350	349	348	apollo	2018-03-20 10:37:18.695	apollo	2018-03-20 10:37:18.695	0
356	355	354	apollo	2018-03-20 10:41:03.035	apollo	2018-03-20 10:41:03.035	0
359	358	357	apollo	2018-03-20 10:41:03.174	apollo	2018-03-20 10:41:03.174	0
368	367	364	apollo	2018-03-20 10:46:29.175	apollo	2018-03-20 10:46:29.175	0
369	367	365	apollo	2018-03-20 10:46:29.176	apollo	2018-03-20 10:46:29.176	0
370	367	366	apollo	2018-03-20 10:46:29.177	apollo	2018-03-20 10:46:29.177	0
374	373	372	apollo	2018-03-20 10:46:29.223	apollo	2018-03-20 10:46:29.223	0
377	376	375	apollo	2018-03-20 10:46:29.235	apollo	2018-03-20 10:46:29.235	0
382	381	380	apollo	2018-03-20 11:00:30.739	apollo	2018-03-20 11:00:30.739	0
385	384	383	apollo	2018-03-20 11:00:30.75	apollo	2018-03-20 11:00:30.75	0
390	389	388	apollo	2018-03-20 11:00:42.021	apollo	2018-03-20 11:00:42.021	0
393	392	391	apollo	2018-03-20 11:00:42.032	apollo	2018-03-20 11:00:42.032	0
398	397	396	apollo	2018-03-20 11:00:49.362	apollo	2018-03-20 11:00:49.362	0
401	400	399	apollo	2018-03-20 11:00:49.377	apollo	2018-03-20 11:00:49.377	0
410	409	406	apollo	2018-03-20 12:01:31.444	apollo	2018-03-20 12:01:31.444	0
411	409	407	apollo	2018-03-20 12:01:31.445	apollo	2018-03-20 12:01:31.445	0
412	409	408	apollo	2018-03-20 12:01:31.446	apollo	2018-03-20 12:01:31.446	0
416	415	414	apollo	2018-03-20 12:01:31.48	apollo	2018-03-20 12:01:31.48	0
419	418	417	apollo	2018-03-20 12:01:31.495	apollo	2018-03-20 12:01:31.495	0
424	423	422	apollo	2018-03-20 12:05:53.187	apollo	2018-03-20 12:05:53.187	0
427	426	425	apollo	2018-03-20 12:05:53.198	apollo	2018-03-20 12:05:53.198	0
\.


--
-- Data for Name: ServerConfig; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "ServerConfig" ("Id", "Key", "Value", "Comment", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
1	apollo.portal.envs	dev	可支持的环境列表	default	2018-03-17 16:07:29.692204		\N	0
3	superAdmin	apollo	Portal超级管理员	default	2018-03-17 16:07:29.692204		\N	0
4	api.readTimeout	10000	http接口read timeout	default	2018-03-17 16:07:29.692204		\N	0
5	consumer.token.salt	someSalt	consumer token salt	default	2018-03-17 16:07:29.692204		\N	0
6	admin.createPrivateNamespace.switch	false	是否允许项目管理员创建私有namespace	default	2018-03-17 16:07:29.692204		\N	0
2	organizations	[{"orgId":"aps","orgName":"aps"},{"orgId":"TEST2","orgName":"样例部门2"}]	部门列表	default	2018-03-17 16:07:29.692204		\N	0
\.


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "UserRole" ("Id", "UserId", "RoleId", "DataChange_CreatedBy", "DataChange_CreatedTime", "DataChange_LastModifiedBy", "DataChange_LastTime", "IsDeleted") FROM stdin;
118	apollo	114	apollo	2018-03-17 18:11:04.439	apollo	2018-03-17 18:11:04.439	0
125	apollo	120	apollo	2018-03-17 18:11:04.53	apollo	2018-03-17 18:11:04.53	0
126	apollo	123	apollo	2018-03-17 18:11:04.56	apollo	2018-03-17 18:11:04.56	0
136	apollo	132	apollo	2018-03-17 18:15:51.019	apollo	2018-03-17 18:15:51.019	0
143	apollo	138	apollo	2018-03-17 18:15:51.113	apollo	2018-03-17 18:15:51.113	0
144	apollo	141	apollo	2018-03-17 18:15:51.152	apollo	2018-03-17 18:15:51.152	0
154	apollo	150	apollo	2018-03-17 18:26:13.37	apollo	2018-03-17 18:26:13.37	0
161	apollo	156	apollo	2018-03-17 18:26:13.751	apollo	2018-03-17 18:26:13.751	0
162	apollo	159	apollo	2018-03-17 18:26:13.798	apollo	2018-03-17 18:26:13.798	0
172	apollo	168	apollo	2018-03-17 18:38:27.614	apollo	2018-03-17 18:38:27.614	0
179	apollo	174	apollo	2018-03-17 18:38:27.789	apollo	2018-03-17 18:38:27.789	0
180	apollo	177	apollo	2018-03-17 18:38:27.818	apollo	2018-03-17 18:38:27.818	0
190	apollo	186	apollo	2018-03-17 18:42:52.838	apollo	2018-03-17 18:42:52.838	0
197	apollo	192	apollo	2018-03-17 18:42:52.952	apollo	2018-03-17 18:42:52.952	0
198	apollo	195	apollo	2018-03-17 18:42:52.971	apollo	2018-03-17 18:42:52.971	0
208	apollo	204	apollo	2018-03-17 18:49:08.982	apollo	2018-03-17 18:49:08.982	0
215	apollo	210	apollo	2018-03-17 18:49:09.081	apollo	2018-03-17 18:49:09.081	0
216	apollo	213	apollo	2018-03-17 18:49:09.095	apollo	2018-03-17 18:49:09.095	0
226	apollo	222	apollo	2018-03-17 18:53:45.386	apollo	2018-03-17 18:53:45.386	0
233	apollo	228	apollo	2018-03-17 18:53:45.477	apollo	2018-03-17 18:53:45.477	0
234	apollo	231	apollo	2018-03-17 18:53:45.492	apollo	2018-03-17 18:53:45.492	0
244	apollo	240	apollo	2018-03-17 19:00:13.563	apollo	2018-03-17 19:00:13.563	0
251	apollo	246	apollo	2018-03-17 19:00:13.682	apollo	2018-03-17 19:00:13.682	0
252	apollo	249	apollo	2018-03-17 19:00:13.695	apollo	2018-03-17 19:00:13.695	0
262	apollo	258	apollo	2018-03-17 19:47:36.097	apollo	2018-03-17 19:47:36.097	0
269	apollo	264	apollo	2018-03-17 19:47:36.215	apollo	2018-03-17 19:47:36.215	0
270	apollo	267	apollo	2018-03-17 19:47:36.23	apollo	2018-03-17 19:47:36.23	0
280	apollo	276	apollo	2018-03-19 09:23:58.438	apollo	2018-03-19 09:23:58.438	0
287	apollo	282	apollo	2018-03-19 09:23:58.751	apollo	2018-03-19 09:23:58.751	0
288	apollo	285	apollo	2018-03-19 09:23:58.771	apollo	2018-03-19 09:23:58.771	0
298	apollo	294	apollo	2018-03-19 18:16:52.601	apollo	2018-03-19 18:16:52.601	0
305	apollo	300	apollo	2018-03-19 18:16:52.759	apollo	2018-03-19 18:16:52.759	0
306	apollo	303	apollo	2018-03-19 18:16:52.798	apollo	2018-03-19 18:16:52.798	0
318	apollo	314	apollo	2018-03-19 18:32:59.799	apollo	2018-03-19 18:32:59.799	0
325	apollo	320	apollo	2018-03-19 18:32:59.874	apollo	2018-03-19 18:32:59.874	0
326	apollo	323	apollo	2018-03-19 18:32:59.886	apollo	2018-03-19 18:32:59.886	0
334	apollo	329	apollo	2018-03-20 10:34:29.081	apollo	2018-03-20 10:34:29.081	0
335	apollo	332	apollo	2018-03-20 10:34:29.108	apollo	2018-03-20 10:34:29.108	0
342	apollo	337	apollo	2018-03-20 10:35:52.064	apollo	2018-03-20 10:35:52.064	0
343	apollo	340	apollo	2018-03-20 10:35:52.083	apollo	2018-03-20 10:35:52.083	0
351	apollo	346	apollo	2018-03-20 10:37:18.765	apollo	2018-03-20 10:37:18.765	0
352	apollo	349	apollo	2018-03-20 10:37:18.856	apollo	2018-03-20 10:37:18.856	0
360	apollo	355	apollo	2018-03-20 10:41:03.227	apollo	2018-03-20 10:41:03.227	0
361	apollo	358	apollo	2018-03-20 10:41:03.269	apollo	2018-03-20 10:41:03.269	0
371	apollo	367	apollo	2018-03-20 10:46:29.216	apollo	2018-03-20 10:46:29.216	0
378	apollo	373	apollo	2018-03-20 10:46:29.242	apollo	2018-03-20 10:46:29.242	0
379	apollo	376	apollo	2018-03-20 10:46:29.247	apollo	2018-03-20 10:46:29.247	0
386	apollo	381	apollo	2018-03-20 11:00:30.806	apollo	2018-03-20 11:00:30.806	0
387	apollo	384	apollo	2018-03-20 11:00:30.814	apollo	2018-03-20 11:00:30.814	0
394	apollo	389	apollo	2018-03-20 11:00:42.072	apollo	2018-03-20 11:00:42.072	0
395	apollo	392	apollo	2018-03-20 11:00:42.079	apollo	2018-03-20 11:00:42.079	0
402	apollo	397	apollo	2018-03-20 11:00:49.439	apollo	2018-03-20 11:00:49.439	0
403	apollo	400	apollo	2018-03-20 11:00:49.447	apollo	2018-03-20 11:00:49.447	0
413	apollo	409	apollo	2018-03-20 12:01:31.468	apollo	2018-03-20 12:01:31.468	0
420	apollo	415	apollo	2018-03-20 12:01:31.518	apollo	2018-03-20 12:01:31.518	0
421	apollo	418	apollo	2018-03-20 12:01:31.526	apollo	2018-03-20 12:01:31.526	0
428	apollo	423	apollo	2018-03-20 12:05:53.251	apollo	2018-03-20 12:05:53.251	0
429	apollo	426	apollo	2018-03-20 12:05:53.259	apollo	2018-03-20 12:05:53.259	0
\.


--
-- Data for Name: Users; Type: TABLE DATA; Schema: public; Owner: triceed
--

COPY "Users" ("Id", "Username", "Password", "Email", "Enabled") FROM stdin;
1	apollo	$2a$10$7r20uS.BQ9uBpf3Baj3uQOZvMVvB1RN3PYoKE94gtz2.WAOuiiwXS	apollo@acme.com	1
\.


--
-- Name: app_name_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('app_name_seq', 1, false);


--
-- Name: app_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('app_seq', 2, true);


--
-- Name: authorities_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('authorities_seq', 1, true);


--
-- Name: consumer_audit_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('consumer_audit_seq', 1, false);


--
-- Name: consumer_role_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('consumer_role_seq', 1, false);


--
-- Name: consumer_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('consumer_seq', 1, false);


--
-- Name: consumer_token_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('consumer_token_seq', 1, false);


--
-- Name: favorite_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('favorite_seq', 1, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('hibernate_sequence', 429, true);


--
-- Name: permission_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('permission_seq', 1, false);


--
-- Name: role_permission_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('role_permission_seq', 1, false);


--
-- Name: role_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('role_seq', 1, false);


--
-- Name: server_config_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('server_config_seq', 6, true);


--
-- Name: user_role_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('user_role_seq', 1, false);


--
-- Name: users_seq; Type: SEQUENCE SET; Schema: public; Owner: triceed
--

SELECT pg_catalog.setval('users_seq', 1, true);


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
-- Name: Authorities_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Authorities"
    ADD CONSTRAINT "Authorities_pkey" PRIMARY KEY ("Id");


--
-- Name: ConsumerAudit_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ConsumerAudit"
    ADD CONSTRAINT "ConsumerAudit_pkey" PRIMARY KEY ("Id");


--
-- Name: ConsumerRole_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ConsumerRole"
    ADD CONSTRAINT "ConsumerRole_pkey" PRIMARY KEY ("Id");


--
-- Name: ConsumerToken_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ConsumerToken"
    ADD CONSTRAINT "ConsumerToken_pkey" PRIMARY KEY ("Id");


--
-- Name: Consumer_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Consumer"
    ADD CONSTRAINT "Consumer_pkey" PRIMARY KEY ("Id");


--
-- Name: Favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Favorite"
    ADD CONSTRAINT "Favorite_pkey" PRIMARY KEY ("Id");


--
-- Name: Permission_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Permission"
    ADD CONSTRAINT "Permission_pkey" PRIMARY KEY ("Id");


--
-- Name: RolePermission_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "RolePermission"
    ADD CONSTRAINT "RolePermission_pkey" PRIMARY KEY ("Id");


--
-- Name: Role_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("Id");


--
-- Name: ServerConfig_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "ServerConfig"
    ADD CONSTRAINT "ServerConfig_pkey" PRIMARY KEY ("Id");


--
-- Name: UserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY ("Id");


--
-- Name: Users_pkey; Type: CONSTRAINT; Schema: public; Owner: triceed; Tablespace: 
--

ALTER TABLE ONLY "Users"
    ADD CONSTRAINT "Users_pkey" PRIMARY KEY ("Id");


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

