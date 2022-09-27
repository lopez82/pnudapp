--
-- PostgreSQL database dump
--

-- Dumped from database version 13.7
-- Dumped by pg_dump version 13.7

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    trial081 character(1)
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: TABLE auth_group; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_group IS 'TRIAL';


--
-- Name: COLUMN auth_group.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group.id IS 'TRIAL';


--
-- Name: COLUMN auth_group.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group.name IS 'TRIAL';


--
-- Name: COLUMN auth_group.trial081; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group.trial081 IS 'TRIAL';


--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL,
    trial084 character(1)
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: TABLE auth_group_permissions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_group_permissions IS 'TRIAL';


--
-- Name: COLUMN auth_group_permissions.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group_permissions.id IS 'TRIAL';


--
-- Name: COLUMN auth_group_permissions.group_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group_permissions.group_id IS 'TRIAL';


--
-- Name: COLUMN auth_group_permissions.permission_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group_permissions.permission_id IS 'TRIAL';


--
-- Name: COLUMN auth_group_permissions.trial084; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_group_permissions.trial084 IS 'TRIAL';


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL,
    trial087 character(1)
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: TABLE auth_permission; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_permission IS 'TRIAL';


--
-- Name: COLUMN auth_permission.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_permission.id IS 'TRIAL';


--
-- Name: COLUMN auth_permission.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_permission.name IS 'TRIAL';


--
-- Name: COLUMN auth_permission.content_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_permission.content_type_id IS 'TRIAL';


--
-- Name: COLUMN auth_permission.codename; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_permission.codename IS 'TRIAL';


--
-- Name: COLUMN auth_permission.trial087; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_permission.trial087 IS 'TRIAL';


--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp(6) without time zone,
    is_superuser smallint NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff smallint NOT NULL,
    is_active smallint NOT NULL,
    date_joined timestamp(6) without time zone NOT NULL,
    trial091 character(1)
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: TABLE auth_user; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_user IS 'TRIAL';


--
-- Name: COLUMN auth_user.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.id IS 'TRIAL';


--
-- Name: COLUMN auth_user.password; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.password IS 'TRIAL';


--
-- Name: COLUMN auth_user.last_login; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.last_login IS 'TRIAL';


--
-- Name: COLUMN auth_user.is_superuser; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.is_superuser IS 'TRIAL';


--
-- Name: COLUMN auth_user.username; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.username IS 'TRIAL';


--
-- Name: COLUMN auth_user.first_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.first_name IS 'TRIAL';


--
-- Name: COLUMN auth_user.last_name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.last_name IS 'TRIAL';


--
-- Name: COLUMN auth_user.email; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.email IS 'TRIAL';


--
-- Name: COLUMN auth_user.is_staff; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.is_staff IS 'TRIAL';


--
-- Name: COLUMN auth_user.is_active; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.is_active IS 'TRIAL';


--
-- Name: COLUMN auth_user.date_joined; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.date_joined IS 'TRIAL';


--
-- Name: COLUMN auth_user.trial091; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user.trial091 IS 'TRIAL';


--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL,
    trial094 character(1)
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: TABLE auth_user_groups; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_user_groups IS 'TRIAL';


--
-- Name: COLUMN auth_user_groups.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_groups.id IS 'TRIAL';


--
-- Name: COLUMN auth_user_groups.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_groups.user_id IS 'TRIAL';


--
-- Name: COLUMN auth_user_groups.group_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_groups.group_id IS 'TRIAL';


--
-- Name: COLUMN auth_user_groups.trial094; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_groups.trial094 IS 'TRIAL';


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    trial094 character(1)
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: TABLE auth_user_user_permissions; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.auth_user_user_permissions IS 'TRIAL';


--
-- Name: COLUMN auth_user_user_permissions.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_user_permissions.id IS 'TRIAL';


--
-- Name: COLUMN auth_user_user_permissions.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_user_permissions.user_id IS 'TRIAL';


--
-- Name: COLUMN auth_user_user_permissions.permission_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_user_permissions.permission_id IS 'TRIAL';


--
-- Name: COLUMN auth_user_user_permissions.trial094; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.auth_user_user_permissions.trial094 IS 'TRIAL';


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp(6) without time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag integer NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    trial097 character(1)
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: TABLE django_admin_log; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.django_admin_log IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.id IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.action_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.action_time IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.object_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.object_id IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.object_repr; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.object_repr IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.action_flag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.action_flag IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.change_message; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.change_message IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.content_type_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.content_type_id IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.user_id IS 'TRIAL';


--
-- Name: COLUMN django_admin_log.trial097; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_admin_log.trial097 IS 'TRIAL';


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL,
    trial100 character(1)
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: TABLE django_content_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.django_content_type IS 'TRIAL';


--
-- Name: COLUMN django_content_type.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_content_type.id IS 'TRIAL';


--
-- Name: COLUMN django_content_type.app_label; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_content_type.app_label IS 'TRIAL';


--
-- Name: COLUMN django_content_type.model; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_content_type.model IS 'TRIAL';


--
-- Name: COLUMN django_content_type.trial100; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_content_type.trial100 IS 'TRIAL';


--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp(6) without time zone NOT NULL,
    trial104 character(1)
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: TABLE django_migrations; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.django_migrations IS 'TRIAL';


--
-- Name: COLUMN django_migrations.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_migrations.id IS 'TRIAL';


--
-- Name: COLUMN django_migrations.app; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_migrations.app IS 'TRIAL';


--
-- Name: COLUMN django_migrations.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_migrations.name IS 'TRIAL';


--
-- Name: COLUMN django_migrations.applied; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_migrations.applied IS 'TRIAL';


--
-- Name: COLUMN django_migrations.trial104; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_migrations.trial104 IS 'TRIAL';


--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp(6) without time zone NOT NULL,
    trial104 character(1)
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: TABLE django_session; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.django_session IS 'TRIAL';


--
-- Name: COLUMN django_session.session_key; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_session.session_key IS 'TRIAL';


--
-- Name: COLUMN django_session.session_data; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_session.session_data IS 'TRIAL';


--
-- Name: COLUMN django_session.expire_date; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_session.expire_date IS 'TRIAL';


--
-- Name: COLUMN django_session.trial104; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.django_session.trial104 IS 'TRIAL';


--
-- Name: medicaments_bonlivraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_bonlivraison (
    id bigint NOT NULL,
    fournisseur character varying(500) NOT NULL,
    num character varying(255) NOT NULL,
    quantite bigint NOT NULL,
    date_livraison date NOT NULL,
    observation character varying(500),
    commande_id bigint NOT NULL,
    user_id integer,
    date_exp date,
    trial107 character(1)
);


ALTER TABLE public.medicaments_bonlivraison OWNER TO postgres;

--
-- Name: TABLE medicaments_bonlivraison; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_bonlivraison IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.fournisseur; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.fournisseur IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.num; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.num IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.quantite; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.quantite IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.date_livraison; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.date_livraison IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.observation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.observation IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.commande_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.commande_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.user_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.date_exp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.date_exp IS 'TRIAL';


--
-- Name: COLUMN medicaments_bonlivraison.trial107; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_bonlivraison.trial107 IS 'TRIAL';


--
-- Name: medicaments_bonlivraison_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_bonlivraison_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_bonlivraison_id_seq OWNER TO postgres;

--
-- Name: medicaments_bonlivraison_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_bonlivraison_id_seq OWNED BY public.medicaments_bonlivraison.id;


--
-- Name: medicaments_categorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_categorie (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    trial110 character(1)
);


ALTER TABLE public.medicaments_categorie OWNER TO postgres;

--
-- Name: TABLE medicaments_categorie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_categorie IS 'TRIAL';


--
-- Name: COLUMN medicaments_categorie.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_categorie.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_categorie.nom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_categorie.nom IS 'TRIAL';


--
-- Name: COLUMN medicaments_categorie.trial110; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_categorie.trial110 IS 'TRIAL';


--
-- Name: medicaments_categorie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_categorie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_categorie_id_seq OWNER TO postgres;

--
-- Name: medicaments_categorie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_categorie_id_seq OWNED BY public.medicaments_categorie.id;


--
-- Name: medicaments_cbonlivraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_cbonlivraison (
    bonlivraison_ptr_id bigint NOT NULL,
    province_id bigint NOT NULL,
    trial110 character(1)
);


ALTER TABLE public.medicaments_cbonlivraison OWNER TO postgres;

