PGDMP      ,                }            Products    16.3    16.3 P    [           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            \           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ]           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ^           1262    213459    Products    DATABASE     }   CREATE DATABASE "Products" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Products";
                postgres    false            �            1259    213525    category    TABLE     �  CREATE TABLE public.category (
    categoryid integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    description character varying(250)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    213524    category_categoryid_seq    SEQUENCE     �   CREATE SEQUENCE public.category_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.category_categoryid_seq;
       public          postgres    false    224            _           0    0    category_categoryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.category_categoryid_seq OWNED BY public.category.categoryid;
          public          postgres    false    223            �            1259    213502    cities    TABLE     �  CREATE TABLE public.cities (
    cityid integer NOT NULL,
    stateid integer,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    213501    cities_cityid_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_cityid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.cities_cityid_seq;
       public          postgres    false    220            `           0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
          public          postgres    false    219            �            1259    213479 	   countries    TABLE     �  CREATE TABLE public.countries (
    countryid integer NOT NULL,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    code character varying(20) NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    213478    countries_countryid_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_countryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.countries_countryid_seq;
       public          postgres    false    216            a           0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    215            �            1259    213655    product    TABLE     5  CREATE TABLE public.product (
    productid integer NOT NULL,
    name character varying(100) NOT NULL,
    price numeric(10,2) NOT NULL,
    categoryid integer,
    details character varying(250) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    imagepath text
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    213654    product_productid_seq    SEQUENCE     �   CREATE SEQUENCE public.product_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.product_productid_seq;
       public          postgres    false    228            b           0    0    product_productid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_productid_seq OWNED BY public.product.productid;
          public          postgres    false    227            �            1259    213670    productimage    TABLE     �  CREATE TABLE public.productimage (
    productimageid integer NOT NULL,
    imaegpath text NOT NULL,
    productid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
     DROP TABLE public.productimage;
       public         heap    postgres    false            �            1259    213669    productimage_productimageid_seq    SEQUENCE     �   CREATE SEQUENCE public.productimage_productimageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.productimage_productimageid_seq;
       public          postgres    false    230            c           0    0    productimage_productimageid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.productimage_productimageid_seq OWNED BY public.productimage.productimageid;
          public          postgres    false    229            �            1259    213707    recentlyviewedproduct    TABLE     �  CREATE TABLE public.recentlyviewedproduct (
    recentlyviewedproductid integer NOT NULL,
    viewedat timestamp without time zone NOT NULL,
    userid integer,
    productid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
 )   DROP TABLE public.recentlyviewedproduct;
       public         heap    postgres    false            �            1259    213706 1   recentlyviewedproduct_recentlyviewedproductid_seq    SEQUENCE     �   CREATE SEQUENCE public.recentlyviewedproduct_recentlyviewedproductid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 H   DROP SEQUENCE public.recentlyviewedproduct_recentlyviewedproductid_seq;
       public          postgres    false    232            d           0    0 1   recentlyviewedproduct_recentlyviewedproductid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.recentlyviewedproduct_recentlyviewedproductid_seq OWNED BY public.recentlyviewedproduct.recentlyviewedproductid;
          public          postgres    false    231            �            1259    213516    roles    TABLE     �  CREATE TABLE public.roles (
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
       public         heap    postgres    false            �            1259    213515    roles_roleid_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_roleid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_roleid_seq;
       public          postgres    false    222            e           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
          public          postgres    false    221            �            1259    213488    states    TABLE     �  CREATE TABLE public.states (
    stateid integer NOT NULL,
    countryid integer,
    name character varying(100) NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.states;
       public         heap    postgres    false            �            1259    213487    states_stateid_seq    SEQUENCE     �   CREATE SEQUENCE public.states_stateid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.states_stateid_seq;
       public          postgres    false    218            f           0    0    states_stateid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.states_stateid_seq OWNED BY public.states.stateid;
          public          postgres    false    217            �            1259    213585    users    TABLE     5  CREATE TABLE public.users (
    userid integer NOT NULL,
    roleid integer,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    phone character varying(30) NOT NULL,
    address text,
    countryid integer,
    stateid integer,
    cityid integer,
    zipcode character varying(30),
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    lastlogin timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    213584    users_userid_seq    SEQUENCE     �   CREATE SEQUENCE public.users_userid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.users_userid_seq;
       public          postgres    false    226            g           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    225            �           2604    213528    category categoryid    DEFAULT     z   ALTER TABLE ONLY public.category ALTER COLUMN categoryid SET DEFAULT nextval('public.category_categoryid_seq'::regclass);
 B   ALTER TABLE public.category ALTER COLUMN categoryid DROP DEFAULT;
       public          postgres    false    224    223    224            ~           2604    213505    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    219    220    220            x           2604    213482    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    213658    product productid    DEFAULT     v   ALTER TABLE ONLY public.product ALTER COLUMN productid SET DEFAULT nextval('public.product_productid_seq'::regclass);
 @   ALTER TABLE public.product ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    228    227    228            �           2604    213673    productimage productimageid    DEFAULT     �   ALTER TABLE ONLY public.productimage ALTER COLUMN productimageid SET DEFAULT nextval('public.productimage_productimageid_seq'::regclass);
 J   ALTER TABLE public.productimage ALTER COLUMN productimageid DROP DEFAULT;
       public          postgres    false    230    229    230            �           2604    213710 -   recentlyviewedproduct recentlyviewedproductid    DEFAULT     �   ALTER TABLE ONLY public.recentlyviewedproduct ALTER COLUMN recentlyviewedproductid SET DEFAULT nextval('public.recentlyviewedproduct_recentlyviewedproductid_seq'::regclass);
 \   ALTER TABLE public.recentlyviewedproduct ALTER COLUMN recentlyviewedproductid DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    213519    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    222    221    222            {           2604    213491    states stateid    DEFAULT     p   ALTER TABLE ONLY public.states ALTER COLUMN stateid SET DEFAULT nextval('public.states_stateid_seq'::regclass);
 =   ALTER TABLE public.states ALTER COLUMN stateid DROP DEFAULT;
       public          postgres    false    217    218    218            �           2604    213588    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    225    226    226            P          0    213525    category 
   TABLE DATA           �   COPY public.category (categoryid, name, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, description) FROM stdin;
    public          postgres    false    224   Vm       L          0    213502    cities 
   TABLE DATA           �   COPY public.cities (cityid, stateid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    220   �n       H          0    213479 	   countries 
   TABLE DATA           �   COPY public.countries (countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, code) FROM stdin;
    public          postgres    false    216   �n       T          0    213655    product 
   TABLE DATA           �   COPY public.product (productid, name, price, categoryid, details, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, imagepath) FROM stdin;
    public          postgres    false    228   (o       V          0    213670    productimage 
   TABLE DATA           �   COPY public.productimage (productimageid, imaegpath, productid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    230   qq       X          0    213707    recentlyviewedproduct 
   TABLE DATA           �   COPY public.recentlyviewedproduct (recentlyviewedproductid, viewedat, userid, productid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    232   Es       N          0    213516    roles 
   TABLE DATA           z   COPY public.roles (roleid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    222   �s       J          0    213488    states 
   TABLE DATA           �   COPY public.states (stateid, countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    218   Jt       R          0    213585    users 
   TABLE DATA           �   COPY public.users (userid, roleid, firstname, lastname, username, email, password, phone, address, countryid, stateid, cityid, zipcode, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, lastlogin) FROM stdin;
    public          postgres    false    226   �t       h           0    0    category_categoryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.category_categoryid_seq', 13, true);
          public          postgres    false    223            i           0    0    cities_cityid_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.cities_cityid_seq', 1, true);
          public          postgres    false    219            j           0    0    countries_countryid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.countries_countryid_seq', 2, true);
          public          postgres    false    215            k           0    0    product_productid_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.product_productid_seq', 9, true);
          public          postgres    false    227            l           0    0    productimage_productimageid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.productimage_productimageid_seq', 15, true);
          public          postgres    false    229            m           0    0 1   recentlyviewedproduct_recentlyviewedproductid_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('public.recentlyviewedproduct_recentlyviewedproductid_seq', 8, true);
          public          postgres    false    231            n           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 2, true);
          public          postgres    false    221            o           0    0    states_stateid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.states_stateid_seq', 1, true);
          public          postgres    false    217            p           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 2, true);
          public          postgres    false    225            �           2606    213533    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    224            �           2606    213509    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    220            �           2606    213486    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    216            �           2606    213663    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    228            �           2606    213679    productimage productimage_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_pkey PRIMARY KEY (productimageid);
 H   ALTER TABLE ONLY public.productimage DROP CONSTRAINT productimage_pkey;
       public            postgres    false    230            �           2606    213714 0   recentlyviewedproduct recentlyviewedproduct_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_pkey PRIMARY KEY (recentlyviewedproductid);
 Z   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_pkey;
       public            postgres    false    232            �           2606    213523    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    222            �           2606    213495    states states_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (stateid);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    218            �           2606    213599    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    226            �           2606    213601    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    226            �           2606    213595    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    226            �           2606    213597    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    226            �           2606    213510    cities cities_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_stateid_fkey;
       public          postgres    false    4761    218    220            �           2606    213664    product product_categoryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(categoryid) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.product DROP CONSTRAINT product_categoryid_fkey;
       public          postgres    false    224    228    4767            �           2606    213680 (   productimage productimage_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.productimage DROP CONSTRAINT productimage_productid_fkey;
       public          postgres    false    230    4777    228            �           2606    213720 :   recentlyviewedproduct recentlyviewedproduct_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_productid_fkey;
       public          postgres    false    228    4777    232            �           2606    213715 7   recentlyviewedproduct recentlyviewedproduct_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_userid_fkey;
       public          postgres    false    232    4773    226            �           2606    213496    states states_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.states DROP CONSTRAINT states_countryid_fkey;
       public          postgres    false    218    216    4759            �           2606    213617    users users_cityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cityid_fkey;
       public          postgres    false    220    226    4763            �           2606    213607    users users_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_countryid_fkey;
       public          postgres    false    226    4759    216            �           2606    213602    users users_roleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    226    4765    222            �           2606    213612    users users_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_stateid_fkey;
       public          postgres    false    226    218    4761            P     x�m��n�@Eד��ȏq�+RY��M�&h*�_��Z�l��ﹾ�W��S{���U�P�,�Y"ր� �Ӎ�����nne�������~>�X�r@�=8�ࢂ��U������
J��D��=�P�����8�S/@Po�הQ�?����X���&�r<��}����x���Z��>{<�	��,s�-����aWt1�d��G���Ţrj�N��8�����өM�X8�Ӈ���p ߰�~N��nN���"]�F[��>|�j�F��eC��\�i�;ouUU?#�}      L   ;   x�3�4�J���/�L2��Lu�t�L�LL�L̍�,M��1~`�+F��� ^�7      H   L   x�3���K�L�L�4�4202�50�54T00�20�25�304�47F�4��25�26�3467�� J��qz�q��qqq ���      T   9  x��RMo�@=����$
�*��*��3q�Q��h�)e�z�V�
m�|y��g���=va�5��Bey*W��*S?
&��3X�	��YJ�J��4/f�r�e�f�|�)�d���K9<�.��n2W/h9����c�����ef�V�>�4�+�P��n4ڈ����_��N�����/Ծ��)��k��s%I���������8��C� ��A �4*�Ѵa
���Vn�cc`�zס�l	L�<xJ��!4nhK�68�Ȏ-"JОJ#�0bw㟜d۽�%�R�X�%B���yI�T 2hg-i)w2�\���p�}�𹽧\���cM��~�+E�{�/&�!+6�B|�,���2�?yPO/�2W_]��Cd�Mj�����ZTY���ǵ\��k�I��~�y�i�T[�q����*10�������պ����,2�\�Pzc_�"C�9۞�SE^�v�����V�v�PG��� ˆ�Ͷ��ўG��{�-z)/��&��@�[w��>��F�����1X��B2��j�� �8ɈoJ�Ԛ�A�?*?l�Q�l]̳U\�!�L& �E;      V   �  x����j[A���O��#͏f��
YF�縥v�%o_�ۛkC��rWߑt���7t���J-�#d���@՗F�����o�_��Oc�	6۱�n�����r�,�Ɋ]�H��q���PM�q�����;�� �������2�"���tF�2X�H�Ő@z��"�0q�~�Z��o��C0<Q
D��خ�8���JAz�Cps6|L��#Ԧ#�J\�T[���S�� 8Rv����<)��YJT�Pɐ�@��(�d`PJ�i�-���I�E��oQ-��
�u3�J�h+YHK�W/������7��"��ɗ>��*Gǐz#k�̧ !�h��U�n0/�J������r;�ݛ%R�:겿*T�g^=%�9;q����TF�f�誳�^u{��r�����*y��l�nSk���:Z�L��p���2ߖ���ɯq      X   �   x�uб�0�Z�"X��&EqO�ڀWi�}�T�5�7��&&օl?���bJ&5!y:�弎�:�����s���CQ��b��M�|Cj��řݭC������BU�TL�S	+� ��l
1B�����)�(ܿʬ��:�<@x�B��)�K����`i      N   C   x�3�-N-*�L�4�4202�50�54T00�20�24�35060� J���	.#Nǔ��<�5��qqq X!]      J   =   x�3�4�t/�J,J,�L�4�4202�50�54T00�20�22Գ05261J���	�=... sU�      R   �   x�u����0D��W�b$9J�������\{1��z٦�1��}��-{Y���G@��f�����-�1H6�V�KǛ?�r���M+uVij�(�P|�%}��%�\Kp>����Rb]��h$������z���%��a�~�e��`Ln�&��ߍ��EX�����/*Õ� B&���|�o.�����(d2�;��Z)� V�O�     