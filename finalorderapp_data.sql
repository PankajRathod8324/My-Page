toc.dat                                                                                             0000600 0004000 0002000 00000314560 15006133414 0014445 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       !                }         	   PizzaShop    16.3    16.3 .   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    32786 	   PizzaShop    DATABASE     ~   CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "PizzaShop";
                postgres    false         �           0    0 	   PizzaShop    DATABASE PROPERTIES     =   ALTER DATABASE "PizzaShop" SET "TimeZone" TO 'Asia/Kolkata';
                     postgres    false                    1259    49167    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false         �            1259    32835    cities    TABLE     L  CREATE TABLE public.cities (
    city_id integer NOT NULL,
    state_id integer,
    city_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false         �            1259    32834    cities_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cities_city_id_seq;
       public          postgres    false    222         �           0    0    cities_city_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;
          public          postgres    false    221         �            1259    33048    combine_modifier    TABLE     �   CREATE TABLE public.combine_modifier (
    combine_modifier_id integer NOT NULL,
    modifier_group_id integer,
    modifier_id integer,
    is_deleted boolean DEFAULT false
);
 $   DROP TABLE public.combine_modifier;
       public         heap    postgres    false         �            1259    33047 (   combine_modifier_combine_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.combine_modifier_combine_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.combine_modifier_combine_modifier_id_seq;
       public          postgres    false    238         �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.combine_modifier_combine_modifier_id_seq OWNED BY public.combine_modifier.combine_modifier_id;
          public          postgres    false    237         �            1259    32812 	   countries    TABLE     ?  CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false         �            1259    32811    countries_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.countries_country_id_seq;
       public          postgres    false    218         �           0    0    countries_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;
          public          postgres    false    217         �            1259    33251    customer_tables    TABLE     �   CREATE TABLE public.customer_tables (
    customer_table_id integer NOT NULL,
    customer_id integer,
    table_id integer,
    "IsActive" boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.customer_tables;
       public         heap    postgres    false         �            1259    33250 %   customer_tables_customer_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_tables_customer_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.customer_tables_customer_table_id_seq;
       public          postgres    false    254         �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.customer_tables_customer_table_id_seq OWNED BY public.customer_tables.customer_table_id;
          public          postgres    false    253                    1259    106528    customer_waitings    TABLE     �   CREATE TABLE public.customer_waitings (
    customer_waitings_id integer NOT NULL,
    customer_id integer,
    waiting_list_id integer
);
 %   DROP TABLE public.customer_waitings;
       public         heap    postgres    false                    1259    106527 *   customer_waitings_customer_waitings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_waitings_customer_waitings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.customer_waitings_customer_waitings_id_seq;
       public          postgres    false    284         �           0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.customer_waitings_customer_waitings_id_seq OWNED BY public.customer_waitings.customer_waitings_id;
          public          postgres    false    283         �            1259    33150 	   customers    TABLE     �  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    table_id integer,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    date date,
    noofperson integer
);
    DROP TABLE public.customers;
       public         heap    postgres    false         �            1259    33149    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    246         �           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    245         �            1259    33202 
   favourites    TABLE     ;  CREATE TABLE public.favourites (
    favourites_id integer NOT NULL,
    item_id integer,
    user_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.favourites;
       public         heap    postgres    false         �            1259    33201    favourites_favourites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favourites_favourites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.favourites_favourites_id_seq;
       public          postgres    false    250         �           0    0    favourites_favourites_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.favourites_favourites_id_seq OWNED BY public.favourites.favourites_id;
          public          postgres    false    249                    1259    81949    item_modifier_group    TABLE     �   CREATE TABLE public.item_modifier_group (
    item_id integer NOT NULL,
    modifier_group_id integer NOT NULL,
    min_selection integer,
    max_selection integer
);
 '   DROP TABLE public.item_modifier_group;
       public         heap    postgres    false                    1259    73729    itemtype    TABLE     �   CREATE TABLE public.itemtype (
    itemtype_id integer NOT NULL,
    item_type character varying(100) NOT NULL,
    item_photo text
);
    DROP TABLE public.itemtype;
       public         heap    postgres    false         
           1259    73728    itemtype_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.itemtype_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.itemtype_item_id_seq;
       public          postgres    false    267         �           0    0    itemtype_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.itemtype_item_id_seq OWNED BY public.itemtype.itemtype_id;
          public          postgres    false    266         �            1259    32916    menu_categories    TABLE     �  CREATE TABLE public.menu_categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL,
    category_description text,
    is_deleted boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.menu_categories;
       public         heap    postgres    false         �            1259    32915    menu_categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.menu_categories_category_id_seq;
       public          postgres    false    226         �           0    0    menu_categories_category_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.menu_categories_category_id_seq OWNED BY public.menu_categories.category_id;
          public          postgres    false    225         �            1259    32953    menu_item_units    TABLE     ?  CREATE TABLE public.menu_item_units (
    unit_id integer NOT NULL,
    unit_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.menu_item_units;
       public         heap    postgres    false         �            1259    32952    menu_item_units_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_item_units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.menu_item_units_unit_id_seq;
       public          postgres    false    230         �           0    0    menu_item_units_unit_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.menu_item_units_unit_id_seq OWNED BY public.menu_item_units.unit_id;
          public          postgres    false    229         �            1259    32988 
   menu_items    TABLE     �  CREATE TABLE public.menu_items (
    item_id integer NOT NULL,
    category_id integer,
    item_name character varying(100) NOT NULL,
    rate numeric(5,2) NOT NULL,
    quantity integer NOT NULL,
    unit_id integer,
    is_available boolean DEFAULT true NOT NULL,
    tax_default boolean DEFAULT false NOT NULL,
    tax_percentage numeric(10,2) NOT NULL,
    short_code text,
    description text,
    category_photo text,
    is_favourite boolean DEFAULT false,
    modifier_group_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    itemtype_id integer,
    "is_Deleted" boolean
);
    DROP TABLE public.menu_items;
       public         heap    postgres    false         �            1259    32987    menu_items_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.menu_items_item_id_seq;
       public          postgres    false    234         �           0    0    menu_items_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;
          public          postgres    false    233         �            1259    32936    menu_modifier_groups    TABLE     �  CREATE TABLE public.menu_modifier_groups (
    modifier_group_id integer NOT NULL,
    modifier_group_name character varying(100) NOT NULL,
    modifier_group_decription text,
    is_deleted boolean DEFAULT false,
    category_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 (   DROP TABLE public.menu_modifier_groups;
       public         heap    postgres    false         �            1259    32935 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_modifier_groups_modifier_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.menu_modifier_groups_modifier_group_id_seq;
       public          postgres    false    228         �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.menu_modifier_groups_modifier_group_id_seq OWNED BY public.menu_modifier_groups.modifier_group_id;
          public          postgres    false    227         �            1259    33021    menu_modifiers    TABLE       CREATE TABLE public.menu_modifiers (
    modifier_id integer NOT NULL,
    modifier_name character varying(100) NOT NULL,
    modifier_group_id integer,
    modifier_rate numeric(5,2),
    is_deleted boolean DEFAULT false,
    unit_id integer,
    quantity integer NOT NULL,
    modifier_decription text NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.menu_modifiers;
       public         heap    postgres    false         �            1259    33020    menu_modifiers_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_modifiers_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.menu_modifiers_modifier_id_seq;
       public          postgres    false    236         �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.menu_modifiers_modifier_id_seq OWNED BY public.menu_modifiers.modifier_id;
          public          postgres    false    235                    1259    33306    order_items    TABLE     X  CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    item_id integer,
    date date DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    readyitemquantity integer NOT NULL,
    rate numeric(5,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    order_id integer,
    modifier_id integer,
    category_id integer,
    item_instructions character varying,
    status character varying,
    uid character varying
);
    DROP TABLE public.order_items;
       public         heap    postgres    false                    1259    33305    order_items_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.order_items_order_item_id_seq;
       public          postgres    false    258         �           0    0    order_items_order_item_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;
          public          postgres    false    257                    1259    33321    order_modifiers    TABLE     �  CREATE TABLE public.order_modifiers (
    order_modifier_id integer NOT NULL,
    modifier_id integer,
    date date DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    rate numeric(5,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_item_id integer,
    item_id integer,
    uid character varying
);
 #   DROP TABLE public.order_modifiers;
       public         heap    postgres    false                    1259    33320 %   order_modifiers_order_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_modifiers_order_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.order_modifiers_order_modifier_id_seq;
       public          postgres    false    260         �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.order_modifiers_order_modifier_id_seq OWNED BY public.order_modifiers.order_modifier_id;
          public          postgres    false    259                    1259    90201    order_status    TABLE     y   CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    order_status_name character varying(100)
);
     DROP TABLE public.order_status;
       public         heap    postgres    false                    1259    90200     order_status_order_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.order_status_order_status_id_seq;
       public          postgres    false    278         �           0    0     order_status_order_status_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;
          public          postgres    false    277                    1259    33336    order_tables    TABLE     v   CREATE TABLE public.order_tables (
    order_table_id integer NOT NULL,
    order_id integer,
    table_id integer
);
     DROP TABLE public.order_tables;
       public         heap    postgres    false                    1259    33335    order_tables_order_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tables_order_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.order_tables_order_table_id_seq;
       public          postgres    false    262         �           0    0    order_tables_order_table_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.order_tables_order_table_id_seq OWNED BY public.order_tables.order_table_id;
          public          postgres    false    261                    1259    90177 	   order_tax    TABLE     �   CREATE TABLE public.order_tax (
    order_tax_id integer NOT NULL,
    order_id integer,
    tax_id integer,
    tax_rate numeric
);
    DROP TABLE public.order_tax;
       public         heap    postgres    false                    1259    90176    order_tax_order_tax_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tax_order_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.order_tax_order_tax_id_seq;
       public          postgres    false    274         �           0    0    order_tax_order_tax_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.order_tax_order_tax_id_seq OWNED BY public.order_tax.order_tax_id;
          public          postgres    false    273                     1259    33275    orders    TABLE     #  CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    date date DEFAULT now() NOT NULL,
    review_id integer,
    comment character varying(50),
    sub_total numeric(10,2) NOT NULL,
    no_of_person integer NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    order_status_id integer,
    payment_mode_id integer,
    invoice_no character varying,
    order_duration interval,
    placed_on timestamp with time zone,
    order_type character varying,
    order_instructions character varying,
    "Is_SGST_Include" boolean DEFAULT false,
    sgst_amt numeric(10,2)
);
    DROP TABLE public.orders;
       public         heap    postgres    false         �            1259    33274    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    256         �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    255                    1259    98418    payment    TABLE     ~  CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    order_id integer,
    payment_status_id integer,
    amount numeric(10,2),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    payment_mode character varying
);
    DROP TABLE public.payment;
       public         heap    postgres    false                    1259    90194    payment_mode    TABLE     y   CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);
     DROP TABLE public.payment_mode;
       public         heap    postgres    false                    1259    98417    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    282         �           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    281                    1259    98395    payment_status    TABLE     I  CREATE TABLE public.payment_status (
    payment_status_id integer NOT NULL,
    payment_status_name character varying(100),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.payment_status;
       public         heap    postgres    false                    1259    98394 $   payment_status_payment_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_status_payment_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.payment_status_payment_status_id_seq;
       public          postgres    false    280         �           0    0 $   payment_status_payment_status_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.payment_status_payment_status_id_seq OWNED BY public.payment_status.payment_status_id;
          public          postgres    false    279                    1259    90193     paymode_mode_payment_mode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paymode_mode_payment_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.paymode_mode_payment_mode_id_seq;
       public          postgres    false    276         �           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.paymode_mode_payment_mode_id_seq OWNED BY public.payment_mode.payment_mode_id;
          public          postgres    false    275         	           1259    65622    permissions    TABLE     �  CREATE TABLE public.permissions (
    permission_id integer NOT NULL,
    role_id integer,
    permission_name character varying(50) NOT NULL,
    can_view boolean DEFAULT true,
    can_add_edit boolean DEFAULT false,
    can_delete boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.permissions;
       public         heap    postgres    false                    1259    65621    permissions_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.permissions_permission_id_seq;
       public          postgres    false    265         �           0    0    permissions_permission_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;
          public          postgres    false    264         �            1259    33191    reviews    TABLE     �  CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    rating integer,
    comment text,
    food integer,
    service integer,
    ambience integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_id integer,
    customer_id integer
);
    DROP TABLE public.reviews;
       public         heap    postgres    false         �            1259    33190    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    248         �           0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    247         �            1259    32803    roles    TABLE     0  CREATE TABLE public.roles (
    role_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    role_name text,
    priority integer
);
    DROP TABLE public.roles;
       public         heap    postgres    false         �            1259    32802    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public          postgres    false    216         �           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    215         �            1259    33066    sections    TABLE     �  CREATE TABLE public.sections (
    section_id integer NOT NULL,
    section_name character varying(100) NOT NULL,
    section_decription text NOT NULL,
    is_deleted boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.sections;
       public         heap    postgres    false         �            1259    33065    sections_section_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sections_section_id_seq;
       public          postgres    false    240         �           0    0    sections_section_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;
          public          postgres    false    239         �            1259    32821    states    TABLE     P  CREATE TABLE public.states (
    state_id integer NOT NULL,
    country_id integer,
    state_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.states;
       public         heap    postgres    false         �            1259    32820    states_state_id_seq    SEQUENCE     �   CREATE SEQUENCE public.states_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.states_state_id_seq;
       public          postgres    false    220         �           0    0    states_state_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.states_state_id_seq OWNED BY public.states.state_id;
          public          postgres    false    219                    1259    90142    table_status    TABLE     j  CREATE TABLE public.table_status (
    status_id integer NOT NULL,
    status_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    occupied_time time without time zone
);
     DROP TABLE public.table_status;
       public         heap    postgres    false                    1259    90141    table_status_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.table_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.table_status_status_id_seq;
       public          postgres    false    270         �           0    0    table_status_status_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.table_status_status_id_seq OWNED BY public.table_status.status_id;
          public          postgres    false    269         �            1259    33084    tables    TABLE     �  CREATE TABLE public.tables (
    table_id integer NOT NULL,
    table_name character varying(100) NOT NULL,
    section_id integer,
    capacity integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    status_id integer,
    is_deleted boolean DEFAULT false,
    occupied_time timestamp with time zone
);
    DROP TABLE public.tables;
       public         heap    postgres    false         �            1259    33083    tables_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tables_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tables_table_id_seq;
       public          postgres    false    242         �           0    0    tables_table_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;
          public          postgres    false    241                    1259    90157    tax_type    TABLE     @  CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.tax_type;
       public         heap    postgres    false                    1259    90156    tax_type_tax_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tax_type_tax_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tax_type_tax_type_id_seq;
       public          postgres    false    272         �           0    0    tax_type_tax_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNED BY public.tax_type.tax_type_id;
          public          postgres    false    271         �            1259    33104    taxes    TABLE     �  CREATE TABLE public.taxes (
    tax_id integer NOT NULL,
    tax_name character varying(100) NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    tax_type_id integer,
    tax_amount numeric NOT NULL,
    is_deleted boolean DEFAULT false
);
    DROP TABLE public.taxes;
       public         heap    postgres    false         �            1259    33103    taxes_tax_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taxes_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.taxes_tax_id_seq;
       public          postgres    false    244         �           0    0    taxes_tax_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.taxes_tax_id_seq OWNED BY public.taxes.tax_id;
          public          postgres    false    243         �            1259    32981    units    TABLE     j   CREATE TABLE public.units (
    unit_id integer NOT NULL,
    unit_name character varying(50) NOT NULL
);
    DROP TABLE public.units;
       public         heap    postgres    false         �            1259    32980    units_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.units_unit_id_seq;
       public          postgres    false    232         �           0    0    units_unit_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.units_unit_id_seq OWNED BY public.units.unit_id;
          public          postgres    false    231         �            1259    32849    users    TABLE     O  CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    role_id integer,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    phone character varying(30) NOT NULL,
    profile_photo text,
    address text,
    country_id integer,
    state_id integer,
    city_id integer,
    zipcode character varying(30),
    created_by integer,
    created_at timestamp without time zone DEFAULT now(),
    modified_by integer,
    modified_at timestamp without time zone DEFAULT now(),
    last_login timestamp without time zone,
    reset_token character varying,
    reset_token_expirytime timestamp with time zone,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false
);
    DROP TABLE public.users;
       public         heap    postgres    false         �            1259    32848    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    224         �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    223         �            1259    33221    waiting_list    TABLE     Y  CREATE TABLE public.waiting_list (
    waiting_list_id integer NOT NULL,
    waiting_time timestamp without time zone DEFAULT now(),
    section_id integer NOT NULL,
    name character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    no_of_person integer NOT NULL,
    created_by integer,
    created_at timestamp with time zone DEFAULT now(),
    modified_by integer,
    modified_at timestamp with time zone DEFAULT now(),
    is_deleted boolean DEFAULT false
);
     DROP TABLE public.waiting_list;
       public         heap    postgres    false         �            1259    33220     waiting_list_waiting_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.waiting_list_waiting_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.waiting_list_waiting_list_id_seq;
       public          postgres    false    252         �           0    0     waiting_list_waiting_list_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.waiting_list_waiting_list_id_seq OWNED BY public.waiting_list.waiting_list_id;
          public          postgres    false    251                    2604    32838    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    222    221    222         $           2604    33051 $   combine_modifier combine_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);
 S   ALTER TABLE public.combine_modifier ALTER COLUMN combine_modifier_id DROP DEFAULT;
       public          postgres    false    237    238    238                     2604    32815    countries country_id    DEFAULT     |   ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    217    218    218         B           2604    33254 !   customer_tables customer_table_id    DEFAULT     �   ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);
 P   ALTER TABLE public.customer_tables ALTER COLUMN customer_table_id DROP DEFAULT;
       public          postgres    false    254    253    254         i           2604    106531 &   customer_waitings customer_waitings_id    DEFAULT     �   ALTER TABLE ONLY public.customer_waitings ALTER COLUMN customer_waitings_id SET DEFAULT nextval('public.customer_waitings_customer_waitings_id_seq'::regclass);
 U   ALTER TABLE public.customer_waitings ALTER COLUMN customer_waitings_id DROP DEFAULT;
       public          postgres    false    283    284    284         4           2604    33153    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    246    245    246         :           2604    33205    favourites favourites_id    DEFAULT     �   ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);
 G   ALTER TABLE public.favourites ALTER COLUMN favourites_id DROP DEFAULT;
       public          postgres    false    250    249    250         Y           2604    73732    itemtype itemtype_id    DEFAULT     x   ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);
 C   ALTER TABLE public.itemtype ALTER COLUMN itemtype_id DROP DEFAULT;
       public          postgres    false    266    267    267                    2604    32919    menu_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);
 J   ALTER TABLE public.menu_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    225    226    226                    2604    32956    menu_item_units unit_id    DEFAULT     �   ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);
 F   ALTER TABLE public.menu_item_units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    229    230    230                    2604    32991    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    233    234    234                    2604    32939 &   menu_modifier_groups modifier_group_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);
 U   ALTER TABLE public.menu_modifier_groups ALTER COLUMN modifier_group_id DROP DEFAULT;
       public          postgres    false    228    227    228                     2604    33024    menu_modifiers modifier_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);
 I   ALTER TABLE public.menu_modifiers ALTER COLUMN modifier_id DROP DEFAULT;
       public          postgres    false    236    235    236         J           2604    33309    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    258    257    258         N           2604    33324 !   order_modifiers order_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);
 P   ALTER TABLE public.order_modifiers ALTER COLUMN order_modifier_id DROP DEFAULT;
       public          postgres    false    260    259    260         b           2604    90204    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public          postgres    false    277    278    278         R           2604    33339    order_tables order_table_id    DEFAULT     �   ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);
 J   ALTER TABLE public.order_tables ALTER COLUMN order_table_id DROP DEFAULT;
       public          postgres    false    261    262    262         `           2604    90180    order_tax order_tax_id    DEFAULT     �   ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);
 E   ALTER TABLE public.order_tax ALTER COLUMN order_tax_id DROP DEFAULT;
       public          postgres    false    274    273    274         E           2604    33278    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    255    256    256         f           2604    98421    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    281    282    282         a           2604    90197    payment_mode payment_mode_id    DEFAULT     �   ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);
 K   ALTER TABLE public.payment_mode ALTER COLUMN payment_mode_id DROP DEFAULT;
       public          postgres    false    275    276    276         c           2604    98398     payment_status payment_status_id    DEFAULT     �   ALTER TABLE ONLY public.payment_status ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_status_payment_status_id_seq'::regclass);
 O   ALTER TABLE public.payment_status ALTER COLUMN payment_status_id DROP DEFAULT;
       public          postgres    false    280    279    280         S           2604    65625    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public          postgres    false    265    264    265         7           2604    33194    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    248    247    248         �           2604    32806    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    215    216    216         &           2604    33069    sections section_id    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    240    239    240                    2604    32824    states state_id    DEFAULT     r   ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);
 >   ALTER TABLE public.states ALTER COLUMN state_id DROP DEFAULT;
       public          postgres    false    220    219    220         Z           2604    90145    table_status status_id    DEFAULT     �   ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);
 E   ALTER TABLE public.table_status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    269    270    270         *           2604    33087    tables table_id    DEFAULT     r   ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);
 >   ALTER TABLE public.tables ALTER COLUMN table_id DROP DEFAULT;
       public          postgres    false    242    241    242         ]           2604    90160    tax_type tax_type_id    DEFAULT     |   ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);
 C   ALTER TABLE public.tax_type ALTER COLUMN tax_type_id DROP DEFAULT;
       public          postgres    false    272    271    272         .           2604    33107    taxes tax_id    DEFAULT     l   ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);
 ;   ALTER TABLE public.taxes ALTER COLUMN tax_id DROP DEFAULT;
       public          postgres    false    243    244    244                    2604    32984    units unit_id    DEFAULT     n   ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);
 <   ALTER TABLE public.units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    231    232    232         	           2604    32852    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    224    223    224         =           2604    33224    waiting_list waiting_list_id    DEFAULT     �   ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);
 K   ALTER TABLE public.waiting_list ALTER COLUMN waiting_list_id DROP DEFAULT;
       public          postgres    false    251    252    252         �          0    49167    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    263       5291.dat �          0    32835    cities 
   TABLE DATA           p   COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    222       5250.dat �          0    33048    combine_modifier 
   TABLE DATA           k   COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
    public          postgres    false    238       5266.dat ~          0    32812 	   countries 
   TABLE DATA           o   COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    218       5246.dat �          0    33251    customer_tables 
   TABLE DATA           k   COPY public.customer_tables (customer_table_id, customer_id, table_id, "IsActive", created_at) FROM stdin;
    public          postgres    false    254       5282.dat �          0    106528    customer_waitings 
   TABLE DATA           _   COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM stdin;
    public          postgres    false    284       5312.dat �          0    33150 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM stdin;
    public          postgres    false    246       5274.dat �          0    33202 
   favourites 
   TABLE DATA           w   COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    250       5278.dat �          0    81949    item_modifier_group 
   TABLE DATA           g   COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
    public          postgres    false    268       5296.dat �          0    73729    itemtype 
   TABLE DATA           F   COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
    public          postgres    false    267       5295.dat �          0    32916    menu_categories 
   TABLE DATA           �   COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    226       5254.dat �          0    32953    menu_item_units 
   TABLE DATA           o   COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    230       5258.dat �          0    32988 
   menu_items 
   TABLE DATA              COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
    public          postgres    false    234       5262.dat �          0    32936    menu_modifier_groups 
   TABLE DATA           �   COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    228       5256.dat �          0    33021    menu_modifiers 
   TABLE DATA           �   COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    236       5264.dat �          0    33306    order_items 
   TABLE DATA           �   COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM stdin;
    public          postgres    false    258       5286.dat �          0    33321    order_modifiers 
   TABLE DATA           �   COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM stdin;
    public          postgres    false    260       5288.dat �          0    90201    order_status 
   TABLE DATA           J   COPY public.order_status (order_status_id, order_status_name) FROM stdin;
    public          postgres    false    278       5306.dat �          0    33336    order_tables 
   TABLE DATA           J   COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
    public          postgres    false    262       5290.dat �          0    90177 	   order_tax 
   TABLE DATA           M   COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM stdin;
    public          postgres    false    274       5302.dat �          0    33275    orders 
   TABLE DATA           0  COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM stdin;
    public          postgres    false    256       5284.dat �          0    98418    payment 
   TABLE DATA           �   COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM stdin;
    public          postgres    false    282       5310.dat �          0    90194    payment_mode 
   TABLE DATA           J   COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
    public          postgres    false    276       5304.dat �          0    98395    payment_status 
   TABLE DATA           �   COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    280       5308.dat �          0    65622    permissions 
   TABLE DATA           �   COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    265       5293.dat �          0    33191    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM stdin;
    public          postgres    false    248       5276.dat |          0    32803    roles 
   TABLE DATA           o   COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM stdin;
    public          postgres    false    216       5244.dat �          0    33066    sections 
   TABLE DATA           �   COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    240       5268.dat �          0    32821    states 
   TABLE DATA           t   COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    220       5248.dat �          0    90142    table_status 
   TABLE DATA              COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM stdin;
    public          postgres    false    270       5298.dat �          0    33084    tables 
   TABLE DATA           �   COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM stdin;
    public          postgres    false    242       5270.dat �          0    90157    tax_type 
   TABLE DATA           p   COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    272       5300.dat �          0    33104    taxes 
   TABLE DATA           �   COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
    public          postgres    false    244       5272.dat �          0    32981    units 
   TABLE DATA           3   COPY public.units (unit_id, unit_name) FROM stdin;
    public          postgres    false    232       5260.dat �          0    32849    users 
   TABLE DATA           $  COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
    public          postgres    false    224       5252.dat �          0    33221    waiting_list 
   TABLE DATA           �   COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM stdin;
    public          postgres    false    252       5280.dat �           0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);
          public          postgres    false    221         �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 56, true);
          public          postgres    false    237         �           0    0    countries_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);
          public          postgres    false    217         �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 71, true);
          public          postgres    false    253         �           0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.customer_waitings_customer_waitings_id_seq', 1, false);
          public          postgres    false    283         �           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 21, true);
          public          postgres    false    245         �           0    0    favourites_favourites_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 53, true);
          public          postgres    false    249         �           0    0    itemtype_item_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);
          public          postgres    false    266         �           0    0    menu_categories_category_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 30, true);
          public          postgres    false    225         �           0    0    menu_item_units_unit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);
          public          postgres    false    229         �           0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 53, true);
          public          postgres    false    233         �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 11, true);
          public          postgres    false    227         �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);
          public          postgres    false    235         �           0    0    order_items_order_item_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 169, true);
          public          postgres    false    257         �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 183, true);
          public          postgres    false    259         �           0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);
          public          postgres    false    277         �           0    0    order_tables_order_table_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 33, true);
          public          postgres    false    261         �           0    0    order_tax_order_tax_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 264, true);
          public          postgres    false    273         �           0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 77, true);
          public          postgres    false    255         �           0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 13, true);
          public          postgres    false    281         �           0    0 $   payment_status_payment_status_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.payment_status_payment_status_id_seq', 2, true);
          public          postgres    false    279         �           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);
          public          postgres    false    275                     0    0    permissions_permission_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);
          public          postgres    false    264                    0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 18, true);
          public          postgres    false    247                    0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    215                    0    0    sections_section_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_section_id_seq', 7, true);
          public          postgres    false    239                    0    0    states_state_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);
          public          postgres    false    219                    0    0    table_status_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.table_status_status_id_seq', 5, true);
          public          postgres    false    269                    0    0    tables_table_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tables_table_id_seq', 13, true);
          public          postgres    false    241                    0    0    tax_type_tax_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);
          public          postgres    false    271                    0    0    taxes_tax_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.taxes_tax_id_seq', 13, true);
          public          postgres    false    243         	           0    0    units_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);
          public          postgres    false    231         
           0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 289, true);
          public          postgres    false    223                    0    0     waiting_list_waiting_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 37, true);
          public          postgres    false    251         �           2606    49171 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    263         q           2606    32842    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    222         �           2606    33053 &   combine_modifier combine_modifier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);
 P   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_pkey;
       public            postgres    false    238         m           2606    32819    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    218         �           2606    33256 $   customer_tables customer_tables_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_pkey PRIMARY KEY (customer_table_id);
 N   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_pkey;
       public            postgres    false    254         �           2606    106533 (   customer_waitings customer_waitings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_pkey PRIMARY KEY (customer_waitings_id);
 R   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_pkey;
       public            postgres    false    284         �           2606    33159    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    246         �           2606    33157    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    246         �           2606    33209    favourites favourites_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (favourites_id);
 D   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_pkey;
       public            postgres    false    250         �           2606    81953 ,   item_modifier_group item_modifier_group_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_pkey PRIMARY KEY (item_id, modifier_group_id);
 V   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_pkey;
       public            postgres    false    268    268         �           2606    73738    itemtype itemtype_item_type_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_item_type_key UNIQUE (item_type);
 I   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_item_type_key;
       public            postgres    false    267         �           2606    73736    itemtype itemtype_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_pkey PRIMARY KEY (itemtype_id);
 @   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_pkey;
       public            postgres    false    267         {           2606    32926 $   menu_categories menu_categories_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    226                    2606    32960 $   menu_item_units menu_item_units_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);
 N   ALTER TABLE ONLY public.menu_item_units DROP CONSTRAINT menu_item_units_pkey;
       public            postgres    false    230         �           2606    33000    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    234         }           2606    32946 .   menu_modifier_groups menu_modifier_groups_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_pkey PRIMARY KEY (modifier_group_id);
 X   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_pkey;
       public            postgres    false    228         �           2606    33031 "   menu_modifiers menu_modifiers_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_pkey PRIMARY KEY (modifier_id);
 L   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_pkey;
       public            postgres    false    236         �           2606    33314    order_items order_items_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    258         �           2606    33329 $   order_modifiers order_modifiers_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_pkey PRIMARY KEY (order_modifier_id);
 N   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_pkey;
       public            postgres    false    260         �           2606    90206    order_status order_status_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public            postgres    false    278         �           2606    33341    order_tables order_tables_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_pkey PRIMARY KEY (order_table_id);
 H   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_pkey;
       public            postgres    false    262         �           2606    90182    order_tax order_tax_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_pkey PRIMARY KEY (order_tax_id);
 B   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_pkey;
       public            postgres    false    274         �           2606    33283    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    256         �           2606    98425    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    282         �           2606    98402 "   payment_status payment_status_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.payment_status
    ADD CONSTRAINT payment_status_pkey PRIMARY KEY (payment_status_id);
 L   ALTER TABLE ONLY public.payment_status DROP CONSTRAINT payment_status_pkey;
       public            postgres    false    280         �           2606    90199    payment_mode paymode_mode_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT paymode_mode_pkey PRIMARY KEY (payment_mode_id);
 H   ALTER TABLE ONLY public.payment_mode DROP CONSTRAINT paymode_mode_pkey;
       public            postgres    false    276         �           2606    65632    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    265         �           2606    33200    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    248         k           2606    32810    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216         �           2606    33076    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    240         o           2606    32828    states states_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    220         �           2606    90149    table_status table_status_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.table_status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);
 H   ALTER TABLE ONLY public.table_status DROP CONSTRAINT table_status_pkey;
       public            postgres    false    270         �           2606    33091    tables tables_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_pkey;
       public            postgres    false    242         �           2606    90164    tax_type tax_type_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);
 @   ALTER TABLE ONLY public.tax_type DROP CONSTRAINT tax_type_pkey;
       public            postgres    false    272         �           2606    33113    taxes taxes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (tax_id);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public            postgres    false    244         �           2606    32986    units units_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public            postgres    false    232         s           2606    32863    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224         u           2606    32865    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    224         w           2606    32859    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224         y           2606    32861    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    224         �           2606    33228    waiting_list waiting_list_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);
 H   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_pkey;
       public            postgres    false    252         �           2606    32843    cities cities_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_state_id_fkey;
       public          postgres    false    222    4975    220         �           2606    33054 8   combine_modifier combine_modifier_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_group_id_fkey;
       public          postgres    false    4989    238    228         �           2606    33059 2   combine_modifier combine_modifier_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_id_fkey;
       public          postgres    false    238    4997    236         �           2606    33257 0   customer_tables customer_tables_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_customer_id_fkey;
       public          postgres    false    5009    246    254         �           2606    33262 -   customer_tables customer_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_table_id_fkey;
       public          postgres    false    242    254    5003         �           2606    106534 4   customer_waitings customer_waitings_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_customer_id_fkey;
       public          postgres    false    5009    284    246         �           2606    106539 8   customer_waitings customer_waitings_waiting_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_waiting_list_id_fkey FOREIGN KEY (waiting_list_id) REFERENCES public.waiting_list(waiting_list_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_waiting_list_id_fkey;
       public          postgres    false    252    5015    284         �           2606    33160 !   customers customers_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_table_id_fkey;
       public          postgres    false    5003    246    242         �           2606    33210 "   favourites favourites_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_item_id_fkey;
       public          postgres    false    234    4995    250         �           2606    33215 "   favourites favourites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_user_id_fkey;
       public          postgres    false    4983    250    224         �           2606    90165    taxes fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);
 ;   ALTER TABLE ONLY public.taxes DROP CONSTRAINT fk_customer;
       public          postgres    false    244    5039    272         �           2606    131111    reviews fk_customer_review    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_customer_review;
       public          postgres    false    246    248    5009         �           2606    114723 !   order_items fk_order_category_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_category_key FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id);
 K   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order_category_key;
       public          postgres    false    226    258    4987         �           2606    98348 *   order_modifiers fk_order_modifier_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT fk_order_modifier_order_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id);
 T   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT fk_order_modifier_order_id;
       public          postgres    false    258    5021    260         �           2606    131106    reviews fk_order_review    FK CONSTRAINT     ~   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_order_review;
       public          postgres    false    5019    256    248         �           2606    81954 4   item_modifier_group item_modifier_group_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_item_id_fkey;
       public          postgres    false    234    4995    268         �           2606    81959 >   item_modifier_group item_modifier_group_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_modifier_group_id_fkey;
       public          postgres    false    268    4989    228         �           2606    73739    menu_items itemtype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT itemtype_id;
       public          postgres    false    267    5033    234         �           2606    33001 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    226    234    4987         �           2606    33011 ,   menu_items menu_items_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_modifier_group_id_fkey;
       public          postgres    false    228    4989    234         �           2606    33006 "   menu_items menu_items_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_unit_id_fkey;
       public          postgres    false    234    232    4993         �           2606    32947 :   menu_modifier_groups menu_modifier_groups_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_category_id_fkey;
       public          postgres    false    4987    226    228         �           2606    33032 4   menu_modifiers menu_modifiers_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_modifier_group_id_fkey;
       public          postgres    false    236    228    4989         �           2606    33042 *   menu_modifiers menu_modifiers_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_unit_id_fkey;
       public          postgres    false    4993    236    232         �           2606    98338 "   order_items order_item_modifier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_modifier_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 L   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_modifier_id;
       public          postgres    false    236    258    4997         �           2606    98343 '   order_modifiers order_item_modifiers_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_item_modifiers_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 Q   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_item_modifiers_id;
       public          postgres    false    236    260    4997         �           2606    98333    order_items order_item_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_order_id;
       public          postgres    false    258    256    5019         �           2606    33315 $   order_items order_items_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_item_id_fkey;
       public          postgres    false    234    4995    258         �           2606    33330 0   order_modifiers order_modifiers_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_modifier_id_fkey;
       public          postgres    false    260    236    4997         �           2606    90207     orders order_order_status_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_order_status_id_key;
       public          postgres    false    256    278    5045         �           2606    90212    orders order_payment_mode_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_payment_mode_id;
       public          postgres    false    276    256    5043         �           2606    33342 '   order_tables order_tables_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_order_id_fkey;
       public          postgres    false    256    5019    262         �           2606    33347 '   order_tables order_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_table_id_fkey;
       public          postgres    false    262    242    5003         �           2606    90183 !   order_tax order_tax_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_order_id_fkey;
       public          postgres    false    5019    274    256         �           2606    90188    order_tax order_tax_tax_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_tax_id_fkey;
       public          postgres    false    244    5005    274         �           2606    33284    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    246    5009    256         �           2606    33299    orders orders_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_review_id_fkey;
       public          postgres    false    248    5011    256         �           2606    98426    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    256    282    5019         �           2606    98431 &   payment payment_payment_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_payment_status_id_fkey;
       public          postgres    false    282    280    5047         �           2606    65633 $   permissions permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_role_id_fkey;
       public          postgres    false    216    4971    265         �           2606    32829    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public          postgres    false    220    218    4973         �           2606    90150    tables status_id    FK CONSTRAINT        ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);
 :   ALTER TABLE ONLY public.tables DROP CONSTRAINT status_id;
       public          postgres    false    242    270    5037         �           2606    33092    tables tables_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_section_id_fkey;
       public          postgres    false    5001    242    240         �           2606    32881    users users_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_fkey;
       public          postgres    false    222    224    4977         �           2606    32871    users users_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_fkey;
       public          postgres    false    218    4973    224         �           2606    32866    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    224    4971    216         �           2606    32876    users users_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_fkey;
       public          postgres    false    4975    220    224         �           2606    33245 )   waiting_list waiting_list_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_section_id_fkey;
       public          postgres    false    240    5001    252                                                                                                                                                        5291.dat                                                                                            0000600 0004000 0002000 00000000005 15006133414 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5250.dat                                                                                            0000600 0004000 0002000 00000004112 15006133414 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Surat	1	2025-02-12 01:23:26.224593	1	2025-02-12 01:23:26.224593
3	3	Brisbane	3	2025-02-21 02:04:26.330828	3	2025-02-21 02:04:26.330828
4	4	Manchester	4	2025-02-21 02:04:26.330828	4	2025-02-21 02:04:26.330828
2	2	Mumbai\n	2	2025-02-21 02:04:26.330828	2	2025-02-21 02:04:26.330828
5	1	Los Angeles	7	2025-02-25 02:47:20.097561	7	2025-02-25 02:47:20.097561
6	1	San Francisco	7	2025-02-25 02:47:20.097561	7	2025-02-25 02:47:20.097561
7	2	Houston	7	2025-02-25 02:47:20.097561	7	2025-02-25 02:47:20.097561
8	2	Dallas	7	2025-02-25 02:47:20.097561	7	2025-02-25 02:47:20.097561
9	3	Toronto	8	2025-02-25 02:47:20.097561	8	2025-02-25 02:47:20.097561
10	4	Montreal	8	2025-02-25 02:47:20.097561	8	2025-02-25 02:47:20.097561
11	5	Mexico City	9	2025-02-25 02:47:20.097561	9	2025-02-25 02:47:20.097561
12	6	Sao Paulo	10	2025-02-25 02:47:20.097561	10	2025-02-25 02:47:20.097561
13	7	Buenos Aires	11	2025-02-25 02:47:20.097561	11	2025-02-25 02:47:20.097561
14	8	London	12	2025-02-25 02:47:20.097561	12	2025-02-25 02:47:20.097561
15	9	Paris	13	2025-02-25 02:47:20.097561	13	2025-02-25 02:47:20.097561
16	10	Munich	14	2025-02-25 02:47:20.097561	14	2025-02-25 02:47:20.097561
17	11	Seoul	15	2025-02-25 02:47:20.097561	15	2025-02-25 02:47:20.097561
18	12	Barcelona	16	2025-02-25 02:47:20.097561	16	2025-02-25 02:47:20.097561
19	13	Tokyo	17	2025-02-25 02:47:20.097561	17	2025-02-25 02:47:20.097561
20	14	Auckland	18	2025-02-25 02:47:20.097561	18	2025-02-25 02:47:20.097561
21	15	Beijing	19	2025-02-25 02:47:20.097561	19	2025-02-25 02:47:20.097561
22	16	Moscow	20	2025-02-25 02:47:20.097561	20	2025-02-25 02:47:20.097561
23	17	Johannesburg	21	2025-02-25 02:47:20.097561	21	2025-02-25 02:47:20.097561
24	18	Cairo	22	2025-02-25 02:47:20.097561	22	2025-02-25 02:47:20.097561
25	19	Lagos	23	2025-02-25 02:47:20.097561	23	2025-02-25 02:47:20.097561
26	20	Nairobi	24	2025-02-25 02:47:20.097561	24	2025-02-25 02:47:20.097561
27	21	Riyadh	25	2025-02-25 02:47:20.097561	25	2025-02-25 02:47:20.097561
28	22	Dubai	26	2025-02-25 02:47:20.097561	26	2025-02-25 02:47:20.097561
29	23	Istanbul	27	2025-02-25 02:47:20.097561	27	2025-02-25 02:47:20.097561
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                      5266.dat                                                                                            0000600 0004000 0002000 00000000662 15006133414 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	7	4	f
2	4	3	f
3	4	2	f
5	6	6	f
6	6	7	f
7	7	8	f
8	7	9	f
9	2	10	f
10	2	11	f
12	2	13	f
13	4	17	f
14	4	18	f
15	4	\N	f
16	4	\N	f
17	4	\N	f
18	4	\N	f
19	4	\N	f
20	4	\N	f
21	4	\N	f
22	5	\N	f
23	6	\N	f
24	6	\N	f
25	5	\N	f
26	5	\N	f
27	2	\N	f
28	6	35	f
30	6	37	f
31	5	38	f
32	5	39	f
33	5	40	f
34	6	41	f
35	6	42	f
37	5	44	f
38	2	45	f
39	6	46	f
40	\N	3	f
41	\N	10	f
42	10	6	f
43	10	13	f
44	10	17	f
47	4	1	f
51	11	46	f
52	11	18	f
54	4	17	f
\.


                                                                              5246.dat                                                                                            0000600 0004000 0002000 00000004027 15006133414 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	India	2	2025-02-21 02:00:49.499576	2	2025-02-21 02:00:49.499576
3	Australia	3	2025-02-21 02:00:49.499576	3	2025-02-21 02:00:49.499576
4	England	4	2025-02-21 02:00:49.499576	4	2025-02-21 02:00:49.499576
1	italy	1	2025-02-11 21:27:13.863787	1	2025-02-11 21:27:13.863787
5	United States	7	2025-02-25 02:39:48.535878	7	2025-02-25 02:39:48.535878
6	Canada	8	2025-02-25 02:39:48.535878	8	2025-02-25 02:39:48.535878
7	Mexico	9	2025-02-25 02:39:48.535878	9	2025-02-25 02:39:48.535878
8	Brazil	10	2025-02-25 02:39:48.535878	10	2025-02-25 02:39:48.535878
9	Argentina	11	2025-02-25 02:39:48.535878	11	2025-02-25 02:39:48.535878
10	United Kingdom	12	2025-02-25 02:39:48.535878	12	2025-02-25 02:39:48.535878
11	France	13	2025-02-25 02:39:48.535878	13	2025-02-25 02:39:48.535878
12	Germany	14	2025-02-25 02:39:48.535878	14	2025-02-25 02:39:48.535878
13	South Korea	15	2025-02-25 02:39:48.535878	15	2025-02-25 02:39:48.535878
14	Spain	16	2025-02-25 02:39:48.535878	16	2025-02-25 02:39:48.535878
15	Japan	17	2025-02-25 02:39:48.535878	17	2025-02-25 02:39:48.535878
16	New Zealand	18	2025-02-25 02:39:48.535878	18	2025-02-25 02:39:48.535878
17	Japan	19	2025-02-25 02:39:48.535878	19	2025-02-25 02:39:48.535878
18	China	20	2025-02-25 02:39:48.535878	20	2025-02-25 02:39:48.535878
19	Nepal	21	2025-02-25 02:39:48.535878	21	2025-02-25 02:39:48.535878
20	Russia	22	2025-02-25 02:39:48.535878	22	2025-02-25 02:39:48.535878
21	South Africa	23	2025-02-25 02:39:48.535878	23	2025-02-25 02:39:48.535878
22	Egypt	24	2025-02-25 02:39:48.535878	24	2025-02-25 02:39:48.535878
23	Nigeria	25	2025-02-25 02:39:48.535878	25	2025-02-25 02:39:48.535878
24	Kenya	26	2025-02-25 02:39:48.535878	26	2025-02-25 02:39:48.535878
25	Saudi Arabia	27	2025-02-25 02:39:48.535878	27	2025-02-25 02:39:48.535878
26	United Arab Emirates	28	2025-02-25 02:39:48.535878	28	2025-02-25 02:39:48.535878
27	Turkey	29	2025-02-25 02:39:48.535878	29	2025-02-25 02:39:48.535878
28	South Korea	30	2025-02-25 02:39:48.535878	30	2025-02-25 02:39:48.535878
29	Indonesia	31	2025-02-25 02:39:48.535878	31	2025-02-25 02:39:48.535878
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5282.dat                                                                                            0000600 0004000 0002000 00000003762 15006133414 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        64	1	6	f	2025-05-01 17:38:58.03872+05:30
36	1	6	f	2025-04-28 18:27:53.808437+05:30
65	1	6	f	2025-05-01 17:39:16.902023+05:30
66	8	3	f	2025-05-01 17:50:42.210874+05:30
31	14	6	f	2025-04-28 14:20:04.255601+05:30
25	11	1	f	2025-04-28 12:15:26.726009+05:30
35	1	9	f	2025-04-28 18:10:11.200688+05:30
59	1	3	f	2025-04-29 15:34:59.410826+05:30
41	1	5	f	2025-04-29 10:03:22.126264+05:30
38	2	3	f	2025-04-28 18:41:03.391147+05:30
29	1	1	f	2025-04-28 12:15:26.726009+05:30
62	2	1	f	2025-05-01 17:20:11.516073+05:30
56	4	2	f	2025-04-29 13:43:49.169421+05:30
24	11	1	f	2025-04-28 12:15:26.726009+05:30
44	4	9	f	2025-04-29 10:23:07.305103+05:30
23	12	1	f	2025-04-28 12:15:26.726009+05:30
49	8	13	f	2025-04-29 11:24:30.238774+05:30
54	8	2	f	2025-04-29 12:42:40.785968+05:30
48	8	7	f	2025-04-29 11:24:30.198989+05:30
55	2	7	f	2025-04-29 12:49:25.624001+05:30
63	4	7	f	2025-05-01 17:32:39.616805+05:30
43	2	5	f	2025-04-29 10:18:57.777633+05:30
53	8	2	f	2025-04-29 12:05:37.271326+05:30
46	2	8	f	2025-04-29 10:38:15.355984+05:30
42	2	8	f	2025-04-29 10:15:05.732757+05:30
61	2	4	f	2025-04-30 10:51:58.025746+05:30
57	8	7	f	2025-04-29 15:09:22.679353+05:30
58	1	3	f	2025-04-29 15:34:46.598132+05:30
27	4	1	f	2025-04-28 12:15:26.726009+05:30
50	4	4	f	2025-04-29 11:52:19.497073+05:30
52	1	7	f	2025-04-29 12:04:09.940703+05:30
32	12	13	f	2025-04-28 16:01:02.075723+05:30
67	2	13	f	2025-05-01 18:23:30.602905+05:30
34	12	1	f	2025-04-28 16:48:57.541765+05:30
39	4	13	f	2025-04-28 18:46:27.701423+05:30
28	4	2	f	2025-04-28 12:15:26.726009+05:30
40	4	7	f	2025-04-28 18:48:15.921305+05:30
51	2	2	f	2025-04-29 12:01:39.674757+05:30
37	1	9	f	2025-04-28 18:39:32.223952+05:30
30	2	4	f	2025-04-28 12:36:11.190779+05:30
45	2	7	f	2025-04-29 10:26:35.723599+05:30
60	4	1	f	2025-04-30 10:18:15.036259+05:30
47	4	4	f	2025-04-29 11:14:33.439481+05:30
26	12	2	f	2025-04-28 12:15:26.726009+05:30
68	4	2	f	2025-05-02 13:54:37.061455+05:30
69	1	12	t	2025-05-02 14:41:09.839294+05:30
70	19	7	t	2025-05-02 14:46:38.046416+05:30
71	21	5	t	2025-05-05 11:26:23.204597+05:30
\.


              5312.dat                                                                                            0000600 0004000 0002000 00000000005 15006133414 0014234 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5274.dat                                                                                            0000600 0004000 0002000 00000003515 15006133414 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        12	jacky	\N	jacky@gmail.com	15899652358	0	2025-04-01 18:21:51.302332+05:30	0	2025-04-01 18:21:51.302332+05:30	\N	2
3	Alex	2	alex@gmail.com	9865320587	1	2025-03-21 14:38:53.124914+05:30	1	2025-03-21 14:38:53.124914+05:30	2025-03-21	\N
5	Prakash	5	prakash@gmail.com	8759321456	1	2025-03-24 14:04:37.097953+05:30	1	2025-03-24 14:04:37.097953+05:30	2025-03-24	\N
6	Joey	6	joey@gmail.com	8234563211	1	2025-03-24 14:05:35.854016+05:30	1	2025-03-24 14:05:35.854016+05:30	2025-03-24	\N
7	Kathan	7	kathan@gmail.com	9846351283	1	2025-03-24 14:22:02.687625+05:30	1	2025-03-24 14:22:02.687625+05:30	2025-03-24	\N
18	George	\N	ge@gmail.com	2013235466	0	2025-04-27 10:14:30.904949+05:30	0	2025-04-24 10:14:30.904949+05:30	\N	1
17	ABCD	\N	abc@gmail.com	7895632123	0	2025-04-23 09:51:36.245855+05:30	0	2025-04-23 09:51:36.245855+05:30	\N	4
8	meet	8	meet@gmail.com	9846328651	1	2025-03-24 14:22:38.245945+05:30	1	2025-03-24 14:22:38.245945+05:30	2025-03-24	3
11	sarah	\N	sarah@gmail.com	8957463213	0	2025-04-01 17:27:38.274498+05:30	0	2025-04-01 17:27:38.274498+05:30	\N	2
14	fsfs	\N	a@gmail.com	52524245	0	2025-04-01 18:30:50.520075+05:30	0	2025-04-01 18:30:50.520075+05:30	\N	2
2	Om	3	om@gmail.com	0526987432	1	2025-03-21 14:38:53.124914+05:30	1	2025-03-21 14:38:53.124914+05:30	2025-03-21	4
4	Priyanshi	1	pri@gmail.com	1256347895	1	2025-03-21 14:38:53.124914+05:30	1	2025-03-21 14:38:53.124914+05:30	2025-03-21	3
1	Nistha	4	nish@gmail.com	9841325670	1	2025-03-21 14:38:53.124914+05:30	1	2025-03-21 14:38:53.124914+05:30	2025-03-21	3
19	Jon Snow	\N	john@gmail.com	1895632478	0	2025-05-02 14:46:38.011931+05:30	0	2025-05-02 14:46:38.011931+05:30	\N	5
20	fdsfsd	5	a@gmailc.m	gvrf;klmrfll	1	2025-05-02 16:01:16.745205+05:30	1	2025-05-02 16:01:16.745205+05:30	\N	4
21	Tony Stark	\N	tony@gmail.com	7895463213	0	2025-05-05 11:26:23.122083+05:30	0	2025-05-05 11:26:23.122083+05:30	\N	4
\.


                                                                                                                                                                                   5278.dat                                                                                            0000600 0004000 0002000 00000002174 15006133414 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        14	9	284	0	2025-04-14 01:36:58.93271	0	2025-04-14 01:36:58.93271
22	24	284	0	2025-04-14 02:26:13.667771	0	2025-04-14 02:26:13.667771
23	7	284	0	2025-04-14 02:26:14.826796	0	2025-04-14 02:26:14.826796
24	29	284	0	2025-04-14 02:26:15.890816	0	2025-04-14 02:26:15.890816
25	36	284	0	2025-04-14 02:26:16.960968	0	2025-04-14 02:26:16.960968
29	40	284	0	2025-04-14 02:26:21.253842	0	2025-04-14 02:26:21.253842
30	34	284	0	2025-04-14 02:26:22.556704	0	2025-04-14 02:26:22.556704
31	27	284	0	2025-04-14 02:26:23.556123	0	2025-04-14 02:26:23.556123
33	31	284	0	2025-04-14 02:26:27.56105	0	2025-04-14 02:26:27.56105
36	5	284	0	2025-04-14 02:26:38.759937	0	2025-04-14 02:26:38.759937
38	37	278	0	2025-04-14 21:46:31.61494	0	2025-04-14 21:46:31.61494
45	26	284	0	2025-04-15 03:35:52.66275	0	2025-04-15 03:35:52.66275
47	44	284	0	2025-04-24 21:13:07.943928	0	2025-04-24 21:13:07.943928
48	51	284	0	2025-04-24 21:13:10.668572	0	2025-04-24 21:13:10.668572
49	53	284	0	2025-04-24 21:13:13.559425	0	2025-04-24 21:13:13.559425
50	41	284	0	2025-04-24 21:13:34.218979	0	2025-04-24 21:13:34.218979
51	22	284	0	2025-04-28 05:43:26.34202	0	2025-04-28 05:43:26.34202
\.


                                                                                                                                                                                                                                                                                                                                                                                                    5296.dat                                                                                            0000600 0004000 0002000 00000000173 15006133414 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        36	4	2	4
38	4	1	4
51	2	1	4
52	7	1	4
53	5	1	4
50	6	2	4
42	2	1	1
42	4	1	1
39	10	0	0
39	7	1	5
37	7	1	3
41	7	1	5
41	6	2	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                     5295.dat                                                                                            0000600 0004000 0002000 00000000046 15006133414 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Veg	\N
2	Non-Veg	\N
3	Vegan	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          5254.dat                                                                                            0000600 0004000 0002000 00000003523 15006133414 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	PanCake	This is Description	f	0	2025-03-03 10:41:45.492532+05:30	0	2025-03-03 10:41:45.492532+05:30
12	Sizzler	This is Description	f	0	2025-03-03 11:22:02.32054+05:30	0	2025-03-03 11:22:02.32054+05:30
14	Pav-Bhaji	This is Description	f	0	2025-03-03 11:55:09.852032+05:30	0	2025-03-03 11:55:09.852032+05:30
15	Momos	This is Description	f	0	2025-03-03 13:37:33.552168+05:30	0	2025-03-03 13:37:33.552168+05:30
10	caefcasdf	\N	t	0	2025-03-03 10:34:38.168855+05:30	0	2025-03-03 10:34:38.168855+05:30
6	Sandwich 	This is Description	f	1	2025-02-28 14:34:58.871341+05:30	1	2025-02-28 14:34:58.871341+05:30
13	Ice-Cream	This is Description	t	0	2025-03-03 11:50:27.638712+05:30	0	2025-03-03 11:50:27.638712+05:30
21	Shake	This is Description	f	0	2025-03-04 18:38:04.591461+05:30	0	2025-03-04 18:38:04.591461+05:30
7	Dessert	This is Description	f	1	2025-02-28 14:34:58.871341+05:30	1	2025-02-28 14:34:58.871341+05:30
23	Dosa	This is Description Of Dosa	f	0	2025-03-05 11:05:49.880107+05:30	0	2025-03-05 11:05:49.880107+05:30
9	Frenkie	This is Descript	f	1	2025-02-28 17:25:34.457521+05:30	1	2025-02-28 17:25:34.457521+05:30
25	gbgdf	\N	t	0	2025-03-07 10:51:31.987696+05:30	0	2025-03-07 10:51:31.987696+05:30
8	Burger	This is Descriptiond	f	1	2025-02-28 14:34:58.871341+05:30	1	2025-02-28 14:34:58.871341+05:30
24	Pastry	This is Description	t	0	2025-03-07 10:51:13.381378+05:30	0	2025-03-07 10:51:13.381378+05:30
26	frffr	frdrfff	f	0	2025-03-19 17:09:39.157648+05:30	0	2025-03-19 17:09:39.157648+05:30
27	ligrt5rteetdthed	thdtdtgdtd	f	1	2025-05-02 15:57:39.506689+05:30	1	2025-05-02 15:57:39.506689+05:30
28	gvgrfvfgv	fgffgf	f	1	2025-05-02 15:58:11.075988+05:30	1	2025-05-02 15:58:11.075988+05:30
29	kujefknf	k,jfejkn edk	f	0	2025-05-02 16:03:01.263562+05:30	0	2025-05-02 16:03:01.263562+05:30
30	fcds	cdc	f	0	2025-05-02 16:20:44.506745+05:30	0	2025-05-02 16:20:44.506745+05:30
\.


                                                                                                                                                                             5258.dat                                                                                            0000600 0004000 0002000 00000000101 15006133414 0014242 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pcs	1	2025-03-03 21:56:05.1863	1	2025-03-03 21:56:05.1863
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                               5262.dat                                                                                            0000600 0004000 0002000 00000010415 15006133414 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        37	15	Special Momos	250.00	2	1	f	f	4.00	SM	fddvdfa	\N	f	7	0	2025-03-07 04:40:52.074115	0	2025-03-07 04:40:52.074115	3	f
9	14	Special Pav-Bhaji	80.00	10	1	t	t	0.00	SP	This is Description	\N	f	\N	0	2025-03-04 03:41:22.014435	0	2025-03-04 03:41:22.014435	1	f
10	15	Paneer Cheese Momos	220.00	1	1	t	f	0.00	PCM	This is Description	\N	f	\N	0	2025-03-04 05:04:49.731456	0	2025-03-04 05:04:49.731456	1	f
22	15	Cheese Momos	150.00	4	1	t	f	0.00	CM	This is Description	\N	f	\N	0	2025-03-05 03:43:58.022331	0	2025-03-05 03:43:58.022331	1	f
23	8	Chicken Burger	250.00	1	1	f	t	10.00	CB	This is Description	\N	f	\N	0	2025-03-05 05:07:38.559972	0	2025-03-05 05:07:38.559972	2	f
24	21	AlmondShake	250.00	1	1	t	f	0.00	AS	This is Description	\N	f	\N	0	2025-03-07 03:49:23.724273	0	2025-03-07 03:49:23.724273	1	f
25	21	AlmondShake	250.00	1	1	t	f	0.00	AS	This is Description	\N	f	\N	0	2025-03-07 03:49:28.032884	0	2025-03-07 03:49:28.032884	1	f
26	21	AlmondShake	250.00	1	1	t	f	0.00	AS	thskfjkl,fgm,.	\N	f	\N	0	2025-03-07 03:50:29.234064	0	2025-03-07 03:50:29.234064	3	f
3	6	Punjabi Tadka Sandwich	200.00	3	1	t	f	10.00	PTS	This is Sandwich Item Description	\N	f	2	1	2025-03-03 21:58:28.406747	1	2025-03-03 21:58:28.406747	1	f
5	9	Cheese Frenkie	100.00	1	1	t	t	8.00	CF	This is Description	\N	f	\N	0	2025-03-04 03:36:29.720185	0	2025-03-04 03:36:29.720185	1	f
6	8	Cheese Burger	150.00	1	1	t	t	6.00	CB	This is Description	\N	f	\N	0	2025-03-04 03:37:46.020005	0	2025-03-04 03:37:46.020005	1	f
7	11	Standard PanCake!!	100.00	2	1	t	t	12.00	SP	This is Description	\N	f	\N	0	2025-03-04 03:39:09.653191	0	2025-03-04 03:39:09.653191	1	f
8	12	Chinese Sizzler	350.00	2	1	t	f	0.00	CS	This is Description	\N	f	\N	0	2025-03-04 03:40:33.445641	0	2025-03-04 03:40:33.445641	1	f
27	15	Chicken Momos	212.00	1	1	t	f	0.00	d	csdsdsfd	\N	f	\N	0	2025-03-07 03:55:00.95263	0	2025-03-07 03:55:00.95263	2	f
28	21	Almond Shake	340.00	1	1	t	f	0.00	AS	fddsdsdsd	\N	f	\N	0	2025-03-07 04:04:05.345758	0	2025-03-07 04:04:05.345758	1	f
29	21	Almond Shake	340.00	1	1	t	f	0.00	AS	fddsdsdsd	\N	f	\N	0	2025-03-07 04:12:24.298438	0	2025-03-07 04:12:24.298438	1	f
30	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	\N	0	2025-03-07 04:15:30.243069	0	2025-03-07 04:15:30.243069	1	f
31	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:40.832681	0	2025-03-07 04:16:40.832681	1	f
32	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:40.872124	0	2025-03-07 04:16:40.872124	1	f
33	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:42.56601	0	2025-03-07 04:16:42.56601	1	t
34	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:17:48.387132	0	2025-03-07 04:17:48.387132	1	f
35	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:17:55.329296	0	2025-03-07 04:17:55.329296	1	f
36	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:18:21.275857	0	2025-03-07 04:18:21.275857	1	f
38	23	Butter Dosa	120.00	3	1	t	f	0.00	BD	efdeeded	\N	f	4	0	2025-03-07 05:09:32.290533	0	2025-03-07 05:09:32.290533	1	f
40	9	Cheese Butter Frenkie	20.00	12	1	t	f	0.00	\N	\N	\N	f	\N	0	2025-03-12 04:59:22.453615	0	2025-03-12 04:59:22.453615	3	f
43	14	Cheese Pav-Bhaji	120.00	1	1	f	f	2.00	CPB	dejdoeldke	\N	f	\N	0	2025-03-17 21:25:40.152883	0	2025-03-17 21:25:40.152883	1	f
44	14	Cheese Pav-Bhaji	120.00	1	1	f	f	2.00	CPB	dejdoeldke	\N	f	\N	0	2025-03-17 21:25:42.695003	0	2025-03-17 21:25:42.695003	1	f
50	15	Special Momos	2.00	3	1	t	f	0.00	SM	fwrfrf	\N	f	\N	0	2025-03-18 20:58:05.111218	0	2025-03-18 20:58:05.111218	1	f
51	15	Mexican Momos	200.00	3	1	t	f	0.00	MM	csrfrsefr	\N	f	\N	0	2025-03-18 20:59:07.760694	0	2025-03-18 20:59:07.760694	1	f
52	15	Italian Momos	250.00	3	1	t	f	0.00	IM	deaef	\N	f	\N	0	2025-03-18 20:59:46.158633	0	2025-03-18 20:59:46.158633	1	f
53	15	Authentic Momos	270.00	2	1	t	f	0.00	AM	fcsfs	\N	f	\N	0	2025-03-18 21:00:25.199334	0	2025-03-18 21:00:25.199334	1	f
42	12	Maxican Sizzler	20.00	5	1	f	f	0.00	MS	ffrfefeff	/images/ed72676c-0593-43d9-9f24-31bef83137ca.jpg	f	\N	0	2025-03-12 20:43:51.602962	0	2025-03-12 20:43:51.602962	1	f
39	23	Cheese Dosa	130.00	1	1	f	f	5.00	CD	sfsdfssff	\N	f	7	0	2025-03-07 05:10:52.345699	0	2025-03-07 05:10:52.345699	3	f
41	21	Kit Kate Shake	40.00	3	1	f	f	0.00		fvddf	\N	f	\N	0	2025-03-12 05:14:32.907135	0	2025-03-12 05:14:32.907135	2	f
\.


                                                                                                                                                                                                                                                   5256.dat                                                                                            0000600 0004000 0002000 00000001206 15006133414 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	Toppings	This is Description	f	\N	0	2025-03-04 21:34:58.243419	0	2025-03-04 21:34:58.243419
6	Crust Option	This is Description	f	\N	0	2025-03-04 21:41:06.28655	0	2025-03-04 21:41:06.28655
2	Veggies	This is Description	f	6	1	2025-03-03 21:55:03.741296	1	2025-03-03 21:55:03.741296
4	Size	This is Descriptions	f	\N	0	2025-03-04 21:33:19.540832	0	2025-03-04 21:33:19.540832
7	Sauce Option	\N	f	\N	0	2025-03-05 23:23:22.455157	0	2025-03-05 23:23:22.455157
10	Pizza Options	This is Description	f	\N	0	2025-03-11 03:35:58.752366	0	2025-03-11 03:35:58.752366
11	Veggiesssssss	eeeeee	f	\N	0	2025-03-18 21:43:42.028518	0	2025-03-18 21:43:42.028518
\.


                                                                                                                                                                                                                                                                                                                                                                                          5264.dat                                                                                            0000600 0004000 0002000 00000005175 15006133414 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Large	4	180.00	f	1	1	This is Description	0	2025-03-05 00:46:46.06743	0	2025-03-05 00:46:46.06743
4	Tomato	7	30.00	f	1	2	This is Description	0	2025-03-05 23:23:54.861182	0	2025-03-05 23:23:54.861182
5	Thin	6	80.00	f	1	2	cdcdcdc	0	2025-03-10 21:35:02.926946	0	2025-03-10 21:35:02.926946
8	BBQ	7	120.00	f	1	1	cddascds	0	2025-03-10 21:43:29.927241	0	2025-03-10 21:43:29.927241
9	Alfredo	7	150.00	f	1	3	cdacsa	0	2025-03-10 23:06:50.451562	0	2025-03-10 23:06:50.451562
35	Extra Large	6	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:40:14.549941	0	2025-03-11 01:40:14.549941
37	Extra Large	6	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:55:36.77268	0	2025-03-11 01:55:36.77268
39	Chillie Flaxes	5	20.00	f	1	1	cdsdcsd	0	2025-03-11 01:58:45.450769	0	2025-03-11 01:58:45.450769
40	Chillie Flaxes	5	20.00	f	1	1	cdsdcsd	0	2025-03-11 02:03:00.871922	0	2025-03-11 02:03:00.871922
11	Capsicum!	2	30.00	f	1	1	cddad	0	2025-03-10 23:26:11.461773	0	2025-03-10 23:26:11.461773
36	Extra Large	5	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:50:07.586778	0	2025-03-11 01:50:07.586778
42	Chillie Flaxes	6	20.00	f	1	1	cdsdcsd	0	2025-03-11 03:14:17.043456	0	2025-03-11 03:14:17.043456
43	Chillie Flaxes3333	6	20.00	f	1	1	cdsdcsd	0	2025-03-11 03:18:29.835189	0	2025-03-11 03:18:29.835189
44	Chillie Flaxes3444	5	20.00	f	1	1	cdsdcsd	0	2025-03-11 03:23:31.255021	0	2025-03-11 03:23:31.255021
46	Chillie 	6	20.00	f	1	1	cdsdcsd	0	2025-03-11 03:30:32.679638	0	2025-03-11 03:30:32.679638
18	Extra Large	4	200.00	t	1	2	csdfvfvdfvdfv	0	2025-03-11 00:11:03.744438	0	2025-03-11 00:11:03.744438
3	Medium	4	130.00	t	1	1	This is Description	0	2025-03-05 00:47:15.021443	0	2025-03-05 00:47:15.021443
10	Onion	2	50.00	t	1	2	cdadl;kamc	0	2025-03-10 23:19:52.969562	0	2025-03-10 23:19:52.969562
38	SASASA	5	29.00	t	\N	2	DCSDAS	0	2025-03-11 01:56:32.65277	0	2025-03-11 01:56:32.65277
41	Chillie Flaxes	6	20.00	t	1	1	cdsdcsd	0	2025-03-11 03:09:50.851479	0	2025-03-11 03:09:50.851479
45	Chillie Flaxes34446666	2	20.00	t	1	1	cdsdcsd	0	2025-03-11 03:24:39.290781	0	2025-03-11 03:24:39.290781
17	Extra Large	4	200.00	t	1	2	csdfvfvdfvdfv	0	2025-03-11 00:10:22.805335	0	2025-03-11 00:10:22.805335
13	Tomato	2	50.00	t	1	3	fcdfd	0	2025-03-10 23:38:59.549271	0	2025-03-10 23:38:59.549271
6	Thick	6	100.00	t	1	3	ffsfdsdfds	0	2025-03-10 21:38:03.685889	0	2025-03-10 21:38:03.685889
12	Olives	2	80.00	f	1	6	elnrlkjnrfl	0	2025-03-10 23:36:34.016165	0	2025-03-10 23:36:34.016165
1	Small	4	80.00	f	1	1	This is Description	0	2025-03-04 22:50:10.446444	0	2025-03-04 22:50:10.446444
47	Tomato	\N	180.00	f	1	5	gfrsf	0	2025-03-12 20:54:56.377107	0	2025-03-12 20:54:56.377107
7	Gluten-Free	6	120.00	t	1	1	cddscsdc	0	2025-03-10 21:42:30.36607	0	2025-03-10 21:42:30.36607
\.


                                                                                                                                                                                                                                                                                                                                                                                                   5286.dat                                                                                            0000600 0004000 0002000 00000022325 15006133414 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        81	37	2025-04-25	1	0	250.00	0	2025-04-25 17:49:50.501988+05:30	0	2025-04-25 17:49:50.501988+05:30	33	\N	15	\N	In Progress	3789
82	22	2025-04-25	3	0	150.00	0	2025-04-25 17:49:50.604449+05:30	0	2025-04-25 17:49:50.604449+05:30	33	\N	15	\N	In Progress	22
83	10	2025-04-25	3	0	220.00	0	2025-04-25 17:51:15.318176+05:30	0	2025-04-25 17:51:15.318176+05:30	33	\N	15	\N	In Progress	10
84	42	2025-04-25	2	0	20.00	0	2025-04-25 17:53:24.686474+05:30	0	2025-04-25 17:53:24.686474+05:30	33	\N	12	\N	In Progress	42111
116	10	2025-04-28	1	0	220.00	0	2025-04-28 18:43:16.196611+05:30	0	2025-04-28 18:43:16.196611+05:30	48	\N	15	\N	In Progress	10
117	41	2025-04-28	1	0	40.00	0	2025-04-28 18:43:16.203612+05:30	0	2025-04-28 18:43:16.203612+05:30	48	\N	21	\N	In Progress	4148935374246
85	37	2025-04-25	1	0	250.00	0	2025-04-25 17:55:19.947311+05:30	0	2025-04-25 17:55:19.947311+05:30	34	\N	15	\N	In Progress	3789
86	10	2025-04-25	1	0	220.00	0	2025-04-25 17:55:19.978174+05:30	0	2025-04-25 17:55:19.978174+05:30	34	\N	15	\N	In Progress	10
87	22	2025-04-25	1	0	150.00	0	2025-04-25 17:55:19.986101+05:30	0	2025-04-25 17:55:19.986101+05:30	34	\N	15	\N	In Progress	22
89	24	2025-04-25	1	0	250.00	0	2025-04-25 17:55:50.564629+05:30	0	2025-04-25 17:55:50.564629+05:30	34	\N	21	\N	In Progress	24
90	9	2025-04-25	1	0	80.00	0	2025-04-25 18:23:08.30946+05:30	0	2025-04-25 18:23:08.30946+05:30	35	\N	14	\N	In Progress	9
91	37	2025-04-25	1	0	250.00	0	2025-04-25 18:23:08.339268+05:30	0	2025-04-25 18:23:08.339268+05:30	35	\N	15	\N	In Progress	3789
114	37	2025-04-28	1	0	250.00	0	2025-04-28 18:43:16.08361+05:30	0	2025-04-28 18:43:16.08361+05:30	48	\N	15	\N	In Progress	378
115	42	2025-04-28	1	0	20.00	0	2025-04-28 18:43:16.180796+05:30	0	2025-04-28 18:43:16.180796+05:30	48	\N	12	\N	In Progress	4211
129	9	2025-04-28	1	0	80.00	0	2025-04-29 10:39:36.208473+05:30	0	2025-04-29 10:39:36.208473+05:30	57	\N	14	Item Comment 1	In Progress	9
97	42	2025-04-27	2	0	20.00	0	2025-04-28 09:35:25.332391+05:30	0	2025-04-28 09:35:25.332391+05:30	37	\N	12	\N	In Progress	421
96	10	2025-04-27	3	3	220.00	0	2025-04-28 09:31:15.436632+05:30	0	2025-04-28 09:31:15.436632+05:30	37	\N	15	\N	Ready	10
98	37	2025-04-27	1	0	250.00	0	2025-04-28 09:46:52.53939+05:30	0	2025-04-28 09:46:52.53939+05:30	38	\N	15	\N	In Progress	3789
99	10	2025-04-27	1	0	220.00	0	2025-04-28 09:46:52.659993+05:30	0	2025-04-28 09:46:52.659993+05:30	38	\N	15	\N	In Progress	10
100	9	2025-04-27	1	0	80.00	0	2025-04-28 10:25:55.803668+05:30	0	2025-04-28 10:25:55.803668+05:30	39	\N	14	\N	In Progress	9
101	42	2025-04-27	1	0	20.00	0	2025-04-28 10:25:55.818787+05:30	0	2025-04-28 10:25:55.818787+05:30	39	\N	12	\N	In Progress	42111
102	10	2025-04-27	2	0	220.00	0	2025-04-28 10:58:56.203506+05:30	0	2025-04-28 10:58:56.203506+05:30	39	\N	15	\N	In Progress	10
130	37	2025-04-28	2	0	250.00	0	2025-04-29 10:39:36.215622+05:30	0	2025-04-29 10:39:36.215622+05:30	57	\N	15	Item Comment 2	In Progress	3789
131	42	2025-04-28	1	0	20.00	0	2025-04-29 10:45:13.964579+05:30	0	2025-04-29 10:45:13.964579+05:30	57	\N	12	\N	In Progress	42111
107	42	2025-04-28	1	0	20.00	0	2025-04-28 12:36:33.506362+05:30	0	2025-04-28 12:36:33.506362+05:30	42	\N	12	\N	In Progress	42111
136	37	2025-04-28	16	0	250.00	0	2025-04-29 11:54:04.079866+05:30	0	2025-04-29 11:54:04.079866+05:30	60	\N	15	\N	In Progress	3789
105	9	2025-04-28	1	0	80.00	0	2025-04-28 12:36:33.48117+05:30	0	2025-04-28 12:36:33.48117+05:30	42	\N	14	\N	In Progress	9
103	37	2025-04-27	1	1	250.00	0	2025-04-28 11:30:29.769219+05:30	0	2025-04-28 11:30:29.769219+05:30	40	\N	15	\N	Ready	3789
106	37	2025-04-28	1	0	250.00	0	2025-04-28 12:36:33.498245+05:30	0	2025-04-28 12:36:33.498245+05:30	42	\N	15	\N	In Progress	378
108	37	2025-04-28	1	0	250.00	0	2025-04-28 14:31:38.186936+05:30	0	2025-04-28 14:31:38.186936+05:30	43	\N	15	\N	In Progress	3789
104	37	2025-04-27	10	0	250.00	0	2025-04-28 12:22:10.086011+05:30	0	2025-04-28 12:22:10.086011+05:30	41	\N	15	\N	In Progress	3789
126	42	2025-04-28	1	1	20.00	0	2025-04-29 10:03:57.87169+05:30	0	2025-04-29 10:03:57.87169+05:30	55	\N	12	\N	Ready	421
109	37	2025-04-28	5	5	250.00	0	2025-04-28 16:35:38.363326+05:30	0	2025-04-28 16:35:38.363326+05:30	44	\N	15	\N	Ready	3789
111	37	2025-04-28	1	0	250.00	0	2025-04-28 18:14:54.23986+05:30	0	2025-04-28 18:14:54.23986+05:30	46	\N	15	\N	In Progress	3789
112	42	2025-04-28	1	0	20.00	0	2025-04-28 18:14:54.324414+05:30	0	2025-04-28 18:14:54.324414+05:30	46	\N	12	\N	In Progress	42111
124	37	2025-04-28	1	1	250.00	0	2025-04-29 10:03:57.804234+05:30	0	2025-04-29 10:03:57.804234+05:30	55	\N	15	\N	Ready	3789
138	37	2025-04-28	1	0	0.00	0	2025-04-29 12:02:20.171809+05:30	0	2025-04-29 12:02:20.171809+05:30	61	\N	15	\N	In Progress	379
125	10	2025-04-28	1	1	220.00	0	2025-04-29 10:03:57.868449+05:30	0	2025-04-29 10:03:57.868449+05:30	55	\N	15	\N	Ready	10
113	37	2025-04-28	13	13	250.00	0	2025-04-28 18:23:10.168414+05:30	0	2025-04-28 18:23:10.168414+05:30	47	\N	15	\N	Ready	3789
127	9	2025-04-28	1	0	80.00	0	2025-04-29 10:39:10.691769+05:30	0	2025-04-29 10:39:10.691769+05:30	56	\N	14	\N	In Progress	9
128	37	2025-04-28	1	0	250.00	0	2025-04-29 10:39:10.71056+05:30	0	2025-04-29 10:39:10.71056+05:30	56	\N	15	\N	In Progress	3789
132	37	2025-04-28	1	1	250.00	0	2025-04-29 11:17:59.755197+05:30	0	2025-04-29 11:17:59.755197+05:30	58	\N	15	\N	Ready	3789
133	42	2025-04-28	3	3	20.00	0	2025-04-29 11:22:00.840671+05:30	0	2025-04-29 11:22:00.840671+05:30	58	\N	12	\N	Ready	42111
137	37	2025-04-28	1	0	250.00	0	2025-04-29 12:02:20.162858+05:30	0	2025-04-29 12:02:20.162858+05:30	61	\N	15	\N	In Progress	379
134	37	2025-04-28	4	0	250.00	0	2025-04-29 11:24:46.701718+05:30	0	2025-04-29 11:24:46.701718+05:30	59	\N	15	\N	In Progress	3789
139	37	2025-04-28	1	0	250.00	0	2025-04-29 12:04:33.304462+05:30	0	2025-04-29 12:04:33.304462+05:30	62	\N	15	\N	In Progress	3789
140	37	2025-04-28	1	0	0.00	0	2025-04-29 12:04:33.31456+05:30	0	2025-04-29 12:04:33.31456+05:30	62	\N	15	\N	In Progress	3789
144	37	2025-04-29	3	3	250.00	0	2025-04-29 12:49:36.880784+05:30	0	2025-04-29 12:49:36.880784+05:30	65	\N	15	\N	Ready	3789
135	37	2025-04-28	16	0	250.00	0	2025-04-29 11:54:04.054787+05:30	0	2025-04-29 11:54:04.054787+05:30	60	\N	15	\N	In Progress	3789
145	37	2025-04-29	3	0	250.00	0	2025-04-29 14:10:56.872904+05:30	0	2025-04-29 14:10:56.872904+05:30	66	\N	15	\N	In Progress	3789
146	37	2025-04-29	3	0	250.00	0	2025-04-29 15:09:41.076549+05:30	0	2025-04-29 15:09:41.076549+05:30	67	\N	15	\N	In Progress	3789
141	37	2025-04-28	2	2	250.00	0	2025-04-29 12:05:48.152088+05:30	0	2025-04-29 12:05:48.152088+05:30	63	\N	15	\N	Ready	3789
143	37	2025-04-29	2	2	250.00	0	2025-04-29 12:42:53.144284+05:30	0	2025-04-29 12:42:53.144284+05:30	64	\N	15	\N	Ready	379
147	37	2025-04-29	3	3	250.00	0	2025-04-30 10:06:38.723842+05:30	0	2025-04-30 10:06:38.723842+05:30	68	\N	15	\N	Ready	3789
148	37	2025-04-29	3	3	250.00	0	2025-04-30 10:27:34.319504+05:30	0	2025-04-30 10:27:34.319504+05:30	69	\N	15	\N	Ready	3789
149	42	2025-04-29	1	1	20.00	0	2025-04-30 11:04:08.442849+05:30	0	2025-04-30 11:04:08.442849+05:30	69	\N	12	\N	Ready	42111
150	37	2025-05-01	1	1	250.00	0	2025-05-01 17:21:19.995407+05:30	0	2025-05-01 17:21:19.995407+05:30	70	\N	15	\N	Ready	3789
151	10	2025-05-01	1	1	220.00	0	2025-05-01 17:21:20.072649+05:30	0	2025-05-01 17:21:20.072649+05:30	70	\N	15	\N	Ready	10
152	9	2025-05-01	1	1	80.00	0	2025-05-01 17:21:20.081638+05:30	0	2025-05-01 17:21:20.081638+05:30	70	\N	14	\N	Ready	9
153	37	2025-05-01	1	1	250.00	0	2025-05-01 17:34:05.178309+05:30	0	2025-05-01 17:34:05.178309+05:30	71	\N	15	\N	Ready	3789
154	10	2025-05-01	1	1	220.00	0	2025-05-01 17:34:05.2563+05:30	0	2025-05-01 17:34:05.2563+05:30	71	\N	15	\N	Ready	10
155	42	2025-05-01	1	1	20.00	0	2025-05-01 17:34:05.264015+05:30	0	2025-05-01 17:34:05.264015+05:30	71	\N	12	\N	Ready	42111
156	37	2025-05-01	1	1	250.00	0	2025-05-01 17:39:57.137289+05:30	0	2025-05-01 17:39:57.137289+05:30	72	\N	15	\N	Ready	3789
157	9	2025-05-01	1	1	80.00	0	2025-05-01 17:39:57.209367+05:30	0	2025-05-01 17:39:57.209367+05:30	72	\N	14	\N	Ready	9
158	7	2025-05-01	1	1	100.00	0	2025-05-01 17:39:57.216826+05:30	0	2025-05-01 17:39:57.216826+05:30	72	\N	11	\N	Ready	7
159	9	2025-05-01	3	3	80.00	0	2025-05-01 17:51:06.389598+05:30	0	2025-05-01 17:51:06.389598+05:30	73	\N	14	\N	Ready	9
160	10	2025-05-01	1	1	220.00	0	2025-05-01 17:51:06.404624+05:30	0	2025-05-01 17:51:06.404624+05:30	73	\N	15	\N	Ready	10
161	3	2025-05-01	1	1	200.00	0	2025-05-01 17:51:06.413284+05:30	0	2025-05-01 17:51:06.413284+05:30	73	\N	6	\N	Ready	3
162	37	2025-05-01	1	1	250.00	0	2025-05-01 18:23:52.908974+05:30	0	2025-05-01 18:23:52.908974+05:30	74	\N	15	\N	Ready	3789
163	5	2025-05-01	1	1	100.00	0	2025-05-01 18:23:52.97899+05:30	0	2025-05-01 18:23:52.97899+05:30	74	\N	9	\N	Ready	5
164	7	2025-05-01	3	3	100.00	0	2025-05-01 18:23:52.986133+05:30	0	2025-05-01 18:23:52.986133+05:30	74	\N	11	\N	Ready	7
165	8	2025-05-01	1	1	350.00	0	2025-05-01 18:23:52.994228+05:30	0	2025-05-01 18:23:52.994228+05:30	74	\N	12	\N	Ready	8
166	29	2025-05-01	1	1	340.00	0	2025-05-01 18:23:53.00113+05:30	0	2025-05-01 18:23:53.00113+05:30	74	\N	21	\N	Ready	29
167	37	2025-05-02	1	1	250.00	0	2025-05-02 13:55:03.658555+05:30	0	2025-05-02 13:55:03.658555+05:30	75	\N	15	\N	Ready	3789
168	37	2025-05-02	2	1	250.00	0	2025-05-02 14:43:18.606988+05:30	0	2025-05-02 14:43:18.606988+05:30	76	\N	15	\N	In Progress	378
169	37	2025-05-02	1	0	250.00	0	2025-05-02 15:48:58.124638+05:30	0	2025-05-02 15:48:58.124638+05:30	77	\N	15	\N	In Progress	3789
\.


                                                                                                                                                                                                                                                                                                           5288.dat                                                                                            0000600 0004000 0002000 00000022162 15006133414 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        103	11	2025-04-28	0	30.00	0	2025-04-28 00:06:33.561151	0	2025-04-28 00:06:33.561151	107	42	42111
104	8	2025-04-28	0	120.00	0	2025-04-28 02:01:38.237936	0	2025-04-28 02:01:38.237936	108	37	3789
105	9	2025-04-28	0	150.00	0	2025-04-28 02:01:38.246326	0	2025-04-28 02:01:38.246326	108	37	3789
77	9	2025-04-25	0	150.00	0	2025-04-25 05:19:50.58105	0	2025-04-25 05:19:50.58105	81	37	3789
78	8	2025-04-25	0	120.00	0	2025-04-25 05:19:50.596953	0	2025-04-25 05:19:50.596953	81	37	3789
79	1	2025-04-25	0	80.00	0	2025-04-25 05:23:24.694789	0	2025-04-25 05:23:24.694789	84	42	42111
80	11	2025-04-25	0	30.00	0	2025-04-25 05:23:24.704639	0	2025-04-25 05:23:24.704639	84	42	42111
84	8	2025-04-25	0	120.00	0	2025-04-25 05:25:20.011041	0	2025-04-25 05:25:20.011041	\N	37	3748
81	9	2025-04-25	0	150.00	0	2025-04-25 05:25:19.960384	0	2025-04-25 05:25:19.960384	85	37	3789
82	8	2025-04-25	0	120.00	0	2025-04-25 05:25:19.969437	0	2025-04-25 05:25:19.969437	85	37	3789
85	8	2025-04-25	0	120.00	0	2025-04-25 05:53:08.525708	0	2025-04-25 05:53:08.525708	91	37	3789
86	9	2025-04-25	0	150.00	0	2025-04-25 05:53:08.541581	0	2025-04-25 05:53:08.541581	91	37	3789
106	8	2025-04-28	0	120.00	0	2025-04-28 04:05:38.418101	0	2025-04-28 04:05:38.418101	109	37	3789
107	9	2025-04-28	0	150.00	0	2025-04-28 04:05:38.436798	0	2025-04-28 04:05:38.436798	109	37	3789
93	1	2025-04-27	0	80.00	0	2025-04-27 21:05:25.335826	0	2025-04-27 21:05:25.335826	97	42	421
94	9	2025-04-27	0	150.00	0	2025-04-27 21:16:52.592575	0	2025-04-27 21:16:52.592575	98	37	3789
95	8	2025-04-27	0	120.00	0	2025-04-27 21:16:52.606357	0	2025-04-27 21:16:52.606357	98	37	3789
96	1	2025-04-27	0	80.00	0	2025-04-27 21:55:55.862436	0	2025-04-27 21:55:55.862436	101	42	42111
97	11	2025-04-27	0	30.00	0	2025-04-27 21:55:55.924059	0	2025-04-27 21:55:55.924059	101	42	42111
98	9	2025-04-27	0	150.00	0	2025-04-27 23:00:29.820715	0	2025-04-27 23:00:29.820715	103	37	3789
99	8	2025-04-27	0	120.00	0	2025-04-27 23:00:29.833544	0	2025-04-27 23:00:29.833544	103	37	3789
110	9	2025-04-28	0	150.00	0	2025-04-28 05:44:54.29007	0	2025-04-28 05:44:54.29007	111	37	3789
111	8	2025-04-28	0	120.00	0	2025-04-28 05:44:54.317524	0	2025-04-28 05:44:54.317524	111	37	3789
112	1	2025-04-28	0	80.00	0	2025-04-28 05:44:54.332027	0	2025-04-28 05:44:54.332027	112	42	42111
113	11	2025-04-28	0	30.00	0	2025-04-28 05:44:54.339951	0	2025-04-28 05:44:54.339951	112	42	42111
130	9	2025-04-28	0	150.00	0	2025-04-28 22:09:10.757251	0	2025-04-28 22:09:10.757251	128	37	3789
131	8	2025-04-28	0	120.00	0	2025-04-28 22:09:10.76836	0	2025-04-28 22:09:10.76836	128	37	3789
114	9	2025-04-28	0	150.00	0	2025-04-28 05:53:10.177383	0	2025-04-28 05:53:10.177383	113	37	3789
115	8	2025-04-28	0	120.00	0	2025-04-28 05:53:10.185575	0	2025-04-28 05:53:10.185575	113	37	3789
100	9	2025-04-27	0	150.00	0	2025-04-27 23:52:10.136102	0	2025-04-27 23:52:10.136102	104	37	3789
101	8	2025-04-27	0	120.00	0	2025-04-27 23:52:10.149088	0	2025-04-27 23:52:10.149088	104	37	3789
132	9	2025-04-28	0	150.00	0	2025-04-28 22:09:36.222747	0	2025-04-28 22:09:36.222747	130	37	3789
102	1	2025-04-28	0	80.00	0	2025-04-28 00:06:33.547259	0	2025-04-28 00:06:33.547259	107	42	42111
120	42	2025-04-28	0	20.00	0	2025-04-28 06:13:16.276476	0	2025-04-28 06:13:16.276476	117	41	4148935374246
121	37	2025-04-28	0	200.00	0	2025-04-28 06:13:16.28421	0	2025-04-28 06:13:16.28421	117	41	4148935374246
122	35	2025-04-28	0	200.00	0	2025-04-28 06:13:16.297091	0	2025-04-28 06:13:16.297091	117	41	4148935374246
123	46	2025-04-28	0	20.00	0	2025-04-28 06:13:16.306861	0	2025-04-28 06:13:16.306861	117	41	4148935374246
124	8	2025-04-28	0	120.00	0	2025-04-28 06:13:16.314069	0	2025-04-28 06:13:16.314069	117	41	4148935374246
125	9	2025-04-28	0	150.00	0	2025-04-28 06:13:16.321202	0	2025-04-28 06:13:16.321202	117	41	4148935374246
126	4	2025-04-28	0	30.00	0	2025-04-28 06:13:16.326162	0	2025-04-28 06:13:16.326162	117	41	4148935374246
116	8	2025-04-28	0	120.00	0	2025-04-28 06:13:16.149844	0	2025-04-28 06:13:16.149844	114	37	378
117	9	2025-04-28	0	150.00	0	2025-04-28 06:13:16.164314	0	2025-04-28 06:13:16.164314	114	37	378
118	4	2025-04-28	0	30.00	0	2025-04-28 06:13:16.172841	0	2025-04-28 06:13:16.172841	114	37	378
119	11	2025-04-28	0	30.00	0	2025-04-28 06:13:16.189659	0	2025-04-28 06:13:16.189659	115	42	4211
127	8	2025-04-28	0	120.00	0	2025-04-28 21:33:57.854802	0	2025-04-28 21:33:57.854802	124	37	3789
128	9	2025-04-28	0	150.00	0	2025-04-28 21:33:57.865881	0	2025-04-28 21:33:57.865881	124	37	3789
129	1	2025-04-28	0	80.00	0	2025-04-28 21:33:57.8743	0	2025-04-28 21:33:57.8743	126	42	421
133	8	2025-04-28	0	120.00	0	2025-04-28 22:09:36.229554	0	2025-04-28 22:09:36.229554	130	37	3789
134	1	2025-04-28	0	80.00	0	2025-04-28 22:15:13.990145	0	2025-04-28 22:15:13.990145	131	42	42111
135	11	2025-04-28	0	30.00	0	2025-04-28 22:15:13.998116	0	2025-04-28 22:15:13.998116	131	42	42111
136	8	2025-04-28	0	120.00	0	2025-04-28 22:47:59.808767	0	2025-04-28 22:47:59.808767	132	37	3789
137	9	2025-04-28	0	150.00	0	2025-04-28 22:47:59.821601	0	2025-04-28 22:47:59.821601	132	37	3789
138	1	2025-04-28	0	80.00	0	2025-04-28 22:52:00.879845	0	2025-04-28 22:52:00.879845	133	42	42111
139	11	2025-04-28	0	30.00	0	2025-04-28 22:52:00.892407	0	2025-04-28 22:52:00.892407	133	42	42111
142	8	2025-04-28	0	120.00	0	2025-04-28 23:24:04.067922	0	2025-04-28 23:24:04.067922	135	37	3789
143	9	2025-04-28	0	150.00	0	2025-04-28 23:24:04.07637	0	2025-04-28 23:24:04.07637	135	37	3789
140	9	2025-04-28	0	150.00	0	2025-04-28 22:54:46.709527	0	2025-04-28 22:54:46.709527	134	37	3789
141	8	2025-04-28	0	120.00	0	2025-04-28 22:54:46.718862	0	2025-04-28 22:54:46.718862	134	37	3789
144	8	2025-04-28	0	120.00	0	2025-04-28 23:24:04.082453	0	2025-04-28 23:24:04.082453	136	37	3789
145	9	2025-04-28	0	150.00	0	2025-04-28 23:24:04.084763	0	2025-04-28 23:24:04.084763	136	37	3789
147	9	2025-04-28	0	150.00	0	2025-04-28 23:32:20.174822	0	2025-04-28 23:32:20.174822	138	37	379
146	9	2025-04-28	0	150.00	0	2025-04-28 23:32:20.165838	0	2025-04-28 23:32:20.165838	137	37	379
148	9	2025-04-28	0	150.00	0	2025-04-28 23:34:33.307378	0	2025-04-28 23:34:33.307378	139	37	3789
149	8	2025-04-28	0	120.00	0	2025-04-28 23:34:33.310302	0	2025-04-28 23:34:33.310302	139	37	3789
150	9	2025-04-28	0	150.00	0	2025-04-28 23:34:33.317955	0	2025-04-28 23:34:33.317955	140	37	3789
151	8	2025-04-28	0	120.00	0	2025-04-28 23:34:33.320835	0	2025-04-28 23:34:33.320835	140	37	3789
152	9	2025-04-28	0	150.00	0	2025-04-28 23:35:48.155769	0	2025-04-28 23:35:48.155769	141	37	3789
153	8	2025-04-28	0	120.00	0	2025-04-28 23:35:48.159685	0	2025-04-28 23:35:48.159685	141	37	3789
154	8	2025-04-28	0	120.00	0	2025-04-28 23:41:48.082435	0	2025-04-28 23:41:48.082435	\N	37	3748
156	9	2025-04-29	0	150.00	0	2025-04-29 00:12:53.193642	0	2025-04-29 00:12:53.193642	143	37	379
157	9	2025-04-29	0	150.00	0	2025-04-29 00:19:36.933438	0	2025-04-29 00:19:36.933438	144	37	3789
158	8	2025-04-29	0	120.00	0	2025-04-29 00:19:36.946412	0	2025-04-29 00:19:36.946412	144	37	3789
159	9	2025-04-29	0	150.00	0	2025-04-29 01:40:56.922878	0	2025-04-29 01:40:56.922878	145	37	3789
160	8	2025-04-29	0	120.00	0	2025-04-29 01:40:56.93229	0	2025-04-29 01:40:56.93229	145	37	3789
161	8	2025-04-29	0	120.00	0	2025-04-29 02:39:41.106935	0	2025-04-29 02:39:41.106935	146	37	3789
162	9	2025-04-29	0	150.00	0	2025-04-29 02:39:41.115919	0	2025-04-29 02:39:41.115919	146	37	3789
165	8	2025-04-29	0	120.00	0	2025-04-29 21:57:34.366365	0	2025-04-29 21:57:34.366365	148	37	3789
166	9	2025-04-29	0	150.00	0	2025-04-29 21:57:34.384122	0	2025-04-29 21:57:34.384122	148	37	3789
167	1	2025-04-29	0	80.00	0	2025-04-29 22:34:08.459969	0	2025-04-29 22:34:08.459969	149	42	42111
168	11	2025-04-29	0	30.00	0	2025-04-29 22:34:08.465744	0	2025-04-29 22:34:08.465744	149	42	42111
163	8	2025-04-29	0	120.00	0	2025-04-29 21:36:44.619665	0	2025-04-29 21:36:44.619665	147	37	3789
164	9	2025-04-29	0	150.00	0	2025-04-29 21:36:49.028502	0	2025-04-29 21:36:49.028502	147	37	3789
169	8	2025-05-01	0	120.00	0	2025-05-01 04:51:20.048038	0	2025-05-01 04:51:20.048038	150	37	3789
170	9	2025-05-01	0	150.00	0	2025-05-01 04:51:20.064211	0	2025-05-01 04:51:20.064211	150	37	3789
171	8	2025-05-01	0	120.00	0	2025-05-01 05:04:05.229393	0	2025-05-01 05:04:05.229393	153	37	3789
172	9	2025-05-01	0	150.00	0	2025-05-01 05:04:05.248521	0	2025-05-01 05:04:05.248521	153	37	3789
173	1	2025-05-01	0	80.00	0	2025-05-01 05:04:05.272765	0	2025-05-01 05:04:05.272765	155	42	42111
174	11	2025-05-01	0	30.00	0	2025-05-01 05:04:05.279756	0	2025-05-01 05:04:05.279756	155	42	42111
175	9	2025-05-01	0	150.00	0	2025-05-01 05:09:57.189496	0	2025-05-01 05:09:57.189496	156	37	3789
176	8	2025-05-01	0	120.00	0	2025-05-01 05:09:57.201553	0	2025-05-01 05:09:57.201553	156	37	3789
177	8	2025-05-01	0	120.00	0	2025-05-01 05:53:52.959247	0	2025-05-01 05:53:52.959247	162	37	3789
178	9	2025-05-01	0	150.00	0	2025-05-01 05:53:52.971806	0	2025-05-01 05:53:52.971806	162	37	3789
179	9	2025-05-02	0	150.00	0	2025-05-02 01:25:03.711114	0	2025-05-02 01:25:03.711114	167	37	3789
180	8	2025-05-02	0	120.00	0	2025-05-02 01:25:03.72418	0	2025-05-02 01:25:03.72418	167	37	3789
181	8	2025-05-02	0	120.00	0	2025-05-02 02:13:18.659634	0	2025-05-02 02:13:18.659634	168	37	378
182	8	2025-05-02	0	120.00	0	2025-05-02 03:18:58.154356	0	2025-05-02 03:18:58.154356	169	37	3789
183	9	2025-05-02	0	150.00	0	2025-05-02 03:18:58.169434	0	2025-05-02 03:18:58.169434	169	37	3789
\.


                                                                                                                                                                                                                                                                                                                                                                                                              5306.dat                                                                                            0000600 0004000 0002000 00000000121 15006133414 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Failed
2	On Hold
3	Cancelled
4	Completed
5	Served
6	In Progress
7	Pending
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                               5290.dat                                                                                            0000600 0004000 0002000 00000000310 15006133414 0014240 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        10	58	4
11	59	7
12	59	13
13	60	4
14	61	2
15	62	7
16	63	2
17	64	2
18	65	7
19	66	2
20	67	7
21	68	3
22	68	3
23	69	1
24	70	4
25	70	1
26	71	7
27	72	6
28	72	6
29	73	3
30	74	13
31	75	2
32	76	12
33	77	7
\.


                                                                                                                                                                                                                                                                                                                        5302.dat                                                                                            0000600 0004000 0002000 00000006070 15006133414 0014243 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        111	38	4	100.00
112	38	5	14.80
8	2	2	\N
9	2	1	\N
4	1	1	42.40
5	1	2	10.600
6	1	4	100.0
7	1	5	10.600
10	\N	1	8
11	\N	2	2.00
12	\N	4	100.00
13	\N	5	2.00
14	\N	13	43.45
15	\N	1	8
16	\N	2	2.00
17	\N	4	100.00
18	\N	5	2.00
19	\N	13	43.45
20	\N	1	8
21	\N	2	2.00
22	\N	4	100.00
23	\N	5	2.00
24	\N	13	43.45
25	\N	2	2.00
26	\N	4	100.00
27	\N	5	2.00
28	\N	13	43.45
113	38	13	43.45
30	\N	2	2.00
31	\N	4	100.00
32	\N	5	2.00
33	\N	13	43.45
29	\N	1	8
34	\N	2	2.00
35	\N	4	100.00
36	\N	5	2.00
37	\N	13	43.45
90	33	2	35.60
114	39	2	13.00
91	33	4	100.00
48	23	4	100.00
92	33	5	35.60
49	23	5	28.63
115	39	4	100.00
50	23	13	43.45
93	33	13	43.45
116	39	5	13.00
117	39	13	43.45
118	40	2	10.40
119	40	4	100.00
120	40	5	10.40
121	40	13	43.45
94	34	2	22.80
95	34	4	100.00
96	34	5	22.80
97	34	13	43.45
98	35	2	12.00
99	35	4	100.00
100	35	5	12.00
101	35	13	43.45
102	\N	2	14.60
103	\N	4	100.00
104	\N	5	14.60
105	\N	13	43.45
158	\N	2	4.40
159	\N	4	100.00
179	56	4	100.00
160	\N	5	4.40
128	42	5	9.20
59	\N	13	43.45
60	\N	2	263.94
61	\N	4	100.00
58	\N	13	43.45
55	\N	2	82.48
56	\N	4	100.00
180	56	5	12.00
129	42	13	43.45
130	43	2	10.40
131	43	4	100.00
132	43	5	10.40
133	43	13	43.45
161	\N	13	43.45
181	56	13	43.45
106	37	2	15.60
107	37	4	100.00
108	37	5	15.60
109	37	13	43.45
134	44	2	30.40
135	44	4	100.00
136	44	5	30.40
137	44	13	43.45
122	41	2	55.40
162	\N	2	4.40
123	41	4	100.00
124	41	5	55.40
142	46	2	13.00
125	41	13	43.45
143	46	4	100.00
144	46	5	13.00
145	46	13	43.45
138	\N	2	-1246.50
139	\N	4	100.00
140	\N	5	-1246.50
141	\N	13	43.45
147	48	4	100.00
148	48	5	32.00
149	48	13	43.45
163	\N	4	100.00
173	\N	13	43.45
154	\N	2	4.40
155	\N	4	100.00
156	\N	5	4.40
157	\N	13	43.45
150	\N	2	6.00
151	\N	4	100.00
152	\N	5	6.00
153	\N	13	43.45
164	\N	5	4.40
165	\N	13	43.45
166	\N	2	4.40
167	\N	4	100.00
168	\N	5	4.40
169	\N	13	43.45
174	55	2	16.80
175	55	4	100.00
176	55	5	16.80
177	55	13	43.45
182	57	2	19.60
186	58	2	13.80
183	57	4	100.00
191	59	4	100.00
184	57	5	19.60
187	58	4	100.00
185	57	13	43.45
193	59	13	43.45
188	58	5	13.80
192	59	5	25.40
189	58	13	43.45
194	60	2	0.00
195	60	4	100.00
196	60	5	0.00
197	60	13	43.45
202	62	2	10.40
198	61	2	0.00
199	61	4	100.00
200	61	5	0.00
201	61	13	43.45
203	62	4	100.00
204	62	5	10.40
205	62	13	43.45
210	64	2	5.00
206	63	2	15.40
207	63	4	100.00
208	63	5	15.40
209	63	13	43.45
211	64	4	100.00
212	64	5	5.00
213	64	13	43.45
214	65	2	10.00
215	65	4	100.00
216	65	5	10.00
217	65	13	43.45
218	66	2	0.00
219	66	4	100.00
220	66	5	0.00
221	66	13	43.45
222	67	2	20.40
223	67	4	100.00
224	67	5	20.40
225	67	13	43.45
226	68	1	61.60
227	68	2	15.40
228	68	4	100.00
229	68	5	15.40
230	69	1	61.60
231	69	2	15.40
232	69	4	100.00
233	69	5	15.40
234	70	1	65.60
235	70	2	16.40
236	70	4	100.00
237	70	5	16.40
238	71	1	69.60
239	71	2	17.40
240	71	4	100.00
241	71	5	17.40
242	71	13	43.45
243	72	1	56.00
244	72	2	14.00
245	72	4	100.00
246	72	13	43.45
247	73	1	52.80
248	73	2	13.20
249	73	4	100.00
250	73	5	13.20
251	74	1	128.80
252	74	2	32.20
253	74	4	100.00
254	74	5	32.20
255	75	1	41.60
256	75	2	10.40
257	75	4	100.00
258	76	1	49.60
259	76	2	12.40
260	76	4	100.00
261	77	1	41.60
262	77	2	10.40
263	77	4	100.00
264	77	5	10.40
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                        5284.dat                                                                                            0000600 0004000 0002000 00000021250 15006133414 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        23	17	2025-04-24	\N	\N	1490.00	4	2044.46	0	2025-04-24 14:48:51.255212+05:30	0	2025-04-24 14:48:51.255212+05:30	4	\N	#DOM20250023	00:11:22.782566	2025-04-24 14:48:50.513432+05:30	DineIn		t	200.00
33	12	2025-04-25	\N	\N	1780.00	2	1994.65	0	2025-04-25 17:49:44.026228+05:30	0	2025-04-25 17:49:44.026228+05:30	4	\N	#DOM20250033	00:11:22.782566	2025-04-25 17:49:42.92466+05:30	DineIn		\N	0.00
34	12	2025-04-25	\N	\N	1140.00	2	2265.05	0	2025-04-25 17:55:19.931242+05:30	0	2025-04-25 17:55:19.931242+05:30	4	\N	#DOM20250034	00:11:22.782566	2025-04-25 17:55:19.930361+05:30	DineIn		\N	0.00
35	12	2025-04-25	\N	\N	600.00	1	719.45	0	2025-04-25 18:23:08.204317+05:30	0	2025-04-25 18:23:08.204317+05:30	4	\N	#DOM20250035	00:11:22.782566	2025-04-25 18:23:08.011577+05:30	DineIn		f	0.00
37	11	2025-04-27	\N	\N	780.00	1	933.85	0	2025-04-28 09:31:15.282559+05:30	0	2025-04-28 09:31:15.282559+05:30	4	\N	#DOM20250037	00:11:22.782566	2025-04-28 09:31:15.185702+05:30	DineIn		t	0.00
38	11	2025-04-27	\N	\N	740.00	2	913.05	0	2025-04-28 09:46:52.456995+05:30	0	2025-04-28 09:46:52.456995+05:30	4	\N	#DOM20250038	00:11:22.782566	2025-04-28 09:46:52.359407+05:30	DineIn		\N	0.00
39	12	2025-04-27	\N	\N	650.00	2	819.45	0	2025-04-28 10:25:55.696214+05:30	0	2025-04-28 10:25:55.696214+05:30	4	\N	#DOM20250039	00:11:22.782566	2025-04-28 10:25:55.511042+05:30	DineIn		\N	0.00
40	4	2025-04-27	\N	\N	520.00	6	684.25	0	2025-04-28 11:30:29.664898+05:30	0	2025-04-28 11:30:29.664898+05:30	4	\N	#DOM20250040	00:11:22.782566	2025-04-28 11:30:29.482766+05:30	DineIn		t	0.00
41	1	2025-04-27	\N	\N	2770.00	3	3069.98	0	2025-04-28 12:22:09.97131+05:30	0	2025-04-28 12:22:09.97131+05:30	3	\N	#DOM20250041	00:11:22.782566	2025-04-28 12:22:09.774053+05:30	DineIn		t	45.73
42	2	2025-04-28	\N	\N	460.00	4	649.45	0	2025-04-28 12:36:33.408249+05:30	0	2025-04-28 12:36:33.408249+05:30	3	\N	#DOM20250042	00:11:22.782566	2025-04-28 12:36:33.315407+05:30	DineIn		\N	0.00
43	14	2025-04-28	\N	\N	520.00	2	684.25	0	2025-04-28 14:31:38.070654+05:30	0	2025-04-28 14:31:38.070654+05:30	3	\N	#DOM20250043	00:11:22.782566	2025-04-28 14:31:37.881387+05:30	DineIn		t	41.60
44	12	2025-04-28	\N	\N	1520.00	5	1845.85	0	2025-04-28 16:35:38.251039+05:30	0	2025-04-28 16:35:38.251039+05:30	4	\N	#DOM20250044	00:11:22.782566	2025-04-28 16:35:38.041463+05:30	DineIn		t	121.60
68	1	2025-04-29	\N	\N	1020.00	3	1273.20	0	2025-04-30 10:06:29.804537+05:30	0	2025-04-30 10:06:29.804537+05:30	4	\N	#DOM20250068	00:11:22.782566	2025-04-30 10:06:27.259823+05:30	DineIn		t	30.80
1	4	2025-03-10	4	comment	530.00	4	693.60	1	2025-03-21 15:09:30.822061+05:30	1	2025-03-21 15:09:30.822061+05:30	4	4	#DOM2025000220	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	make order perfect	f	\N
2	4	2025-03-21	3	comment	400.00	8	440.00	1	2025-03-25 15:09:30.822061+05:30	1	2025-03-21 15:09:30.822061+05:30	4	3	#DOM2025000221	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	TakeAway	make order perfect	f	\N
3	2	2025-03-21	2	comment	240.00	4	580.00	1	2025-03-21 15:09:30.822061+05:30	1	2025-03-21 15:09:30.822061+05:30	4	2	#DOM2025000223	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	\N	f	\N
4	1	2025-03-21	1	comment	120.00	3	480.00	1	2025-03-21 15:09:30.822061+05:30	1	2025-03-21 15:09:30.822061+05:30	4	1	#DOM2025000224	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	\N	f	\N
6	5	2025-02-10	3	comment	130.00	3	380.00	1	2025-03-24 14:05:43.634895+05:30	1	2025-03-24 14:05:43.634895+05:30	4	3	#DOM2025000225	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	\N	f	\N
7	6	2025-01-10	1	comment	70.00	1	150.00	1	2025-03-24 14:06:54.301096+05:30	1	2025-03-24 14:06:54.301096+05:30	4	2	#DOM2025000227	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	TakeAway	\N	f	\N
9	7	2025-02-28	2	comment	100.00	1	180.00	1	2025-03-24 14:22:43.627451+05:30	1	2025-03-24 14:22:43.627451+05:30	4	1	#DOM2025000226	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	\N	f	\N
10	8	2024-10-12	4	comment	880.00	6	1020.00	1	2025-03-24 14:24:06.780583+05:30	1	2025-03-24 14:24:06.780583+05:30	4	3	#DOM2025000228	00:11:22.782566	2025-03-21 15:55:30.822061+05:30	DineIn	\N	f	\N
46	12	2025-04-28	\N	\N	650.00	2	767.45	0	2025-04-28 18:14:54.187974+05:30	0	2025-04-28 18:14:54.187974+05:30	3	\N	#DOM20250046	00:11:22.782566	2025-04-28 18:14:54.155348+05:30	DineIn		t	52.00
47	1	2025-04-28	\N	\N	1400.00	3	2948.31	0	2025-04-28 18:23:10.151671+05:30	0	2025-04-28 18:23:10.151671+05:30	4	\N	#DOM20250047	00:11:22.782566	2025-04-28 18:23:10.150076+05:30	DineIn		t	1400.00
48	2	2025-04-28	\N	\N	1600.00	4	1679.45	0	2025-04-28 18:43:15.985798+05:30	0	2025-04-28 18:43:15.985798+05:30	3	\N	#DOM20250048	00:11:22.782566	2025-04-28 18:43:15.884877+05:30	DineIn		\N	\N
55	1	2025-04-28	\N	\N	840.00	3	1017.05	0	2025-04-29 10:03:57.726259+05:30	0	2025-04-29 10:03:57.726259+05:30	4	\N	#DOM20250055	00:11:22.782566	2025-04-29 10:03:57.626269+05:30	DineIn		t	67.20
56	2	2025-04-28	\N	\N	600.00	4	767.45	0	2025-04-29 10:39:10.565987+05:30	0	2025-04-29 10:39:10.565987+05:30	3	\N	#DOM20250056	00:11:22.782566	2025-04-29 10:39:10.456042+05:30	DineIn		\N	\N
57	2	2025-04-28	\N	\N	980.00	4	1241.05	0	2025-04-29 10:39:36.196726+05:30	0	2025-04-29 10:39:36.196726+05:30	3	\N	#DOM20250057	00:11:22.782566	2025-04-29 10:39:36.195853+05:30	DineIn	Order Comment	t	78.40
58	4	2025-04-28	\N	\N	690.00	3	916.25	0	2025-04-29 11:17:59.673095+05:30	0	2025-04-29 11:17:59.673095+05:30	4	\N	#DOM20250058	00:11:22.782566	2025-04-29 11:17:59.573845+05:30	DineIn		t	55.20
59	8	2025-04-28	\N	\N	1270.00	3	1438.85	0	2025-04-29 11:24:46.68388+05:30	0	2025-04-29 11:24:46.68388+05:30	3	\N	#DOM20250059	00:11:22.782566	2025-04-29 11:24:46.676113+05:30	DineIn		t	0.00
60	4	2025-04-28	\N	\N	1334.25	30	2309.84	0	2025-04-29 11:54:04.02108+05:30	0	2025-04-29 11:54:04.02108+05:30	3	\N	#DOM20250060	00:11:22.782566	2025-04-29 11:54:04.015213+05:30	DineIn		t	39.40
61	2	2025-04-28	\N	\N	527.45	4	527.45	0	2025-04-29 12:02:20.158962+05:30	0	2025-04-29 12:02:20.158962+05:30	3	\N	#DOM20250061	00:11:22.782566	2025-04-29 12:02:20.158112+05:30	DineIn		t	4.00
62	1	2025-04-28	\N	\N	520.00	3	642.65	0	2025-04-29 12:04:33.300091+05:30	0	2025-04-29 12:04:33.300091+05:30	3	\N	#DOM20250062	00:11:22.782566	2025-04-29 12:04:33.299606+05:30	DineIn		t	41.60
63	8	2025-04-28	\N	\N	770.00	3	2013.85	0	2025-04-29 12:05:48.147978+05:30	0	2025-04-29 12:05:48.147978+05:30	4	\N	#DOM20250063	00:11:22.782566	2025-04-29 12:05:48.147578+05:30	DineIn		t	61.60
64	8	2025-04-29	\N	\N	250.00	3	383.45	0	2025-04-29 12:42:53.056289+05:30	0	2025-04-29 12:42:53.056289+05:30	4	\N	#DOM20250064	00:11:22.782566	2025-04-29 12:42:52.929788+05:30	DineIn		t	20.00
65	2	2025-04-29	\N	\N	500.00	4	623.45	0	2025-04-29 12:49:36.793663+05:30	0	2025-04-29 12:49:36.793663+05:30	4	\N	#DOM20250065	00:11:22.782566	2025-04-29 12:49:36.690375+05:30	DineIn		t	40.00
66	4	2025-04-29	\N	\N	643.45	3	966.32	0	2025-04-29 14:10:56.758973+05:30	0	2025-04-29 14:10:56.758973+05:30	3	\N	#DOM20250066	00:11:22.782566	2025-04-29 14:10:56.572543+05:30	DineIn		t	179.42
67	8	2025-04-29	\N	\N	1020.00	3	1204.25	0	2025-04-29 15:09:41.041747+05:30	0	2025-04-29 15:09:41.041747+05:30	3	\N	#DOM20250067	00:11:22.782566	2025-04-29 15:09:41.033482+05:30	DineIn		t	81.60
69	4	2025-04-29	\N	\N	1150.00	3	1418.80	0	2025-04-30 10:27:34.212774+05:30	0	2025-04-30 10:27:34.212774+05:30	4	\N	#DOM20250069	00:11:22.782566	2025-04-30 10:27:33.906808+05:30	DineIn		t	30.80
70	2	2025-05-01	\N	\N	820.00	4	1048.00	0	2025-05-01 17:21:19.929715+05:30	0	2025-05-01 17:21:19.929715+05:30	4	\N	#DOM20250070	00:01:16.075487	2025-05-01 17:21:19.894697+05:30	DineIn		t	29.60
74	2	2025-05-01	\N	\N	1610.00	4	2055.60	0	2025-05-01 18:23:52.857063+05:30	0	2025-05-01 18:23:52.857063+05:30	4	\N	#DOM20250074	00:00:16.075487	2025-05-01 18:23:52.802083+05:30	DineIn		t	152.40
71	4	2025-05-01	\N	\N	870.00	3	1147.45	0	2025-05-01 17:34:05.126027+05:30	0	2025-05-01 17:34:05.126027+05:30	4	\N	#DOM20250071	00:01:16.075487	2025-05-01 17:34:05.093845+05:30	DineIn		t	29.60
72	1	2025-05-01	\N	\N	700.00	3	937.45	0	2025-05-01 17:39:57.080296+05:30	0	2025-05-01 17:39:57.080296+05:30	4	\N	#DOM20250072	00:01:16.075487	2025-05-01 17:39:57.047948+05:30	DineIn		t	24.00
73	8	2025-05-01	\N	\N	660.00	3	889.20	0	2025-05-01 17:51:06.339065+05:30	0	2025-05-01 17:51:06.339065+05:30	4	\N	#DOM20250073	00:00:16.075487	2025-05-01 17:51:06.305988+05:30	DineIn		t	50.00
75	4	2025-05-02	\N	\N	520.00	3	692.80	0	2025-05-02 13:55:03.606064+05:30	0	2025-05-02 13:55:03.606064+05:30	4	\N	#DOM20250075	00:00:14.071691	2025-05-02 13:55:03.569823+05:30	DineIn		t	20.80
76	1	2025-05-02	\N	\N	620.00	3	852.65	0	2025-05-02 14:43:18.555385+05:30	0	2025-05-02 14:43:18.555385+05:30	6	\N	#DOM20250076	\N	2025-05-02 14:43:18.522883+05:30	DineIn		t	14.80
77	19	2025-05-02	\N	\N	520.00	5	703.20	0	2025-05-02 15:48:58.057174+05:30	0	2025-05-02 15:48:58.057174+05:30	6	\N	#DOM20250077	\N	2025-05-02 15:48:57.940476+05:30	DineIn		t	20.80
\.


                                                                                                                                                                                                                                                                                                                                                        5310.dat                                                                                            0000600 0004000 0002000 00000001277 15006133414 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	65	1	623.45	0	2025-04-29 00:20:12.93145	0	2025-04-29 00:20:12.93145	Cash
6	69	1	1418.80	0	2025-04-29 22:35:04.053866	0	2025-04-29 22:35:04.053866	Cash
7	68	1	1273.20	0	2025-04-30 04:47:50.208398	0	2025-04-30 04:47:50.208398	Cash
8	70	1	1048.00	0	2025-05-01 04:51:48.10638	0	2025-05-01 04:51:48.10638	Cash
9	71	1	1147.45	0	2025-05-01 05:04:33.725136	0	2025-05-01 05:04:33.725136	Cash
10	72	1	937.45	0	2025-05-01 05:10:15.382908	0	2025-05-01 05:10:15.382908	Cash
11	73	1	889.20	0	2025-05-01 05:21:25.319256	0	2025-05-01 05:21:25.319256	Cash
12	74	1	2055.60	0	2025-05-01 05:54:09.132922	0	2025-05-01 05:54:09.132922	Cash
13	75	1	692.80	0	2025-05-02 01:25:17.789088	0	2025-05-02 01:25:17.789088	Cash
\.


                                                                                                                                                                                                                                                                                                                                 5304.dat                                                                                            0000600 0004000 0002000 00000000043 15006133414 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Pending
2	UPI
3	Card
4	Cash
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             5308.dat                                                                                            0000600 0004000 0002000 00000000216 15006133414 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Completed	1	2025-03-25 03:44:22.256284	1	2025-03-25 03:44:22.256284
2	Failed	1	2025-03-25 03:44:22.256284	1	2025-03-25 03:44:22.256284
\.


                                                                                                                                                                                                                                                                                                                                                                                  5293.dat                                                                                            0000600 0004000 0002000 00000003166 15006133414 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	1	User	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
21	2	Order	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
22	2	Cutomers	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
3	1	RoleAndPermission	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
4	1	Menu	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
5	1	TableAndSection	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
6	1	TaxAndFee	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
7	1	Order	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
8	1	Customers	f	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
9	2	User	t	t	t	2	2025-02-26 21:30:20.643594	2	2025-02-26 21:30:20.643594
18	3	User	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
12	3	RoleAndPermission	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
10	2	RoleAndPermission	t	t	t	2	2025-02-26 21:31:36.594255	2	2025-02-26 21:31:36.594255
13	3	Menu	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
14	3	TableAndSection	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
15	3	TaxAndFee	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
16	3	Order	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
17	3	Cutomers	t	t	t	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
19	2	TableAndSection	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
11	2	Menu	t	t	t	2	2025-02-26 21:31:36.594255	2	2025-02-26 21:31:36.594255
20	2	TaxAndFee	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
\.


                                                                                                                                                                                                                                                                                                                                                                                                          5276.dat                                                                                            0000600 0004000 0002000 00000002723 15006133414 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533	\N	\N
2	3	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533	\N	\N
3	4	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533	\N	\N
4	5	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533	\N	\N
6	3	Osm	2	5	3	0	2025-04-28 04:13:58.801601	0	2025-04-28 04:13:58.801601	44	12
7	3	Food Is Just Wow!	2	4	3	0	2025-04-28 05:54:56.95809	0	2025-04-28 05:54:56.95809	47	1
8	3	Food is OSM	2	4	3	0	2025-04-28 21:35:34.48684	0	2025-04-28 21:35:34.48684	55	1
9	3	Food Is Best.	2	4	5	0	2025-04-28 22:52:33.986391	0	2025-04-28 22:52:33.986391	58	4
10	3	Food and The Service is Just Wow	2	4	3	0	2025-04-29 00:20:39.09823	0	2025-04-29 00:20:39.09823	65	2
11	3	Boring Food	2	4	5	0	2025-04-29 22:35:41.800829	0	2025-04-29 22:35:41.800829	69	4
12	3	The Service is Good.	2	4	3	0	2025-04-30 04:48:03.020047	0	2025-04-30 04:48:03.020047	68	1
13	3	Food And Service Is good!!	2	5	3	0	2025-05-01 04:52:07.235663	0	2025-05-01 04:52:07.235663	70	2
14	3	The Food Is Awsome	2	5	4	0	2025-05-01 05:04:53.440259	0	2025-05-01 05:04:53.440259	71	4
15	3	Good	2	4	3	0	2025-05-01 05:10:25.983125	0	2025-05-01 05:10:25.983125	72	1
16	3	Too Good!!	2	4	5	0	2025-05-01 05:21:39.741944	0	2025-05-01 05:21:39.741944	73	8
17	4	Memorable!!	4	5	5	0	2025-05-01 05:54:26.484547	0	2025-05-01 05:54:26.484547	74	2
18	3	Food is best of my life!	3	4	2	0	2025-05-02 01:26:09.165074	0	2025-05-02 01:26:09.165074	75	4
\.


                                             5244.dat                                                                                            0000600 0004000 0002000 00000000334 15006133414 0014245 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	2025-02-12 01:21:00.266079	1	2025-02-12 01:21:00.266079	Chef	3
2	2	2025-02-21 01:55:29.22341	2	2025-02-21 01:55:29.22341	Super Admin	1
3	3	2025-02-21 01:55:29.22341	3	2025-02-21 01:55:29.22341	Account Manager	2
\.


                                                                                                                                                                                                                                                                                                    5268.dat                                                                                            0000600 0004000 0002000 00000000727 15006133414 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Ground Floor!!	This is Description	f	1	2025-03-18 03:39:32.994072	1	2025-03-18 03:39:32.994072
5	Second Floor!!	This is Description	f	0	2025-03-18 05:41:47.792747	0	2025-03-18 05:41:47.792747
4	First Floor!!	This is Description	f	1	2025-03-18 03:39:32.994072	1	2025-03-18 03:39:32.994072
6	Temp	This is Description	f	0	2025-03-18 22:43:27.867362	0	2025-03-18 22:43:27.867362
7	Temp 2	This is Description	f	0	2025-03-18 22:44:09.809607	0	2025-03-18 22:44:09.809607
\.


                                         5248.dat                                                                                            0000600 0004000 0002000 00000004103 15006133414 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	Gujarat	1	2025-02-12 01:22:46.241827	1	2025-02-12 01:22:46.241827
3	3	Queensland	3	2025-02-21 02:04:23.77236	3	2025-02-21 02:04:23.77236
4	4	London	4	2025-02-21 02:04:23.77236	4	2025-02-21 02:04:23.77236
2	2	Maharastra	2	2025-02-21 02:04:23.77236	2	2025-02-21 02:04:23.77236
5	1	California	7	2025-02-25 02:46:52.384007	7	2025-02-25 02:46:52.384007
6	1	Texas	7	2025-02-25 02:46:52.384007	7	2025-02-25 02:46:52.384007
7	2	Ontario	8	2025-02-25 02:46:52.384007	8	2025-02-25 02:46:52.384007
8	2	Quebec	8	2025-02-25 02:46:52.384007	8	2025-02-25 02:46:52.384007
9	3	Mexico City	9	2025-02-25 02:46:52.384007	9	2025-02-25 02:46:52.384007
10	4	Sao Paulo	10	2025-02-25 02:46:52.384007	10	2025-02-25 02:46:52.384007
11	5	Buenos Aires	11	2025-02-25 02:46:52.384007	11	2025-02-25 02:46:52.384007
12	6	England	12	2025-02-25 02:46:52.384007	12	2025-02-25 02:46:52.384007
13	7	Ile-de-France	13	2025-02-25 02:46:52.384007	13	2025-02-25 02:46:52.384007
14	8	Bavaria	14	2025-02-25 02:46:52.384007	14	2025-02-25 02:46:52.384007
15	9	Seoul	15	2025-02-25 02:46:52.384007	15	2025-02-25 02:46:52.384007
16	10	Catalonia	16	2025-02-25 02:46:52.384007	16	2025-02-25 02:46:52.384007
17	11	Tokyo	17	2025-02-25 02:46:52.384007	17	2025-02-25 02:46:52.384007
18	12	Auckland	18	2025-02-25 02:46:52.384007	18	2025-02-25 02:46:52.384007
19	13	Beijing	19	2025-02-25 02:46:52.384007	19	2025-02-25 02:46:52.384007
20	14	Moscow	20	2025-02-25 02:46:52.384007	20	2025-02-25 02:46:52.384007
21	15	Gauteng	21	2025-02-25 02:46:52.384007	21	2025-02-25 02:46:52.384007
22	16	Cairo	22	2025-02-25 02:46:52.384007	22	2025-02-25 02:46:52.384007
23	17	Lagos	23	2025-02-25 02:46:52.384007	23	2025-02-25 02:46:52.384007
24	18	Nairobi	24	2025-02-25 02:46:52.384007	24	2025-02-25 02:46:52.384007
25	19	Riyadh	25	2025-02-25 02:46:52.384007	25	2025-02-25 02:46:52.384007
26	20	Dubai	26	2025-02-25 02:46:52.384007	26	2025-02-25 02:46:52.384007
27	21	Istanbul	27	2025-02-25 02:46:52.384007	27	2025-02-25 02:46:52.384007
28	22	Busan	28	2025-02-25 02:46:52.384007	28	2025-02-25 02:46:52.384007
29	23	Jakarta	29	2025-02-25 02:46:52.384007	29	2025-02-25 02:46:52.384007
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                             5298.dat                                                                                            0000600 0004000 0002000 00000000555 15006133414 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Available	1	2025-03-18 23:31:37.210533	1	2025-03-18 23:31:37.210533	\N
2	Occupied	1	2025-03-18 23:31:37.210533	1	2025-03-18 23:31:37.210533	\N
3	Assigned	1	2025-03-28 02:20:29.455178	1	2025-03-28 02:20:29.455178	\N
4	Running	1	2025-03-28 02:20:29.455178	1	2025-03-28 02:20:29.455178	\N
5	Reserved	1	2025-03-28 02:20:29.455178	1	2025-03-28 02:20:29.455178	\N
\.


                                                                                                                                                   5270.dat                                                                                            0000600 0004000 0002000 00000002512 15006133414 0014244 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        10	TT1	6	10	0	2025-04-02 05:50:22.723872	0	2025-04-02 05:50:22.723872	1	f	\N
9	TF1	4	6	0	2025-04-01 22:17:58.614081	0	2025-04-01 22:17:58.614081	1	f	2025-04-29 10:23:05.320633+05:30
4	GT4	3	5	0	2025-03-19 02:25:19.952279	0	2025-03-19 02:25:19.952279	1	f	2025-04-30 10:51:57.967748+05:30
8	GT8	4	5	0	2025-03-19 03:17:28.361469	0	2025-03-19 03:17:28.361469	1	f	2025-04-29 10:38:08.543881+05:30
1	GT1	3	3	1	2025-03-18 23:40:30.425251	1	2025-03-18 23:40:30.425251	1	f	2025-05-01 17:20:11.435502+05:30
6	GT6	3	2	0	2025-03-19 02:58:59.071788	0	2025-03-19 02:58:59.071788	1	f	2025-05-01 17:39:16.890464+05:30
11	TT2	6	1	0	2025-04-02 05:50:45.540597	0	2025-04-02 05:50:45.540597	1	f	2025-04-24 10:14:30.956289+05:30
3	GT3	3	5	0	2025-03-19 02:22:12.292961	0	2025-03-19 02:22:12.292961	1	f	2025-05-01 17:50:42.140548+05:30
13	GF10	3	10	0	2025-04-22 21:17:48.614836	0	2025-04-22 21:17:48.614836	1	f	2025-05-01 18:23:30.535261+05:30
2	GT2	3	3	1	2025-03-18 23:40:52.836319	1	2025-03-18 23:40:52.836319	1	f	2025-05-02 13:54:36.99053+05:30
12	vgbvd bbd	3	3	0	2025-04-03 22:22:41.941972	0	2025-04-03 22:22:41.941972	4	t	2025-05-02 14:41:09.766515+05:30
7	GT7	3	5	0	2025-03-19 03:17:03.567207	0	2025-03-19 03:17:03.567207	4	f	2025-05-02 14:46:38.038772+05:30
5	GT5!!	5	5	0	2025-03-19 02:40:53.123992	0	2025-03-19 02:40:53.123992	3	f	2025-05-05 11:26:23.174476+05:30
\.


                                                                                                                                                                                      5300.dat                                                                                            0000600 0004000 0002000 00000000224 15006133414 0014234 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Flat Amount	1	2025-03-19 21:46:02.274135	1	2025-03-19 21:46:02.274135
2	Percentage	1	2025-03-19 21:46:02.274135	1	2025-03-19 21:46:02.274135
\.


                                                                                                                                                                                                                                                                                                                                                                            5272.dat                                                                                            0000600 0004000 0002000 00000001560 15006133414 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        7	Temp 5	t	f	0	2025-03-20 05:36:30.263938	0	2025-03-20 05:36:30.263938	1	10.00	t
9	Temp 6	t	f	0	2025-03-20 21:50:40.984317	0	2025-03-20 21:50:40.984317	1	8.00	t
11	Temp 8	t	t	0	2025-03-20 21:53:41.34579	0	2025-03-20 21:53:41.34579	1	8.00	t
12	SGST	t	t	0	2025-03-20 22:52:15.481647	0	2025-03-20 22:52:15.481647	2	10.00	t
2	CGST	t	t	1	2025-03-19 21:55:55.688245	1	2025-03-19 21:55:55.688245	2	2.00	f
4	AGST	t	t	0	2025-03-20 05:10:29.271542	0	2025-03-20 05:10:29.271542	1	100.00	f
5	VGST	t	f	0	2025-03-20 05:34:37.567623	0	2025-03-20 05:34:37.567623	2	2.00	f
6	Temp 4!!	t	f	0	2025-03-20 05:36:16.568972	0	2025-03-20 05:36:16.568972	1	10.00	t
10	Temp 7	t	f	0	2025-03-20 21:52:00.430232	0	2025-03-20 21:52:00.430232	1	8.00	t
1	SGST	t	t	1	2025-03-19 21:55:55.688245	1	2025-03-19 21:55:55.688245	2	8	f
13	NGST	t	f	0	2025-03-25 01:43:01.648897	0	2025-03-25 01:43:01.648897	1	43.45	f
\.


                                                                                                                                                5260.dat                                                                                            0000600 0004000 0002000 00000000013 15006133414 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pcs
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     5252.dat                                                                                            0000600 0004000 0002000 00000013427 15006133414 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        278	Jack	Decker	jack1234	2	tatvasoft.pct71@outlook.com	$2a$11$wtpF15maXhvMmED/kUpO..tPMSSDQWZ1/6Bbvj.RbV4qbHQjrod.q	1978523657	/images/fea97f8e-f19e-4671-861f-2eb7e4da4818_Screenshot (8).png	328478 SATret	1	5	11	453556	2	2025-02-21 03:38:32	2	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
263	Ivy	Thomas	ivy_thomas	1	ivy@example.com	password11	6667178888	\N	808 Fir St	10	11	21	333338	11	2025-02-21 03:38:32	11	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
266	Leo	Harris	leo_harris	1	leo@example.com	password14	4445956666	\N	1111 Palm St	13	14	1	666667	14	2025-02-21 03:38:32	14	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
268	Nina	Thompson	nina_thompson	1	nina@example.com	password16	2223338444	\N	1313 Willow St	15	16	5	888898	16	2025-02-21 03:38:32	16	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
270	Paul	Martinez	paul_martinez	2	paul@example.com	password18	8889960000	\N	1515 Hickory St	17	18	9	00000	18	2025-02-21 03:38:32	18	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
271	Quinn	Robinson	quinn_robinson	1	quinn@example.com	password19	0001412222	\N	1616 Magnolia St	18	19	11	111113	19	2025-02-21 03:38:32	19	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
272	Rose	Clark	rose_clark	2	rose@example.com	password20	3334045555	\N	1717 Dogwood St	19	20	13	22222	20	2025-02-21 03:38:32	20	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
273	Sam	Lewis	sam_lewis	2	sam@example.com	password21	6767178888	\N	1818 Sycamore St	20	21	15	33333	21	2025-02-21 03:38:32	21	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
274	Tina	Walker	tina_walker	3	tina@example.com	password22	9190001111	\N	1919 Juniper St	21	22	17	44444	22	2025-02-21 03:38:32	22	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
275	Uma	Young	uma_young	2	uma@example.com	password23	1112283333	\N	2020 Alder St	22	23	19	55555	23	2025-02-21 03:38:32	23	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
276	Victor	King	victor_king	2	victor@example.com	password24	4445856666	\N	2121 Beech St	23	24	21	66666	24	2025-02-21 03:38:32	24	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
255	Alice	Johnson	alice_johnson	3	alice@example.com	password3	11122263333	/images/2aa885e5-d87a-44cb-ab5c-5562d03b0a1e_9e8264e7-8285-4f08-9789-a6dff505f6c7_Screenshot (6).png	789 Oak St	2	1	1	554321	3	2025-02-21 03:38:32	3	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
269	Oscar	Garcia	oscar_garcia	3	oscar@example.com	password17	5556667777	\N	1414 Ash St	16	22	23	999996	17	2025-02-21 03:38:32	17	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	f
259	Eve	Wilson	eve_wilson	1	eve@example.com	password7	5556267777	/images/6f91572f-72dc-4114-9ef7-3fc6ff9d0195_Screenshot (3).png	404 Birch St	6	12	18	778889	7	2025-02-21 03:38:32	7	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
265	Kate	White	kate_white	3	kate@example.com	password13	1112224333	/images/199b673b-5d13-4492-905b-c0c7dc3897a8_Screenshot (9).png	1010 Cypress St	12	18	19	555556	13	2025-02-21 03:38:32	13	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
264	Jack	Jackson	jack_jackson	2	jack@example.com	password12	9990001111	/images/ca9021ed-76af-4653-8f69-9084edb2dae3_Screenshot (10).png	909 Redwood St	11	17	18	444445	12	2025-02-21 03:38:32	12	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
277	Wendy	Scott	wendy_scott	1	wendy@example.com	password25	7778889999	\N	2222 Elm St	14	20	26	77777	25	2025-02-21 03:38:32	25	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	f
262	Hank	Anderson	hank_anderson	1	hank@example.com	password10	3333445555	/images/6205be2a-fc66-4853-ac5a-dfb6f4c267f2_Screenshot (12).png	707 Spruce St	9	15	21	222292	10	2025-02-21 03:38:32	10	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
286	Panda	panda	panda	3	panda@gmail.com	$2a$11$NCMEx.Bj.Ghs5Ud0h67nt.sigZOd1M2x.MVW/NE70xOKftMR7c/PS	02443524557	/images/78d5dcb0-a445-4f82-b0d5-a5bde8e07244_panda.jfif	fsdfs	17	23	29	546733	\N	2025-04-03 01:25:53.093018	\N	2025-04-03 01:25:53.093018	\N	\N	\N	f	t
279	prakash	Mali	jack	1	prakash@gmail.com	123	09876543214	\N	fsdfs	2	2	2	546733	\N	2025-02-25 22:36:34.760327	\N	2025-02-25 22:36:34.760327	2025-02-25 22:36:34.760327	\N	\N	t	f
282	Priyanshi	Sojitra	pri123	1	tatva.pci72@outlook.com	$2a$11$Ff8pzEbWJriiRwSmhk1lAu88fgRb5TjlUBgGUMbDZ.wPEPg8SMRBW	1548695325	/images/9f68494b-2dbb-4aad-967f-d3874e19912e_cat.jfif	ddfff	16	22	28	234455	\N	2025-03-18 02:49:57.57204	\N	2025-03-18 02:49:57.57204	2025-03-18 02:49:57.57204	\N	\N	t	f
267	Mia	Martin	mia_martin	1	mia@example.com	password15	7778839999	\N	1212 Poplar St	14	15	3	777778	15	2025-02-21 03:38:32	15	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
261	Grace	Taylor	grace_taylor	2	grace@example.com	password9	0001812222	/images/dd9bbf2b-a266-4620-9cb2-13d979b1e10f_Screenshot (11).png	606 Chestnut St	8	14	20	111112	9	2025-02-21 03:38:32	9	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
288	dbcfjkaed	dbcfjkaed	vsrvfns@gmail.com	3	vskbhj@gmail.com	$2a$11$UV5kn9KH70fCl2fdkZJXvObIUp94YiHMsXvfEb5S6ivuo/rx.E/Y2	9859847329050	/images/01d00189-b853-4b7c-8959-fedcc390ee59_lion.jfif	fsdfs	11	17	23	546733	\N	2025-04-03 03:09:49.708125	\N	2025-04-03 03:09:49.708125	2025-04-03 18:26:38.472976	\N	\N	t	f
289	ABC	ABC	fohifrj@gmail.com	1	fohifrj@gmail.com	$2a$11$IMr.Oji7m3OCmDBFrTnWNu4yKQL5C4Fgwpi895K2pCe7/n3GxWWrq	244352455	/images/fee9a55b-18e6-4e66-a8b1-5139c23ce145_nature2.jfif	fsdfs	14	20	26	12312	\N	2025-04-09 00:16:55.675923	\N	2025-04-09 00:16:55.675923	-infinity	\N	\N	t	f
284	om	bhatttt	om123	3	tatva.pci71@outlook.com	$2a$11$Tswa5XUTwMvTmdp.9uphlewxoAVUAgG4ktFp2kWoqLiabs8qE8ZMS	9876585243	/images/97bdfa35-6d52-4a79-b831-cc100d783c98_bear.jfif	fsdfs	11	17	23	12312	\N	2025-03-18 02:59:00.422908	\N	2025-03-18 02:59:00.422908	2025-03-18 02:59:00.422908	\N	\N	t	f
254	Jane	Smith	jane_smith	3	jane@example.com	password2	09876554321	/images/ab6eba76-9d7a-4e54-b1bf-6c0781e05e59_nature1.jfif	456 Elm St	1	5	11	678590	2	2025-02-21 03:38:32	2	2025-02-21 03:38:32	-infinity	\N	\N	t	f
\.


                                                                                                                                                                                                                                         5280.dat                                                                                            0000600 0004000 0002000 00000003127 15006133414 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        22	2025-04-28 22:54:16.207144	3	meet	\N	\N	9846328651	meet@gmail.com	3	\N	2025-04-29 11:24:16.207144+05:30	\N	2025-04-29 11:24:16.207144+05:30	t
20	2025-04-28 22:06:42.679872	4	Om	\N	\N	0526987432	om@gmail.com	4	\N	2025-04-29 10:36:42.679872+05:30	\N	2025-04-29 10:36:42.679872+05:30	t
21	2025-04-28 22:43:58.231834	3	Priyanshi	\N	\N	1256347895	pri@gmail.com	6	\N	2025-04-29 11:13:58.231834+05:30	\N	2025-04-29 11:13:58.231834+05:30	t
25	2025-05-02 01:42:42.911415	5	Jon Snow	\N	\N	1895632478	john@gmail.com	5	\N	2025-05-02 14:12:42.911415+05:30	\N	2025-05-02 14:12:42.911415+05:30	t
31	2025-05-02 16:35:06.594329	6	Tony Stark	\N	\N	7895463213	tony@gmail.com	4	\N	2025-05-02 16:35:06.594329+05:30	\N	2025-05-02 16:35:06.594329+05:30	t
33	2025-05-05 16:25:26.986588	3	Om	\N	\N	1547885265	om@gmail.com	2	\N	2025-05-05 16:25:26.986588+05:30	\N	2025-05-05 16:25:26.986588+05:30	f
34	2025-05-05 16:31:05.435917	4	Tony Stark	\N	\N	1845632546	tony@gmail.com	2	\N	2025-05-05 16:31:05.435917+05:30	\N	2025-05-05 16:31:05.435917+05:30	f
32	2025-05-05 10:28:19.980294	5	Priyanshi	\N	\N	7895463253	pri@gmail.com	3	\N	2025-05-05 10:28:19.980294+05:30	\N	2025-05-05 10:28:19.980294+05:30	t
35	2025-05-05 17:13:34.715356	5	Priyanshi	\N	\N	7895463253	pri@gmail.com	3	\N	2025-05-05 17:13:34.715356+05:30	\N	2025-05-05 17:13:34.715356+05:30	f
36	2025-05-05 17:14:13.298313	7	Nishtha	\N	\N	9843652762	nish@gmail.com	2	\N	2025-05-05 17:14:13.298313+05:30	\N	2025-05-05 17:14:13.298313+05:30	f
37	2025-05-05 17:14:43.290013	6	Meet	\N	\N	1986532456	meet@gmail.com	3	\N	2025-05-05 17:14:43.290013+05:30	\N	2025-05-05 17:14:43.290013+05:30	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                         restore.sql                                                                                         0000600 0004000 0002000 00000245774 15006133414 0015404 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

DROP DATABASE "PizzaShop";
--
-- Name: PizzaShop; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE "PizzaShop" OWNER TO postgres;

\connect "PizzaShop"

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

--
-- Name: PizzaShop; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE "PizzaShop" SET "TimeZone" TO 'Asia/Kolkata';


\connect "PizzaShop"

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
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO postgres;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    state_id integer,
    city_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- Name: cities_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cities_city_id_seq OWNER TO postgres;

--
-- Name: cities_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;


--
-- Name: combine_modifier; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.combine_modifier (
    combine_modifier_id integer NOT NULL,
    modifier_group_id integer,
    modifier_id integer,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.combine_modifier OWNER TO postgres;

--
-- Name: combine_modifier_combine_modifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.combine_modifier_combine_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.combine_modifier_combine_modifier_id_seq OWNER TO postgres;

--
-- Name: combine_modifier_combine_modifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.combine_modifier_combine_modifier_id_seq OWNED BY public.combine_modifier.combine_modifier_id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.countries_country_id_seq OWNER TO postgres;

--
-- Name: countries_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;


--
-- Name: customer_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_tables (
    customer_table_id integer NOT NULL,
    customer_id integer,
    table_id integer,
    "IsActive" boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.customer_tables OWNER TO postgres;

--
-- Name: customer_tables_customer_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_tables_customer_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_tables_customer_table_id_seq OWNER TO postgres;

--
-- Name: customer_tables_customer_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_tables_customer_table_id_seq OWNED BY public.customer_tables.customer_table_id;


--
-- Name: customer_waitings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customer_waitings (
    customer_waitings_id integer NOT NULL,
    customer_id integer,
    waiting_list_id integer
);


ALTER TABLE public.customer_waitings OWNER TO postgres;

--
-- Name: customer_waitings_customer_waitings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customer_waitings_customer_waitings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customer_waitings_customer_waitings_id_seq OWNER TO postgres;

--
-- Name: customer_waitings_customer_waitings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customer_waitings_customer_waitings_id_seq OWNED BY public.customer_waitings.customer_waitings_id;


--
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    table_id integer,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    date date,
    noofperson integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: favourites; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favourites (
    favourites_id integer NOT NULL,
    item_id integer,
    user_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.favourites OWNER TO postgres;

--
-- Name: favourites_favourites_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.favourites_favourites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.favourites_favourites_id_seq OWNER TO postgres;

--
-- Name: favourites_favourites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.favourites_favourites_id_seq OWNED BY public.favourites.favourites_id;


--
-- Name: item_modifier_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_modifier_group (
    item_id integer NOT NULL,
    modifier_group_id integer NOT NULL,
    min_selection integer,
    max_selection integer
);


ALTER TABLE public.item_modifier_group OWNER TO postgres;

--
-- Name: itemtype; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.itemtype (
    itemtype_id integer NOT NULL,
    item_type character varying(100) NOT NULL,
    item_photo text
);


ALTER TABLE public.itemtype OWNER TO postgres;

--
-- Name: itemtype_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.itemtype_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.itemtype_item_id_seq OWNER TO postgres;

--
-- Name: itemtype_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.itemtype_item_id_seq OWNED BY public.itemtype.itemtype_id;


--
-- Name: menu_categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_categories (
    category_id integer NOT NULL,
    category_name character varying(100) NOT NULL,
    category_description text,
    is_deleted boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.menu_categories OWNER TO postgres;

--
-- Name: menu_categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_categories_category_id_seq OWNER TO postgres;

--
-- Name: menu_categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_categories_category_id_seq OWNED BY public.menu_categories.category_id;


--
-- Name: menu_item_units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_item_units (
    unit_id integer NOT NULL,
    unit_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.menu_item_units OWNER TO postgres;

--
-- Name: menu_item_units_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_item_units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_item_units_unit_id_seq OWNER TO postgres;

--
-- Name: menu_item_units_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_item_units_unit_id_seq OWNED BY public.menu_item_units.unit_id;


--
-- Name: menu_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_items (
    item_id integer NOT NULL,
    category_id integer,
    item_name character varying(100) NOT NULL,
    rate numeric(5,2) NOT NULL,
    quantity integer NOT NULL,
    unit_id integer,
    is_available boolean DEFAULT true NOT NULL,
    tax_default boolean DEFAULT false NOT NULL,
    tax_percentage numeric(10,2) NOT NULL,
    short_code text,
    description text,
    category_photo text,
    is_favourite boolean DEFAULT false,
    modifier_group_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    itemtype_id integer,
    "is_Deleted" boolean
);


ALTER TABLE public.menu_items OWNER TO postgres;

--
-- Name: menu_items_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_items_item_id_seq OWNER TO postgres;

--
-- Name: menu_items_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;


--
-- Name: menu_modifier_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_modifier_groups (
    modifier_group_id integer NOT NULL,
    modifier_group_name character varying(100) NOT NULL,
    modifier_group_decription text,
    is_deleted boolean DEFAULT false,
    category_id integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.menu_modifier_groups OWNER TO postgres;

--
-- Name: menu_modifier_groups_modifier_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_modifier_groups_modifier_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_modifier_groups_modifier_group_id_seq OWNER TO postgres;

--
-- Name: menu_modifier_groups_modifier_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_modifier_groups_modifier_group_id_seq OWNED BY public.menu_modifier_groups.modifier_group_id;


--
-- Name: menu_modifiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menu_modifiers (
    modifier_id integer NOT NULL,
    modifier_name character varying(100) NOT NULL,
    modifier_group_id integer,
    modifier_rate numeric(5,2),
    is_deleted boolean DEFAULT false,
    unit_id integer,
    quantity integer NOT NULL,
    modifier_decription text NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.menu_modifiers OWNER TO postgres;

--
-- Name: menu_modifiers_modifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menu_modifiers_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.menu_modifiers_modifier_id_seq OWNER TO postgres;

--
-- Name: menu_modifiers_modifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menu_modifiers_modifier_id_seq OWNED BY public.menu_modifiers.modifier_id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    item_id integer,
    date date DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    readyitemquantity integer NOT NULL,
    rate numeric(5,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    order_id integer,
    modifier_id integer,
    category_id integer,
    item_instructions character varying,
    status character varying,
    uid character varying
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_items_order_item_id_seq OWNER TO postgres;

--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;


--
-- Name: order_modifiers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_modifiers (
    order_modifier_id integer NOT NULL,
    modifier_id integer,
    date date DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    rate numeric(5,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_item_id integer,
    item_id integer,
    uid character varying
);


ALTER TABLE public.order_modifiers OWNER TO postgres;

--
-- Name: order_modifiers_order_modifier_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_modifiers_order_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_modifiers_order_modifier_id_seq OWNER TO postgres;

--
-- Name: order_modifiers_order_modifier_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_modifiers_order_modifier_id_seq OWNED BY public.order_modifiers.order_modifier_id;


--
-- Name: order_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    order_status_name character varying(100)
);


ALTER TABLE public.order_status OWNER TO postgres;

--
-- Name: order_status_order_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_status_order_status_id_seq OWNER TO postgres;

--
-- Name: order_status_order_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;


--
-- Name: order_tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_tables (
    order_table_id integer NOT NULL,
    order_id integer,
    table_id integer
);


ALTER TABLE public.order_tables OWNER TO postgres;

--
-- Name: order_tables_order_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_tables_order_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_tables_order_table_id_seq OWNER TO postgres;

--
-- Name: order_tables_order_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_tables_order_table_id_seq OWNED BY public.order_tables.order_table_id;


--
-- Name: order_tax; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_tax (
    order_tax_id integer NOT NULL,
    order_id integer,
    tax_id integer,
    tax_rate numeric
);


ALTER TABLE public.order_tax OWNER TO postgres;

--
-- Name: order_tax_order_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_tax_order_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.order_tax_order_tax_id_seq OWNER TO postgres;

--
-- Name: order_tax_order_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_tax_order_tax_id_seq OWNED BY public.order_tax.order_tax_id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    date date DEFAULT now() NOT NULL,
    review_id integer,
    comment character varying(50),
    sub_total numeric(10,2) NOT NULL,
    no_of_person integer NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    order_status_id integer,
    payment_mode_id integer,
    invoice_no character varying,
    order_duration interval,
    placed_on timestamp with time zone,
    order_type character varying,
    order_instructions character varying,
    "Is_SGST_Include" boolean DEFAULT false,
    sgst_amt numeric(10,2)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- Name: payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment (
    payment_id integer NOT NULL,
    order_id integer,
    payment_status_id integer,
    amount numeric(10,2),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    payment_mode character varying
);


ALTER TABLE public.payment OWNER TO postgres;

--
-- Name: payment_mode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);


ALTER TABLE public.payment_mode OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_payment_id_seq OWNER TO postgres;

--
-- Name: payment_payment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;


--
-- Name: payment_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_status (
    payment_status_id integer NOT NULL,
    payment_status_name character varying(100),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payment_status OWNER TO postgres;

--
-- Name: payment_status_payment_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.payment_status_payment_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payment_status_payment_status_id_seq OWNER TO postgres;

--
-- Name: payment_status_payment_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.payment_status_payment_status_id_seq OWNED BY public.payment_status.payment_status_id;


--
-- Name: paymode_mode_payment_mode_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paymode_mode_payment_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.paymode_mode_payment_mode_id_seq OWNER TO postgres;

--
-- Name: paymode_mode_payment_mode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paymode_mode_payment_mode_id_seq OWNED BY public.payment_mode.payment_mode_id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    permission_id integer NOT NULL,
    role_id integer,
    permission_name character varying(50) NOT NULL,
    can_view boolean DEFAULT true,
    can_add_edit boolean DEFAULT false,
    can_delete boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- Name: permissions_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.permissions_permission_id_seq OWNER TO postgres;

--
-- Name: permissions_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    rating integer,
    comment text,
    food integer,
    service integer,
    ambience integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_id integer,
    customer_id integer
);


ALTER TABLE public.reviews OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reviews_review_id_seq OWNER TO postgres;

--
-- Name: reviews_review_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    role_name text,
    priority integer
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.roles_role_id_seq OWNER TO postgres;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: sections; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sections (
    section_id integer NOT NULL,
    section_name character varying(100) NOT NULL,
    section_decription text NOT NULL,
    is_deleted boolean DEFAULT false,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.sections OWNER TO postgres;

--
-- Name: sections_section_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sections_section_id_seq OWNER TO postgres;

--
-- Name: sections_section_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;


--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    state_id integer NOT NULL,
    country_id integer,
    state_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: states_state_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.states_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.states_state_id_seq OWNER TO postgres;

--
-- Name: states_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.states_state_id_seq OWNED BY public.states.state_id;


--
-- Name: table_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.table_status (
    status_id integer NOT NULL,
    status_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    occupied_time time without time zone
);


ALTER TABLE public.table_status OWNER TO postgres;

--
-- Name: table_status_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.table_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.table_status_status_id_seq OWNER TO postgres;

--
-- Name: table_status_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.table_status_status_id_seq OWNED BY public.table_status.status_id;


--
-- Name: tables; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tables (
    table_id integer NOT NULL,
    table_name character varying(100) NOT NULL,
    section_id integer,
    capacity integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    status_id integer,
    is_deleted boolean DEFAULT false,
    occupied_time timestamp with time zone
);


ALTER TABLE public.tables OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tables_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tables_table_id_seq OWNER TO postgres;

--
-- Name: tables_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;


--
-- Name: tax_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tax_type OWNER TO postgres;

--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tax_type_tax_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNER TO postgres;

--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNED BY public.tax_type.tax_type_id;


--
-- Name: taxes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taxes (
    tax_id integer NOT NULL,
    tax_name character varying(100) NOT NULL,
    is_enabled boolean DEFAULT true NOT NULL,
    is_default boolean DEFAULT false NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    tax_type_id integer,
    tax_amount numeric NOT NULL,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.taxes OWNER TO postgres;

--
-- Name: taxes_tax_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taxes_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taxes_tax_id_seq OWNER TO postgres;

--
-- Name: taxes_tax_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taxes_tax_id_seq OWNED BY public.taxes.tax_id;


--
-- Name: units; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.units (
    unit_id integer NOT NULL,
    unit_name character varying(50) NOT NULL
);


ALTER TABLE public.units OWNER TO postgres;

--
-- Name: units_unit_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.units_unit_id_seq OWNER TO postgres;

--
-- Name: units_unit_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.units_unit_id_seq OWNED BY public.units.unit_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    role_id integer,
    email character varying(50) NOT NULL,
    password text NOT NULL,
    phone character varying(30) NOT NULL,
    profile_photo text,
    address text,
    country_id integer,
    state_id integer,
    city_id integer,
    zipcode character varying(30),
    created_by integer,
    created_at timestamp without time zone DEFAULT now(),
    modified_by integer,
    modified_at timestamp without time zone DEFAULT now(),
    last_login timestamp without time zone,
    reset_token character varying,
    reset_token_expirytime timestamp with time zone,
    is_active boolean DEFAULT true,
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: waiting_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.waiting_list (
    waiting_list_id integer NOT NULL,
    waiting_time timestamp without time zone DEFAULT now(),
    section_id integer NOT NULL,
    name character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    phone character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    no_of_person integer NOT NULL,
    created_by integer,
    created_at timestamp with time zone DEFAULT now(),
    modified_by integer,
    modified_at timestamp with time zone DEFAULT now(),
    is_deleted boolean DEFAULT false
);


ALTER TABLE public.waiting_list OWNER TO postgres;

--
-- Name: waiting_list_waiting_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.waiting_list_waiting_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.waiting_list_waiting_list_id_seq OWNER TO postgres;

--
-- Name: waiting_list_waiting_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.waiting_list_waiting_list_id_seq OWNED BY public.waiting_list.waiting_list_id;


--
-- Name: cities city_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);


--
-- Name: combine_modifier combine_modifier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);


--
-- Name: countries country_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);


--
-- Name: customer_tables customer_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);


--
-- Name: customer_waitings customer_waitings_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_waitings ALTER COLUMN customer_waitings_id SET DEFAULT nextval('public.customer_waitings_customer_waitings_id_seq'::regclass);


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


--
-- Name: favourites favourites_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);


--
-- Name: itemtype itemtype_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);


--
-- Name: menu_categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);


--
-- Name: menu_item_units unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);


--
-- Name: menu_items item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);


--
-- Name: menu_modifier_groups modifier_group_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);


--
-- Name: menu_modifiers modifier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);


--
-- Name: order_items order_item_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);


--
-- Name: order_modifiers order_modifier_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);


--
-- Name: order_status order_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);


--
-- Name: order_tables order_table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);


--
-- Name: order_tax order_tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);


--
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- Name: payment payment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);


--
-- Name: payment_mode payment_mode_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);


--
-- Name: payment_status payment_status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_status ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_status_payment_status_id_seq'::regclass);


--
-- Name: permissions permission_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);


--
-- Name: reviews review_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Name: sections section_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);


--
-- Name: states state_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);


--
-- Name: table_status status_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);


--
-- Name: tables table_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);


--
-- Name: tax_type tax_type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);


--
-- Name: taxes tax_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);


--
-- Name: units unit_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: waiting_list waiting_list_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
\.
COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM '$$PATH$$/5291.dat';

--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5250.dat';

--
-- Data for Name: combine_modifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
\.
COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM '$$PATH$$/5266.dat';

--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5246.dat';

--
-- Data for Name: customer_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tables (customer_table_id, customer_id, table_id, "IsActive", created_at) FROM stdin;
\.
COPY public.customer_tables (customer_table_id, customer_id, table_id, "IsActive", created_at) FROM '$$PATH$$/5282.dat';

--
-- Data for Name: customer_waitings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM stdin;
\.
COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM '$$PATH$$/5312.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM stdin;
\.
COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM '$$PATH$$/5274.dat';

--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5278.dat';

--
-- Data for Name: item_modifier_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
\.
COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM '$$PATH$$/5296.dat';

--
-- Data for Name: itemtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
\.
COPY public.itemtype (itemtype_id, item_type, item_photo) FROM '$$PATH$$/5295.dat';

--
-- Data for Name: menu_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5254.dat';

--
-- Data for Name: menu_item_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5258.dat';

--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
\.
COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM '$$PATH$$/5262.dat';

--
-- Data for Name: menu_modifier_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5256.dat';

--
-- Data for Name: menu_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5264.dat';

--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM stdin;
\.
COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM '$$PATH$$/5286.dat';

--
-- Data for Name: order_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM stdin;
\.
COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM '$$PATH$$/5288.dat';

--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status (order_status_id, order_status_name) FROM stdin;
\.
COPY public.order_status (order_status_id, order_status_name) FROM '$$PATH$$/5306.dat';

--
-- Data for Name: order_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
\.
COPY public.order_tables (order_table_id, order_id, table_id) FROM '$$PATH$$/5290.dat';

--
-- Data for Name: order_tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM stdin;
\.
COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM '$$PATH$$/5302.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM stdin;
\.
COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM '$$PATH$$/5284.dat';

--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM stdin;
\.
COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM '$$PATH$$/5310.dat';

--
-- Data for Name: payment_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
\.
COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM '$$PATH$$/5304.dat';

--
-- Data for Name: payment_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5308.dat';

--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5293.dat';

--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM stdin;
\.
COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM '$$PATH$$/5276.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM stdin;
\.
COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM '$$PATH$$/5244.dat';

--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5268.dat';

--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5248.dat';

--
-- Data for Name: table_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM stdin;
\.
COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM '$$PATH$$/5298.dat';

--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM stdin;
\.
COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM '$$PATH$$/5270.dat';

--
-- Data for Name: tax_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5300.dat';

--
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
\.
COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM '$$PATH$$/5272.dat';

--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (unit_id, unit_name) FROM stdin;
\.
COPY public.units (unit_id, unit_name) FROM '$$PATH$$/5260.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
\.
COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM '$$PATH$$/5252.dat';

--
-- Data for Name: waiting_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM stdin;
\.
COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM '$$PATH$$/5280.dat';

--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);


--
-- Name: combine_modifier_combine_modifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 56, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);


--
-- Name: customer_tables_customer_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 71, true);


--
-- Name: customer_waitings_customer_waitings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_waitings_customer_waitings_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 21, true);


--
-- Name: favourites_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 53, true);


--
-- Name: itemtype_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);


--
-- Name: menu_categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 30, true);


--
-- Name: menu_item_units_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);


--
-- Name: menu_items_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_items_item_id_seq', 53, true);


--
-- Name: menu_modifier_groups_modifier_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 11, true);


--
-- Name: menu_modifiers_modifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 169, true);


--
-- Name: order_modifiers_order_modifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 183, true);


--
-- Name: order_status_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);


--
-- Name: order_tables_order_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 33, true);


--
-- Name: order_tax_order_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 264, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 77, true);


--
-- Name: payment_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_payment_id_seq', 13, true);


--
-- Name: payment_status_payment_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payment_status_payment_status_id_seq', 2, true);


--
-- Name: paymode_mode_payment_mode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);


--
-- Name: permissions_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);


--
-- Name: reviews_review_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reviews_review_id_seq', 18, true);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);


--
-- Name: sections_section_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sections_section_id_seq', 7, true);


--
-- Name: states_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);


--
-- Name: table_status_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.table_status_status_id_seq', 5, true);


--
-- Name: tables_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_table_id_seq', 13, true);


--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);


--
-- Name: taxes_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxes_tax_id_seq', 13, true);


--
-- Name: units_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 289, true);


--
-- Name: waiting_list_waiting_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 37, true);


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- Name: combine_modifier combine_modifier_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);


--
-- Name: customer_tables customer_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_pkey PRIMARY KEY (customer_table_id);


--
-- Name: customer_waitings customer_waitings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_pkey PRIMARY KEY (customer_waitings_id);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: favourites favourites_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (favourites_id);


--
-- Name: item_modifier_group item_modifier_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_pkey PRIMARY KEY (item_id, modifier_group_id);


--
-- Name: itemtype itemtype_item_type_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_item_type_key UNIQUE (item_type);


--
-- Name: itemtype itemtype_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_pkey PRIMARY KEY (itemtype_id);


--
-- Name: menu_categories menu_categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);


--
-- Name: menu_item_units menu_item_units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);


--
-- Name: menu_items menu_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);


--
-- Name: menu_modifier_groups menu_modifier_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_pkey PRIMARY KEY (modifier_group_id);


--
-- Name: menu_modifiers menu_modifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_pkey PRIMARY KEY (modifier_id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);


--
-- Name: order_modifiers order_modifiers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_pkey PRIMARY KEY (order_modifier_id);


--
-- Name: order_status order_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);


--
-- Name: order_tables order_tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_pkey PRIMARY KEY (order_table_id);


--
-- Name: order_tax order_tax_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_pkey PRIMARY KEY (order_tax_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- Name: payment payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);


--
-- Name: payment_status payment_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_status
    ADD CONSTRAINT payment_status_pkey PRIMARY KEY (payment_status_id);


--
-- Name: payment_mode paymode_mode_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT paymode_mode_pkey PRIMARY KEY (payment_mode_id);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: sections sections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);


--
-- Name: table_status table_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.table_status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);


--
-- Name: tables tables_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);


--
-- Name: tax_type tax_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);


--
-- Name: taxes taxes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (tax_id);


--
-- Name: units units_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: waiting_list waiting_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);


--
-- Name: cities cities_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;


--
-- Name: combine_modifier combine_modifier_modifier_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;


--
-- Name: combine_modifier combine_modifier_modifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;


--
-- Name: customer_tables customer_tables_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;


--
-- Name: customer_tables customer_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;


--
-- Name: customer_waitings customer_waitings_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;


--
-- Name: customer_waitings customer_waitings_waiting_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_waiting_list_id_fkey FOREIGN KEY (waiting_list_id) REFERENCES public.waiting_list(waiting_list_id) ON DELETE SET NULL;


--
-- Name: customers customers_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;


--
-- Name: favourites favourites_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;


--
-- Name: favourites favourites_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;


--
-- Name: taxes fk_customer; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);


--
-- Name: reviews fk_customer_review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: order_items fk_order_category_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_category_key FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id);


--
-- Name: order_modifiers fk_order_modifier_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT fk_order_modifier_order_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id);


--
-- Name: reviews fk_order_review; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: item_modifier_group item_modifier_group_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;


--
-- Name: item_modifier_group item_modifier_group_modifier_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;


--
-- Name: menu_items itemtype_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;


--
-- Name: menu_items menu_items_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;


--
-- Name: menu_items menu_items_modifier_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;


--
-- Name: menu_items menu_items_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;


--
-- Name: menu_modifier_groups menu_modifier_groups_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;


--
-- Name: menu_modifiers menu_modifiers_modifier_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;


--
-- Name: menu_modifiers menu_modifiers_unit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;


--
-- Name: order_items order_item_modifier_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_modifier_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);


--
-- Name: order_modifiers order_item_modifiers_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_item_modifiers_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);


--
-- Name: order_items order_item_order_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id);


--
-- Name: order_items order_items_item_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;


--
-- Name: order_modifiers order_modifiers_modifier_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;


--
-- Name: orders order_order_status_id_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);


--
-- Name: orders order_payment_mode_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);


--
-- Name: order_tables order_tables_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- Name: order_tables order_tables_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;


--
-- Name: order_tax order_tax_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- Name: order_tax order_tax_tax_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;


--
-- Name: orders orders_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;


--
-- Name: orders orders_review_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;


--
-- Name: payment payment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;


--
-- Name: payment payment_payment_status_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id) ON DELETE SET NULL;


--
-- Name: permissions permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;


--
-- Name: states states_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;


--
-- Name: tables status_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);


--
-- Name: tables tables_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;


--
-- Name: users users_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;


--
-- Name: users users_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;


--
-- Name: users users_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;


--
-- Name: users users_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;


--
-- Name: waiting_list waiting_list_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    