--
-- Name: TABLE medicaments_cbonlivraison; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_cbonlivraison IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonlivraison.bonlivraison_ptr_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonlivraison.bonlivraison_ptr_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonlivraison.province_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonlivraison.province_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonlivraison.trial110; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonlivraison.trial110 IS 'TRIAL';


--
-- Name: medicaments_cbonsortie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_cbonsortie (
    bonsortie_ptr_id bigint NOT NULL,
    province_id bigint NOT NULL,
    trial113 character(1)
);


ALTER TABLE public.medicaments_cbonsortie OWNER TO postgres;

--
-- Name: TABLE medicaments_cbonsortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_cbonsortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonsortie.bonsortie_ptr_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonsortie.bonsortie_ptr_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonsortie.province_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonsortie.province_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cbonsortie.trial113; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cbonsortie.trial113 IS 'TRIAL';


--
-- Name: medicaments_commande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_commande (
    id bigint NOT NULL,
    prix_unitaire bigint NOT NULL,
    date_exp date,
    partenaire_id bigint NOT NULL,
    date_livraison date,
    observation character varying(500),
    produit_commande_id bigint,
    quantite_commande bigint,
    lot_commande character varying(500),
    trial117 character(1)
);


ALTER TABLE public.medicaments_commande OWNER TO postgres;

--
-- Name: TABLE medicaments_commande; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_commande IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.prix_unitaire; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.prix_unitaire IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.date_exp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.date_exp IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.partenaire_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.partenaire_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.date_livraison; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.date_livraison IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.observation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.observation IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.produit_commande_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.produit_commande_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.quantite_commande; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.quantite_commande IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.lot_commande; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.lot_commande IS 'TRIAL';


--
-- Name: COLUMN medicaments_commande.trial117; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_commande.trial117 IS 'TRIAL';


--
-- Name: medicaments_commande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_commande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_commande_id_seq OWNER TO postgres;

--
-- Name: medicaments_commande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_commande_id_seq OWNED BY public.medicaments_commande.id;


--
-- Name: medicaments_consmoy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_consmoy (
    id bigint NOT NULL,
    annee bigint NOT NULL,
    value bigint NOT NULL,
    produit_id bigint NOT NULL,
    trial117 character(1)
);


ALTER TABLE public.medicaments_consmoy OWNER TO postgres;

--
-- Name: TABLE medicaments_consmoy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_consmoy IS 'TRIAL';


--
-- Name: COLUMN medicaments_consmoy.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_consmoy.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_consmoy.annee; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_consmoy.annee IS 'TRIAL';


--
-- Name: COLUMN medicaments_consmoy.value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_consmoy.value IS 'TRIAL';


--
-- Name: COLUMN medicaments_consmoy.produit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_consmoy.produit_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_consmoy.trial117; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_consmoy.trial117 IS 'TRIAL';


--
-- Name: medicaments_consmoy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_consmoy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_consmoy_id_seq OWNER TO postgres;

--
-- Name: medicaments_consmoy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_consmoy_id_seq OWNED BY public.medicaments_consmoy.id;


--
-- Name: medicaments_cvbonlivraison; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_cvbonlivraison (
    bonlivraison_ptr_id bigint NOT NULL,
    site_id bigint NOT NULL,
    trial120 character(1)
);


ALTER TABLE public.medicaments_cvbonlivraison OWNER TO postgres;

--
-- Name: TABLE medicaments_cvbonlivraison; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_cvbonlivraison IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonlivraison.bonlivraison_ptr_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonlivraison.bonlivraison_ptr_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonlivraison.site_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonlivraison.site_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonlivraison.trial120; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonlivraison.trial120 IS 'TRIAL';


--
-- Name: medicaments_cvbonsortie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_cvbonsortie (
    bonsortie_ptr_id bigint NOT NULL,
    site_id bigint NOT NULL,
    trial123 character(1)
);


ALTER TABLE public.medicaments_cvbonsortie OWNER TO postgres;

--
-- Name: TABLE medicaments_cvbonsortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_cvbonsortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonsortie.bonsortie_ptr_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonsortie.bonsortie_ptr_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonsortie.site_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonsortie.site_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_cvbonsortie.trial123; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_cvbonsortie.trial123 IS 'TRIAL';


--
-- Name: medicaments_distrmoy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_distrmoy (
    id bigint NOT NULL,
    annee bigint NOT NULL,
    value bigint NOT NULL,
    produit_id bigint NOT NULL,
    trial127 character(1)
);


ALTER TABLE public.medicaments_distrmoy OWNER TO postgres;

--
-- Name: TABLE medicaments_distrmoy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_distrmoy IS 'TRIAL';


--
-- Name: COLUMN medicaments_distrmoy.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_distrmoy.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_distrmoy.annee; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_distrmoy.annee IS 'TRIAL';


--
-- Name: COLUMN medicaments_distrmoy.value; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_distrmoy.value IS 'TRIAL';


--
-- Name: COLUMN medicaments_distrmoy.produit_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_distrmoy.produit_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_distrmoy.trial127; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_distrmoy.trial127 IS 'TRIAL';


--
-- Name: medicaments_distrmoy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_distrmoy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_distrmoy_id_seq OWNER TO postgres;

--
-- Name: medicaments_distrmoy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_distrmoy_id_seq OWNED BY public.medicaments_distrmoy.id;


--
-- Name: medicaments_etatcommande; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_etatcommande (
    id bigint NOT NULL,
    etat character varying(255) NOT NULL,
    trial130 character(1)
);


ALTER TABLE public.medicaments_etatcommande OWNER TO postgres;

--
-- Name: TABLE medicaments_etatcommande; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_etatcommande IS 'TRIAL';


--
-- Name: COLUMN medicaments_etatcommande.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_etatcommande.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_etatcommande.etat; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_etatcommande.etat IS 'TRIAL';


--
-- Name: COLUMN medicaments_etatcommande.trial130; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_etatcommande.trial130 IS 'TRIAL';


--
-- Name: medicaments_etatcommande_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_etatcommande_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_etatcommande_id_seq OWNER TO postgres;

--
-- Name: medicaments_etatcommande_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_etatcommande_id_seq OWNED BY public.medicaments_etatcommande.id;


--
-- Name: medicaments_inventairesage; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_inventairesage (
    id bigint NOT NULL,
    lot character varying(255) NOT NULL,
    quantite_sage bigint NOT NULL,
    mois character varying(255) NOT NULL,
    annee character varying(255) NOT NULL,
    produit_inventaire_id bigint NOT NULL,
    prix_unitaire_sage bigint NOT NULL,
    date_exp date,
    trial130 character(1)
);


ALTER TABLE public.medicaments_inventairesage OWNER TO postgres;

--
-- Name: TABLE medicaments_inventairesage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_inventairesage IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.lot; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.lot IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.quantite_sage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.quantite_sage IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.mois; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.mois IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.annee; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.annee IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.produit_inventaire_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.produit_inventaire_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.prix_unitaire_sage; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.prix_unitaire_sage IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.date_exp; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.date_exp IS 'TRIAL';


--
-- Name: COLUMN medicaments_inventairesage.trial130; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_inventairesage.trial130 IS 'TRIAL';


--
-- Name: medicaments_inventairesage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_inventairesage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_inventairesage_id_seq OWNER TO postgres;

--
-- Name: medicaments_inventairesage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_inventairesage_id_seq OWNED BY public.medicaments_inventairesage.id;


--
-- Name: medicaments_partenaire; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_partenaire (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    trial133 character(1)
);


ALTER TABLE public.medicaments_partenaire OWNER TO postgres;

--
-- Name: TABLE medicaments_partenaire; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_partenaire IS 'TRIAL';


--
-- Name: COLUMN medicaments_partenaire.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_partenaire.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_partenaire.nom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_partenaire.nom IS 'TRIAL';


--
-- Name: COLUMN medicaments_partenaire.trial133; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_partenaire.trial133 IS 'TRIAL';


--
-- Name: medicaments_partenaire_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_partenaire_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_partenaire_id_seq OWNER TO postgres;

--
-- Name: medicaments_partenaire_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_partenaire_id_seq OWNED BY public.medicaments_partenaire.id;


--
-- Name: medicaments_produit; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_produit (
    id bigint NOT NULL,
    designation character varying(500) NOT NULL,
    categorie_id bigint NOT NULL,
    programme_id integer DEFAULT 1 NOT NULL,
    num_ref character varying(255),
    dashbord smallint NOT NULL,
    taille_paquet bigint NOT NULL,
    trial136 character(1)
);


