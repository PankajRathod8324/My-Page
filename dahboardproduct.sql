PGDMP  -    	                }            Products    16.3    16.3 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    213459    Products    DATABASE     }   CREATE DATABASE "Products" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "Products";
                postgres    false            �            1259    222022    address    TABLE     �  CREATE TABLE public.address (
    addressid integer NOT NULL,
    street text,
    zipcode character varying(30),
    userid integer,
    countryid integer,
    stateid integer,
    cityid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.address;
       public         heap    postgres    false            �            1259    222021    address_addressid_seq    SEQUENCE     �   CREATE SEQUENCE public.address_addressid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.address_addressid_seq;
       public          postgres    false    240                       0    0    address_addressid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.address_addressid_seq OWNED BY public.address.addressid;
          public          postgres    false    239            �            1259    222092    brand    TABLE     �  CREATE TABLE public.brand (
    brandid integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone,
    description text
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    222091    brand_brandid_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_brandid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.brand_brandid_seq;
       public          postgres    false    246                       0    0    brand_brandid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.brand_brandid_seq OWNED BY public.brand.brandid;
          public          postgres    false    245            �            1259    222116    brandmapping    TABLE     �  CREATE TABLE public.brandmapping (
    brandmappingid integer NOT NULL,
    categoryid integer,
    brandid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
     DROP TABLE public.brandmapping;
       public         heap    postgres    false            �            1259    222115    brandmapping_brandmappingid_seq    SEQUENCE     �   CREATE SEQUENCE public.brandmapping_brandmappingid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.brandmapping_brandmappingid_seq;
       public          postgres    false    248                       0    0    brandmapping_brandmappingid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.brandmapping_brandmappingid_seq OWNED BY public.brandmapping.brandmappingid;
          public          postgres    false    247            �            1259    221920    cart    TABLE     t  CREATE TABLE public.cart (
    cartid integer NOT NULL,
    userid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.cart;
       public         heap    postgres    false            �            1259    221919    cart_cartid_seq    SEQUENCE     �   CREATE SEQUENCE public.cart_cartid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cart_cartid_seq;
       public          postgres    false    236                       0    0    cart_cartid_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cart_cartid_seq OWNED BY public.cart.cartid;
          public          postgres    false    235            �            1259    221934 	   cartitems    TABLE     �  CREATE TABLE public.cartitems (
    cartitemid integer NOT NULL,
    cartid integer,
    productid integer,
    quantity integer,
    price numeric(10,2),
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.cartitems;
       public         heap    postgres    false            �            1259    221933    cartitems_cartitemid_seq    SEQUENCE     �   CREATE SEQUENCE public.cartitems_cartitemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cartitems_cartitemid_seq;
       public          postgres    false    238                       0    0    cartitems_cartitemid_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cartitems_cartitemid_seq OWNED BY public.cartitems.cartitemid;
          public          postgres    false    237            �            1259    213525    category    TABLE     �  CREATE TABLE public.category (
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
       public          postgres    false    224                       0    0    category_categoryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.category_categoryid_seq OWNED BY public.category.categoryid;
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
       public          postgres    false    220                       0    0    cities_cityid_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.cities_cityid_seq OWNED BY public.cities.cityid;
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
       public          postgres    false    216                       0    0    countries_countryid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.countries_countryid_seq OWNED BY public.countries.countryid;
          public          postgres    false    215            �            1259    222072 
   orderitems    TABLE     �  CREATE TABLE public.orderitems (
    orderitemid integer NOT NULL,
    orderid integer,
    productid integer,
    quantity integer,
    price numeric(10,2),
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.orderitems;
       public         heap    postgres    false            �            1259    222071    orderitems_orderitemid_seq    SEQUENCE     �   CREATE SEQUENCE public.orderitems_orderitemid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.orderitems_orderitemid_seq;
       public          postgres    false    244                       0    0    orderitems_orderitemid_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.orderitems_orderitemid_seq OWNED BY public.orderitems.orderitemid;
          public          postgres    false    243            �            1259    222053    orders    TABLE     �  CREATE TABLE public.orders (
    orderid integer NOT NULL,
    userid integer,
    addressid integer,
    totalamount numeric(10,2),
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    222052    orders_orderid_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_orderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orders_orderid_seq;
       public          postgres    false    242                       0    0    orders_orderid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orders_orderid_seq OWNED BY public.orders.orderid;
          public          postgres    false    241            �            1259    213655    product    TABLE     {  CREATE TABLE public.product (
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
    imagepath text,
    brandid integer,
    isreturnable boolean DEFAULT false NOT NULL
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
       public          postgres    false    228                       0    0    product_productid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.product_productid_seq OWNED BY public.product.productid;
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
       public          postgres    false    230                        0    0    productimage_productimageid_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.productimage_productimageid_seq OWNED BY public.productimage.productimageid;
          public          postgres    false    229            �            1259    230308    productvariant    TABLE     �  CREATE TABLE public.productvariant (
    productvariantid integer NOT NULL,
    price numeric(10,2),
    productid integer,
    variantid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
 "   DROP TABLE public.productvariant;
       public         heap    postgres    false            �            1259    230307 #   productvariant_productvariantid_seq    SEQUENCE     �   CREATE SEQUENCE public.productvariant_productvariantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.productvariant_productvariantid_seq;
       public          postgres    false    254            !           0    0 #   productvariant_productvariantid_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.productvariant_productvariantid_seq OWNED BY public.productvariant.productvariantid;
          public          postgres    false    253                        1259    230327    productvariantoption    TABLE     �  CREATE TABLE public.productvariantoption (
    productvariantoptionid integer NOT NULL,
    productvariantid integer,
    variantoptionid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
 (   DROP TABLE public.productvariantoption;
       public         heap    postgres    false            �            1259    230326 /   productvariantoption_productvariantoptionid_seq    SEQUENCE     �   CREATE SEQUENCE public.productvariantoption_productvariantoptionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.productvariantoption_productvariantoptionid_seq;
       public          postgres    false    256            "           0    0 /   productvariantoption_productvariantoptionid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.productvariantoption_productvariantoptionid_seq OWNED BY public.productvariantoption.productvariantoptionid;
          public          postgres    false    255            �            1259    213707    recentlyviewedproduct    TABLE     �  CREATE TABLE public.recentlyviewedproduct (
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
       public          postgres    false    232            #           0    0 1   recentlyviewedproduct_recentlyviewedproductid_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.recentlyviewedproduct_recentlyviewedproductid_seq OWNED BY public.recentlyviewedproduct.recentlyviewedproductid;
          public          postgres    false    231                       1259    230349    returnpolicies    TABLE     �  CREATE TABLE public.returnpolicies (
    returnpolicyid integer NOT NULL,
    productid integer,
    name character varying(100),
    returndays integer,
    policydescription text,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
 "   DROP TABLE public.returnpolicies;
       public         heap    postgres    false                       1259    230348 !   returnpolicies_returnpolicyid_seq    SEQUENCE     �   CREATE SEQUENCE public.returnpolicies_returnpolicyid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.returnpolicies_returnpolicyid_seq;
       public          postgres    false    258            $           0    0 !   returnpolicies_returnpolicyid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.returnpolicies_returnpolicyid_seq OWNED BY public.returnpolicies.returnpolicyid;
          public          postgres    false    257            �            1259    213516    roles    TABLE     �  CREATE TABLE public.roles (
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
       public          postgres    false    222            %           0    0    roles_roleid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.roles_roleid_seq OWNED BY public.roles.roleid;
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
       public          postgres    false    218            &           0    0    states_stateid_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.states_stateid_seq OWNED BY public.states.stateid;
          public          postgres    false    217            �            1259    213585    users    TABLE     �  CREATE TABLE public.users (
    userid integer NOT NULL,
    roleid integer,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
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
    lastlogin timestamp without time zone DEFAULT now() NOT NULL,
    "IsActive" boolean DEFAULT true NOT NULL,
    resettoken text,
    resettokenexpirytime timestamp with time zone
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
       public          postgres    false    226            '           0    0    users_userid_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.users_userid_seq OWNED BY public.users.userid;
          public          postgres    false    225            �            1259    230284    variant    TABLE     �  CREATE TABLE public.variant (
    variantid integer NOT NULL,
    name character varying(100) NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
    DROP TABLE public.variant;
       public         heap    postgres    false            �            1259    230283    variant_variantid_seq    SEQUENCE     �   CREATE SEQUENCE public.variant_variantid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.variant_variantid_seq;
       public          postgres    false    250            (           0    0    variant_variantid_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.variant_variantid_seq OWNED BY public.variant.variantid;
          public          postgres    false    249            �            1259    230294    variantoption    TABLE     �  CREATE TABLE public.variantoption (
    variantoptionid integer NOT NULL,
    value character varying(100) NOT NULL,
    variantid integer,
    deleted boolean DEFAULT false NOT NULL,
    createdby integer NOT NULL,
    createdat timestamp without time zone DEFAULT now() NOT NULL,
    modifiedby integer NOT NULL,
    modifiedat timestamp without time zone,
    deletedby integer NOT NULL,
    deletedat timestamp without time zone
);
 !   DROP TABLE public.variantoption;
       public         heap    postgres    false            �            1259    230293 !   variantoption_variantoptionid_seq    SEQUENCE     �   CREATE SEQUENCE public.variantoption_variantoptionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.variantoption_variantoptionid_seq;
       public          postgres    false    252            )           0    0 !   variantoption_variantoptionid_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.variantoption_variantoptionid_seq OWNED BY public.variantoption.variantoptionid;
          public          postgres    false    251            �            1259    213737    wishlist    TABLE     �  CREATE TABLE public.wishlist (
    wishlistid integer NOT NULL,
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
    DROP TABLE public.wishlist;
       public         heap    postgres    false            �            1259    213736    wishlist_wishlistid_seq    SEQUENCE     �   CREATE SEQUENCE public.wishlist_wishlistid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.wishlist_wishlistid_seq;
       public          postgres    false    234            *           0    0    wishlist_wishlistid_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.wishlist_wishlistid_seq OWNED BY public.wishlist.wishlistid;
          public          postgres    false    233            �           2604    222025    address addressid    DEFAULT     v   ALTER TABLE ONLY public.address ALTER COLUMN addressid SET DEFAULT nextval('public.address_addressid_seq'::regclass);
 @   ALTER TABLE public.address ALTER COLUMN addressid DROP DEFAULT;
       public          postgres    false    239    240    240            �           2604    222095    brand brandid    DEFAULT     n   ALTER TABLE ONLY public.brand ALTER COLUMN brandid SET DEFAULT nextval('public.brand_brandid_seq'::regclass);
 <   ALTER TABLE public.brand ALTER COLUMN brandid DROP DEFAULT;
       public          postgres    false    245    246    246            �           2604    222119    brandmapping brandmappingid    DEFAULT     �   ALTER TABLE ONLY public.brandmapping ALTER COLUMN brandmappingid SET DEFAULT nextval('public.brandmapping_brandmappingid_seq'::regclass);
 J   ALTER TABLE public.brandmapping ALTER COLUMN brandmappingid DROP DEFAULT;
       public          postgres    false    248    247    248            �           2604    221923    cart cartid    DEFAULT     j   ALTER TABLE ONLY public.cart ALTER COLUMN cartid SET DEFAULT nextval('public.cart_cartid_seq'::regclass);
 :   ALTER TABLE public.cart ALTER COLUMN cartid DROP DEFAULT;
       public          postgres    false    235    236    236            �           2604    221937    cartitems cartitemid    DEFAULT     |   ALTER TABLE ONLY public.cartitems ALTER COLUMN cartitemid SET DEFAULT nextval('public.cartitems_cartitemid_seq'::regclass);
 C   ALTER TABLE public.cartitems ALTER COLUMN cartitemid DROP DEFAULT;
       public          postgres    false    237    238    238            �           2604    213528    category categoryid    DEFAULT     z   ALTER TABLE ONLY public.category ALTER COLUMN categoryid SET DEFAULT nextval('public.category_categoryid_seq'::regclass);
 B   ALTER TABLE public.category ALTER COLUMN categoryid DROP DEFAULT;
       public          postgres    false    224    223    224            �           2604    213505    cities cityid    DEFAULT     n   ALTER TABLE ONLY public.cities ALTER COLUMN cityid SET DEFAULT nextval('public.cities_cityid_seq'::regclass);
 <   ALTER TABLE public.cities ALTER COLUMN cityid DROP DEFAULT;
       public          postgres    false    220    219    220            �           2604    213482    countries countryid    DEFAULT     z   ALTER TABLE ONLY public.countries ALTER COLUMN countryid SET DEFAULT nextval('public.countries_countryid_seq'::regclass);
 B   ALTER TABLE public.countries ALTER COLUMN countryid DROP DEFAULT;
       public          postgres    false    215    216    216            �           2604    222075    orderitems orderitemid    DEFAULT     �   ALTER TABLE ONLY public.orderitems ALTER COLUMN orderitemid SET DEFAULT nextval('public.orderitems_orderitemid_seq'::regclass);
 E   ALTER TABLE public.orderitems ALTER COLUMN orderitemid DROP DEFAULT;
       public          postgres    false    244    243    244            �           2604    222056    orders orderid    DEFAULT     p   ALTER TABLE ONLY public.orders ALTER COLUMN orderid SET DEFAULT nextval('public.orders_orderid_seq'::regclass);
 =   ALTER TABLE public.orders ALTER COLUMN orderid DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    213658    product productid    DEFAULT     v   ALTER TABLE ONLY public.product ALTER COLUMN productid SET DEFAULT nextval('public.product_productid_seq'::regclass);
 @   ALTER TABLE public.product ALTER COLUMN productid DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    213673    productimage productimageid    DEFAULT     �   ALTER TABLE ONLY public.productimage ALTER COLUMN productimageid SET DEFAULT nextval('public.productimage_productimageid_seq'::regclass);
 J   ALTER TABLE public.productimage ALTER COLUMN productimageid DROP DEFAULT;
       public          postgres    false    229    230    230            �           2604    230311    productvariant productvariantid    DEFAULT     �   ALTER TABLE ONLY public.productvariant ALTER COLUMN productvariantid SET DEFAULT nextval('public.productvariant_productvariantid_seq'::regclass);
 N   ALTER TABLE public.productvariant ALTER COLUMN productvariantid DROP DEFAULT;
       public          postgres    false    254    253    254            �           2604    230330 +   productvariantoption productvariantoptionid    DEFAULT     �   ALTER TABLE ONLY public.productvariantoption ALTER COLUMN productvariantoptionid SET DEFAULT nextval('public.productvariantoption_productvariantoptionid_seq'::regclass);
 Z   ALTER TABLE public.productvariantoption ALTER COLUMN productvariantoptionid DROP DEFAULT;
       public          postgres    false    255    256    256            �           2604    213710 -   recentlyviewedproduct recentlyviewedproductid    DEFAULT     �   ALTER TABLE ONLY public.recentlyviewedproduct ALTER COLUMN recentlyviewedproductid SET DEFAULT nextval('public.recentlyviewedproduct_recentlyviewedproductid_seq'::regclass);
 \   ALTER TABLE public.recentlyviewedproduct ALTER COLUMN recentlyviewedproductid DROP DEFAULT;
       public          postgres    false    231    232    232            �           2604    230352    returnpolicies returnpolicyid    DEFAULT     �   ALTER TABLE ONLY public.returnpolicies ALTER COLUMN returnpolicyid SET DEFAULT nextval('public.returnpolicies_returnpolicyid_seq'::regclass);
 L   ALTER TABLE public.returnpolicies ALTER COLUMN returnpolicyid DROP DEFAULT;
       public          postgres    false    258    257    258            �           2604    213519    roles roleid    DEFAULT     l   ALTER TABLE ONLY public.roles ALTER COLUMN roleid SET DEFAULT nextval('public.roles_roleid_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN roleid DROP DEFAULT;
       public          postgres    false    221    222    222            �           2604    213491    states stateid    DEFAULT     p   ALTER TABLE ONLY public.states ALTER COLUMN stateid SET DEFAULT nextval('public.states_stateid_seq'::regclass);
 =   ALTER TABLE public.states ALTER COLUMN stateid DROP DEFAULT;
       public          postgres    false    218    217    218            �           2604    213588    users userid    DEFAULT     l   ALTER TABLE ONLY public.users ALTER COLUMN userid SET DEFAULT nextval('public.users_userid_seq'::regclass);
 ;   ALTER TABLE public.users ALTER COLUMN userid DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    230287    variant variantid    DEFAULT     v   ALTER TABLE ONLY public.variant ALTER COLUMN variantid SET DEFAULT nextval('public.variant_variantid_seq'::regclass);
 @   ALTER TABLE public.variant ALTER COLUMN variantid DROP DEFAULT;
       public          postgres    false    250    249    250            �           2604    230297    variantoption variantoptionid    DEFAULT     �   ALTER TABLE ONLY public.variantoption ALTER COLUMN variantoptionid SET DEFAULT nextval('public.variantoption_variantoptionid_seq'::regclass);
 L   ALTER TABLE public.variantoption ALTER COLUMN variantoptionid DROP DEFAULT;
       public          postgres    false    252    251    252            �           2604    213740    wishlist wishlistid    DEFAULT     z   ALTER TABLE ONLY public.wishlist ALTER COLUMN wishlistid SET DEFAULT nextval('public.wishlist_wishlistid_seq'::regclass);
 B   ALTER TABLE public.wishlist ALTER COLUMN wishlistid DROP DEFAULT;
       public          postgres    false    234    233    234            �          0    222022    address 
   TABLE DATA           �   COPY public.address (addressid, street, zipcode, userid, countryid, stateid, cityid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    240   �                0    222092    brand 
   TABLE DATA           �   COPY public.brand (brandid, name, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, description) FROM stdin;
    public          postgres    false    246                   0    222116    brandmapping 
   TABLE DATA           �   COPY public.brandmapping (brandmappingid, categoryid, brandid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    248   �      �          0    221920    cart 
   TABLE DATA           {   COPY public.cart (cartid, userid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    236   H      �          0    221934 	   cartitems 
   TABLE DATA           �   COPY public.cartitems (cartitemid, cartid, productid, quantity, price, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    238   �      �          0    213525    category 
   TABLE DATA           �   COPY public.category (categoryid, name, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, description) FROM stdin;
    public          postgres    false    224   $      �          0    213502    cities 
   TABLE DATA           �   COPY public.cities (cityid, stateid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    220   �      �          0    213479 	   countries 
   TABLE DATA           �   COPY public.countries (countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, code) FROM stdin;
    public          postgres    false    216   8                 0    222072 
   orderitems 
   TABLE DATA           �   COPY public.orderitems (orderitemid, orderid, productid, quantity, price, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    244   �      �          0    222053    orders 
   TABLE DATA           �   COPY public.orders (orderid, userid, addressid, totalamount, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    242   4      �          0    213655    product 
   TABLE DATA           �   COPY public.product (productid, name, price, categoryid, details, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, imagepath, brandid, isreturnable) FROM stdin;
    public          postgres    false    228   �      �          0    213670    productimage 
   TABLE DATA           �   COPY public.productimage (productimageid, imaegpath, productid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    230   ]"      
          0    230308    productvariant 
   TABLE DATA           �   COPY public.productvariant (productvariantid, price, productid, variantid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    254   �-                0    230327    productvariantoption 
   TABLE DATA           �   COPY public.productvariantoption (productvariantoptionid, productvariantid, variantoptionid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    256   �-      �          0    213707    recentlyviewedproduct 
   TABLE DATA           �   COPY public.recentlyviewedproduct (recentlyviewedproductid, viewedat, userid, productid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    232   .                0    230349    returnpolicies 
   TABLE DATA           �   COPY public.returnpolicies (returnpolicyid, productid, name, returndays, policydescription, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    258   >0      �          0    213516    roles 
   TABLE DATA           z   COPY public.roles (roleid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    222   1      �          0    213488    states 
   TABLE DATA           �   COPY public.states (stateid, countryid, name, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    218   n1      �          0    213585    users 
   TABLE DATA             COPY public.users (userid, roleid, firstname, lastname, username, email, password, phone, address, countryid, stateid, cityid, zipcode, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat, lastlogin, "IsActive", resettoken, resettokenexpirytime) FROM stdin;
    public          postgres    false    226   �1                0    230284    variant 
   TABLE DATA           �   COPY public.variant (variantid, name, active, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    250   v4                0    230294    variantoption 
   TABLE DATA           �   COPY public.variantoption (variantoptionid, value, variantid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    252   �4      �          0    213737    wishlist 
   TABLE DATA           �   COPY public.wishlist (wishlistid, userid, productid, deleted, createdby, createdat, modifiedby, modifiedat, deletedby, deletedat) FROM stdin;
    public          postgres    false    234   �4      +           0    0    address_addressid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.address_addressid_seq', 1, false);
          public          postgres    false    239            ,           0    0    brand_brandid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.brand_brandid_seq', 10, true);
          public          postgres    false    245            -           0    0    brandmapping_brandmappingid_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.brandmapping_brandmappingid_seq', 22, true);
          public          postgres    false    247            .           0    0    cart_cartid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cart_cartid_seq', 18, true);
          public          postgres    false    235            /           0    0    cartitems_cartitemid_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.cartitems_cartitemid_seq', 36, true);
          public          postgres    false    237            0           0    0    category_categoryid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.category_categoryid_seq', 15, true);
          public          postgres    false    223            1           0    0    cities_cityid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.cities_cityid_seq', 10, true);
          public          postgres    false    219            2           0    0    countries_countryid_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.countries_countryid_seq', 5, true);
          public          postgres    false    215            3           0    0    orderitems_orderitemid_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.orderitems_orderitemid_seq', 4, true);
          public          postgres    false    243            4           0    0    orders_orderid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.orders_orderid_seq', 3, true);
          public          postgres    false    241            5           0    0    product_productid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.product_productid_seq', 28, true);
          public          postgres    false    227            6           0    0    productimage_productimageid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.productimage_productimageid_seq', 113, true);
          public          postgres    false    229            7           0    0 #   productvariant_productvariantid_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.productvariant_productvariantid_seq', 1, false);
          public          postgres    false    253            8           0    0 /   productvariantoption_productvariantoptionid_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.productvariantoption_productvariantoptionid_seq', 1, false);
          public          postgres    false    255            9           0    0 1   recentlyviewedproduct_recentlyviewedproductid_seq    SEQUENCE SET     `   SELECT pg_catalog.setval('public.recentlyviewedproduct_recentlyviewedproductid_seq', 36, true);
          public          postgres    false    231            :           0    0 !   returnpolicies_returnpolicyid_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.returnpolicies_returnpolicyid_seq', 5, true);
          public          postgres    false    257            ;           0    0    roles_roleid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.roles_roleid_seq', 2, true);
          public          postgres    false    221            <           0    0    states_stateid_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.states_stateid_seq', 1, true);
          public          postgres    false    217            =           0    0    users_userid_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.users_userid_seq', 9, true);
          public          postgres    false    225            >           0    0    variant_variantid_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.variant_variantid_seq', 1, false);
          public          postgres    false    249            ?           0    0 !   variantoption_variantoptionid_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.variantoption_variantoptionid_seq', 1, false);
          public          postgres    false    251            @           0    0    wishlist_wishlistid_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.wishlist_wishlistid_seq', 49, true);
          public          postgres    false    233            !           2606    222031    address address_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (addressid);
 >   ALTER TABLE ONLY public.address DROP CONSTRAINT address_pkey;
       public            postgres    false    240            '           2606    222100    brand brand_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brandid);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    246            )           2606    222123    brandmapping brandmapping_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.brandmapping
    ADD CONSTRAINT brandmapping_pkey PRIMARY KEY (brandmappingid);
 H   ALTER TABLE ONLY public.brandmapping DROP CONSTRAINT brandmapping_pkey;
       public            postgres    false    248                       2606    221927    cart cart_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_pkey PRIMARY KEY (cartid);
 8   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_pkey;
       public            postgres    false    236                       2606    221941    cartitems cartitems_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_pkey PRIMARY KEY (cartitemid);
 B   ALTER TABLE ONLY public.cartitems DROP CONSTRAINT cartitems_pkey;
       public            postgres    false    238                       2606    213533    category category_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (categoryid);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    224                       2606    213509    cities cities_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (cityid);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    220                       2606    213486    countries countries_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (countryid);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    216            %           2606    222079    orderitems orderitems_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_pkey PRIMARY KEY (orderitemid);
 D   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_pkey;
       public            postgres    false    244            #           2606    222060    orders orders_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (orderid);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    242                       2606    213663    product product_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (productid);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    228                       2606    213679    productimage productimage_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_pkey PRIMARY KEY (productimageid);
 H   ALTER TABLE ONLY public.productimage DROP CONSTRAINT productimage_pkey;
       public            postgres    false    230            /           2606    230315 "   productvariant productvariant_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.productvariant
    ADD CONSTRAINT productvariant_pkey PRIMARY KEY (productvariantid);
 L   ALTER TABLE ONLY public.productvariant DROP CONSTRAINT productvariant_pkey;
       public            postgres    false    254            1           2606    230334 .   productvariantoption productvariantoption_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.productvariantoption
    ADD CONSTRAINT productvariantoption_pkey PRIMARY KEY (productvariantoptionid);
 X   ALTER TABLE ONLY public.productvariantoption DROP CONSTRAINT productvariantoption_pkey;
       public            postgres    false    256                       2606    213714 0   recentlyviewedproduct recentlyviewedproduct_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_pkey PRIMARY KEY (recentlyviewedproductid);
 Z   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_pkey;
       public            postgres    false    232            3           2606    230358 "   returnpolicies returnpolicies_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.returnpolicies
    ADD CONSTRAINT returnpolicies_pkey PRIMARY KEY (returnpolicyid);
 L   ALTER TABLE ONLY public.returnpolicies DROP CONSTRAINT returnpolicies_pkey;
       public            postgres    false    258            	           2606    213523    roles roles_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (roleid);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    222                       2606    213495    states states_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (stateid);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    218                       2606    213599    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    226                       2606    213601    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    226                       2606    213595    users users_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (userid);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    226                       2606    213597    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    226            +           2606    230292    variant variant_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.variant
    ADD CONSTRAINT variant_pkey PRIMARY KEY (variantid);
 >   ALTER TABLE ONLY public.variant DROP CONSTRAINT variant_pkey;
       public            postgres    false    250            -           2606    230301     variantoption variantoption_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.variantoption
    ADD CONSTRAINT variantoption_pkey PRIMARY KEY (variantoptionid);
 J   ALTER TABLE ONLY public.variantoption DROP CONSTRAINT variantoption_pkey;
       public            postgres    false    252                       2606    213744    wishlist wishlist_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_pkey PRIMARY KEY (wishlistid);
 @   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_pkey;
       public            postgres    false    234            D           2606    222047    address address_cityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.address DROP CONSTRAINT address_cityid_fkey;
       public          postgres    false    240    4871    220            E           2606    222037    address address_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.address DROP CONSTRAINT address_countryid_fkey;
       public          postgres    false    240    216    4867            F           2606    222042    address address_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.address DROP CONSTRAINT address_stateid_fkey;
       public          postgres    false    218    240    4869            G           2606    222032    address address_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.address DROP CONSTRAINT address_userid_fkey;
       public          postgres    false    226    4881    240            :           2606    222134    product brandid    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT brandid FOREIGN KEY (brandid) REFERENCES public.brand(brandid) ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.product DROP CONSTRAINT brandid;
       public          postgres    false    228    4903    246            L           2606    222129 &   brandmapping brandmapping_brandid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brandmapping
    ADD CONSTRAINT brandmapping_brandid_fkey FOREIGN KEY (brandid) REFERENCES public.brand(brandid) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.brandmapping DROP CONSTRAINT brandmapping_brandid_fkey;
       public          postgres    false    246    4903    248            M           2606    222124 )   brandmapping brandmapping_categoryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.brandmapping
    ADD CONSTRAINT brandmapping_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(categoryid) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.brandmapping DROP CONSTRAINT brandmapping_categoryid_fkey;
       public          postgres    false    4875    248    224            A           2606    221928    cart cart_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cart
    ADD CONSTRAINT cart_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 ?   ALTER TABLE ONLY public.cart DROP CONSTRAINT cart_userid_fkey;
       public          postgres    false    4881    226    236            B           2606    221942    cartitems cartitems_cartid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_cartid_fkey FOREIGN KEY (cartid) REFERENCES public.cart(cartid) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.cartitems DROP CONSTRAINT cartitems_cartid_fkey;
       public          postgres    false    236    238    4893            C           2606    221947 "   cartitems cartitems_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cartitems
    ADD CONSTRAINT cartitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.cartitems DROP CONSTRAINT cartitems_productid_fkey;
       public          postgres    false    238    4885    228            5           2606    213510    cities cities_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_stateid_fkey;
       public          postgres    false    220    218    4869            J           2606    222080 "   orderitems orderitems_orderid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_orderid_fkey FOREIGN KEY (orderid) REFERENCES public.orders(orderid) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_orderid_fkey;
       public          postgres    false    242    244    4899            K           2606    222085 $   orderitems orderitems_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orderitems
    ADD CONSTRAINT orderitems_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.orderitems DROP CONSTRAINT orderitems_productid_fkey;
       public          postgres    false    4885    228    244            H           2606    222066    orders orders_addressid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_addressid_fkey FOREIGN KEY (addressid) REFERENCES public.address(addressid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_addressid_fkey;
       public          postgres    false    242    4897    240            I           2606    222061    orders orders_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_userid_fkey;
       public          postgres    false    4881    242    226            ;           2606    213664    product product_categoryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.category(categoryid) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.product DROP CONSTRAINT product_categoryid_fkey;
       public          postgres    false    4875    228    224            <           2606    213680 (   productimage productimage_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productimage
    ADD CONSTRAINT productimage_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.productimage DROP CONSTRAINT productimage_productid_fkey;
       public          postgres    false    230    228    4885            O           2606    230316 ,   productvariant productvariant_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productvariant
    ADD CONSTRAINT productvariant_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.productvariant DROP CONSTRAINT productvariant_productid_fkey;
       public          postgres    false    254    228    4885            P           2606    230321 ,   productvariant productvariant_variantid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productvariant
    ADD CONSTRAINT productvariant_variantid_fkey FOREIGN KEY (variantid) REFERENCES public.variant(variantid) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.productvariant DROP CONSTRAINT productvariant_variantid_fkey;
       public          postgres    false    254    4907    250            Q           2606    230335 ?   productvariantoption productvariantoption_productvariantid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productvariantoption
    ADD CONSTRAINT productvariantoption_productvariantid_fkey FOREIGN KEY (productvariantid) REFERENCES public.productvariant(productvariantid) ON DELETE CASCADE;
 i   ALTER TABLE ONLY public.productvariantoption DROP CONSTRAINT productvariantoption_productvariantid_fkey;
       public          postgres    false    254    4911    256            R           2606    230340 >   productvariantoption productvariantoption_variantoptionid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.productvariantoption
    ADD CONSTRAINT productvariantoption_variantoptionid_fkey FOREIGN KEY (variantoptionid) REFERENCES public.variantoption(variantoptionid) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.productvariantoption DROP CONSTRAINT productvariantoption_variantoptionid_fkey;
       public          postgres    false    256    4909    252            =           2606    213720 :   recentlyviewedproduct recentlyviewedproduct_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_productid_fkey;
       public          postgres    false    228    4885    232            >           2606    213715 7   recentlyviewedproduct recentlyviewedproduct_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.recentlyviewedproduct
    ADD CONSTRAINT recentlyviewedproduct_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 a   ALTER TABLE ONLY public.recentlyviewedproduct DROP CONSTRAINT recentlyviewedproduct_userid_fkey;
       public          postgres    false    4881    226    232            S           2606    230359 ,   returnpolicies returnpolicies_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.returnpolicies
    ADD CONSTRAINT returnpolicies_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.returnpolicies DROP CONSTRAINT returnpolicies_productid_fkey;
       public          postgres    false    228    258    4885            4           2606    213496    states states_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.states DROP CONSTRAINT states_countryid_fkey;
       public          postgres    false    216    4867    218            6           2606    213617    users users_cityid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cityid_fkey FOREIGN KEY (cityid) REFERENCES public.cities(cityid) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_cityid_fkey;
       public          postgres    false    4871    220    226            7           2606    213607    users users_countryid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(countryid) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.users DROP CONSTRAINT users_countryid_fkey;
       public          postgres    false    226    4867    216            8           2606    213602    users users_roleid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_roleid_fkey FOREIGN KEY (roleid) REFERENCES public.roles(roleid) ON DELETE CASCADE;
 A   ALTER TABLE ONLY public.users DROP CONSTRAINT users_roleid_fkey;
       public          postgres    false    222    226    4873            9           2606    213612    users users_stateid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_stateid_fkey FOREIGN KEY (stateid) REFERENCES public.states(stateid) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_stateid_fkey;
       public          postgres    false    4869    218    226            N           2606    230302 *   variantoption variantoption_variantid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.variantoption
    ADD CONSTRAINT variantoption_variantid_fkey FOREIGN KEY (variantid) REFERENCES public.variant(variantid) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.variantoption DROP CONSTRAINT variantoption_variantid_fkey;
       public          postgres    false    250    252    4907            ?           2606    213750     wishlist wishlist_productid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_productid_fkey FOREIGN KEY (productid) REFERENCES public.product(productid) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_productid_fkey;
       public          postgres    false    234    4885    228            @           2606    213745    wishlist wishlist_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.wishlist
    ADD CONSTRAINT wishlist_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(userid) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.wishlist DROP CONSTRAINT wishlist_userid_fkey;
       public          postgres    false    234    4881    226            �      x������ � �         �   x����j�0�ϓ��&��$�����m{�"Ml]�lٷ���B\f���}�o��e+	I�m�a�B]l�B%�%\S.-J���F�k��	��2lr{��� )��x�Q�䛮��T��݁4��hU�},����57���9Z��y����pj�y��{����Vh��L��џ?�L����J������DGTk��g;h,r�3�B��� ��W�:��]3B�M�}h         G   x�34��4NN�̼�̼̒J ;�Lp�%�qK�sZ !.i#�n�� ��pKq�rZ┏���� J�+      �   \   x�M���0�Ni ��9�*ț�K ��x�|v4pr:�T�E%C3��D�;	��A���φe�@���sZ��SҢu�fu���8�t9/�      �   `   x�u���@Ck�"8�������(]�Ʋ���A�ɜ�Z5踪�bE��Ecꘀ��I�}{�=oUq�U%�#[���>c�T3���wa���m      �   L  x����n�@���S�p�}�ܝ�20�JT���	d �B�D��&P
��-�߿��Nf^~�]�)��7�AC@<�|�8�h��Z\/��z�!�šk��ЕO�N0���18��W
�=�UӏT$��F��}Y��t���c1~9��͢m?���ųx��ӿ�\�m��SoɃ
_v�w�l��,�ն�����b� 
��d�K~�����?�C;gfuS�
�8��L�UeW���Pb�to�ŜS8 �-�	�A�-x �k��r �㤫�`�I4�O�=��f�+��u�6��DD��V�4j�[ݒ'�3/��_�,�~ x�&      �   �   x�}ϱ�0�}
_ �
ʦ��&�8��Z�*���ޫ{Y�����$���{�YGQ	�Q$Rn����r��e�v��M�/<�v]<`�u�uv�R&
W$����a�*'U��R9����	eR�;N�`����y�}T�$N�Om�k#|;بّ��LQԤ���N`      �   �   x�}�;�0E�zfl�֌���E4�� K@d	�H�"vOB�"i^s���>O)���ST*�ȓ�N4q�T����x�R٦~�1@P�}>�{\�?��r�v��8����.�֘���t�W1�����/d          U   x�}�1� ����.�5�Kxf�.L.�ާ�,;|i32Je�-�b@��1㺹���s�U*YSwO�/������n�$"z�#4      �   b   x�m˱�0�O�b=`�a�L�:���XiRXB/��cb�Yo���b'��~pOD��k����"b�3�> M~P?Ȣ����iZ���g-�<�<�      �   �  x��YQs�6�}f~ڙ��c�K� 	�O�c;޵��i�3� %��%);��C�������/�PRd'm�IF	^^�{��"4��U�>n�<����2��G=re�@n�Z�ϣ���2�nB�ά���hӗ��<t�m�&eM釮�DU�UYcMѩ�!射%R�V���{C��3����i�e?��`"��N�w���g�D75)��WMgHެ�kPYeȢ+ۀ���7݆�eno�
l�/뢬�a��^F��&��)M�!ӄz���[���J-L��4�Yb"᧡�>S��2�OS���\&涬�����j/���W�3�Y^ֽ�KI��za�/"o�,���Q��'����9t������|w��O��ӘO#�X&� ��o�"�N�\�4��� =�.���}�"������3W]��.�}SDwe��"����6�3��:��z��Isg&_�a�kk��u��am�dd��O/;iV��7���M��T���v�VdQ5��H�ٟ}S9(5XB�0��z�J���gav܈F9�D[��`�<'�锻(R�c*�Q��\��5P��l�M�B�H�lj�{��8%!��)��H�T&}����r�S\2���co���(���x��SD���I�TF!ۛd޼����'�c�h�)�(��4���g��MO�u@�{S���͠ʪ��e�XV��`/܊A����5+5q9�G��~٬�RU�Y�ڽ�>���Wz��?<I0��UX5ZEr��6�e�G�{fjS�Èʼ�k�Ü��ѳn:Sk��y~� ��H�}�w�>��j��$"�{����W_=߸D�$���S�bf����o��ѳ�r HR�{�»j(K4�h4:,���V� =D��r�뭟#>����̀͡��Tm��k������]���lRjy�'A'1c{g!����h��,T!�塟�(d��L��n���v��#�:7ݮH��M�+L�=c�[g$�DP}j(U"L��$,�YF�L�_g��)O���o��T�320Y�� ŋ�mǏ�I�Һ/\㋟�����0/r�_GE�3��9��+�����.��C�۬��"��B�2�7=ٶ=�;���_���w77�ޒ�../��_deұ�����0�bXھh���$��닷�S2��ɇq�6u�B�Z�u�7���i�>�c=@�E,�����EM�8��,a>*�UD#?�H+MLJu|���w7j�]��<���b��fXZ�t5N^F�[2��=�`b��?XB^�wf3!���>����'�:G]ýoɯ�}k;4M������%Ic"���#G<�_	�f�h���:�l�ɨ�~%I�~M���]�������ƮL�T݀<�,-��� ���=vIZ�Zi�+!��
%|ɀB�扲�$��
��Q:��(�m��};�b�
n�s/�hc쾸��|U��F��ؑ���;��۰CwX�17۩p����
��R���%�N��4$��v޼��Em\:��
=F��76���W����j�y�4�M7��L�g ��iL�!x�R��)3<��H@vؔ��>��;X�" �8o��b9�&�#��O#8�9;uQf�mz��5�룤*4��8�Kp���j���2�s];�lC����l�l!_:�8���y}D^oj�*��V�9�9�89ܗ�����ݱOTkc]��v�<�N�@zvC�ʝ.h��ƺq��8��0�<d���hK�@x�I�(�>Ub�2*�oD��(�Ena޿����Ǘ!��@ �=<.���7jo���n鉛�^�~��-F���;||�� ��d�h����1�U���~G�W����x 4qY�)A?c��*�p_�hm��S�HDnT�	��-���䕺;�v�?>ٻ����Q����")�q�g�Z�˲S���_�n���ԛת�(k�K<6�b����ߖ&��)�\��	���ϓ�{;�8�iWZ�{���q�8�p5�*�.�K��(��"rcy��zX�c�׋	~�H]e�e3�4P��fƍB�~޹>�}L9�Ti?��Y$
_r����⸐����M��э��_�/�.��q�A���di�;HIo{�\C}��g��uU�=j �ט�\�'�n�B�ۢ�Ia{˄̚Ҷ�|�M����G5$|m�H�5�`̴g�U�M�]@�����X�&g�_���k_�)���e�y��{`�xnTp�[c�=<8����&��`4�7�������<��������\E	+��C��7�� ��^��^^��ž8��2��0"l����̧�����6�ՐB��o�ٸ�lZ3%�f�fn\q��5�;ȟ3��R�ms��	2��YZ�A�(MPyM�Ns�a8�#<�ues?�BX�@�/�(΅(☥����M����%�2��N�"s{d��Yx�vl��������%J	m�^��8�:�{���k��:��=A�6k7on���Bf,�A�l�o]U�f=��%�w|E\w��Ci���������t�ڭG���l����v^~�� =n��ݬ�*�n�XK�F8���(�L��i隰0}*]	u��~R`5�H9�P�y�q�2L�)�߄g��#eE��^�~vlh� ���K��O�,��_��%{6��u�����+h#��;F���
��,����B7�ieVM�J��2aVTe�}�K����g&.
�����<���?��F$98���#�\��_$�O�;�.��KZ!�H��	($��W�q?.RM���[I�O�a���|�BR�H�?�~�R�VU� N�B���r�̻�ҭ�1�.�v�C)<�����:��H.�%t��	1�Y ��[͝c��_���S2/+0�?X�W֕ŀzSٙN��N��84k�������TB�L�t� �$��q@#�@�\�,���Tb��"pr.EHc�e�n1i�-h x0Y;��N��w��[�y^����dq��C^Uk�1��p6;���V �5o'���*W�K��;���9��Z������{\��ݹ#nNހ�tؕv�`tJ� �4�O�(9�,��O�KsL:V~z�4̕(��R�+k��)QD�F�x&������#�}����t���f��%gn���9����xB���0C�rzog2���stZ�<Yc��L D0�4]]�cȪ�=ā�`�,�]o�ý�nJ���z�>��o:m��Y�?�o=���lpX�Ҟ�Q��0�,��(Y峘g����]PϚ	�������U�M������H|�[?B�38�Dy�ȕh�M����o\~/<�F1r�N>up�2ʕ�E��o�_Z��k�i��?b�Q$9Y�z߈�w�u�ֹ�n�*��a�����n���~�Tf<�E�w���n=�7���^m���a.��*��>+�L�:��РF�Ɋ�җq�i0���~|�3%�'~&8�tR`�N0Z�E�ǹ�����9x����  �6I      �   Z  x��Z[s�7|6�"���ݥǰ���,x!�T�I#c��6��uBYg]u.�ʾ��?��{��cg��?��'r�}ȉb(Q5��r��*�X�L-!�f��E��+�)����WoC̋��/N�t��{��N������W|�����=go ����JR��9�Tj*g�-���E�.|=8:�w�p7�D��UB�ʕ�Ub�8'͎jJ��kϟ�w��7��$�
:5@�r3���O�z�-�>:���i�Tw��7dJ-IHuBq'�+�1+�Ֆ�k�6-���jYӮ�0�:�@j-(�Q3��TLZ����q�r������'�7f�p�QeW�r&�|hhS�5��񋟿�_�oyj�ח����ƛ�������Y9����EQ0QJO�^��/g��s��o�����Ӿ����i���{#Ub�ű*[�.������Jq����_��֖}���Zz��Z��J.eÍ�D����ūz)rv����;Cƣ���w::������=�i��ei�gP�<��]�LV��7��o@2ې�C�1Ze��.�2u:K-�F��-��z1����;gP�tR.�2J*I�(�"��&(�AM�ʺ��l
Dh�Kҥ*�#�^����������@��lPĩ�J��fT�RX��D����1�jC�)�"n;�j���v����\���$�"�	�WD���2�� A^r�R):�j���+>�>�D�mu����V�ƪ��*xjN��V{k>hcŭ�?��9��s�gV!��P[�����ڻ�[��������0W�u�q�/�A==�R�_!d�rN0xk���w+�Vn*�ԱC]����L��������m�Vt0D��B�U�]�<ʆz����V�!�VW����J]�d�(�[
����W֞/1�
T��r�q��$%8��č\�t�
=)ѵ7�CPJ4�-�TM�*�ȱ��;tJ[�WX���U3'���p�*�N�����Z�5ٔ`^9�*	�s�N�1�L���=�i�w�&�������
	Q�
5h�4θ����n8���Xs'���������/�;%�{3!R_nk����VT +���
�	��U�
zyEB%C���6��bt����Yc܂U�e�X�dL���o*<��KW����3|���ؖ�˚t����G��3^���^�p�T�|�S�y�Ta�k��Hv8��R���ړ�"�J#�dlM(��MDӻD�	��Wk���'�)S�$ZiB;�1k9Ⱥ��S����?��|tdn���F�NkL�c��XL�3�&4��.��t3.��$>{�uw��Zlb���0���y�C�ab��KםN��izY��`w��X8���<�J���\T�8�,8�CEh,�=:~����z�e'QF�T��#����:��5"v�@������b6T).⦛�($l{RV/e �>����D��{�3����R*2�v�+9�L5ґ��e��S�|x�ѥ��!&���<� �>��
KU1:6���1Q?ԋ������� 1%6�rUuY�$�y��ږ�����WB��!��Eq&f l�����[eS��2~�������X�N�d�m�+kp*�PB훐i�^}������2�b
�a;|�H�0&����T�>�qԗ�Ϯ^>�|���m��zW]�& ���.O!*1y��5Y�ҷ��~~�v�p+��T5EK�۫��zuL.("�a9�g8�iw�){��iZ�"�M�9O&`�i�h� q�F?��bʞ0��p�	��t��ƺ̚��&n� ����Ɇ���C������x	�4�i4�w�$��K|��g�0�Ͷ�r�%����zg���IL�qp����� ��BO�[�,i0Q��'1��	v�z��7�m�aj�qkI�u���'�xZ'�����9bl��ꁩ)��E�g4\{lQѸu[��K��c�TN0�P���ֽ�ʚ��嚵�;g�M�Sm�#OR��#�:dKx[ig�2�����o�f�J��e�xF������fC���rK�g�V�_\�]-���7���*L��K�b�Vƪ�X5�	$�Ks�`?{x��o�bw��H9���`�tR֧ܛp(�/ܫ���v�Xy�XS	�%	7�r�X��>��3�M���?��rx��6�5�t���+`�l�0�L�cn-W�S�%��;Cĩ*k?���t�oO�u!��a!٘u@<���ߒw� �g��b�aЧ8�3 ���p`1��X��1Qo��k>,�C��"��]��������Ї�zz��x������N�������VԀS)�)-0���3jP��,`M���������nw����Xk6��Kyx���$��̗ja ������[6f�d��:�Mö�)r^d �$<�V�����ק������z)�e�yS!�N�V����,�4�p|^�U˯�~��|�XӤ^��������Q\�(K�����w�h�Wztx�;Ĥ^��4^�t?^�Fn*S�7#�5�  ���'��Fm�Z`�E���q�Ki!%�E�ʹ�@6'�><��Ǳ;J;C�I=��f�kE@L!�AJL
�>��i�~����ǻCL�%4�6`@��Y� �{Ƞx�Yģ��=Q�x�bRO��$��bbotx�\P�خq�k���b}�ʓz�R�X�EH)0��]��a��� 1��L�à*87��b�qUu�p�ôa_l����Q�ړ���Ѩ���,p����=���b���}״�=�p4�����а/r�c*�~_l�ji�ߘ6���TaA���}� ��꽒[i�l��f嫟�s����d� rCkagU�.Q0���l^~������"�bs핿H�qf��� '��x�%.�yV\����Z��������Y      
      x������ � �            x������ � �      �   -  x�}�=�1���)|���C�[/��Vir��� �-�����G��8���;�`"��.q�ю����������?�����sk3��B�H�K���w�C�E���KT�?�xG��F�,{ݡ�S5���@��,H�ov�l�.(̆�z+���SU���4g�Q����(+(����>�mC���$Ӻ(>LI�� �����7�A��Bm�z�7wé�;s����Z5�* u�=�ps�J��w��J&^�mFyP�T(QY7�l�<~K�Acn�sԵHz�K�`Hɻnv>�T�=%�Oon�i1rG&�7
F�*��Ȧx@�N�噍ex��i8���Κkmi�Y����7K�Y"ϲ��>�k�ךi���tx�\�
O`z4��L�^vY/Exr�jI�)Q�e='_�La���^�oe�&��4�(�S�еD̯�!X7�"�o��Cd�cYtڬ4O>��L����` }��z*�B�sR�8�4�/i��r��*���}�˫XY���2���fT�ь���s5�l�	�����_q�y�>�v��y��G         �   x������0�g�)�	�ס��%���.&��!��g������[�\�.?BB|�q��:��?tœ�%P��:`z60//)�2g�����
������M]L�ѕum{�Ӄ�������<uƞ�Q��6<������S\�\����(ġ����smu�?�@~Zb�HHlA�M���(��������s��ʘ�r      �   C   x�3�-N-*�L�4�4202�50�54T00�20�24�35060� J���	.#Nǔ��<�5��qqq X!]      �   =   x�3�4�t/�J,J,�L�4�4202�50�54T00�20�22Գ05261J���	�=... sU�      �   �  x��S]s�0}��>�4@�OU*��/P�:}�
EPV��l������d.ɽI8�������R�~�2�`�
�	�\���	���LFI��f�<`����{�jP�g�|�wnz����箛���&~���`q~e�mؚ.4�,�T�������b_�A Vh �
b��BEː��Dx+ZE��)c�d0h��o���y��S �g�_�%m�yb���͑��=[m&�(����@�if�N�.i��)L�b�b'�u+���e���j@��b�A�nb��fߊ~�+qU&�bAIġ��<���{	�\���Tg"b��i�R����%j���Ӆ�>	�=��U�̊���C��K�&����Q�#_��I��(԰L�U�?@�ƿq_{O��"����X ���-?S_��U���v�k��~�����Ew�D��\��?��F��I�\�(�'Yź�^)�?f�%�A��z�>���'p���I���Kf���ж�ѻ��i����^R�8�9�f��*���ή����)Ħn��C���?H�w�H/#R֙Ft���t,u_e�1ෘ��2yZl���9�[����I&q0�"����f�����M�l;����9�/�<�Z��,7�����ʋ�/]G��ʿ��t�&3�Ǟ�}���뻼i�B�dlT�            x������ � �            x������ � �      �   �   x�uл� E����y�������_��	�8�.j����KH����atEg!Fi�cx~ב��G�P���L�7��-H���:�=���L'�h�Aɛ��V4^�S��#q+:^��6�?�Vs{��H���b��F�	�]�ԊŞpR���O1     