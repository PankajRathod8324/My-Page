PGDMP  ,    4        	        }            MVCRegistrationForm    16.3    16.3 0    %           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            &           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            '           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            (           1262    205131    MVCRegistrationForm    DATABASE     �   CREATE DATABASE "MVCRegistrationForm" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
 %   DROP DATABASE "MVCRegistrationForm";
                postgres    false            �            1259    205174    cities    TABLE     �  CREATE TABLE public.cities (
    cityid integer NOT NULL,
    stateid integer,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    205173    cities_cityid_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    220            )           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    219            �            1259    205151 	   countries    TABLE     �  CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    205150    countries_countryid_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    216            *           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    215            �            1259    205221    roles    TABLE     �  CREATE TABLE public.roles (
    roleid integer NOT NULL,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    205220    roles_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_roleid_seq;
       public          postgres    false    222            +           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
          public          postgres    false    221            �            1259    205160    states    TABLE     �  CREATE TABLE public.states (
    stateid integer NOT NULL,
    countryid integer,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.states;
       public         heap    postgres    false            �            1259    205159    states_stateid_seq    SEQUENCE     �   CREATE SEQUENCE public.states_stateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.states_stateid_seq;
       public          postgres    false    218            ,           0    0    states_stateid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.states_stateid_seq OWNED BY public.states.stateid;
          public          postgres    false    217            �            1259    205230    users    TABLE     G  CREATE TABLE public.users (
    userid integer NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    roleid integer,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    phone character varying(30) NOT NULL,
    countryid integer,
    stateid integer,
    cityid integer,
    address character varying(250) NOT NULL,
    zipcode character varying(30),
    deleted boolean DEFAULT false,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    lastlogin timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    205229    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    224            -           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    223            j           2604    205177    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    219    220    220            d           2604    205154    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    215    216    216            m           2604    205224    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    222    221    222            g           2604    205163    states stateid    DEFAULT     p   ALTER TABLE ONLY public.states ALTER COLUMN stateid SET DEFAULT nextval('public.states_stateid_seq'::regclass);
 =   ALTER TABLE public.states ALTER COLUMN stateid DROP DEFAULT;
       public          postgres    false    218    217    218            p           2604    205233    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    224    223    224                      0    205174    cities 
   TABLE DATA           �   COPY public.cities (cityid, stateid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    220   �=                 0    205151 	   countries 
   TABLE DATA           �   COPY public.countries (countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    216   x>                  0    205221    roles 
   TABLE DATA           z   COPY public.roles (roleid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    222   �>                 0    205160    states 
   TABLE DATA           �   COPY public.states (stateid, countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    218   ?       "          0    205230    users 
   TABLE DATA           �   COPY public.users (userid, firstname, lastname, username, roleid, email, password, phone, countryid, stateid, cityid, address, zipcode, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, lastlogin) FROM stdin;
    public          postgres    false    224   �?       .           0    0    cities_cityid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cities_cityid_seq', 5, true);
          public          postgres    false    219            /           0    0    countries_countryid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.countries_countryid_seq', 6, true);
          public          postgres    false    215            0           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 1, true);
          public          postgres    false    221            1           0    0    states_stateid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.states_stateid_seq', 5, true);
          public          postgres    false    217            2           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 2, true);
          public          postgres    false    223            y           2606    205181    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    220            u           2606    205158    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    216            {           2606    205228    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    222            w           2606    205167    states states_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (stateid);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    218            }           2606    205244    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224                       2606    205246    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    224            �           2606    205240    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            �           2606    205242    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    224            �           2606    205182    cities cities_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_stateid_fkey;
       public          postgres    false    220    218    4727            �           2606    205168    states states_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.states DROP CONSTRAINT states_countryid_fkey;
       public          postgres    false    216    4725    218            �           2606    205262    users users_cityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid) ON DELETE SET NULL;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cityid_fkey;
       public          postgres    false    224    220    4729            �           2606    205252    users users_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE SET NULL;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_countryid_fkey;
       public          postgres    false    4725    216    224            �           2606    205247    users users_roleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid) ON DELETE SET NULL;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    222    224    4731            �           2606    205257    users users_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_stateid_fkey;
       public          postgres    false    224    218    4727               m   x�3�4�tJ�K��/J�L�4�4202�50�5�T00�2��22�370667J���	.#NN��ܤ�L��ss�f&撠ńӈө(�8)1�Ǚ��Ң����qqq �6I         L   x�3���K�L�L�4�4202�50�5�T00�21�24�313363J���	.SN��⒢�R4�q�;�<F��� ��          8   x�3�-N-�L�4�4202�50�5�T00�20�22�34����J���	�=... (�
;         v   x�3�4�t/�J,J,�L�4�4202�50�5�T00�2��20�3��000J���	.#NS����Լ�ļ��s�q���e�$���B����K�H�g
��X��X��M��=... Yb:]      "   �   x�u�A�0D׿������q�P�l�XAJj1����63�ͼ�K�7�����):X��d@Cr���������)�Q��M���ז���0��#V;y^�8��*��!) ���GH�@.��h�ي�d˹�N���N	!�\y+�     