ALTER TABLE public.medicaments_produit OWNER TO postgres;

--
-- Name: TABLE medicaments_produit; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_produit IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.designation; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.designation IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.categorie_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.categorie_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.programme_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.programme_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.num_ref; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.num_ref IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.dashbord; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.dashbord IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.taille_paquet; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.taille_paquet IS 'TRIAL';


--
-- Name: COLUMN medicaments_produit.trial136; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_produit.trial136 IS 'TRIAL';


--
-- Name: medicaments_produit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_produit_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_produit_id_seq OWNER TO postgres;

--
-- Name: medicaments_produit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_produit_id_seq OWNED BY public.medicaments_produit.id;


--
-- Name: medicaments_programme; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_programme (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    trial140 character(1)
);


ALTER TABLE public.medicaments_programme OWNER TO postgres;

--
-- Name: TABLE medicaments_programme; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_programme IS 'TRIAL';


--
-- Name: COLUMN medicaments_programme.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_programme.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_programme.nom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_programme.nom IS 'TRIAL';


--
-- Name: COLUMN medicaments_programme.trial140; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_programme.trial140 IS 'TRIAL';


--
-- Name: medicaments_programme_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_programme_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_programme_id_seq OWNER TO postgres;

--
-- Name: medicaments_programme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_programme_id_seq OWNED BY public.medicaments_programme.id;


--
-- Name: medicaments_province; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_province (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    trial143 character(1)
);


ALTER TABLE public.medicaments_province OWNER TO postgres;

--
-- Name: TABLE medicaments_province; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_province IS 'TRIAL';


--
-- Name: COLUMN medicaments_province.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_province.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_province.nom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_province.nom IS 'TRIAL';


--
-- Name: COLUMN medicaments_province.trial143; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_province.trial143 IS 'TRIAL';


--
-- Name: medicaments_province_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_province_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_province_id_seq OWNER TO postgres;

--
-- Name: medicaments_province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_province_id_seq OWNED BY public.medicaments_province.id;


--
-- Name: medicaments_site; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_site (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    trial143 character(1)
);


ALTER TABLE public.medicaments_site OWNER TO postgres;

--
-- Name: TABLE medicaments_site; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_site IS 'TRIAL';


--
-- Name: COLUMN medicaments_site.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_site.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_site.nom; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_site.nom IS 'TRIAL';


--
-- Name: COLUMN medicaments_site.trial143; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_site.trial143 IS 'TRIAL';


--
-- Name: medicaments_site_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_site_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_site_id_seq OWNER TO postgres;

--
-- Name: medicaments_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_site_id_seq OWNED BY public.medicaments_site.id;


--
-- Name: medicaments_sortie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicaments_sortie (
    id bigint NOT NULL,
    quantite_sortie bigint NOT NULL,
    date_sortie date NOT NULL,
    observation_sortie character varying(500),
    produit_sortie_id bigint NOT NULL,
    lot_sortie character varying(500),
    trial146 character(1)
);


ALTER TABLE public.medicaments_sortie OWNER TO postgres;

--
-- Name: TABLE medicaments_sortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.medicaments_sortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.id IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.quantite_sortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.quantite_sortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.date_sortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.date_sortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.observation_sortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.observation_sortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.produit_sortie_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.produit_sortie_id IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.lot_sortie; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.lot_sortie IS 'TRIAL';


--
-- Name: COLUMN medicaments_sortie.trial146; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.medicaments_sortie.trial146 IS 'TRIAL';


--
-- Name: medicaments_sortie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicaments_sortie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicaments_sortie_id_seq OWNER TO postgres;

--
-- Name: medicaments_sortie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicaments_sortie_id_seq OWNED BY public.medicaments_sortie.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: medicaments_bonlivraison id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_bonlivraison ALTER COLUMN id SET DEFAULT nextval('public.medicaments_bonlivraison_id_seq'::regclass);


--
-- Name: medicaments_categorie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_categorie ALTER COLUMN id SET DEFAULT nextval('public.medicaments_categorie_id_seq'::regclass);


--
-- Name: medicaments_commande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_commande ALTER COLUMN id SET DEFAULT nextval('public.medicaments_commande_id_seq'::regclass);


--
-- Name: medicaments_consmoy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_consmoy ALTER COLUMN id SET DEFAULT nextval('public.medicaments_consmoy_id_seq'::regclass);


--
-- Name: medicaments_distrmoy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_distrmoy ALTER COLUMN id SET DEFAULT nextval('public.medicaments_distrmoy_id_seq'::regclass);


--
-- Name: medicaments_etatcommande id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_etatcommande ALTER COLUMN id SET DEFAULT nextval('public.medicaments_etatcommande_id_seq'::regclass);


--
-- Name: medicaments_inventairesage id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_inventairesage ALTER COLUMN id SET DEFAULT nextval('public.medicaments_inventairesage_id_seq'::regclass);


--
-- Name: medicaments_partenaire id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_partenaire ALTER COLUMN id SET DEFAULT nextval('public.medicaments_partenaire_id_seq'::regclass);


--
-- Name: medicaments_produit id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_produit ALTER COLUMN id SET DEFAULT nextval('public.medicaments_produit_id_seq'::regclass);


--
-- Name: medicaments_programme id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_programme ALTER COLUMN id SET DEFAULT nextval('public.medicaments_programme_id_seq'::regclass);


--
-- Name: medicaments_province id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_province ALTER COLUMN id SET DEFAULT nextval('public.medicaments_province_id_seq'::regclass);


--
-- Name: medicaments_site id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_site ALTER COLUMN id SET DEFAULT nextval('public.medicaments_site_id_seq'::regclass);


