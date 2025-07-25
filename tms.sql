PGDMP  7                    }            DemoProject    16.3    16.3 Y    b           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            c           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            d           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            e           1262    263171    DemoProject    DATABASE     �   CREATE DATABASE "DemoProject" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "DemoProject";
                postgres    false            �            1255    287800 6   addcategory(character varying, text, boolean, integer) 	   PROCEDURE     l  CREATE PROCEDURE public.addcategory(IN name character varying, IN description text, IN active boolean, IN createdby integer, OUT new_id integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    INSERT INTO category (name, description, active, createdby)
    VALUES (name, description, active, createdby)
    RETURNING Id INTO new_id;  -- Capture the generated Id
END;
$$;
 �   DROP PROCEDURE public.addcategory(IN name character varying, IN description text, IN active boolean, IN createdby integer, OUT new_id integer);
       public          postgres    false            �            1255    295997    deletecategory(integer) 	   PROCEDURE     �  CREATE PROCEDURE public.deletecategory(IN p_categoryid integer, OUT rows_updated integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE category
    SET 
        isdeleted = TRUE,
        modifiedat = NOW()
    WHERE id = p_categoryid;

    GET DIAGNOSTICS rows_updated = ROW_COUNT;

    IF rows_updated = 0 THEN
        RAISE NOTICE 'No category found with ID %', p_categoryid;
    END IF;
END;
$$;
 Y   DROP PROCEDURE public.deletecategory(IN p_categoryid integer, OUT rows_updated integer);
       public          postgres    false            �            1255    287808    getallcategories()    FUNCTION     z  CREATE FUNCTION public.getallcategories() RETURNS TABLE(id integer, name character varying, description text, active boolean, isdeleted boolean, createdby integer, createdat timestamp without time zone, modifiedby integer, modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT 
        category.id,
        category.name,
        category.description,
        category.active,
        category.isdeleted,
        category.createdby,
        category.createdat,
        category.modifiedby,
        category.modifiedat
    FROM category
    WHERE category.isdeleted = FALSE;
END;
$$;
 )   DROP FUNCTION public.getallcategories();
       public          postgres    false            �            1255    287807    getcategory(integer)    FUNCTION     _  CREATE FUNCTION public.getcategory(p_categoryid integer) RETURNS TABLE(id integer, name character varying, description text, active boolean, isdeleted boolean, createdby integer, createdat timestamp without time zone, modifiedby integer, modifiedat timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT category.id, category.name, category.description, category.active, category.isdeleted, category.createdby, category.createdat, category.modifiedby, category.modifiedat
    FROM category
    WHERE category.id = p_CategoryId AND category.isdeleted = FALSE;
END;
$$;
 8   DROP FUNCTION public.getcategory(p_categoryid integer);
       public          postgres    false            �            1255    304187 9   updatecategory(integer, character varying, text, boolean) 	   PROCEDURE     c  CREATE PROCEDURE public.updatecategory(IN p_id integer, IN p_name character varying, IN p_description text, IN p_active boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE category c
    SET 
        name = p_name,
        description = p_description,
        active = p_active,
        modifiedat = CURRENT_TIMESTAMP
    WHERE c.id = p_id;
END;
$$;
 �   DROP PROCEDURE public.updatecategory(IN p_id integer, IN p_name character varying, IN p_description text, IN p_active boolean);
       public          postgres    false            �            1259    312389 	   AuditLogs    TABLE     �   CREATE TABLE public."AuditLogs" (
    "Id" integer NOT NULL,
    "ExceptionType" text,
    "Message" text,
    "StackTrace" text,
    "Time" timestamp without time zone,
    "CurrentIP" text,
    "Hostname" text,
    "Level" text,
    "Url" text
);
    DROP TABLE public."AuditLogs";
       public         heap    postgres    false            �            1259    312380    UserActivityLogs    TABLE     �   CREATE TABLE public."UserActivityLogs" (
    "Id" integer NOT NULL,
    "UserId" text,
    "Action" text,
    "Description" text,
    "Time" timestamp without time zone,
    "Url" text
);
 &   DROP TABLE public."UserActivityLogs";
       public         heap    postgres    false            �            1259    320618    address    TABLE     �  CREATE TABLE public.address (
    id integer NOT NULL,
    street text,
    zipcode character varying(30),
    countryid integer,
    stateid integer,
    cityid integer,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    320617    address_id_seq    SEQUENCE     �   CREATE SEQUENCE public.address_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.address_id_seq;
       public          postgres    false    234            f           0    0    address_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.address_id_seq OWNED BY public.address.id;
          public          postgres    false    233            �            1259    312388    auditlogs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auditlogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auditlogs_id_seq;
       public          postgres    false    226            g           0    0    auditlogs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.auditlogs_id_seq OWNED BY public."AuditLogs"."Id";
          public          postgres    false    225            �            1259    287769    category    TABLE     x  CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    description text,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer,
    modifiedat timestamp without time zone
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    287768    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    222            h           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    221            �            1259    320604    city    TABLE     �  CREATE TABLE public.city (
    id integer NOT NULL,
    stateid integer,
    name character varying(100) NOT NULL,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.city;
       public         heap    postgres    false            �            1259    320603    city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.city_id_seq;
       public          postgres    false    232            i           0    0    city_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.city_id_seq OWNED BY public.city.id;
          public          postgres    false    231            �            1259    320581    country    TABLE     �  CREATE TABLE public.country (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(20) NOT NULL,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer,
    createdat timestamp with time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    320580    country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.country_id_seq;
       public          postgres    false    228            j           0    0    country_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.country_id_seq OWNED BY public.country.id;
          public          postgres    false    227            �            1259    287748    roles    TABLE     9  CREATE TABLE public.roles (
    roleid integer NOT NULL,
    name character varying(100) NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    isdeleted boolean DEFAULT false
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    287747    roles_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_roleid_seq;
       public          postgres    false    220            k           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
          public          postgres    false    219            �            1259    320590    state    TABLE     �  CREATE TABLE public.state (
    id integer NOT NULL,
    countryid integer,
    name character varying(100) NOT NULL,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.state;
       public         heap    postgres    false            �            1259    320589    state_id_seq    SEQUENCE     �   CREATE SEQUENCE public.state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.state_id_seq;
       public          postgres    false    230            l           0    0    state_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.state_id_seq OWNED BY public.state.id;
          public          postgres    false    229            �            1259    271366    taskitem    TABLE     �  CREATE TABLE public.taskitem (
    id integer NOT NULL,
    category character varying(100),
    title character varying(20) NOT NULL,
    description character varying(250) NOT NULL,
    duedate timestamp with time zone,
    iscompleted boolean DEFAULT false NOT NULL,
    priority integer,
    isdeleted boolean DEFAULT false NOT NULL,
    createdby integer,
    createdat timestamp with time zone DEFAULT now() NOT NULL,
    modifiedby integer,
    modifiedat timestamp with time zone
);
    DROP TABLE public.taskitem;
       public         heap    postgres    false            �            1259    271365    taskitem_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taskitem_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.taskitem_id_seq;
       public          postgres    false    218            m           0    0    taskitem_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.taskitem_id_seq OWNED BY public.taskitem.id;
          public          postgres    false    217            �            1259    263182    user    TABLE     �  CREATE TABLE public."user" (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    name character varying(50),
    passwordhash text,
    createdby integer,
    createdat timestamp with time zone DEFAULT now(),
    modifiedby integer,
    modifiedat timestamp with time zone,
    isdeleted boolean DEFAULT false,
    roleid integer,
    addressid integer DEFAULT 0
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    312379    useractivitylogs_id_seq    SEQUENCE     �   CREATE SEQUENCE public.useractivitylogs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.useractivitylogs_id_seq;
       public          postgres    false    224            n           0    0    useractivitylogs_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.useractivitylogs_id_seq OWNED BY public."UserActivityLogs"."Id";
          public          postgres    false    223            �            1259    263181    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            o           0    0    users_id_seq    SEQUENCE OWNED BY     >   ALTER SEQUENCE public.users_id_seq OWNED BY public."user".id;
          public          postgres    false    215            �           2604    312392    AuditLogs Id    DEFAULT     p   ALTER TABLE ONLY public."AuditLogs" ALTER COLUMN "Id" SET DEFAULT nextval('public.auditlogs_id_seq'::regclass);
 ?   ALTER TABLE public."AuditLogs" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    312383    UserActivityLogs Id    DEFAULT     ~   ALTER TABLE ONLY public."UserActivityLogs" ALTER COLUMN "Id" SET DEFAULT nextval('public.useractivitylogs_id_seq'::regclass);
 F   ALTER TABLE public."UserActivityLogs" ALTER COLUMN "Id" DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    320621 
   address id    DEFAULT     h   ALTER TABLE ONLY public.address ALTER COLUMN id SET DEFAULT nextval('public.address_id_seq'::regclass);
 9   ALTER TABLE public.address ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    233    234    234            �           2604    287772    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            �           2604    320607    city id    DEFAULT     b   ALTER TABLE ONLY public.city ALTER COLUMN id SET DEFAULT nextval('public.city_id_seq'::regclass);
 6   ALTER TABLE public.city ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    231    232            �           2604    320584 
   country id    DEFAULT     h   ALTER TABLE ONLY public.country ALTER COLUMN id SET DEFAULT nextval('public.country_id_seq'::regclass);
 9   ALTER TABLE public.country ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    287751    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    320593    state id    DEFAULT     d   ALTER TABLE ONLY public.state ALTER COLUMN id SET DEFAULT nextval('public.state_id_seq'::regclass);
 7   ALTER TABLE public.state ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    271369    taskitem id    DEFAULT     j   ALTER TABLE ONLY public.taskitem ALTER COLUMN id SET DEFAULT nextval('public.taskitem_id_seq'::regclass);
 :   ALTER TABLE public.taskitem ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    263185    user id    DEFAULT     e   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            W          0    312389 	   AuditLogs 
   TABLE DATA           �   COPY public."AuditLogs" ("Id", "ExceptionType", "Message", "StackTrace", "Time", "CurrentIP", "Hostname", "Level", "Url") FROM stdin;
    public          postgres    false    226   �u       U          0    312380    UserActivityLogs 
   TABLE DATA           d   COPY public."UserActivityLogs" ("Id", "UserId", "Action", "Description", "Time", "Url") FROM stdin;
    public          postgres    false    224   y�       _          0    320618    address 
   TABLE DATA           �   COPY public.address (id, street, zipcode, countryid, stateid, cityid, isdeleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    234   ��       S          0    287769    category 
   TABLE DATA           z   COPY public.category (id, name, active, description, isdeleted, createdby, createdat, modifiedby, modifiedat) FROM stdin;
    public          postgres    false    222   �       ]          0    320604    city 
   TABLE DATA           �   COPY public.city (id, stateid, name, isdeleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    232   ��       Y          0    320581    country 
   TABLE DATA           �   COPY public.country (id, name, code, isdeleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    228   �       Q          0    287748    roles 
   TABLE DATA           f   COPY public.roles (roleid, name, createdby, createdat, modifiedby, modifiedat, isdeleted) FROM stdin;
    public          postgres    false    220   ��       [          0    320590    state 
   TABLE DATA           �   COPY public.state (id, countryid, name, isdeleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    230   ��       O          0    271366    taskitem 
   TABLE DATA           �   COPY public.taskitem (id, category, title, description, duedate, iscompleted, priority, isdeleted, createdby, createdat, modifiedby, modifiedat) FROM stdin;
    public          postgres    false    218   \�       M          0    263182    user 
   TABLE DATA           �   COPY public."user" (id, email, name, passwordhash, createdby, createdat, modifiedby, modifiedat, isdeleted, roleid, addressid) FROM stdin;
    public          postgres    false    216   ��       p           0    0    address_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.address_id_seq', 4, true);
          public          postgres    false    233            q           0    0    auditlogs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auditlogs_id_seq', 153, true);
          public          postgres    false    225            r           0    0    category_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.category_id_seq', 14, true);
          public          postgres    false    221            s           0    0    city_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.city_id_seq', 1, true);
          public          postgres    false    231            t           0    0    country_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.country_id_seq', 3, true);
          public          postgres    false    227            u           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 3, true);
          public          postgres    false    219            v           0    0    state_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.state_id_seq', 2, true);
          public          postgres    false    229            w           0    0    taskitem_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.taskitem_id_seq', 8, true);
          public          postgres    false    217            x           0    0    useractivitylogs_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.useractivitylogs_id_seq', 1671, true);
          public          postgres    false    223            y           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 19, true);
          public          postgres    false    215            �           2606    320627    address address_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    234            �           2606    312396    AuditLogs auditlogs_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."AuditLogs"
    ADD CONSTRAINT auditlogs_pkey PRIMARY KEY ("Id");
 D   ALTER TABLE ONLY public."AuditLogs" DROP CONSTRAINT auditlogs_pkey;
       public            postgres    false    226            �           2606    287779    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    222            �           2606    320611    city city_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.city DROP CONSTRAINT city_pkey;
       public            postgres    false    232            �           2606    320588    country country_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    228            �           2606    287755    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    220            �           2606    320597    state state_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.state DROP CONSTRAINT state_pkey;
       public            postgres    false    230            �           2606    271374    taskitem taskitem_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.taskitem
    ADD CONSTRAINT taskitem_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.taskitem DROP CONSTRAINT taskitem_pkey;
       public            postgres    false    218            �           2606    312387 &   UserActivityLogs useractivitylogs_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."UserActivityLogs"
    ADD CONSTRAINT useractivitylogs_pkey PRIMARY KEY ("Id");
 R   ALTER TABLE ONLY public."UserActivityLogs" DROP CONSTRAINT useractivitylogs_pkey;
       public            postgres    false    224            �           2606    263191    user users_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY public."user" DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    320643    address address_cityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.city(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.address DROP CONSTRAINT address_cityid_fkey;
       public          postgres    false    4784    234    232            �           2606    320633    address address_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.country(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.address DROP CONSTRAINT address_countryid_fkey;
       public          postgres    false    4780    228    234            �           2606    320638    address address_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.state(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_stateid_fkey;
       public          postgres    false    234    4782    230            �           2606    320612    city city_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.city
    ADD CONSTRAINT city_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.state(id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.city DROP CONSTRAINT city_stateid_fkey;
       public          postgres    false    232    4782    230            �           2606    320677    city fk_city_createdby_user    FK CONSTRAINT     }   ALTER TABLE ONLY public.city
    ADD CONSTRAINT fk_city_createdby_user FOREIGN KEY (createdby) REFERENCES public."user"(id);
 E   ALTER TABLE ONLY public.city DROP CONSTRAINT fk_city_createdby_user;
       public          postgres    false    4768    232    216            �           2606    320667 !   country fk_country_createdby_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.country
    ADD CONSTRAINT fk_country_createdby_user FOREIGN KEY (createdby) REFERENCES public."user"(id);
 K   ALTER TABLE ONLY public.country DROP CONSTRAINT fk_country_createdby_user;
       public          postgres    false    4768    216    228            �           2606    320692    state fk_state_createdby_user    FK CONSTRAINT        ALTER TABLE ONLY public.state
    ADD CONSTRAINT fk_state_createdby_user FOREIGN KEY (createdby) REFERENCES public."user"(id);
 G   ALTER TABLE ONLY public.state DROP CONSTRAINT fk_state_createdby_user;
       public          postgres    false    216    4768    230            �           2606    320661    user fk_users_address    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT fk_users_address FOREIGN KEY (addressid) REFERENCES public.address(id) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public."user" DROP CONSTRAINT fk_users_address;
       public          postgres    false    216    234    4786            �           2606    320598    state state_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.state
    ADD CONSTRAINT state_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.country(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.state DROP CONSTRAINT state_countryid_fkey;
       public          postgres    false    230    228    4780            �           2606    287756    user users_roleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid) NOT VALID;
 B   ALTER TABLE ONLY public."user" DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    216    4772    220            W      x��}ms۶��g�W�S��8��Ӟg\+i=w줱��!���l�"U����?��(���BG���NL�"�xY\�.���_�����{�ǩ�{/�8���k?��7���*�z���p��7~z��(��*'� ���2U_�)$�������GQ�U�Y�-��<>����?�DG�h��_�tp����&)?L��A��-��x�Q�| ��Ayy�y��G��gO�S~�W�8Ly9��@R�(��E8�ػ�4- O{w�>���+~{�ϠS��R(͉zW<Vϼ.��%x�')���4�yr�_�A��S%��(�FQ��P�b 8��������dU�O�W�_A��o�$�����@�(����_=Kc���n���?�
rp��'� �ؓ��D��I8�S�1t"�%���wYy���m���ǔ��ޯ���=��_�?��N�����F�z�e2���J�����B����0I��p���C?JC�*����c��HyG�͇��W>L3��aV�A�~�J��F�g���������2[5�,k��i��>�{~��p��/=@š�e�dU��OJ��K�������o<�$Ч�_��7_?B�7�������w_�>�G<����2��������k�Z���L���3� *����R�{��%�b�P��F��IC)%��L������^s%δ.Q�K�S����N��0��NI�(�<��S��A&5����� 1�������'�/a���էO��WQx���'�7�V�QuX��@�{��6�}y�� -���^����g��QZҗd��O���ob>�!�(�h�GA�'�=#D�)T��zs"N�J&#���C�3ͻq1j��{���ލ�t�_�k�]ȹ1�y9�.��ѿ@�*O��)ҽ����1�*���'+�b���S/�ht�W����T������1�8�S����g�W��K$Z��'�ab�M�t�siYV"��<L(����E�E�x�?���_�1�d��V��#~G���E%�7.f�YRW�O�윩t�����8m)[�����M��\>|(���V�S
fU�>���
�GA �\�ZIj�����x巧�
�/2,�յ��w��Oy�������e����A:�����>��u4,��s/����X>�#ȼ�ߓs{̒����W�<��0�(��ρ"��\sr��3^*�X$���x��D�`R�k�.�"�|��(�UyQ����	�zx���C(������(z������*uP�7/u6,f^�A��Ԍ��2�� ����0kͳ ���˶Ɂ�J?G� @|�`	�BS��m���7�{���I�[+�**T:\~�V��5��\��Hu���1F������V�t�Ҙ]P8jB����B՛�m���w:	�����@����b��[y����ȟ�ˋ��6Y����.<�ų���f$^��6%.u\�̶mBg���O��.�G���i1���CUbڪ�Zd���9��u���4�ϟ����~p͠Ͻ���h�}}H�CB��Z��鐨�C�AR-�:��;�a�U��sC�B�B�§
0�p�����}�):��6�j�c�q��^K�4�^H7T��ܬ���j Yg0U��u�٨���j �K��8:�����A��hG��r�!Qю�A;��q���nD��|j�<\H�� =k�������q���
�n�Z��P����/%��Q-]����N	Eg
RG��H[��:$*R���@ֱ��Wzw�q5
ER�iֆ\�!�@��\�F �C�"��u�Q���s�G����ĶBb�q�C�"$� $v`����-?s��x�n�"u��иG&�L�2d2O���o ���l�h��ہ�j0(�M�f�`� A��\�F �C�"�x\C�,5��l�)N$ $��[�3!q!����
��D��RM5ujm�3���S$��$-F������F���x�Ġ����
�`�:S)�ڦQ�pK(2:dt���@�:$*2�dt� kXdÕ��[B����e��Un	E��\�F �C�"�x\C�,5u��d�=�q���LӍ����5�k��;$*r�'�5$�:��5l\����V`BHl1�tHT������h�`�/�ȉ��8�F�C�[5��=R�2He�� �yJT���M]��F�f.t��u���V`BHl1�tHT����ѭ��ǂGg����2����	�R�T��zw<�]z�N��*���*�.%*a6q6�A�h������a!�rq���^�:u���F��η�j��uyՎ�\ꨔ2�l�)K�C�~=4bЈA#�4b��S�5�i��~=�ĶBb�q�C�"$� $v�}�Z�:�דGg:aRko��Q�\�1�j���em�]z>w��Twu�2��d���&�;����x��p4㓚�� ����;u�%��i�I��_��j�� ���b2�p�Ƨл2�-�U�EP�+��Ó�quU�}�b��߳�5y�n�$s	�Ab��x���eI�~4�����^C�y��� 4ES��;A(�(�Ays�%Y���G���}���B���bAn z�CW?ʝ�����8��h����ׂZ%��]� �?H�>�ၠ����2�x4��ݰ[�ΔXsuM��f+T����).��&Q���9"hH�!��t������ҵ�٢��m6��0�7Bbk�	!��8�!Qw;��m�`��-�&��6Z���H͊�w5����s���Ӧ-��+x|�xRʖ'��z��t�ˇE6Sي|
��U�Z���}Ux��(���V���in ^������}M{�Svr3�!�2���� �@��@���^GC9�t�%�__�gr�-��#qO>,�g^��@�yU��N�1���(�s�H0��5�PG��̝%�X$���x�U�Lr�vZ�R>�B//�u�u2A�o=?��N�������O/�pQ}��\��2�y�3��H��}ɵe$�)d+.��W@j���� �TIĿe��`[��q Dg�`	�BS��m���7�{���8Wxn��UTh/+��
�a�~�����V>�1^��z�� ��[bׂ�Q
7��c���F7��6w����B�Hy�߹\K�� [����7�����$[���Y�n��A�\�%Z[�ֈֈֈ�mk������Alc-���-w�i��.�����8k��O��!Qq� gp֠�-��W]��Gml����~6���KLU#:�6;���{��wc0V�C�/�rwa׊��ڽL��J�I~œMW�?@6���\l�Ҍ.l!/\�����?5�2�oj�}�F���JY%ƽ�9�yD�˧)`���@�`�6��hP) O �Q��({��>�P4?nO��˶By7\�0�K ���Z���<�h�`է��X5�3�����af'	���n�C5C����P��9��eL��i��{Y8��������;0̣���OT�(ɷׄ��V"](�]������ ��!G���_o.�������s˳�����4�����
C�5z��cݺ��:3�K�-�����La���ۢl��"��o��ZN���-~���oW3+�=����~{.�RT�H�H�H�Hݶ�R�n������Z�S�G�dfw�F�9vCu��ov��>�0���ǵ�6��;$*��o�����̕�4�p6�R�Ϝ=�H���#�D-��s����X���N�O�Qf'�^�<V�#+�"a	��;{7����� �^���W�x����i���4{GA� �=P�~PZ��A�@���|x�����	�ʺ����M:#sE�tK54[��ꌙ����;���5�Ǵ��t`Mk{0�F��zL�R{������njT'�Z��x�m<�C)·�����em]w��ZrM�2�X�k4z�'��v����C*������$����ͳ���EkC�M4y��A�M4y2�i�̴7p��h� ����1U'c�/E6X��CWW�{    V*��w�_�y��ˢ�������Q=�M4� ��!?�9�U�O����@�~D-.�ڜ�T,�Y0@5&y�X����wyQ�Y�$%�~��d%�9�N/+2�j��T�Q�"B6��g�/�a"�0�8L��i�j$�m~�U�y�G-{Z����ڍ��,����h;��Y���sk��m�JY�.�J������ʨ@3z��t,��H��(�����O}?��0�D ?W�������u3��ʌ��uf,���ù&)-���w���l;w&m3E�]1��;<�" ��,�8�a��C���-��y0�z��v��|�����G�>ƥƃK�
��P~W�[�q���B?��Џ�~,�c�&M�Kʳgϔ�P88@��g%��W.�h� ���$Q�q����'ၲ\f��a��[�u��3��D	�T���[?�V����e��q#2�,�,�lq狶�֔
��͵�ȕ��}���zWW<����:��8쯽d~"i�kY�!�5�I���$����W�b��:/��_�r
!��ŨL%�F��ț�7T�lB�c��@o��z���yZ?dx�o�T�$��4��!M1̟�z#.�_�(zBy#��DM�S�|�싿'������~��^�����>���)���CF���B�$j���@l0,U�wŧ����	T��T���<8ͥ���T7W�'����).��&Q�o�8���o��j�T8���o8���o8���o8����oz�+�^���
���J�<,z�٪cY�L�Y5�oũ�&��E�o�����=��#g٢0�5G�>�tܢ�g}w�Ϟ}�i�o@�tDaDaDaD�'�¶���]FU�0����"��s��}�^�Y����,O��c�����5E�}l��<6K�˪>����v�η�ڴ���w
�q-�P�����P5�0����>��{�pp=����4[ZOCl�plj��ʋ�Ә�3�3�����Q�at�|�YG}F}F}ޒ>��l�X��3C}F}F}ޖ>�*5l{�#j곁������-}�TS�sc�QL���yK��t�b��v-�g���y[�l��L[y��B}�Q�Q�Q���φ�:̲���8,�g�F}F}ގ>W��izc�U�?�>�>oM�u��C�Yo	��y;�L]���f6k����$��w�oNf��K3�����P��*�����d�`RY�_��o'}��u1I�<p?&��X�T��C�B�[(ڸ��P���l��T�a��*�-�Y�'��H�x��3q��[:�*�*�*�*�*��EU�%D՘f��!Te������������OU��k�2��Tm�׿�b��/?��3�O�����ޣ|�W/\�D5���2F�@�	y�Y����5�,g�cI.���͠R � ���;+�h��4�i*~��'^�e3L��?L��P� ;p����y$~���O刓�T����A�_|�M"���򟎯���Z����t�?^����gd��_=K����\�� ety_��YXx�D�Dp�r�c��.+�a�-ҿ���~�7^���ۇV#��G�))u�ˡ�&]�V��8��&~!b�m,��e�j���V��h���u&�>G��:4�Z��3��:=ӥ�J����;K'2d��s�o-:�8�A���o]�4�>e��AƖ��7.�(n?�uD���9����������n�p���J�����g`=�� nM۷��Eޣ�B������H��{�E�2�/�55Ⱦ}6_}Ż�U
�'^p:	�yT���%&��P��J�"e�^M�3ם8`�^A����./�by�*�lz�ͷr��s[Ûu�m��G�Q=bx�k$�H�[��#�"��%���1��u�A�G�BZ��i5�j��H��V#�FZ��{v�W#.�k��u�v!��#!FB��	1b$�H�����)��E�S�Y�AM�Y9��"Z� y�F�6���%�.�
��mnRz_x��>�:J~R޿��q�~y�e\�|�A�!��_~�2��}�q���h�V�˄�?~���W�_�GP_��/E�L�Y�� �l��Z�&�ðư(*"B�O=�/�x7��$�O�K �|8PR(�"
����PEI���\H�7-��'"6nZ�M��1Xk�Ŵl�X����Nc��jT�#��X�tG������1���t��0VLw'� ��IBA%��'=c��bp�g,qƲu��K�%�j�9�YvF�����*�B��|.֢
1ы�t�9Mg4����\-��t��	:����Pl���'	m����EE/*zQы�^�65p���²c*em*�mwډj��PMGw����:{9�Lr�J�)�A!��"���[5�F�D��&<�[ۗ�3�9�[5 |?��Hd�A+������3�so�PT����(}/��F��"oE�\:�g��o�<K<���vO�=��|�&�c��E�o�?Y�7 �$J��D��%�LF��5�-f�k@A\d���������"���L��s�bZ�[/�Iӧ0'�N��*�"��Q9���x��Ɋ���*>P��g���ۊ�Fͤ�S�v�����fJ3�+����dx��8ˈ��jS����:il#��Հ�neDEDEDŧ
5Qq�Pq�Ϯ�1f�ª����c ��𧟹�si^�}~�A���y>����/o6�1����{.�7��\~�;n�/}���Z0�@q.�p.�p.�)�%��a���ٍM&8�ӓ	��9��t�l̿Aq2�&�6A�I|�&;�6�[ӆ��؇��	��-�&D�CM�DET�9T��|w%���L���L���LhSwp2�v��Z:њ3�Yq���"���P��y0�&����te�X�σa�'�ؗ"_��%e�ٻ�gޟ�3������> �*cᛁ7�z�F�N,�wD	t�%gj9>U��E���
�-�Ȝ ���fr\���m���v���Y�L���[.�h������l�siYV"��<6�Hl�7b�_呣t���[Ҝz��x֤:�>&՗0�@�� �{�#O:Y�x��m&تv�N�NB;	�$�������2>jX�����f����$�Vm�1b5�--4�v��t�i�`h&���f�Ima�h&���>3�pT�S[�8�Y>j���]i��,w�WRͥD5	���ϰ��ZI��}:`��V04��HB#	���ph4��Hj��$�(U�f֐�D4�$��[I:Uۢ��#A+iw�O���
�VZIh%����VZI���t]���d��0��(�;��M���l3�
�t�ęt�⊰3�f.
&���'�U�U�U�U�U����*q5S5G7�'���.¹<��G?��Kx�L���sK��=~��k���,.����b/�ã�O}��3y��<`^�E��Y�LшkP����:�֚���tS�1��jY5�jd�Ȫ�U#��
�f�K-�0�a�)oC\E\E\E\E\E\}���*qj76d �"�"�"�"�"�>a\5UiS�@��$�Rf#�"�"�"�"�"�vWa�Rݶ���e�F��h�pz$浣�N	�T�ϔ[?�V���B�v�,�)P��E<"e��+��6D���J�����\!d%�d&maaaa�m�5���n������Nw���χ*<+��d�5���O����Ο+"6,�V.ckX���Lݪ�������h�Na��h�˘K�j0C#-y��	�v�����w��A[n�z������R3����7��e��q�o�h�(R�iD��S�[K�,�16r-�xK4�[�[�[�[����[����ڎj鶶QT�)hS�k�{�q�}��ڛ��TG3)!���'�7��%��������d���`+����x���iָ�ˮ�-���>��ׅ��6���ŝ2��<h�Ʈ�Y���6�x�r[�פ������M�m4����)s���ʒ$[��Tӡ�a�d�&2�n$ݭ��3�O]Ml�P�C������j?j?j�������:��Z��+�o������wJ��KL �	  �6[/AE�-t������{���G�8���=���p�g$�2մm}c���wv�]�����h�yRÓ��d��h9�	Y��ׄ'��i� ���>���|�y�����=�̈́�R���}Q��|�M��v6��_7荗^o_�4O�G�(���x>Ie'Mz��ae�?=b&z_�(:By#\�DM�S0��ʾ�{��O�z��%���;������ ��+@2n��09f����w��� Q����җ*�솩0Ǡ�u�wU���Kh�JMK[}9h^��7��T��D!(��
�
�
�-��Uf��Y9>�B��*4*4*�6Z�\����z�
MP�Q�Q���І�2F-se�y�BSThThT�(4q���|���YGuFuFuފ:S�*Q4��zK
M�Jj���s�B�ШШ�[Rh�P)5(inҊ��ШШ��RhGut`�+�#Y��*4*4*�V���Qj;�A��ub�Ш��[��خ��6��q�*4*�V��.�Tj��B�Nz;
�\(�i1g�h��׉�B�BoK�	ɢXVs
���P�Q���к��m�~^�b�n. ��)ѣ��cE����2VH���F������G؈]ÿ� 2~
�8��>�����{bOz��@�.�H�C�VU"�FC��(�NI�(��I�E[��m7ݞ�����Nߤr���P�O�?�k��S�OƁwwxIb~�ԟ�b��-��v��?�M��0����qߴ�\�Q�al�}Ӄh-q�����0
�����`#�'g�������@/R���KLmA���"�Ȼ��ˣ�d�U��7��2���_!�S	�� r�x�z�IZV�Ҙ���IP�n���/��%���8��imͩˈ�,մ�A�:IG��'4<ˮ	�y0�$~(Z�4ȡ�#+���K�\�(�`_�:إ��c�U������i��b��>�CY�	�#��?}/���c&�w�ϼ?��cf����@���g,B���񇨧��ӯ(r�.�Am<{�x"slZ:F]�z%l���pU�:�Y��S��@Cgc���������:���k��*�%����1ؼ����z�Y�;��5���-��\Z��ȡ�D8�D��"Pe6.C���#�f�>nQ���� ���Щ���B�i���w1�J\5u��U�O�Xțl*�F����u��wU#K'hd���FYmk�Y@fM�2b�+��y��Z�7E�)�M���ҿ�3W�T�sǦ��Mm����kC�)s��ꖩ�������tw�Qܓ����7E�)Yhd����d���i ͒Y�=Q�)�ذxK�A���*oE�6�o�o�o��5p��t�֩�ٴ�p�2��Q�jm�5ET/�YZ�����otw{Q\��}��E�(Wh\�q���qeh*a�E�&��E��"G���|��ҳ�B��B� N^@���$�@r���"E���d�>������z��/8���7�R��|�B��>����ʋl��Oz5�V�� �^A����./�by�*�l�6;�B艱T��f�|+�|>���ٿȇr�<���g�M��$��}8Z��ux6��$i�l�/�n`�Ԛ���ڒn�t#�FF���SfԆ��:�a��ԒnƐK#�F.�\�ipi�H��L#�F2�d�I�i�e����"�C�#�P��at[��/=_�"�����j����8�ï��'��Op	o���_���׏��b��E,�)��8}�x4I+�e��?��A���A�#���{35�����D���V?#�7��+*��{���yҢQ%M���X��?��'�ŀ��.Z�}�W�P�A_�{KH"�*����J��$�}yC(X&\�K���,�4J���1��j_~+���e��B�%�=�8՛q�HJ&#���Dt���PP�/O��_{7>��E~q��v!��j%ɪ��ʝ3��� ��^}�H�������{<{�dE]e�q觾���)�ܯ��/.��uB�#���ʪ�ie=�W�Rq���]Q�Ų�����'�L9	�aJT��� 
��.���P8~���Z�Y���][�~ԁ�U��/�DTDTDT|rP�!QwW�����a�L4����c <�F�O?�D�Ҽ���҃�_2^�(?nl6�1�����M!I.1��=O�ߓ���w���<�h�{��w�?<�_){p^!��"��g!���q2'p2�uܵ�i�SU3���MY�vw���i.�T͢������B�K@�	zM�k�WD�DE���yMj���F�Z\���s	��-�&D�CM�DET�9T��|w%ǹ�K���K���KhQwm.���۶�Ƭy��ݥ�J�Xo�s]�P�K@�	zM�k�WD�DE���yMj��$L3���7t�K@Tl!6!*�j:$*��Ρ�.x�+9�%�\�%�\�%�\B���s	�����Xk�Ozߚ��������%!      U      x���[�-7�%���+�S�eX�E��,40@cf����H�qcdl����Ҏ���7%W�i�,��P(�H�\�?����������������篿������߾�������~��  �%���5�7�o1)�����������������߾������ۿ����կ�7�o��J�S�_C�E��-ă)�\�7�g}�t����9�����J�/�_?���<��:6��8r I-��5���7�F@n���9Iv�
��F}�7�l�|$,	�18���k�)�����{����o�����~Fw�_��ӟ߿�U���?~�Ϸ���������������OC��7�c�����Y��P����)��&����7�H�G�;_�~�x$���G��ߢ��7"ah\��&y�Q�i�5������?����o���O���?������_��g����`�6�XX݄�������jz�*(�e�����c���J��?�w��_�B�BdN0�<pyx���@��9C��-���#|�-�,A��[���2z�}�=��+~#��r�G!G��.�g�Xf�R���<}�u(9KP71�^M�l~1��_)i��Ap<L�����^>�������:�^$=N��<�����~�A���O�A�2$OWGk���%g����0���,|8�ۓ<����<x"q>�>Q�c/��?Z	�A���E����jS�!=�^��
DT�>#��@�|�G
��� �)
B?GI���r=��E݊���?��K���Em�ţrD����~A�op�P8�/�gS�;\3�}�8�٦1fV�7R���1!p���n�G�╃��K}�O^=}�����������9"��-�C����ڼy���[����F.z~��� ~�8�*�G���o�_�0o��S�����.Ѕ+ˁ .�̉&?��һw���֫���A$��u�^{Կ|�S6�_����B����gZk�Ï�����t�%�W7��w�v]�=��ރsX ^� ���tt��K�m����<�o�Xę1a��|P 	^m��åg�#�.݊��d�s,`\v�=��ty�����	.��)��8��ˁ�UV����b;ő*�������G˱�j�Q�/ 8��Q�/����N�.���%�|�)8�����0���0A�1\Z�p�9ʧV3�|��0�<%#Ǥ�]fF����7��[փ2_��㖺���0{��'!#:�k��$x���7M��d�G�����.�o���3-�����C0ĉ����n������@��M�n~p��#D�����vbC
��n~;�	+������a������7Hz�g����,`���L���0e�u��Hoe�UM*�mۭ������1U�G^V�[�SE>�x�&x�+�z�cE>r����o��A�Q�r2����]�9�������U�+S����+�M�%F�0N�Ů�M�c=(C1n���ܠ]��)��w��ÚUe��hZu\��Ґi�o�C�h��s�"�;�
b�aW���#vZ�-�����B�u�)6
��q�^�ke�M9�w�Ć����f�N��:�r����"�$/<�`_Al<��/<�̦���S���nk�Y��b�Ƶ�}�)v=J�7�a�[��G�yx���NÄ��Gg_�*�V�2_���}�%���t ˩2�����n�l|�q	�%ɫ����ߟ<.p�;j@�
ٜ����>S�=���?�����wo��|lq	ɕF4T��듏<��'��%D��%��k�����ą+��K�L�Z1��W��@Ԕ���GN�<�Z/��_��
�����;��K�e��7��O�듏�._����.D�W��}�C-���`Dp��Z�t��uX�|�	x�#W"�E��� 8���&ʆ_A��mZ�D�i>fP����E$[=�!ZR��F��H$�p1=9��� N �Y�S�o/�K�4[9���R����6QfcYJ|[�����Q��}AnA�退�(��x��Y{=��c���N�`<u����+\8E/�ȣ�`��K���b��K4�ķ�Ͻtִh���ghA��z�4q2��FZqG��	Y.F�Щ�̣�VW]�V]ɝA�o�$��o]ws�A�ǩ^o�0!�ޟi�b��ZB������Pˡ��>��d#?ɝ��%��wOIx��O6tp:�r`�W���q���¯l X�S����TY���"�.^�ǽ���'8p��Vx�^�o��fs;/�K��]�T���?�z��Ldp�|	�5���*�~K-m��\a��~��r4QLZ�oGۓ�%�����z���|	��5�ynⷴ��:��Ș>����^	�����K�ĶU�Ŵ����ƅX�PY�=����I~��6�%��#�h��T�%w��\����6$��|	�5p��l䚗�[QI�*��T���~+*�W[V���б�+��g�=\�/��t%����;����U���"[[�K����Qm���
|�q�b��
�N���c��z�,�������ѓ8�r����T�6m� S�����od���H��*U}�W��C�]�A��� }oU}�������I$�N�̲���f���-,�z��&������������������_��Ҟ~�a����bn�Z�����������KK��W�|ja��&n"υ)q��$U)��@fba`��Y{X�$�s��LG��w]�&�f�+����@��+�v��@���{�H|����=��l��A�w�ex�1�r�i�����Hs�޲�i�P�T�Vhb��8�>�nc�d�ʶ��-�w1ƺm���Tp�>�㥃��28ԍ�n��Ĳ��2R�[��w�X;-+ ��c˨�U���ںq�~b�&wR-�G�!�Y�?Q��!t9s����x�x��)�i�Q�������=���n�<�n��O�aM麅�c�Ҏ�Te���Ӕ:V7Y��0�Y�D�C����v�7�Y��[�?^��-h�V�5�8Ro�����Z���A!�2V�T��A�İ�����<�1�a;�nX�aBa�b��6�)B
N�#�(<�Ӱ�k¾�Ͼr r�B�]'Ek\ĠE�>w8��@��4���6��:0�E9b�q���0p��y3�B�D�0p������W���u�-��2:��XWnb�v� ���d�gL���i>It9^gl���3�z��?6p��JdF��i�	7!j`�3����[������(P�rem�!��/I�eD_P� m�E-%Z�؊����cV�,6��8-�M�+|9
�q��]JݯZְ�_�����em�q���Ƅ�P�lv�^�0����/�ePl�^����;��:<�k��-��ĺ�谍�L��Q�8�DG��_�_@t\�ޭրSe������FaI!NU�=�/(�t�6T�Шta�)z�g7�qBX@t
��	lDC�Y�� *�g��&:��֟��T��㣻KS��0L�䘍4~%�>�LX6��a���:z���b�Z��YC�Õ�#R ��N�UZꐸ#MiT>�����gVx6@ec�(D7�5t	���4��̨M��C�ĦZG��]�]��"Ou�>�/`�>e��;k}��N��A�YX}��$�r$�S=F��x.ʋ�#����4�����s[@s�I2��yʍD�G��� ��A�[�
X�r=EO|m����!G8�I�O8����e�Мbͱj�}�)z= �Wa}�n�c-�VgV�ҍD�@լ�Ñ��e�Tp]Ǧ%r���Ce���/�.�`j+p�s;�u���,�.���Y�j �<ױ�A	�pt�G��o�l�1Y"WÆ�Gw�\ǎr�R�1|������
&)�545wH�x/o��?�謉}0�(\Cs1G+����X;?�u��}��VX\�QT��f<j�D6�`ZAsm�	Q����͸M��ZD@�>^���qkIt�d�~�P�    l֧�&��ly��$-�9���0e�`S��£^W�������Z}!��`�Y=iY6�p�F;7raHej��ã/8�[֑�t5�s�!�:IWݹ�uV9Φ�zU�"%aMS�2T83��Ǯb	�!W����}����o���?��)�u�lw�v��ｼv�D�Zܙ�T����빎��[�Ɣ'�'�w�rP�q�G��9A���#�[����9Av�D:��j��刄d����6B:#���i���V�0�(L�q����&SD��k���Z��/w��Qb��l�,Y w�M�9I �La���*FȤ��y�[皴JW�+���u�r���a�<��3�Y�-�Oq�h^���bg��C2R�d��S�$����=���:<�Kպ�-����(J�0�q����Vn�U��zU��A�U��8����&���s6�4lB߹���(ɕ�l��ܩ����n���[���g�������j�&����~��#T4�����D/S%\/o�Kr7��n����r�="�\_�
�k��F��
~|t� �OZ�T��奯a9�#�֍��v�n��H�4b�ە��k�3U��x�KH��R�b�o�$�ʃ�DlS��/��	qC��\�ᪿ�֩F�Iqi*VYx�'��힠dk1�����2[�?B�;s�V.��<!�»i�c��B���Js��?���m�?��t�^U�W{ݮI�������ЦǨ�l��I Nt�;�����F0M���f�;v
ej�=>�ߝk���`���N�����w���\�O:�4d�}7�|`�ɘ�Ew��JQ�q�;G�����96��Dw�b���\`n��ã�� ����{7��ڇ!�+Ec1��O�����d�&���ѱ���}~8��nxt���$3�� �إ�����Gw����Q+��,ݍ�]�x�0�W��B��J:V�,�<'�L�Pq2������GIV��Ov����J9�
yxs[�s�zs�>Eo4���������zQC���f����'!^^�
�Sp�9�:���Q��S�u͝��u��c�����f�2��n��誢[r��p��N+J���Hݝ7t}v.��=���^��@8#�;٪��[,a�Z���;!Z��:����,�쿪ѹ�����o�j�c�;<�B�ĎFWz8�}�h{e�����+Z'��g�<�Z������Uh�(C������S��\�}���+x��l��ZRo�Z!��[��Β���7ߛ��/Oy��}	ӵLw,M#ǑV0]Q�����oW~�u���(V��a�������_}�O�s�$,k$y���|Sr�)�����!��d˾a��k^�xt��J����>�����U54'�u?�x�	6��������+xN�㑪��%ٍ���N���QS��Gw�|��n��{�^��!=iIOT�ΗGt7�5t��p���~Dw{t]V��Q���7�2dÄޠ������*}��^��|@�lT�Bw/�=%���Gt�%��g�c*�z1��L��ˑR����}���h��´��^�e�\�YWwC���vc����]��鴣 
S�L�y�)�^�`��BwK��S��ϐ�ِ��9���١v�Y|����[w�`l��O�v�,���c-0twDtl�,*��͏��f:l^��
[�P�!�]�<#�����Ƴp@�bi#����l��=������ˑ�όe����c<jJh��E_DG��~����T��kˆX���5p�CX�d�6F��l�g�dId�K��Ẕ���Й��{�ͥ��Έ���k*i���|ӵv���l���^�uX����=$�-�|�d�^����N:ְ�ݙ�ߺ�5�c��D����/���Ӊ3;��~ytZ�s��U�W��������է��F����#&����)��tuU�uJ�}�A��2D��V�k����/�#�;�8<�e"l���=$�OG� n�dYw�F4t��O�mX�qC�G2*���7���|y.�4썘���[�:O�C���<:��)L4߽��+���s�`�hAsD�W���L^}�6��Q�đ7U:��;�G橞����+\:���M���<���d~����V\�o~�5�*Q����S"::��WU����d�C���"r����Z5,1�Q�����I�P5�Β�?o-9PB5�������Yy0-�kLP;STDy���!t��᪪���`	ۯ��uU�;$N�ā�=p����H6��a�:�������q�Wp]��*^j[y��t���h�"1��?�p��{��+���s!2��!X���� d-W6�+�~Q��_c�4�[$N���ݏ41���5��va%Ѱ�nY]+��&�bjPt�W�����5�$���^�fNq�ˣ��;vo�L�^�]y�[� _�8��-���Hٚ#tR�>XÜ��}�-w�*NebS�y[$Np���pe����@η8Qh��xu�H<��Z焪���E��e������}-w�t�83������x9�yJ��q�W0]��r�j���G�.^�_��&rN�8ѵ�.$�������t�l��$g�DCh�h��E����֤$����N�ˁX'Ro<^��ux���8a��#fyV���
M�ǈ�>��*6�R]����Yg��|�`�C�tx�W�B�i������ؽ\���ެ��M��T��J+�:���Y%��>���dQ���N��]�^���#��A��+�,�ã^���A��M�M��)��&q�+�(�1�41�������.�3���u(�B�&m:r6I����ahcNb86��誢ϕ�$w�����I5-�05/���})�]GWsb�lQr6I���
Uc�<y�$��E�1`*�%g�ĉ��ϲx��\��I�^u�XM=+�&6�ݒ�I⎞��1�W��$��k�w�Ŝ�u6I��u�֩t�#�
�k3�b�s��WP]m�h*Pg��w6I��I��$c'9�$NtԐ#è0@e׵+��en��#�
��ZJ����Ie�aPG���F���$qG�>�P�E�e�)���$�=Yk�����_pkp�͇���.0�����Z[��xE^o���~�[@f��*�i���6�<���DhS���6e֑��Y�J0`����+�&����W��6�;zQݿx��ߠ�ತ�f	��ވ��˒V+�"j<?�
.KZ�#N�\l����wt��r�։���D�H�K��qG��7MM�x�^�a���o=C8�Ou*;%�jŇ��0�:�n��K�p�i�:���)*|�����=�OT�����z]����W0]��*���{[QF��|@�2U�w�諘�c'mD`[}�¯`�/�&G0�pJ�l�C���2)�{�]��wt�*[15)���T��C%�k�qEvU��c터�q\�]Ul�L.�Z��)�y�G��4�*�PTx��5�����������|e�= {� ���H�t�����S�菏���T�2�:5������t*vI)K��9'���JEB�{8vvA��Z�X倳ݻ3��^K�zBs+���:k�|����M'zLG �jm�sNĉ�E�C�qGײd��yo�l�8ѵ���+�q�k�h�����U5_��hL��.j�Q�g�[�t
~l�t���(W�)��P��K�
�9>^���@F�tv�����9E;�P�N����������(��G.Vǆ0UM5�"!���0�����k-�Z|�L'������7��Nѳl���Jh��T���T�.-��T�ѓKS�r��n�tRUc9_�:���h與8�����]�ޮʰ�`R��.AoE4�4�ՙ�\�Щ�����c˪G���WgE�yxԾ#�]�$�ÜD��/��t�1���"�_@u>�P�!��"�����r�$�b	;�E��-�5�qG'����A��6��^qъ�V����Yk� ����9.��$�.�� :8 Q    ��|���"��E������ :�箵�F�T�R���ݥ�q��4T�s�G�T�������o��MgU��J!߻sZDG�����|��N���wO*�mC_AuU�-�Uq�����V�U]^Au�>�^��T�-��%��l�#���VH�4�2�}���0�^�N�A_@u�n7��q#��t �[}J'DG��H|c����UC�9��G�T���u"�z�����&Ě�+���]�h���u�N�xk��@��6�N��IS2�h��aP1hG�}׵YPUKh�ǻ�"�F"���닝#���(��
\Wp��x-	�rh�o�����i	�q�\�:1�j�uu����T��r��+�еbc�����u$R�~��^����X�
��\�g�r�X}ձ�b%k{m�J4t�G�3oc���%����#�����2�dI��9��u�_WS�0�
��(��6�0*	��+l.3��U?����uf �L�ࡲ�z:�D���Zj���5�92�Dm�Ӝ|I��u"Fm���P�sMag+`O���D��pT�j��_w"&�Ĉ��B5F�*�;%::5�d� Nq�O��A
�ڲ���)6��غ���]E���H6�V��� �n�8��a*�~���o
�oҋ%T����ѱ� 4���{n�Kǭv���G�.��k�i�F���[��H�X@����Z7n|�Ή��BЄk&���n�k�(+���2�{%=��6�u�_�Jt�| G2v�$�DC׉���,�{%:�hIMF������|��?�{%��
fc�L��J@���G��+��� �����Ls"���+����J�dL�$�����앍�U��*���&�/��h�I c6fD��W��NJ N�������M�$s���tTt�1�F��W��kij���WBЩw+�h��O�^��.1���]�o�h�K�@��D�1�wx��9Ygs��7������uBG���C�7K<�L�R�џ�7K4t���}�5�B!����,m4O=0G���o� -��p�lL�$�DG��ad�`ٟ�h�*(��B�{Z��Y��-�N9Y��$�D��#����wvKV�@�F�TO�ˣ���4l:�p=���¯����5�2q�f	hՔI�ˢQh6��%�6�PF���H�i.���+����3ai(�4�����Յ����$���'<Ȯ3n:��+�Rϙ�Ґ��+���n�����W���#�qF���+Z��AX�"���+�ѫ�<�������N˗�QT���t�^	h�:X�i	e���N�1!������t��d�Ү�۰�d��Ͼ��P����µ
��\��a@�2'��B+�c�j�%�7K@�$G��ZZ�DG׎�l�J�f����瘌����,�]"z?M��|�7Ktt<0XS��f��΂��;��/�:
Z�#�{5N�M�f��.>e�њ�7K4���Ũ������{��6�DC<8�:����)�l����J��5�U�(�{%���<��S�:F��+��)�b5���:���<�|����J������Q�ny>�{%H�|T�"�u�f��Jttޞ�����W�UJH�X��2F���J4t�F���J��^	��(E,�pI�}q>�h�l�z�[~�A<��ul�މmU�
��![����� f�7�hU��r?�Ð�f�;�xu�vU��n�;�u����)�'K4����u�w�Ns���![�˲�[����7O��o�`́��OJ�:+����5t�tz��kw{u�؈�6��氀��H��:�����EB�����-�:q���Fe�DG�Hyn��#:� ?��������?����������Wxo�0�:>Y��}�o��A�|@E��G�6��С�U��;�,�a�
LG���K��.�w��.@�6�E'�Z�{]�N�uHS�(���G>a6^�g�O|ӄJ��!��J߾i �Rs�93�ڍ�G�6�M�Ac_E�����B�;k�)���Ƌ�ج��W��p���}Y�bu�a�Q+MT�E㨻�Lх�
���%�:��2����#���^H�����Mt���E���ڽ�����5�frt�ىH��q����O�8�Zē6��t�J��_q�/����7�8��^��g�ϼ\�Yb������u�։���M.����7hZ�֠��"7i�V�#'e.`�K ����s"K�o/�PSG̔���7���R��I�1Z��uyA[Mգ�UN�ѷz.��Ӻ!�i�V��Li@�S��^���醜�޲F�8q�~Ö�����o�5�^y-#����^ֺ�w�Ic�bf/kut��j�b��u���]��dL4e������S�{�솞���(���������%��өL�څ]��*o�U����왽AeG� ��Ԁ�G�L��d�b�μ��P3=�TkH�V0�{ϩ�5ߑ����e=O1���o�CZAg�R,�k�d��w��p8���+H�!V��X��+��}R5��i3�t�>Q�X�S�����������cL�$V�Ynbt�O?�� oMud�1u/t���p���mT%ֹb�/9��+\�\a�։�r@�\a�_��u���L�֬|�#	��V����%�FM��~�u�TE r^�n[mm 0�(U	i���I��b,eH-��#/�:"s�;��5�"Fa�a��|�� 4�MHq�� Jx��C��=!�>�u!��h�)�N҉�B/Fу\�NR1"���y��;�M#'"���1���iD;�p�R��͵�s:j�lq3LG����E��]�����zFtwd�T��c���}BuGv=
�HLk}��v���K��3w��
OP
-���	Z�;bы��o�Qo$���Ca�3+?	!�,�8�j?!�����Co�p�OG,�P���jwqk�(�a����n�9��i����^�Ū�U��cP�G���k��NSG�g����p%�駡G��M���\-��Out��+���%������zƔ�Φ]��y1�^�m���\��Y�Kx��4fU��(�)a�u��=���m8Ec��^��ѩE�X_m\Ag��:Itn,�/q�Q�$J���9��6��S<r����W�Y��L��⮍WtVu�ғQ��Ds�U�C<��8qR��wD�P�8U���o�:��:/���o�|P�� ��
:k�BN�x�Q�js�zDEK�k��� ��X���r����Pxcf��+�������]C�#B�hH~���k� �d<P�%�7����ƻ�⮀��W���z�+�o�Z�����K���r�1�]�%�7t������"��8R2��wu��dJ�_Cu���~9��:A��������txcYXq���Y<M�喻p���N�,�4�����:J l��/����i��֭ߛ������Q��պ�k�NK������S�������;z>���ͪ�
��z�ZU��ȳ��鲞1�S��+�.��QR51#�
�˺�0Y����Lk$A� Z�(6VWPC���na����u����O�Bd
d�-:qI�TB�����FL���K͢;.\�D��k͢⬣�ϱNS8���*t���H�{n�� �ڄ�B�ڦc��Sxs��&�교��ܣrT��f�H��뛵s{�a)���FmE.��k5�7�;�\��*�e�}[����|���?���{'��ۿ�����������헿���o�s�z����N��~��H��Y��<GI���uB�JN�Q}[Ʋ
���j�X��|4���X��F����d��VsH�q�%��>��m�.�c�l��E�4٠YD7����*:a�����Gy��蝰��:�|���������N���[�U�|S������$R���;a����2#���;a��¢�i�y���M�6��Gز����d�
q��Z��;N��KI��뮈�,�@̀�����|�3b�[�X�z�	�&$<K���9?Za݄�`%J�::|�MH��o��    Z��uR��d��iX7!���kwf�q7�+X7!5X�#�<18��PkJcN�8D'��:n�q��1���N\��.x5v�8�c��\���� FHIΖ�'�`M�Y�q�
����oE��
X�=�w\񒲊$�z,��D��כo�t-p.�
rj���Ö�W�+�	5�7s�N<�Vg��6�<{MV�%����p=��]�M��P~}b<�	����M�j,�z�'���p��:�'�*b�edGM�.p�b��Q&RU'���SHx�\���+H�t�S�(�Z��]ARM69���>�����m�m�ע['�
�j��%�r�v>aW��tH��ijtV����TCvB��]�Q��e��4��(�
�b�~B�R�vG�И�����U���j��fO=g����!_��'�
�bUK+�Mo�Ί�T�@��*�vC�v�����~'�
�b�,��go�������x��_8;QW0�8zS<���u�wT�y'��k
á��׽'��ҢB���BF'�
�j��颋��
�J�V ��p^`�E�6�0@�8�����;l�Ɛf� �Y�~�UU07���]AQYρf�͞�+8��	�!MÞ�+H���)�:��+H�4=T�k��uG�����u	�	����z11^w���+H�6��:Q�,.���W+�8���u�'�0r�T��gA�V�넌�	����ƗQ(�{�]�QU��3�� �vGAё��'|��8
��x���]@R�r�>��L��E-��	9�vI)l��z-��uV���N�}s����čy� 򗉣N_͈#O_�9��-C��Z�'��XgY��8��j�8����W�+X
�\�:�yvK���y�����7X�2	x:�r
���L�%s���r*�wX�+N�e>�/�Y�T�V9aW�T�K�r�?
�
���2�lMu�����9"�i�p��������%�SM��J�{ڠ1	���,��ӟ�
�J-E ��q�/&o�z�Zx�$��wX���J�'�
�J�\P��Z�]AR��S\�|�eu® ���&�i�$�n���/)�̇T����%��)�8��W�T�b�qBG�]�RY���Dq��}'�
��:�R���_R�a�(�i�ݖ,���g��a��]�RYO�����Vԙ+,1��ຢμ�b�0�]Wԙ+�N,�<+�̡��G�cM��ਖ&��l:����6B��VW�����<�4��WT�+,�P%LS�SN��V-@��ӧϊsE����k�vC��D���튪sJǜ#M�b��갥��Z����T����6ĺ��ۅ��óN�%��R�3��N�%���2!h�acXQk����$�D&�]@R]6J{E�qД�6�s6��aE�9j����lM��`��[9LH�qWP���H��-������C��P�w[5ܒ*]Ϯ�㮠��5]M�
������Z(��]Qu���BJ��D����Hck�i)�]�VTNJ�وDp�EM�s�2+Ê�s��b�M����>:���h�;��RX-(e���wYQ]����. +�E-��h�y��v��PfaW�,��9��y�w�d���HA��3aE	:�8!Jt?�V+j�;.e��m�������^�t��`�1�2[,&�+�
4�G�<��aE%:�Q�(��l��஠+�D�J���
+�ѩł̐���O��脽���C�����T@b��8�~Wԣ.ƣ�4]/�+�
ۨ��3�1��H��iMz}4��+J�	[�@��s�]�W��C��i�ZQ��qY�rVmCpW�j�#�w���Zre����+��邫��2�YU�]�W��������t�%U}
��1�(NWܤ��f��������c�5̦mw_��G%'����>]p1�˄��w_��������ꂫw�%��Ⱦ�]�W�)���+jԩ��k�l����+�18���J����H��aW�kj� ͳ�*u��"ۙ�/w�l�Z��̯�)P�]�V�u?���ӂ����Z[?r��t�]�V|��ųEԂ���Zc-��&}cXQ�.�m�N�2��+��W����iv^Q���YN��g��MW�:k}�!�<]���^��&�@�т�`��#�Pz�MW[Ϯ���w\�� �_>�k�;n9T�w�#�U<�q�_�H�?M����[t~�t+����ʾ�,N������H�ӆ�p����s�y��_��p5���|n�_��a�@,y�U9����@�AL㮠+R9�������뤊֚K�eީ�������̯�z��
[���C2�z�E'6��+����W��u^�V��1����W�7\	����i�t�:V �Y�
�]AW��nn=[�.�+�u�U�+3!{Õ�7�Z�S)�Jv���]q�T��K���Ip�մ�t�5&��|f�_��q��328�j����_��pI;�8̊��
�j�H�IE;���)���]@W:dA���IX��V
��܁��7���:ʏY��U�*Ϗ:�t���CY�㉣^C�I�5}��/lo�1规�ɣ�/l�M+��7��������owe�&�Sb��t��w�t�&f:�q��He��a�������X#���ơ6`�М���I�W�S�J�(^��y�e�tiL%�w�D{�-G�Pg�0v9��� ����	�
rj��S��͈���������p�����k��e�Q-F�z�ժ�$^�4����;�|39�POq����j��/Zo�B��<�o�����+>j�?��U�����<]|�E�VB=9z�/Z��h��2I墦[�z��G�y�O��\�[�(����Y���uR��6︵�⮠�ڪP���
�j���|�k�׬w\��H���Yo��7&�+تj�M�4�7*�+��E��:]��5��d]Q�Q��j��f�nr�������L�*O�$>橂,/܋�s�ק��)�|�G�Q����,.!Ή��Ȋ��� ���U΀�'�W�SU�A��+M�A��� Ǩ�L0�մ��ը:�2M̧��Q�R�W�q>e�_�S�=L5g���G�zǅC��|�z�ת�M�5d��2��V��:�l��iV�Gpp������zi�����4翶e����k<�S���!�_��pU�J��B*�<+lc�J��J8�_��q��z�=�����7kD�g,�zÍtpf�����z���p �8]w���WK`�!���.յ5l�� &�� �yV�YpW�UR�.�a�\=���;n=T�a� ���7\-ߞW4�l��6T��<+r.�+�*i�(ǔ�3+��W�|Tcz;��VWܨ��avԓ�`��]�G,+��W'����4��B��}��]CW��?����ru��,������rul��U�j��z����X�����f�]CW�g����+�*kx�)gqW�U�¦�eZ9YpЕJ(�p�<���6F9S�����ru�MQ��ɂ�����:n�X��z��^�[;B�,
ϊ�
����r�ӳ�^]��[}>��z��z�;n�:������h�8=�Zp�|u�����q�W�[A$��2]��W��V�y��׫s�Z�}R��W��z����|���^��jw\��J��/X���`(���n�5��D��`��M�a�<z(X��f���������~��5�{�?~�_�ϡY�Ri��`0�X����?���ϟ~��/���W����_�_bPp[$��(��7}f>��^�n�0�k�Y���F��R�PB��Fx�!�`c�>T�w��mԫ�R�P�r��}�j���LC��_���OX�M��)�cY|�`荁�5P���4�?��@|1�y�
j�'��˺^����+��>x�M� �[�zT�qX11������%�q#�ć�,-�����,A�����~�<��/�la��"�f�i�ǚ00�3��gq�c0a�;�J���9N�yﭨ��)�C���Pރ��0�4�b��\zoEܶL��{�=�X%wp�m����,��V�U�Z��\�r~�jy��L��1z	hr��{+v�;��{u,�1�L�;�f�����zr�V0x�Nh�    ���]�a���T�ش&����6Y�F���D���,�=U3�J꿷lӧ-���n���C���NN�Tf���[V�Y�>s�0�d}oY�dY՘�R��{g�}�IH0=���&��[F�a���l��\>"�0�Zoٮ��Q�B��"�-�u Ԧ(�a��e��m�u�	š,��vKۖQg��֍��lS�-�qj� ���f�s�:�!�>�=l
��e�g)�.Q���؞{��m��S|��l[:o$Q�iL,ݦcB�V�՜|kY�Gw=�}�η��?Gp'���Pq؄��;��$Ԋ⁖���]i�(��������
K�As)�,��2�t���y��������"�V�q��x{�E�� �2P�P�\�����A���t���û�	?�N�V9���No��'�6���@�K��5H)O�l �DN�EUQ.�d���ܤ������ ���w[��⻂����01^Ȯ,�6�T�%q���6�.��9L�l	}O[*����/�Ӎ�#U��A��v[��&�CtbaVT�&��c�uz�1����ۢ%)g�\/�_��mJ^��=w�ݖ|�4��(��¬!_���)̟J��|�_�N,��%����U{��-�ٔq>�0kȗ�j��i��s��l�p��aX9?�0+�7k���t�/�3<m)h8��za��Fݘt���O.�"߬_��maV�o��zƀӍ@�ȷ4�Ú����#uc���jCff���CRUF���*9��X��p���/�Ԍ�o�Tii�t��ma88o&f�MZ�{��5<�,�pěj�!(A��������Mt�����"u� 1a ���*����m&�Ot�Ah�5+���OlA�۷��B���V:�E>1�ۂy���!�d'0mہ*�-Ǘ�(Y<�m�'�V������m;P���;�7�؁u�
JxH��PxX�6mA�5��P��z���@�q�7�]�HY�*-��񚜗Mn���C����g7�a�Kw���J��x��)P[tȀ� ���)�v9�T�Wi�=��xپ�ú�	��tcR(�r8�W�oT4kA�Ϫ�A��ث-�IN<��=���X7��q~ �-Y���b�4LFN,��5����t0�75�-$nn���_���դ����P�D�j��F�q�����G'&-n�:�'Ф��B°�C�uIP��'ː��q�
M'!�a5�Ȋ}�͊���I+�Lҭ�N�''˼���ԥ[uE�XyX>�bEGej��Iݱ�pgѺ�����V��L�&b�<9��+�&K�;�c��+�������Cc�Y��ح(�,묖�{+VPg��³B���n3刨Lj��/��ԡ����^�=i٦�Ul]���٪���mjY햑���MB�Բ���pR�a7��V�)G��xZ��ʵA����A�lym#����ζ�5��l��~����2�EJk�t���m7�#ѳG
�R�Y��O	�]׮�v4>wu�jA���{oَ���2	ntҫoץ��7�f�[����[�x�y���e;���em<}��k~oَ+�eE]trv>�}�Wm�.O����,�L�Fb�$W7������09g��e�HN-������i�n"95��g���[����fY:H~��n�n`e	�dẉ��2�!��c3p�AW�#sQ?�l�/�-#�uU�a������
��ˠ�ܻtXa��K<Q�wLP8t���|�(�;&H�m�+La�)��#ғ��M�0@�o@B��NzH(��1�d0�t�`����Y�����t=x���$��u����ᆟO>5r�f����f4��I����'&.�p%�����f�2�]��lJ�I�zH�6��	��.���Ϳ/:3�����^�;�s�6��j3R�ũ�-�^���Q��-�ũ]�U5�sl)�r��j�-69��e;�7�Pk�ar\�{�v�-�e(�v*<L�];q�\L7P�*C�6�,�����f ��<䐉�хs3P�'�S�{X���u�7�X��_|0p�����t`R�<�
��X.��Ů��y�n �ا����u7˄_���򜶨4�L���򈣥�uOC�xC,ϖ;�y�e�`��ٸo�<s�5ݬC鞴l�i�M����)h�J��@P!/x����(��,ÃR���-2�7儕#vh�h�v��7�j��8gb�vM2ΊT��l�=�N���OZ���5����qz�.��Ȫ�-�9�䤺��D9�N{�{�xJ�rF_�<��S�8N?oپS�D�'�O����|��t�h���zg��:}�-�w+'~���wJ�)�'B�� -�O�!�wJ
�����5��y�m:߅��X�����Xc���?��7؄CMq��l�-R/w˚2�k�������#J|3�M~k�ýo:�e%�x]:�ɚm�V"	rF�N�b������sS�^�����b��б�<L7���������?���_n���/2-qтt��^	͏��N������uy�iyY�3�a9�!������Q�U��
��"��K�xR��O�[6��u�PL�[�V4=�����O����O�VH[+�S���?�ڊ����������\8hU�|+u�S����Q<ృ�4�Y�����O������M���k���6��O
J��F���(�I,Rθ�&���g��/��X>�T�����>��/mC�E6�H�hXW������؆돳٠�qB�a�C��}�6�E� T@>�QT��:�m�T}QKA����ݚ�6�P�N��䍍�K�P+}Ъ��]�'[(��M��Dt��5�=/.��-w�X_��������O9{�os���Zӊ�{�����SG�A�a�*��}4c&_GU7 Yvɥ9���⹾,��1ޭ��"�t��=���~�����1n�|�Þ��e�����<�{7�FꚥiYz(1��KS��R�&�QZ��A*��@��G&�>��v��7*�ziu}J.�j�76z���"V��t�h�ㄜ�.���҂�u:I��u���.�ꈕ��jS(�Z��㻃��#aQ�ȤP������&�������x1�Rɚh�%TF/��7#��/�R}�0���|��
�vv��H��N���P�z���$�G�P���?~?u����2:r�z]f��eFa�;l>r��&ě�m�|0���앧��wˊ<8�[��{Y��[V�\�����[�;S-a��i��%�<�l��n�~��\���8O����n�jo���5�^(�[�lkné��l}>�Y��i.���Ĳ���ݲ��4-�Ұ���0�#1?�d�N �M��8����8�/�>-�0��7fd٦ ە�8�<ל�a}yu����S��Ȳ��s�e����m�Ȳ��2Ғ��d�<��w��2�'�By0��Eg�\ q��u_��t��;����&o{��;gײ矬���g���m�Ϧ?�G�}�0Ġvn
�yjI���{�V0m_ATa�a���
�0�6�Y9o�m�#�4����q��l_G��#�grSР��s�a��`+>4l�Z�|���o	7w��r py.��{9GFY�sg�^ݺz �4�D�$�Ս�}���+���T��۷�H�::(ƀC%��]��L�:#B���>��7�)��	�p���n<T��N�P��d�؋eׇܬW�k��r�����xH��K~h���A���x0��%?�y.ɠm�1��}�d�t)��I������yh�ܴ�P�Z��p=�z.��L�eg�>��w�?�:�2��K;�	�6���{w��V1��z��.,;QY�:�'�|���y�{�z!i�qҵ�0����x!i�qҬ�5�a"�9Ӷ�U�6V�a�ol�����ʋ|�ŋ��k��V��yz���6}Ü���&�����n��Oy0����t�D ���n��6��H'}81��˨�������
����1��$���At�.�t�3��?�t�8��1�W!�����ra�xdh�V�õ�]�W���T�<{��j�Ԥ�eY�� -  ����
"�̬͠��
"��"+H�I�b^6~hE]gESĪhX��iU��X�
u�0�_9ܬ�ˬ��[Й�\�u_$Xg��W�Q��������ϳf��r��	����1u�X�`��:��&�A?n���a�)ZFRTif��Ӯ[jC��b��)��ܻ�pԌa�v^�Li��ލ�C�N':%?]ȝ�>��E<�aS��B�-�Lt�1���K���3u�ʁ%�g�ۼ���ns
Jz.�5ۙ;�ۜ�@���g��z����ǳ������)LT='��y�}O�LB�<<8Fk��Ԑ�'B�u�q�x׭W ;-��$���j��;�4�	h�,��*��S�t�V�a���;��=��fd�0�X�ft9P`�E��^u�/%L{�/�|A�P5��D�'v������(�4&�SbH���{ɑ��� ^䇮ɱ�:_�WD��+�c��?�,Sw&�4,���eO�~ƚe\M7���g
��X�ҟ/�;�b��p�|��l�]e��H<P�f8!�b!w�#�"aY�d<R7�$�hEB��|MA����/@i���Ww�!��0��F�t�9�ď�y����ܺ9I����z�4� ���WI�L	3ّw�{���:<�DJÎ�ѱ���c#�~�d����΍�Fj*]A�y�%���d�.�0̳5�)l<8�X1�4nT�X�����r|��0fv�dt�������:����}�^�̬�^�f$�.
CE�-i֥���w��)�ۦ�(u��s�/n?FHu}c�^￸�#s�eBW���7�#$�*'���_�z��X^�2�����~���/N��T3�p�9"�;�O6z��F���/���������(G��y/������FR}��iOw�iaA��xn�=tw/���u�ѳ�o[G�i^	1݃��{��޴�8b!���z�����B�r?�}M����G!�ᴯ����O��q1�����������1�[d��tD���ix�쿍��5>����H3�R��y���ۣN��VЉ��af�������-Z�:�[�C��,3#n�Lv^�LO��'�}��~c먌,ۢ�M���D��频ei�e�����_@�d���I{���5g�Ԓ;l>�pt��nj�	�(�f�ܟ����v5��~��7�=-��󓺁��tƑx<��Kj��,�0�r�<�F���QR�Ϋ)�1P3�n_hЍ̅�Ĭ��\3�u�ĭrA��a��Э��a}Z���3�xS���y� 4d��g����Ғ&�ʰFtpn���nj�2=Y�^��]�f��<��a�f[
n�Qsv��lK5�S�!���lK��As��JoO:ڼ�`Pw�y���e���9�uIkwƲÓ�w%N���Ox�΄C�1Txj�����-��n`=B�0��|i���Z�,ӄ擖m	$�e�֠C؞t�Ӗ
�nY:�cyR�]��v�K��Az��Ӧ"��6K�Cmɑe[rѧe��vx>gٖ��f�A1���,ے?��B��������2�*��<��6�ݲʹ�'�ٞ�m���`�����ٞ�m�[R�<��1§k�?�/_������Y      _   :   x�3�H�K�MT����)Nc3S#KNC0L�4����K���,��c��W� �?�      S   �  x����r�0�����YI��3��SH��S&7���x��W�0!�L&�^I�o���
�N��VfE�?!��Y��VVM�rD�G`�����0uJ�Y�y�B#m����������_���N�:������0unP��+���_��������u�_>�}�����tu��A��>J�p����p�iGS'�8�/58
#�uo�  ����70ʄA�:�)�C��d]�@I��i2��>�3��N9���`����3��U�U�o?�����W:�c�u�1�Y�'ә��#DP�-p8�����Y"�`s�C�w{���7�L�p����8p�g����C�2�5����d�oq�(ӕ��L���,X�I1.�bV/���m ��mDp{��i�����2)��4_?��G�=sT�yUW�t+�H9���v���g]Ӵ����?      ]   *   x�3�4�.-J,�L�t3��2�2K*98c��W� ɓ	W      Y   v   x���;
�0��)t��h#�Υ�mB�F`ƭ��@ڤx�f�s�;�o `d�$���T�TH�<��rֈT�XyL���:l^���1�k��l�����+���-�B�o�'u      Q   @   x�3�tL����4�4202�50�54T00�21�2��370306J��q�qs���4F��� sL6      [   [   x�3�4�t/�J,J,�L�u3��2�2K*98��Lu�u�L����L,��-͌��1~\F@���@��%E�@�F(�c� �b���� D�*      O   ,  x���MN�0���)|�Z3��x*[$��qKZ��q�8H�=N�BS`�4^x�h�{ϲ�S�{lÙ����P'V�7ϵ;^���H���Hr� W�����ZΚ�,鈜��h���
��B����FXǘ6�mg����e@|�Q�`,�z^��t�n0�Qzp�F�&��cǪ�x��$�8��n�"�N��}�e�9�C�폺?��d>-hA���k������4 K����B�-M�������^��&3�}=l�攚��+�6�%j�xD�,9{	a�Q&T^a�,դ��(�Oʔ�      M     x���Y��HF��_�C�v�I��O�*%(�"�/) ;�������*j��"2���D��"*#iDBP��?;�*R5�<�*`�J�������A��h��k!�5A�=P'.йsDk�q���z�K��|=u/QJO8�BѐfB�'� Bay��Aܥ|ۧ��C�x b��R'���'�J�ү|G$�$���=��a�V��̃KU���Y��Q�_s57�Z�ŉ� '��QJ2�4ҟ����9Q�[�0�������UA>��io��{��Y�,�Ę��s�V�z�Њg6����!3����(����$��zuN��'U��JM-�Ĭ��^�E�ٿZ~���*�e)�;Fv�m�1�C��Q s��S4�&��X*q�
�>�?�O���.@1��B��V�6�<+N�$�/���H�!�:Bi���\�S��+�����P:�P
�h')^���q6��X12�[h��dU��J���B��Su���I�ؽ���f���4�Jbʮ�8UY��]�����mSCtʛ��?���8���2�j�����u�_^B��α���T�Q��DL ��Ӊ6q}��F�;bMd���1ND�ZN��;�"���'��.Bz/�̞��kŪ�R�o#��2�L�61��$���Q�*��>���mw��-Dc
��7�=1����<��������'�.hۇ}c��òi�����h�1W^*8�c�t�痈0����	.ۊP�y�M��M̐�f���^gӫC��k����=zhܮ*'&}U۱EO��s�>��i����J͛���6�[�͘��S��>!�ϰ��!M�}㦎��n,�i"v�r΋ť2s�Y�L@d�L��?4�[I�O�d���ѡ����'��
�z�n_�\�����4���a�eφD�#��|�<(�ay+�K�����A2oC�8գ�Ѽ6Q���|�`r;�8�B_9�;�ymQ	�6�Zz����͵*�k#�[��.Qߪ[�r좼�Se,}������_s�,n     