--
-- Name: medicaments_sortie id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_sortie ALTER COLUMN id SET DEFAULT nextval('public.medicaments_sortie_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name, trial081) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id, trial084) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename, trial087) FROM stdin;
1	Can add log entry	1	add_logentry	T
2	Can change log entry	1	change_logentry	T
3	Can delete log entry	1	delete_logentry	T
4	Can view log entry	1	view_logentry	T
5	Can add permission	2	add_permission	T
6	Can change permission	2	change_permission	T
7	Can delete permission	2	delete_permission	T
8	Can view permission	2	view_permission	T
9	Can add group	3	add_group	T
10	Can change group	3	change_group	T
11	Can delete group	3	delete_group	T
12	Can view group	3	view_group	T
13	Can add user	4	add_user	T
14	Can change user	4	change_user	T
15	Can delete user	4	delete_user	T
16	Can view user	4	view_user	T
17	Can add content type	5	add_contenttype	T
18	Can change content type	5	change_contenttype	T
19	Can delete content type	5	delete_contenttype	T
20	Can view content type	5	view_contenttype	T
21	Can add session	6	add_session	T
22	Can change session	6	change_session	T
23	Can delete session	6	delete_session	T
24	Can view session	6	view_session	T
25	Can add produit	7	add_produit	T
26	Can change produit	7	change_produit	T
27	Can delete produit	7	delete_produit	T
28	Can view produit	7	view_produit	T
29	Can add categorie	8	add_categorie	T
30	Can change categorie	8	change_categorie	T
31	Can delete categorie	8	delete_categorie	T
32	Can view categorie	8	view_categorie	T
33	Can add livraison	9	add_livraison	T
34	Can change livraison	9	change_livraison	T
35	Can delete livraison	9	delete_livraison	T
36	Can view livraison	9	view_livraison	T
37	Can add lot	10	add_lot	T
38	Can change lot	10	change_lot	T
39	Can delete lot	10	delete_lot	T
40	Can view lot	10	view_lot	T
41	Can add cons moy	11	add_consmoy	T
42	Can change cons moy	11	change_consmoy	T
43	Can delete cons moy	11	delete_consmoy	T
44	Can view cons moy	11	view_consmoy	T
45	Can add distr moy	12	add_distrmoy	T
46	Can change distr moy	12	change_distrmoy	T
47	Can delete distr moy	12	delete_distrmoy	T
48	Can view distr moy	12	view_distrmoy	T
49	Can add commande	13	add_commande	T
50	Can change commande	13	change_commande	T
51	Can delete commande	13	delete_commande	T
52	Can view commande	13	view_commande	T
53	Can add partenaire	14	add_partenaire	T
54	Can change partenaire	14	change_partenaire	T
55	Can delete partenaire	14	delete_partenaire	T
56	Can view partenaire	14	view_partenaire	T
57	Can add bon livraison	15	add_bonlivraison	T
58	Can change bon livraison	15	change_bonlivraison	T
59	Can delete bon livraison	15	delete_bonlivraison	T
60	Can view bon livraison	15	view_bonlivraison	T
61	Can add bon sortie	16	add_bonsortie	T
62	Can change bon sortie	16	change_bonsortie	T
63	Can delete bon sortie	16	delete_bonsortie	T
64	Can view bon sortie	16	view_bonsortie	T
65	Can add programme	17	add_programme	T
66	Can change programme	17	change_programme	T
67	Can delete programme	17	delete_programme	T
68	Can view programme	17	view_programme	T
69	Can add site	18	add_site	T
70	Can change site	18	change_site	T
71	Can delete site	18	delete_site	T
72	Can view site	18	view_site	T
73	Can add cv bon sortie	19	add_cvbonsortie	T
74	Can change cv bon sortie	19	change_cvbonsortie	T
75	Can delete cv bon sortie	19	delete_cvbonsortie	T
76	Can view cv bon sortie	19	view_cvbonsortie	T
77	Can add cv bon livraison	20	add_cvbonlivraison	T
78	Can change cv bon livraison	20	change_cvbonlivraison	T
79	Can delete cv bon livraison	20	delete_cvbonlivraison	T
80	Can view cv bon livraison	20	view_cvbonlivraison	T
81	Can add province	21	add_province	T
82	Can change province	21	change_province	T
83	Can delete province	21	delete_province	T
84	Can view province	21	view_province	T
85	Can add c bon sortie	22	add_cbonsortie	T
86	Can change c bon sortie	22	change_cbonsortie	T
87	Can delete c bon sortie	22	delete_cbonsortie	T
88	Can view c bon sortie	22	view_cbonsortie	T
89	Can add c bon livraison	23	add_cbonlivraison	T
90	Can change c bon livraison	23	change_cbonlivraison	T
91	Can delete c bon livraison	23	delete_cbonlivraison	T
92	Can view c bon livraison	23	view_cbonlivraison	T
93	Can add province	24	add_province	T
94	Can change province	24	change_province	T
95	Can delete province	24	delete_province	T
96	Can view province	24	view_province	T
97	Can add c bon sortie	25	add_cbonsortie	T
98	Can change c bon sortie	25	change_cbonsortie	T
99	Can delete c bon sortie	25	delete_cbonsortie	T
100	Can view c bon sortie	25	view_cbonsortie	T
101	Can add cv bon livraison	26	add_cvbonlivraison	T
102	Can change cv bon livraison	26	change_cvbonlivraison	T
103	Can delete cv bon livraison	26	delete_cvbonlivraison	T
104	Can view cv bon livraison	26	view_cvbonlivraison	T
105	Can add site	27	add_site	T
106	Can change site	27	change_site	T
107	Can delete site	27	delete_site	T
108	Can view site	27	view_site	T
109	Can add c bon livraison	28	add_cbonlivraison	T
110	Can change c bon livraison	28	change_cbonlivraison	T
111	Can delete c bon livraison	28	delete_cbonlivraison	T
112	Can view c bon livraison	28	view_cbonlivraison	T
113	Can add cv bon sortie	29	add_cvbonsortie	T
114	Can change cv bon sortie	29	change_cvbonsortie	T
115	Can delete cv bon sortie	29	delete_cvbonsortie	T
116	Can view cv bon sortie	29	view_cvbonsortie	T
117	Can add etat commande	30	add_etatcommande	T
118	Can change etat commande	30	change_etatcommande	T
119	Can delete etat commande	30	delete_etatcommande	T
120	Can view etat commande	30	view_etatcommande	T
121	Can add sortie	31	add_sortie	T
122	Can change sortie	31	change_sortie	T
123	Can delete sortie	31	delete_sortie	T
124	Can view sortie	31	view_sortie	T
125	Can add stock sage	32	add_stocksage	T
126	Can change stock sage	32	change_stocksage	T
127	Can delete stock sage	32	delete_stocksage	T
128	Can view stock sage	32	view_stocksage	T
129	Can add inventaire sage	33	add_inventairesage	T
130	Can change inventaire sage	33	change_inventairesage	T
131	Can delete inventaire sage	33	delete_inventairesage	T
132	Can view inventaire sage	33	view_inventairesage	T
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, trial091) FROM stdin;
1	pbkdf2_sha256$390000$EPXZEvYZToOSwfKX95vTn6$6zTopkqwLOk4sCpYRTiUDLH1osZb4GI0/W4tp8U/E2U=	2022-09-26 20:37:47.687109	1	lopez			lopez@gmail.com	1	1	2022-08-17 13:18:41.796243	T
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id, trial094) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id, trial094) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id, trial097) FROM stdin;
1	2022-08-18 10:36:59.186066	1	Site object (1)	1	[{"added": {}}]	18	1	T
2	2022-08-18 10:37:21.311458	2	Site object (2)	1	[{"added": {}}]	18	1	T
3	2022-08-18 10:37:32.887694	3	Site object (3)	1	[{"added": {}}]	18	1	T
4	2022-08-18 10:39:32.373545	4	Site object (4)	1	[{"added": {}}]	18	1	T
5	2022-08-18 10:57:19.49517	1	Bubanza	1	[{"added": {}}]	21	1	T
6	2022-08-18 10:57:35.612811	2	Bujumbura Mairie	1	[{"added": {}}]	21	1	T
7	2022-08-18 10:57:45.367824	3	Bujumbura rural	1	[{"added": {}}]	21	1	T
8	2022-08-18 10:57:54.395197	4	Bururi	1	[{"added": {}}]	21	1	T
9	2022-08-18 10:58:02.753089	5	Cankuzo	1	[{"added": {}}]	21	1	T
10	2022-08-18 10:58:11.719764	6	Cibitoke	1	[{"added": {}}]	21	1	T
11	2022-08-18 10:58:20.916411	7	Gitega	1	[{"added": {}}]	21	1	T
12	2022-08-18 10:58:28.212853	8	Karusi	1	[{"added": {}}]	21	1	T
13	2022-08-18 10:58:38.160875	9	Kayanza	1	[{"added": {}}]	21	1	T
14	2022-08-18 10:58:46.731078	10	Kirundo	1	[{"added": {}}]	21	1	T
15	2022-08-18 10:58:53.913181	11	Makamba	1	[{"added": {}}]	21	1	T
16	2022-08-18 10:59:01.745238	12	Muramvya	1	[{"added": {}}]	21	1	T
17	2022-08-18 10:59:09.346479	13	Muyinga	1	[{"added": {}}]	21	1	T
18	2022-08-18 10:59:25.285528	14	Mwaro	1	[{"added": {}}]	21	1	T
19	2022-08-18 10:59:36.480053	15	Ngozi	1	[{"added": {}}]	21	1	T
20	2022-08-18 10:59:49.130431	16	Rumonge	1	[{"added": {}}]	21	1	T
21	2022-08-18 10:59:58.178028	17	Ruyigi	1	[{"added": {}}]	21	1	T
22	2022-08-18 11:00:10.946157	18	Rutana	1	[{"added": {}}]	21	1	T
23	2022-08-23 15:39:30.806651	1	Categorie object (1)	1	[{"added": {}}]	8	1	T
24	2022-08-23 15:40:00.397345	2	Categorie object (2)	1	[{"added": {}}]	8	1	T
25	2022-08-23 15:40:16.313698	3	Categorie object (3)	1	[{"added": {}}]	8	1	T
26	2022-08-23 15:40:27.657354	4	Categorie object (4)	1	[{"added": {}}]	8	1	T
27	2022-08-23 15:40:39.102753	5	Categorie object (5)	1	[{"added": {}}]	8	1	T
28	2022-08-23 15:42:47.651016	4	réactifs CV	2	[{"changed": {"fields": ["Categorie"]}}]	8	1	T
29	2022-08-23 15:42:56.626238	3	Médicaments IO	2	[{"changed": {"fields": ["Categorie"]}}]	8	1	T
30	2022-08-23 15:43:07.577967	2	Médicament	2	[{"changed": {"fields": ["Categorie"]}}]	8	1	T
31	2022-08-23 18:08:30.977724	1	Programme object (1)	1	[{"added": {}}]	17	1	T
32	2022-08-23 18:08:38.68535	2	Programme object (2)	1	[{"added": {}}]	17	1	T
33	2022-08-23 18:08:46.676421	3	Programme object (3)	1	[{"added": {}}]	17	1	T
34	2022-08-24 20:56:57.136549	1	EtatCommande object (1)	1	[{"added": {}}]	30	1	T
35	2022-08-24 20:57:14.949358	2	EtatCommande object (2)	1	[{"added": {}}]	30	1	T
36	2022-08-24 20:57:27.761777	3	EtatCommande object (3)	1	[{"added": {}}]	30	1	T
37	2022-08-24 20:57:40.754625	4	EtatCommande object (4)	1	[{"added": {}}]	30	1	T
38	2022-09-02 16:07:48.435919	1	StockSage object (1)	1	[{"added": {}}]	32	1	T
39	2022-09-02 16:37:15.053216	1	ConsMoy object (1)	1	[{"added": {}}]	11	1	T
40	2022-09-02 17:01:48.42419	69	Abacavir /Lamivudine 600/300mg ces, B/30	2	[{"changed": {"fields": ["Dashbord"]}}]	7	1	T
41	2022-09-05 13:28:00.069339	1	Abacavir /Lamivudine 600/300mg ces, B/30 - (222.0)	2	[{"changed": {"fields": ["Cons. moyenne annuel"]}}]	11	1	T
42	2022-09-05 13:29:11.452526	1	Abacavir /Lamivudine 600/300mg ces, B/30 - (2668.0)	2	[{"changed": {"fields": ["Cons. moyenne annuel"]}}]	11	1	T
43	2022-09-08 14:02:56.295993	71	Abacavir/Lamivudine 120/60mg ces dipersibles B/60	2	[{"changed": {"fields": ["Num Ref", "Dashbord"]}}]	7	1	T
44	2022-09-10 16:21:34.698323	20	UNICEF - Abacavir /Lamivudine 600/300mg ces, B/30 - None (10)	2	[{"changed": {"fields": ["Produit", "Quantite", "Date livraison"]}}]	13	1	T
45	2022-09-10 16:21:56.962766	19	UNDP - Abacavir/Lamivudine 120/60mg ces dipersibles B/60 - ab (10)	2	[{"changed": {"fields": ["Produit", "Quantite", "Date livraison"]}}]	13	1	T
46	2022-09-10 16:22:09.532266	18	ETAT - None (None)	3		13	1	T
47	2022-09-10 16:22:09.532988	17	UNDP - None (None)	3		13	1	T
48	2022-09-10 16:24:52.368358	68	Abacavir /Lamivudine 600/300mg ces, B/30 - al	2	[{"changed": {"fields": ["Num Ref"]}}]	7	1	T
49	2022-09-12 14:47:26.009073	1	InventaireSage object (1)	1	[{"added": {}}]	33	1	T
50	2022-09-13 14:03:24.113145	2	Abacavir/Lamivudine 120/60mg ces dipersibles B/60 - ab - (1347.0)	1	[{"added": {}}]	11	1	T
51	2022-09-26 20:39:00.495631	1	Abacavir /Lamivudine 600/300mg ces, B/30 - al - (3234.0)	1	[{"added": {}}]	12	1	T
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model, trial100) FROM stdin;
1	admin	logentry	T
2	auth	permission	T
3	auth	group	T
4	auth	user	T
5	contenttypes	contenttype	T
6	sessions	session	T
7	medicaments	produit	T
8	medicaments	categorie	T
9	medicaments	livraison	T
10	medicaments	lot	T
11	medicaments	consmoy	T
12	medicaments	distrmoy	T
13	medicaments	commande	T
14	medicaments	partenaire	T
15	medicaments	bonlivraison	T
16	medicaments	bonsortie	T
17	medicaments	programme	T
18	chargevirale	site	T
19	chargevirale	cvbonsortie	T
20	chargevirale	cvbonlivraison	T
21	condom	province	T
22	condom	cbonsortie	T
23	condom	cbonlivraison	T
24	medicaments	province	T
25	medicaments	cbonsortie	T
26	medicaments	cvbonlivraison	T
27	medicaments	site	T
28	medicaments	cbonlivraison	T
29	medicaments	cvbonsortie	T
30	medicaments	etatcommande	T
31	medicaments	sortie	T
32	medicaments	stocksage	T
33	medicaments	inventairesage	T
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied, trial104) FROM stdin;
1	contenttypes	0001_initial	2022-08-17 13:18:09.82119	T
2	auth	0001_initial	2022-08-17 13:18:10.003194	T
3	admin	0001_initial	2022-08-17 13:18:10.055193	T
4	admin	0002_logentry_remove_auto_add	2022-08-17 13:18:10.066191	T
5	admin	0003_logentry_add_action_flag_choices	2022-08-17 13:18:10.078197	T
6	contenttypes	0002_remove_content_type_name	2022-08-17 13:18:10.11719	T
7	auth	0002_alter_permission_name_max_length	2022-08-17 13:18:10.13919	T
8	auth	0003_alter_user_email_max_length	2022-08-17 13:18:10.161191	T
9	auth	0004_alter_user_username_opts	2022-08-17 13:18:10.174189	T
10	auth	0005_alter_user_last_login_null	2022-08-17 13:18:10.192192	T
11	auth	0006_require_contenttypes_0002	2022-08-17 13:18:10.195192	T
12	auth	0007_alter_validators_add_error_messages	2022-08-17 13:18:10.205189	T
13	auth	0008_alter_user_username_max_length	2022-08-17 13:18:10.231192	T
14	auth	0009_alter_user_last_name_max_length	2022-08-17 13:18:10.25119	T
15	auth	0010_alter_group_name_max_length	2022-08-17 13:18:10.274194	T
16	auth	0011_update_proxy_permissions	2022-08-17 13:18:10.283191	T
17	auth	0012_alter_user_first_name_max_length	2022-08-17 13:18:10.306193	T
18	sessions	0001_initial	2022-08-17 13:18:10.324194	T
20	medicaments	0002_bonlivraison_bonsortie_programme_delete_livraison_and_more	2022-08-18 09:48:36.025644	T
21	medicaments	0003_alter_consmoy_annee_alter_distrmoy_annee	2022-08-18 09:48:36.030639	T
24	condom	0001_initial	2022-08-18 10:07:21.972056	T
25	condom	0002_province_test	2022-08-18 10:07:21.99006	T
26	chargevirale	0001_initial	2022-08-18 10:08:17.666465	T
27	chargevirale	0002_alter_site_nom	2022-08-18 10:36:07.131806	T
28	condom	0003_remove_province_test	2022-08-18 10:41:48.393803	T
29	medicaments	0004_province_site_cvbonsortie_cvbonlivraison_cbonsortie_and_more	2022-08-18 19:23:09.239639	T
30	medicaments	0005_lot_commande	2022-08-23 14:02:54.950907	T
31	medicaments	0006_rename_desigantion_produit_designation_and_more	2022-08-23 15:49:05.068415	T
32	medicaments	0007_alter_produit_programme	2022-08-23 18:10:43.848995	T
33	medicaments	0008_alter_lot_commande	2022-08-23 18:26:04.948894	T
34	medicaments	0009_alter_commande_etat_alter_lot_date_exp	2022-08-24 07:02:27.751084	T
35	medicaments	0010_remove_lot_commande_remove_lot_num_and_more	2022-08-24 19:30:10.620262	T
36	medicaments	0011_etatcommande_alter_lot_etat_commande	2022-08-24 20:51:29.689759	T
37	medicaments	0012_alter_lot_etat_commande_alter_lot_prix_unitaire_and_more	2022-08-25 10:13:15.953249	T
38	medicaments	0013_remove_bonsortie_lot_bonsortie_livraison	2022-09-01 08:32:39.926364	T
39	medicaments	0014_alter_bonsortie_livraison	2022-09-01 08:32:41.700368	T
46	medicaments	0002_bonlivraison_etatcommande_programme_province_site_and_more	2022-09-01 10:05:21.517008	T
47	medicaments	0003_rename_num_sortie_num_sortie_and_more	2022-09-01 10:05:21.522008	T
48	medicaments	0004_alter_sortie_livraison	2022-09-01 10:05:21.527007	T
49	medicaments	0001_initial	2022-09-01 10:31:55.048937	T
50	medicaments	0002_alter_sortie_livraison	2022-09-01 11:04:39.223612	T
51	medicaments	0002_sortie	2022-09-01 11:21:06.772056	T
52	medicaments	0003_remove_lot_num_lot_lot_ref_commande_and_more	2022-09-02 15:25:34.522932	T
53	medicaments	0004_produit_num_ref_alter_lot_etat_commande	2022-09-02 15:43:07.788827	T
54	medicaments	0005_stocksage	2022-09-02 16:00:45.107763	T
55	medicaments	0006_rename_lot_commande_rename_lot_bonlivraison_commande_and_more	2022-09-02 16:23:21.74569	T
56	medicaments	0007_alter_produit_options_produit_dashbord	2022-09-02 16:56:21.14575	T
57	medicaments	0008_inventairesage_remove_commande_date_estime_livraison_and_more	2022-09-09 10:07:05.51093	T
58	medicaments	0009_alter_produit_categorie	2022-09-10 16:02:18.154424	T
59	medicaments	0010_commande_lot_commande_sortie_lot_sortie	2022-09-10 16:55:17.326787	T
60	medicaments	0011_rename_produit_inventairesage_produit_inventaire_and_more	2022-09-12 13:24:22.872656	T
61	medicaments	0012_inventairesage_date_exp	2022-09-21 09:08:47.685651	T
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date, trial104) FROM stdin;
cmf3dpk7ra6kxmd0tcyg5ryzjmv0zpfv	.eJxVjMsOwiAQRf-FtSEMUB4u3fsNBIZBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzMgJ1-txTxQW0H-R7brXPsbV3mxHeFH3Twa8_0vBzu30GNo37riOCl19mBSlaQh2SMI0TrtAbSxaASGgQ5ZZJTThY1SUOmJFII1k_s_QHLBTci:1oOcr6:HiN7UgwIZRdTAkcaScFWURDNVLL0Q5OwvvUUn_XXWSI	2022-09-01 10:34:28.958612	T
83cpmmu7s2wo1wauz405o9pq0njvbsqw	.eJxVjMsOwiAQRf-FtSEMUB4u3fsNBIZBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzMgJ1-txTxQW0H-R7brXPsbV3mxHeFH3Twa8_0vBzu30GNo37riOCl19mBSlaQh2SMI0TrtAbSxaASGgQ5ZZJTThY1SUOmJFII1k_s_QHLBTci:1oQVnS:C_OfNPdBQBufhwqSJobP2WcmW2Ga5pxuCn4zEkp28TQ	2022-09-06 15:26:30.03141	T
r9twccsao1ff4e5tb2nug7sdpp9uqt00	.eJxVjMsOwiAQRf-FtSEMUB4u3fsNBIZBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzMgJ1-txTxQW0H-R7brXPsbV3mxHeFH3Twa8_0vBzu30GNo37riOCl19mBSlaQh2SMI0TrtAbSxaASGgQ5ZZJTThY1SUOmJFII1k_s_QHLBTci:1oWI5x:0_Qa5_NKsYz9jIIXMS6pPHazgkPvkmiKOlktqgbsBrE	2022-09-22 14:01:29.66482	T
99n4sebdvymm26mli1sipc7azptdhecc	.eJxVjMsOwiAQRf-FtSEMUB4u3fsNBIZBqgaS0q6M_65NutDtPefcFwtxW2vYBi1hzuzMgJ1-txTxQW0H-R7brXPsbV3mxHeFH3Twa8_0vBzu30GNo37riOCl19mBSlaQh2SMI0TrtAbSxaASGgQ5ZZJTThY1SUOmJFII1k_s_QHLBTci:1ocurL:J7RjsND-xxtKobuTUrqffMMX5KAXcrADg5_8nKoUyhY	2022-10-10 20:37:47.871107	T
\.


--
-- Data for Name: medicaments_bonlivraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_bonlivraison (id, fournisseur, num, quantite, date_livraison, observation, commande_id, user_id, date_exp, trial107) FROM stdin;
\.


--
-- Data for Name: medicaments_categorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_categorie (id, nom, trial110) FROM stdin;
1	Consommables	T
2	Médicament	T
3	Médicaments IO	T
4	réactifs CV	T
5	Tests rapides	T
\.


--
-- Data for Name: medicaments_cbonlivraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_cbonlivraison (bonlivraison_ptr_id, province_id, trial110) FROM stdin;
\.


--
-- Data for Name: medicaments_cbonsortie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_cbonsortie (bonsortie_ptr_id, province_id, trial113) FROM stdin;
\.


--
-- Data for Name: medicaments_commande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_commande (id, prix_unitaire, date_exp, partenaire_id, date_livraison, observation, produit_commande_id, quantite_commande, lot_commande, trial117) FROM stdin;
22	200000	2023-05-25	2	2022-09-08	commande 3	68	25558	lot3	T
24	20000	2023-05-26	2	2022-08-30	\N	71	392	lot1	T
25	10000	2023-05-25	4	2022-09-08	\N	91	30	lot1	T
26	20000	2023-09-30	1	2022-09-08	\N	68	42	lot2	T
\.


--
-- Data for Name: medicaments_consmoy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_consmoy (id, annee, value, produit_id, trial117) FROM stdin;
1	2022	32020	68	T
2	2022	16163	71	T
\.


--
-- Data for Name: medicaments_cvbonlivraison; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_cvbonlivraison (bonlivraison_ptr_id, site_id, trial120) FROM stdin;
\.


--
-- Data for Name: medicaments_cvbonsortie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_cvbonsortie (bonsortie_ptr_id, site_id, trial123) FROM stdin;
\.


--
-- Data for Name: medicaments_distrmoy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_distrmoy (id, annee, value, produit_id, trial127) FROM stdin;
1	2022	38808	68	T
\.


--
-- Data for Name: medicaments_etatcommande; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_etatcommande (id, etat, trial130) FROM stdin;
1	En Cours	T
2	Livraison partielle	T
3	Livraison totale	T
4	Annulee	T
\.


--
-- Data for Name: medicaments_inventairesage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_inventairesage (id, lot, quantite_sage, mois, annee, produit_inventaire_id, prix_unitaire_sage, date_exp, trial130) FROM stdin;
1	lot 1	2184	07	2022	68	20000	2022-09-29	T
2	lot 2	2443	07	2022	68	30000	2024-06-28	T
4	lot1	1968	07	2022	71	20000	2023-04-28	T
5	lot 2	13000	07	2022	71	15000	2022-09-21	T
6	lot 3	30000	07	2022	70	10000	2023-05-25	T
\.


--
-- Data for Name: medicaments_partenaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_partenaire (id, nom, trial133) FROM stdin;
1	ETAT	T
2	UNDP	T
3	CHEMONICS	T
4	UNICEF	T
5	AUTRES	T
\.


--
-- Data for Name: medicaments_produit; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_produit (id, designation, categorie_id, programme_id, num_ref, dashbord, taille_paquet, trial136) FROM stdin;
1	Eau pour biologie mol‚culaire 50ml	1	1	\N	0	1	T
2	Ethanol Absolue 99.8%, Fl/1L	1	1	\N	0	1	T
3	Ethanol Absolue 99.5%, Fl/500ML	1	1	\N	0	1	T
4	Ethanol 99.8%, fl/2.5L	1	1	\N	0	1	T
5	Abbot m2000 sp 5ml  reaction vessels 	1	1	\N	0	1	T
6	Abbot mSample preparation System DNA, B/96tests	1	1	\N	0	1	T
7	Abbot RealTime HIV-1 Qualitative control, kit 2*12 vial	1	1	\N	0	1	T
8	Abbot m2000 pipette tips 200l black,24*96pce 	1	1	\N	0	1	T
9	Abbot RealTime HIV-1 calibrator kit 	1	1	\N	0	1	T
10	Abbot m2000 pipette tips 1ml l black,24*96pce 	1	1	\N	0	1	T
11	Abbot Optical adhesive covers, B/100pieces	1	1	\N	0	1	T
12	Abbot master MixTube ,Carton de 150pieces	1	1	\N	0	1	T
13	Abbot RealTime HIV-1Control, kit 3*8 vial	1	1	\N	0	1	T
14	Abbott 200ml Reagent Vessel, carton/90	1	1	\N	0	1	T
15	Abbot 96-well optical reaction plates, B/20pieces	1	1	\N	0	1	T
16	Blood Collection tubes,Plain,4,5ml,round botton, with stopper 13x75mm	1	1	\N	0	1	T
17	Centrifugeuse manuelle, unit‚	1	1	\N	0	1	T
18	Chronometre de laboratoire digital unit‚	1	1	\N	0	1	T
19	Combitips adv sterile biopure 10ml	1	1	\N	0	1	T
20	Corps Vacutainer (Corps de pr‚levement … usage unique) pack/250	1	1	\N	0	1	T
21	Cryoboite pour 81 tubes de 3 …5ml, pce	1	1	\N	0	1	T
22	Cryotube 2ml, Bte de 100pieces	1	1	\N	0	1	T
23	DBS Collection Kit, 20tests	1	1	\N	0	1	T
24	Embout filtre sterile 20µl,B/96	1	1	\N	0	1	T
25	Embout filtre  sterile 1000µl,B/96	1	1	\N	0	1	T
26	Embout bleu 50-1000µl, sachet de 1000	1	1	\N	0	1	T
27	Embout filtre sterile 10µL,B/96	1	1	\N	0	1	T
28	Embout filtre sterile 200µL, B/96	1	1	\N	0	1	T
29	Embout filtre 5-300µl, B/96	1	1	\N	0	1	T
30	Fast Optical 96well reaction plate with barcode0.1ml	1	1	\N	0	1	T
31	Flacon compte goutte 50ml+pipette, verre brun, piece	1	1	\N	0	1	T
32	Hemoglobinometre de Sahli , piece	1	1	\N	0	1	T
33	Comprim‚ Phosphate Buffered Saline, B/100	1	1	\N	0	1	T
34	Microplaque avec un fond plat de 96 puits ,B/10	1	1	\N	0	1	T
35	Tween 20 Reagent Grade 1L	1	1	\N	0	1	T
36	Microtube 1.5ml, B/500	1	1	\N	0	1	T
37	Portoir de 81 places, bte de 5pieces	1	1	\N	0	1	T
38	Portoir metallique	1	1	\N	0	1	T
39	Tambour, pièce	1	1	\N	0	1	T
40	Tampons alcoolis‚s, B/100	1	1	\N	0	1	T
41	Thermomixer C Basic device W/O block EU	1	1	\N	0	1	T
42	Tourniquet, Latex Free, (garrot), pc	1	1	\N	0	1	T
43	Tube conique (falcon) 5ml, piece 	1	1	\N	0	1	T
44	Test Tube, 10ml, 16x100mm, cylindrical, polypropylene, b/2000pieces	1	1	\N	0	1	T
45	TUBE K3 EDTA 6ML W/LAVENDER CAP,B/100	1	1	\N	0	1	T
46	VACUTEST 9ML CLOT ATT. RED CAP	1	1	\N	0	1	T
47	Tube  conique (falcon) 50ml, piece	1	1	\N	0	1	T
48	Nuclease Free water, bottle/1000ml	1	1	\N	0	1	T
49	Marqueur resistant … l'eau	1	1	\N	0	1	T
50	Sterilisateur a air chaud, pasteur electronique, 15ltr, unit‚	1	1	\N	0	1	T
51	Aiguille de prelevement G19, B/100	1	1	\N	0	1	T
52	Papier imprimante , 112mm*25m, BD FACSCOUNT, B/5	1	1	\N	0	1	T
53	Papier imprimante , partec	1	1	\N	0	1	T
54	Papier Joseph, B/40 pieces	1	1	\N	0	1	T
55	Accumulateur de froid, Unit‚	1	1	\N	0	1	T
56	Bombonnes … Dioxyde d'azote + Dioxyde d'azote	1	1	\N	0	1	T
57	Pipette pasteur  4ml en plastique 	1	1	\N	0	1	T
58	Lugol lodine 125ml5(HIM)	1	1	\N	0	1	T
59	Bonnet chirurgical, u.u., piece	1	1	\N	0	1	T
60	Gant d'examen non sterile , latex, moyen, B/100	1	1	\N	0	1	T
61	Gants sterile n 7.5, B/50 paire	1	1	\N	0	1	T
62	Lunettes de protection, piece	1	1	\N	0	1	T
63	Sachets poubelle petit (Biohazard et autres) 300x500mm, C/500pcs	1	1	\N	0	1	T
64	Coton hydrophile non sterile, rouleau, 500gr	1	1	\N	0	1	T
65	Boite de securit‚ 5L, piece	1	1	\N	0	1	T
66	LAMPE GYNECOLOGIQUE	1	1	\N	0	1	T
67	Manodétenteurs pour 2 bombonnes	1	1	\N	0	1	T
68	Abacavir /Lamivudine 600/300mg ces, B/30	2	1	al	1	1	T
70	Abacavir/Lamivudine 120/60mg, ces  dipersibles B/30	2	1	\N	0	1	T
71	Abacavir/Lamivudine 120/60mg ces dipersibles B/60	2	1	ab	1	1	T
72	Atazavir/Ritonavir 300mg/100mg. ces, B/30	2	1	\N	0	1	T
73	Darunavir 600mg, ces,  B/60	2	1	\N	0	1	T
74	Dolutegravir 50mg, ces, B/30	2	1	\N	0	1	T
75	Dolutegravir 50mg/Lamivudine 300mg/Tenofovir300mg ces, B/30	2	1	\N	0	1	T
76	Dolutegravir 50mg/Lamivudine 300mg/Tenofovir300mg ces, B/90	2	1	\N	0	1	T
77	Dolutegravir 10mg, c‚s,B/90	2	1	\N	0	1	T
78	Efavirenz 600mg, ces, B/30	2	1	\N	0	1	T
79	Etravirine, 100mg, ces, B/120	2	1	\N	0	1	T
80	Lamivudine/Tenofovir 300mg/300mg, ces, B/30	2	1	\N	0	1	T
81	Lamivudine/Zidovudine 150/300mg, ces, B/60	2	1	\N	0	1	T
82	Lamivudine/Zidovudine 30/60mg, ces, B/60	2	1	\N	0	1	T
83	Lopinavir/Ritonavir 200mg/50 mg, ces, B/120	2	1	\N	0	1	T
84	Lopinavir/Ritonavir 100mg/25 mg, ces, B/60	2	1	\N	0	1	T
85	Nevirapine 200mg, ces, B/60	2	1	\N	0	1	T
86	Ritonavir 100mg, ces, B/60	2	1	\N	0	1	T
87	T‚nofovir 300mg c‚, B/30c‚s	2	1	\N	0	1	T
88	Zidovudine 50mg/5ml, suspension buvable, flacon/240 ml	2	1	\N	0	1	T
89	Cartouche GeneXpert HIV-1, QUAL (PCR) Kit/10 Test	2	1	\N	0	1	T
90	Cotrimoxazole 120mg, ces B/1000	3	1	\N	0	1	T
91	Erythromycin 125mg/5ml , suspension buvable, Fl/100ml	3	1	\N	0	1	T
92	Pyridoxine 50mg, Bte/1000 c‚s	3	1	\N	0	1	T
93	GXT  NA  Extraction Kit, 96 Tests	4	1	\N	0	1	T
94	Abbot RT HIV-1 Qualitative amplification Reagent	4	1	\N	0	1	T
95	Cartouche Genexpert HIV-1 Charge Virale, Kit /10test	4	1	\N	0	1	T
96	Generic  HIV Charge Virale, kit de 440 Tests	4	1	\N	0	1	T
97	Prot‚inase K recombinant,100mg, poudre	4	1	\N	0	1	T
98	Prot‚inase K recombinant, Solution de 1 ml	4	1	\N	0	1	T
99	HIV 1+2, Determine Complete, Kit/100 Tests	5	1	\N	0	1	T
100	HIV/Syphillis Duo, B/25tst	5	1	\N	0	1	T
101	OraQuick HIV 1/2 ,Kit/25 tests	5	1	\N	0	1	T
102	HIV-1/2 Test Rapid	5	1	\N	0	1	T
103	ONE STEP Anti HIV (1&2), kit/40tests	5	1	\N	0	1	T
\.


--
-- Data for Name: medicaments_programme; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_programme (id, nom, trial140) FROM stdin;
1	VIH	T
2	TB	T
3	Malaria	T
\.


--
-- Data for Name: medicaments_province; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_province (id, nom, trial143) FROM stdin;
1	Bubanza	T
2	Bujumbura Mairie	T
3	Bujumbura rural	T
4	Bururi	T
5	Cankuzo	T
6	Cibitoke	T
7	Gitega	T
8	Karusi	T
9	Kayanza	T
10	Kirundo	T
11	Makamba	T
12	Muramvya	T
13	Muyinga	T
14	Mwaro	T
15	Ngozi	T
16	Rumonge	T
17	Ruyigi	T
18	Rutana	T
\.


--
-- Data for Name: medicaments_site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_site (id, nom, trial143) FROM stdin;
1	ANSS	T
2	Muyinga	T
3	Gitega	T
4	CHUK	T
\.


--
-- Data for Name: medicaments_sortie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicaments_sortie (id, quantite_sortie, date_sortie, observation_sortie, produit_sortie_id, lot_sortie, trial146) FROM stdin;
3	10	2022-10-07	\N	68	\N	T
4	10	2022-10-07	swfsdfsd	68	\N	T
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 51, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 33, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 61, true);


--
-- Name: medicaments_bonlivraison_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_bonlivraison_id_seq', 1, false);


--
-- Name: medicaments_categorie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_categorie_id_seq', 5, true);


--
-- Name: medicaments_commande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_commande_id_seq', 26, true);


--
-- Name: medicaments_consmoy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_consmoy_id_seq', 2, true);


--
-- Name: medicaments_distrmoy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_distrmoy_id_seq', 1, true);


--
-- Name: medicaments_etatcommande_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_etatcommande_id_seq', 4, true);


--
-- Name: medicaments_inventairesage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_inventairesage_id_seq', 6, true);


--
-- Name: medicaments_partenaire_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_partenaire_id_seq', 5, true);


--
-- Name: medicaments_produit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_produit_id_seq', 103, true);


--
-- Name: medicaments_programme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_programme_id_seq', 3, true);


--
-- Name: medicaments_province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_province_id_seq', 18, true);


--
-- Name: medicaments_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_site_id_seq', 4, true);


--
-- Name: medicaments_sortie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicaments_sortie_id_seq', 4, true);


--
-- Name: auth_group pk_auth_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT pk_auth_group PRIMARY KEY (id);


--
-- Name: auth_group_permissions pk_auth_group_permissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT pk_auth_group_permissions PRIMARY KEY (id);


--
-- Name: auth_permission pk_auth_permission; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT pk_auth_permission PRIMARY KEY (id);


--
-- Name: auth_user pk_auth_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT pk_auth_user PRIMARY KEY (id);


--
-- Name: auth_user_groups pk_auth_user_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT pk_auth_user_groups PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions pk_auth_user_user_permissions; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT pk_auth_user_user_permissions PRIMARY KEY (id);


--
-- Name: django_admin_log pk_django_admin_log; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT pk_django_admin_log PRIMARY KEY (id);


--
-- Name: django_content_type pk_django_content_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT pk_django_content_type PRIMARY KEY (id);


--
-- Name: django_migrations pk_django_migrations; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT pk_django_migrations PRIMARY KEY (id);


--
-- Name: django_session pk_django_session; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT pk_django_session PRIMARY KEY (session_key);


--
-- Name: medicaments_bonlivraison pk_medicaments_bonlivraison; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_bonlivraison
    ADD CONSTRAINT pk_medicaments_bonlivraison PRIMARY KEY (id);


--
-- Name: medicaments_categorie pk_medicaments_categorie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_categorie
    ADD CONSTRAINT pk_medicaments_categorie PRIMARY KEY (id);


--
-- Name: medicaments_cbonlivraison pk_medicaments_cbonlivraison; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_cbonlivraison
    ADD CONSTRAINT pk_medicaments_cbonlivraison PRIMARY KEY (bonlivraison_ptr_id);


--
-- Name: medicaments_cbonsortie pk_medicaments_cbonsortie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_cbonsortie
    ADD CONSTRAINT pk_medicaments_cbonsortie PRIMARY KEY (bonsortie_ptr_id);


--
-- Name: medicaments_commande pk_medicaments_commande; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_commande
    ADD CONSTRAINT pk_medicaments_commande PRIMARY KEY (id);


--
-- Name: medicaments_consmoy pk_medicaments_consmoy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_consmoy
    ADD CONSTRAINT pk_medicaments_consmoy PRIMARY KEY (id);


--
-- Name: medicaments_cvbonlivraison pk_medicaments_cvbonlivraison; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_cvbonlivraison
    ADD CONSTRAINT pk_medicaments_cvbonlivraison PRIMARY KEY (bonlivraison_ptr_id);


--
-- Name: medicaments_cvbonsortie pk_medicaments_cvbonsortie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_cvbonsortie
    ADD CONSTRAINT pk_medicaments_cvbonsortie PRIMARY KEY (bonsortie_ptr_id);


--
-- Name: medicaments_distrmoy pk_medicaments_distrmoy; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_distrmoy
    ADD CONSTRAINT pk_medicaments_distrmoy PRIMARY KEY (id);


--
-- Name: medicaments_etatcommande pk_medicaments_etatcommande; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_etatcommande
    ADD CONSTRAINT pk_medicaments_etatcommande PRIMARY KEY (id);


--
-- Name: medicaments_inventairesage pk_medicaments_inventairesage; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_inventairesage
    ADD CONSTRAINT pk_medicaments_inventairesage PRIMARY KEY (id);


--
-- Name: medicaments_partenaire pk_medicaments_partenaire; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_partenaire
    ADD CONSTRAINT pk_medicaments_partenaire PRIMARY KEY (id);


--
-- Name: medicaments_produit pk_medicaments_produit; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_produit
    ADD CONSTRAINT pk_medicaments_produit PRIMARY KEY (id);


--
-- Name: medicaments_programme pk_medicaments_programme; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_programme
    ADD CONSTRAINT pk_medicaments_programme PRIMARY KEY (id);


--
-- Name: medicaments_province pk_medicaments_province; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_province
    ADD CONSTRAINT pk_medicaments_province PRIMARY KEY (id);


--
-- Name: medicaments_site pk_medicaments_site; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_site
    ADD CONSTRAINT pk_medicaments_site PRIMARY KEY (id);


--
-- Name: medicaments_sortie pk_medicaments_sortie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicaments_sortie
    ADD CONSTRAINT pk_medicaments_sortie PRIMARY KEY (id);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_group_permissions_group_id_permission_id_0cd325b0_uniq ON public.auth_group_permissions USING btree (group_id, permission_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_permission_content_type_id_codename_01ab375a_uniq ON public.auth_permission USING btree (content_type_id, codename);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_groups_user_id_group_id_94350c0c_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_user_groups_user_id_group_id_94350c0c_uniq ON public.auth_user_groups USING btree (user_id, group_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX auth_user_user_permissions_user_id_permission_id_14a6b632_uniq ON public.auth_user_user_permissions USING btree (user_id, permission_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX django_content_type_app_label_model_76bd3d3b_uniq ON public.django_content_type USING btree (app_label, model);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: idx_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_name ON public.auth_group USING btree (name);


--
-- Name: idx_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_username ON public.auth_user USING btree (username);


--
-- Name: medicaments_cbonlivraison_province_id_3fd13f0d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_cbonlivraison_province_id_3fd13f0d ON public.medicaments_cbonlivraison USING btree (province_id);


--
-- Name: medicaments_cbonsortie_province_id_de81f673; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_cbonsortie_province_id_de81f673 ON public.medicaments_cbonsortie USING btree (province_id);


--
-- Name: medicaments_commande_produit_commande_id_67fe0493; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_commande_produit_commande_id_67fe0493 ON public.medicaments_commande USING btree (produit_commande_id);


--
-- Name: medicaments_consmoy_produit_id_1f403c02; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_consmoy_produit_id_1f403c02 ON public.medicaments_consmoy USING btree (produit_id);


--
-- Name: medicaments_cvbonlivraison_site_id_5ef1f6c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_cvbonlivraison_site_id_5ef1f6c7 ON public.medicaments_cvbonlivraison USING btree (site_id);


--
-- Name: medicaments_cvbonsortie_site_id_d7516fc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_cvbonsortie_site_id_d7516fc2 ON public.medicaments_cvbonsortie USING btree (site_id);


--
-- Name: medicaments_distrmoy_produit_id_59121be2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_distrmoy_produit_id_59121be2 ON public.medicaments_distrmoy USING btree (produit_id);


--
-- Name: medicaments_inventairesage_produit_id_6bc4e753; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_inventairesage_produit_id_6bc4e753 ON public.medicaments_inventairesage USING btree (produit_inventaire_id);


--
-- Name: medicaments_lot_partenaire_id_ddb5ed87; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_lot_partenaire_id_ddb5ed87 ON public.medicaments_commande USING btree (partenaire_id);


--
-- Name: medicaments_produit_categorie_id_9cff14c7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_produit_categorie_id_9cff14c7 ON public.medicaments_produit USING btree (categorie_id);


--
-- Name: medicaments_sortie_produit_sortie_id_022d808a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX medicaments_sortie_produit_sortie_id_022d808a ON public.medicaments_sortie USING btree (produit_sortie_id);


--
-- PostgreSQL database dump complete
--

