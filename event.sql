PGDMP  %    :                }         	   PizzaShop    16.3    16.3 7   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32786 	   PizzaShop    DATABASE     ~   CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "PizzaShop";
                postgres    false            �           0    0 	   PizzaShop    DATABASE PROPERTIES     =   ALTER DATABASE "PizzaShop" SET "TimeZone" TO 'Asia/Kolkata';
                     postgres    false                       1259    49167    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);
 +   DROP TABLE public."__EFMigrationsHistory";
       public         heap    postgres    false            �            1259    32835    cities    TABLE     L  CREATE TABLE public.cities (
    city_id integer NOT NULL,
    state_id integer,
    city_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.cities;
       public         heap    postgres    false            �            1259    32834    cities_city_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cities_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.cities_city_id_seq;
       public          postgres    false    222            �           0    0    cities_city_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;
          public          postgres    false    221            �            1259    33048    combine_modifier    TABLE     �   CREATE TABLE public.combine_modifier (
    combine_modifier_id integer NOT NULL,
    modifier_group_id integer,
    modifier_id integer,
    is_deleted boolean DEFAULT false
);
 $   DROP TABLE public.combine_modifier;
       public         heap    postgres    false            �            1259    33047 (   combine_modifier_combine_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.combine_modifier_combine_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE public.combine_modifier_combine_modifier_id_seq;
       public          postgres    false    238            �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.combine_modifier_combine_modifier_id_seq OWNED BY public.combine_modifier.combine_modifier_id;
          public          postgres    false    237            �            1259    32812 	   countries    TABLE     ?  CREATE TABLE public.countries (
    country_id integer NOT NULL,
    country_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            �            1259    32811    countries_country_id_seq    SEQUENCE     �   CREATE SEQUENCE public.countries_country_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.countries_country_id_seq;
       public          postgres    false    218            �           0    0    countries_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;
          public          postgres    false    217            �            1259    33251    customer_tables    TABLE     �   CREATE TABLE public.customer_tables (
    customer_table_id integer NOT NULL,
    customer_id integer,
    table_id integer,
    "IsActive" boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.customer_tables;
       public         heap    postgres    false            �            1259    33250 %   customer_tables_customer_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_tables_customer_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.customer_tables_customer_table_id_seq;
       public          postgres    false    254            �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.customer_tables_customer_table_id_seq OWNED BY public.customer_tables.customer_table_id;
          public          postgres    false    253                       1259    106528    customer_waitings    TABLE     �   CREATE TABLE public.customer_waitings (
    customer_waitings_id integer NOT NULL,
    customer_id integer,
    waiting_list_id integer
);
 %   DROP TABLE public.customer_waitings;
       public         heap    postgres    false                       1259    106527 *   customer_waitings_customer_waitings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_waitings_customer_waitings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.customer_waitings_customer_waitings_id_seq;
       public          postgres    false    284            �           0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.customer_waitings_customer_waitings_id_seq OWNED BY public.customer_waitings.customer_waitings_id;
          public          postgres    false    283            �            1259    33150 	   customers    TABLE     �  CREATE TABLE public.customers (
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
       public         heap    postgres    false            �            1259    33149    customers_customer_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.customers_customer_id_seq;
       public          postgres    false    246            �           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    245                       1259    155694    events    TABLE     �  CREATE TABLE public.events (
    event_id integer NOT NULL,
    customer_id integer,
    status_id integer,
    event_date date DEFAULT now() NOT NULL,
    event_start_time timestamp with time zone DEFAULT now() NOT NULL,
    event_end_time timestamp with time zone DEFAULT now() NOT NULL,
    order_type character varying(50),
    isac boolean DEFAULT false,
    noofperson integer NOT NULL,
    special_instruction character varying(50),
    billing_address character varying(200),
    created_by integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    event_type character varying(50)
);
    DROP TABLE public.events;
       public         heap    postgres    false                       1259    155693    events_event_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.events_event_id_seq;
       public          postgres    false    286            �           0    0    events_event_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;
          public          postgres    false    285            �            1259    33202 
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
       public         heap    postgres    false            �            1259    33201    favourites_favourites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favourites_favourites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.favourites_favourites_id_seq;
       public          postgres    false    250            �           0    0    favourites_favourites_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.favourites_favourites_id_seq OWNED BY public.favourites.favourites_id;
          public          postgres    false    249                       1259    81949    item_modifier_group    TABLE     �   CREATE TABLE public.item_modifier_group (
    item_id integer NOT NULL,
    modifier_group_id integer NOT NULL,
    min_selection integer,
    max_selection integer
);
 '   DROP TABLE public.item_modifier_group;
       public         heap    postgres    false                       1259    73729    itemtype    TABLE     �   CREATE TABLE public.itemtype (
    itemtype_id integer NOT NULL,
    item_type character varying(100) NOT NULL,
    item_photo text
);
    DROP TABLE public.itemtype;
       public         heap    postgres    false            
           1259    73728    itemtype_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.itemtype_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.itemtype_item_id_seq;
       public          postgres    false    267            �           0    0    itemtype_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.itemtype_item_id_seq OWNED BY public.itemtype.itemtype_id;
          public          postgres    false    266            �            1259    32916    menu_categories    TABLE     �  CREATE TABLE public.menu_categories (
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
       public         heap    postgres    false            �            1259    32915    menu_categories_category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.menu_categories_category_id_seq;
       public          postgres    false    226            �           0    0    menu_categories_category_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.menu_categories_category_id_seq OWNED BY public.menu_categories.category_id;
          public          postgres    false    225            �            1259    32953    menu_item_units    TABLE     ?  CREATE TABLE public.menu_item_units (
    unit_id integer NOT NULL,
    unit_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.menu_item_units;
       public         heap    postgres    false            �            1259    32952    menu_item_units_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_item_units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.menu_item_units_unit_id_seq;
       public          postgres    false    230            �           0    0    menu_item_units_unit_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.menu_item_units_unit_id_seq OWNED BY public.menu_item_units.unit_id;
          public          postgres    false    229            �            1259    32988 
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
    "is_Deleted" boolean DEFAULT false
);
    DROP TABLE public.menu_items;
       public         heap    postgres    false            �            1259    32987    menu_items_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_items_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.menu_items_item_id_seq;
       public          postgres    false    234            �           0    0    menu_items_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;
          public          postgres    false    233            �            1259    32936    menu_modifier_groups    TABLE     �  CREATE TABLE public.menu_modifier_groups (
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
       public         heap    postgres    false            �            1259    32935 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_modifier_groups_modifier_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.menu_modifier_groups_modifier_group_id_seq;
       public          postgres    false    228            �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.menu_modifier_groups_modifier_group_id_seq OWNED BY public.menu_modifier_groups.modifier_group_id;
          public          postgres    false    227            �            1259    33021    menu_modifiers    TABLE       CREATE TABLE public.menu_modifiers (
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
       public         heap    postgres    false            �            1259    33020    menu_modifiers_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.menu_modifiers_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.menu_modifiers_modifier_id_seq;
       public          postgres    false    236            �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.menu_modifiers_modifier_id_seq OWNED BY public.menu_modifiers.modifier_id;
          public          postgres    false    235                       1259    33306    order_items    TABLE     X  CREATE TABLE public.order_items (
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
       public         heap    postgres    false                       1259    33305    order_items_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.order_items_order_item_id_seq;
       public          postgres    false    258            �           0    0    order_items_order_item_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;
          public          postgres    false    257                       1259    33321    order_modifiers    TABLE     �  CREATE TABLE public.order_modifiers (
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
       public         heap    postgres    false                       1259    33320 %   order_modifiers_order_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_modifiers_order_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.order_modifiers_order_modifier_id_seq;
       public          postgres    false    260            �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.order_modifiers_order_modifier_id_seq OWNED BY public.order_modifiers.order_modifier_id;
          public          postgres    false    259                       1259    90201    order_status    TABLE     y   CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    order_status_name character varying(100)
);
     DROP TABLE public.order_status;
       public         heap    postgres    false                       1259    90200     order_status_order_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.order_status_order_status_id_seq;
       public          postgres    false    278            �           0    0     order_status_order_status_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;
          public          postgres    false    277                       1259    33336    order_tables    TABLE     v   CREATE TABLE public.order_tables (
    order_table_id integer NOT NULL,
    order_id integer,
    table_id integer
);
     DROP TABLE public.order_tables;
       public         heap    postgres    false                       1259    33335    order_tables_order_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tables_order_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.order_tables_order_table_id_seq;
       public          postgres    false    262            �           0    0    order_tables_order_table_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.order_tables_order_table_id_seq OWNED BY public.order_tables.order_table_id;
          public          postgres    false    261                       1259    90177 	   order_tax    TABLE     �   CREATE TABLE public.order_tax (
    order_tax_id integer NOT NULL,
    order_id integer,
    tax_id integer,
    tax_rate numeric
);
    DROP TABLE public.order_tax;
       public         heap    postgres    false                       1259    90176    order_tax_order_tax_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tax_order_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.order_tax_order_tax_id_seq;
       public          postgres    false    274            �           0    0    order_tax_order_tax_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.order_tax_order_tax_id_seq OWNED BY public.order_tax.order_tax_id;
          public          postgres    false    273                        1259    33275    orders    TABLE     #  CREATE TABLE public.orders (
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
       public         heap    postgres    false            �            1259    33274    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    256            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    255                       1259    98418    payment    TABLE     ~  CREATE TABLE public.payment (
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
       public         heap    postgres    false                       1259    90194    payment_mode    TABLE     y   CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);
     DROP TABLE public.payment_mode;
       public         heap    postgres    false                       1259    98417    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    282            �           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    281                       1259    98395    payment_status    TABLE     I  CREATE TABLE public.payment_status (
    payment_status_id integer NOT NULL,
    payment_status_name character varying(100),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.payment_status;
       public         heap    postgres    false                       1259    98394 $   payment_status_payment_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_status_payment_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.payment_status_payment_status_id_seq;
       public          postgres    false    280            �           0    0 $   payment_status_payment_status_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.payment_status_payment_status_id_seq OWNED BY public.payment_status.payment_status_id;
          public          postgres    false    279                       1259    90193     paymode_mode_payment_mode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paymode_mode_payment_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.paymode_mode_payment_mode_id_seq;
       public          postgres    false    276            �           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.paymode_mode_payment_mode_id_seq OWNED BY public.payment_mode.payment_mode_id;
          public          postgres    false    275            	           1259    65622    permissions    TABLE     �  CREATE TABLE public.permissions (
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
       public         heap    postgres    false                       1259    65621    permissions_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.permissions_permission_id_seq;
       public          postgres    false    265            �           0    0    permissions_permission_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;
          public          postgres    false    264            �            1259    33191    reviews    TABLE     �  CREATE TABLE public.reviews (
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
       public         heap    postgres    false            �            1259    33190    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    248            �           0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    247            �            1259    32803    roles    TABLE     0  CREATE TABLE public.roles (
    role_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    role_name text,
    priority integer
);
    DROP TABLE public.roles;
       public         heap    postgres    false            �            1259    32802    roles_role_id_seq    SEQUENCE     �   CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.roles_role_id_seq;
       public          postgres    false    216            �           0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    215            �            1259    33066    sections    TABLE     �  CREATE TABLE public.sections (
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
       public         heap    postgres    false            �            1259    33065    sections_section_id_seq    SEQUENCE     �   CREATE SEQUENCE public.sections_section_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.sections_section_id_seq;
       public          postgres    false    240            �           0    0    sections_section_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;
          public          postgres    false    239            �            1259    32821    states    TABLE     P  CREATE TABLE public.states (
    state_id integer NOT NULL,
    country_id integer,
    state_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.states;
       public         heap    postgres    false            �            1259    32820    states_state_id_seq    SEQUENCE     �   CREATE SEQUENCE public.states_state_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.states_state_id_seq;
       public          postgres    false    220            �           0    0    states_state_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.states_state_id_seq OWNED BY public.states.state_id;
          public          postgres    false    219                       1259    90142    table_status    TABLE     j  CREATE TABLE public.table_status (
    status_id integer NOT NULL,
    status_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    occupied_time time without time zone
);
     DROP TABLE public.table_status;
       public         heap    postgres    false                       1259    90141    table_status_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.table_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.table_status_status_id_seq;
       public          postgres    false    270            �           0    0    table_status_status_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.table_status_status_id_seq OWNED BY public.table_status.status_id;
          public          postgres    false    269            �            1259    33084    tables    TABLE     �  CREATE TABLE public.tables (
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
       public         heap    postgres    false            �            1259    33083    tables_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tables_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.tables_table_id_seq;
       public          postgres    false    242            �           0    0    tables_table_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;
          public          postgres    false    241                       1259    90157    tax_type    TABLE     @  CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.tax_type;
       public         heap    postgres    false                       1259    90156    tax_type_tax_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tax_type_tax_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tax_type_tax_type_id_seq;
       public          postgres    false    272            �           0    0    tax_type_tax_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNED BY public.tax_type.tax_type_id;
          public          postgres    false    271            �            1259    33104    taxes    TABLE     �  CREATE TABLE public.taxes (
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
       public         heap    postgres    false            �            1259    33103    taxes_tax_id_seq    SEQUENCE     �   CREATE SEQUENCE public.taxes_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.taxes_tax_id_seq;
       public          postgres    false    244            �           0    0    taxes_tax_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.taxes_tax_id_seq OWNED BY public.taxes.tax_id;
          public          postgres    false    243            �            1259    32981    units    TABLE     j   CREATE TABLE public.units (
    unit_id integer NOT NULL,
    unit_name character varying(50) NOT NULL
);
    DROP TABLE public.units;
       public         heap    postgres    false            �            1259    32980    units_unit_id_seq    SEQUENCE     �   CREATE SEQUENCE public.units_unit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.units_unit_id_seq;
       public          postgres    false    232            �           0    0    units_unit_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.units_unit_id_seq OWNED BY public.units.unit_id;
          public          postgres    false    231            �            1259    32849    users    TABLE     O  CREATE TABLE public.users (
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
       public         heap    postgres    false            �            1259    32848    users_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_user_id_seq;
       public          postgres    false    224            �           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    223            �            1259    33221    waiting_list    TABLE     Y  CREATE TABLE public.waiting_list (
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
       public         heap    postgres    false            �            1259    33220     waiting_list_waiting_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.waiting_list_waiting_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.waiting_list_waiting_list_id_seq;
       public          postgres    false    252            �           0    0     waiting_list_waiting_list_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.waiting_list_waiting_list_id_seq OWNED BY public.waiting_list.waiting_list_id;
          public          postgres    false    251                       2604    32838    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    222    221    222            *           2604    33051 $   combine_modifier combine_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);
 S   ALTER TABLE public.combine_modifier ALTER COLUMN combine_modifier_id DROP DEFAULT;
       public          postgres    false    238    237    238                       2604    32815    countries country_id    DEFAULT     |   ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    218    217    218            H           2604    33254 !   customer_tables customer_table_id    DEFAULT     �   ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);
 P   ALTER TABLE public.customer_tables ALTER COLUMN customer_table_id DROP DEFAULT;
       public          postgres    false    254    253    254            o           2604    106531 &   customer_waitings customer_waitings_id    DEFAULT     �   ALTER TABLE ONLY public.customer_waitings ALTER COLUMN customer_waitings_id SET DEFAULT nextval('public.customer_waitings_customer_waitings_id_seq'::regclass);
 U   ALTER TABLE public.customer_waitings ALTER COLUMN customer_waitings_id DROP DEFAULT;
       public          postgres    false    284    283    284            :           2604    33153    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    245    246    246            p           2604    155697    events event_id    DEFAULT     r   ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);
 >   ALTER TABLE public.events ALTER COLUMN event_id DROP DEFAULT;
       public          postgres    false    285    286    286            @           2604    33205    favourites favourites_id    DEFAULT     �   ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);
 G   ALTER TABLE public.favourites ALTER COLUMN favourites_id DROP DEFAULT;
       public          postgres    false    249    250    250            _           2604    73732    itemtype itemtype_id    DEFAULT     x   ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);
 C   ALTER TABLE public.itemtype ALTER COLUMN itemtype_id DROP DEFAULT;
       public          postgres    false    266    267    267                       2604    32919    menu_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);
 J   ALTER TABLE public.menu_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    225    226    226                       2604    32956    menu_item_units unit_id    DEFAULT     �   ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);
 F   ALTER TABLE public.menu_item_units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    229    230    230                       2604    32991    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    233    234    234                       2604    32939 &   menu_modifier_groups modifier_group_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);
 U   ALTER TABLE public.menu_modifier_groups ALTER COLUMN modifier_group_id DROP DEFAULT;
       public          postgres    false    228    227    228            &           2604    33024    menu_modifiers modifier_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);
 I   ALTER TABLE public.menu_modifiers ALTER COLUMN modifier_id DROP DEFAULT;
       public          postgres    false    236    235    236            P           2604    33309    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    258    257    258            T           2604    33324 !   order_modifiers order_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);
 P   ALTER TABLE public.order_modifiers ALTER COLUMN order_modifier_id DROP DEFAULT;
       public          postgres    false    259    260    260            h           2604    90204    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public          postgres    false    277    278    278            X           2604    33339    order_tables order_table_id    DEFAULT     �   ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);
 J   ALTER TABLE public.order_tables ALTER COLUMN order_table_id DROP DEFAULT;
       public          postgres    false    261    262    262            f           2604    90180    order_tax order_tax_id    DEFAULT     �   ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);
 E   ALTER TABLE public.order_tax ALTER COLUMN order_tax_id DROP DEFAULT;
       public          postgres    false    274    273    274            K           2604    33278    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    255    256    256            l           2604    98421    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    282    281    282            g           2604    90197    payment_mode payment_mode_id    DEFAULT     �   ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);
 K   ALTER TABLE public.payment_mode ALTER COLUMN payment_mode_id DROP DEFAULT;
       public          postgres    false    275    276    276            i           2604    98398     payment_status payment_status_id    DEFAULT     �   ALTER TABLE ONLY public.payment_status ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_status_payment_status_id_seq'::regclass);
 O   ALTER TABLE public.payment_status ALTER COLUMN payment_status_id DROP DEFAULT;
       public          postgres    false    279    280    280            Y           2604    65625    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public          postgres    false    264    265    265            =           2604    33194    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    247    248    248                       2604    32806    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    215    216    216            ,           2604    33069    sections section_id    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    239    240    240                       2604    32824    states state_id    DEFAULT     r   ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);
 >   ALTER TABLE public.states ALTER COLUMN state_id DROP DEFAULT;
       public          postgres    false    220    219    220            `           2604    90145    table_status status_id    DEFAULT     �   ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);
 E   ALTER TABLE public.table_status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    269    270    270            0           2604    33087    tables table_id    DEFAULT     r   ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);
 >   ALTER TABLE public.tables ALTER COLUMN table_id DROP DEFAULT;
       public          postgres    false    241    242    242            c           2604    90160    tax_type tax_type_id    DEFAULT     |   ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);
 C   ALTER TABLE public.tax_type ALTER COLUMN tax_type_id DROP DEFAULT;
       public          postgres    false    272    271    272            4           2604    33107    taxes tax_id    DEFAULT     l   ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);
 ;   ALTER TABLE public.taxes ALTER COLUMN tax_id DROP DEFAULT;
       public          postgres    false    244    243    244                       2604    32984    units unit_id    DEFAULT     n   ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);
 <   ALTER TABLE public.units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    232    231    232                       2604    32852    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    224    223    224            C           2604    33224    waiting_list waiting_list_id    DEFAULT     �   ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);
 K   ALTER TABLE public.waiting_list ALTER COLUMN waiting_list_id DROP DEFAULT;
       public          postgres    false    251    252    252            �          0    49167    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    263   Ҫ      �          0    32835    cities 
   TABLE DATA           p   COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    222   �      �          0    33048    combine_modifier 
   TABLE DATA           k   COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
    public          postgres    false    238   ެ      �          0    32812 	   countries 
   TABLE DATA           o   COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    218   ��      �          0    33251    customer_tables 
   TABLE DATA           k   COPY public.customer_tables (customer_table_id, customer_id, table_id, "IsActive", created_at) FROM stdin;
    public          postgres    false    254   ��      �          0    106528    customer_waitings 
   TABLE DATA           _   COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM stdin;
    public          postgres    false    284   w�      �          0    33150 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM stdin;
    public          postgres    false    246   ��      �          0    155694    events 
   TABLE DATA           �   COPY public.events (event_id, customer_id, status_id, event_date, event_start_time, event_end_time, order_type, isac, noofperson, special_instruction, billing_address, created_by, created_at, modified_by, modified_at, event_type) FROM stdin;
    public          postgres    false    286   ��      �          0    33202 
   favourites 
   TABLE DATA           w   COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    250   �      �          0    81949    item_modifier_group 
   TABLE DATA           g   COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
    public          postgres    false    268   4�      �          0    73729    itemtype 
   TABLE DATA           F   COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
    public          postgres    false    267   ��      �          0    32916    menu_categories 
   TABLE DATA           �   COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    226   Ƕ      �          0    32953    menu_item_units 
   TABLE DATA           o   COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    230   ��      �          0    32988 
   menu_items 
   TABLE DATA              COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
    public          postgres    false    234   <�      �          0    32936    menu_modifier_groups 
   TABLE DATA           �   COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    228   K�      �          0    33021    menu_modifiers 
   TABLE DATA           �   COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    236   U�      �          0    33306    order_items 
   TABLE DATA           �   COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM stdin;
    public          postgres    false    258   e�      �          0    33321    order_modifiers 
   TABLE DATA           �   COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM stdin;
    public          postgres    false    260   ;�      �          0    90201    order_status 
   TABLE DATA           J   COPY public.order_status (order_status_id, order_status_name) FROM stdin;
    public          postgres    false    278   ��      �          0    33336    order_tables 
   TABLE DATA           J   COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
    public          postgres    false    262   ��      �          0    90177 	   order_tax 
   TABLE DATA           M   COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM stdin;
    public          postgres    false    274   }�      �          0    33275    orders 
   TABLE DATA           0  COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM stdin;
    public          postgres    false    256   ��      �          0    98418    payment 
   TABLE DATA           �   COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM stdin;
    public          postgres    false    282   ��      �          0    90194    payment_mode 
   TABLE DATA           J   COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
    public          postgres    false    276   ��      �          0    98395    payment_status 
   TABLE DATA           �   COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    280   ��      �          0    65622    permissions 
   TABLE DATA           �   COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    265   :�      �          0    33191    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM stdin;
    public          postgres    false    248   r�      �          0    32803    roles 
   TABLE DATA           o   COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM stdin;
    public          postgres    false    216   j�      �          0    33066    sections 
   TABLE DATA           �   COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    240   ��      �          0    32821    states 
   TABLE DATA           t   COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    220   ��      �          0    90142    table_status 
   TABLE DATA              COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM stdin;
    public          postgres    false    270   ��      �          0    33084    tables 
   TABLE DATA           �   COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM stdin;
    public          postgres    false    242   ,�      �          0    90157    tax_type 
   TABLE DATA           p   COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    272   ��      �          0    33104    taxes 
   TABLE DATA           �   COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
    public          postgres    false    244   B�      �          0    32981    units 
   TABLE DATA           3   COPY public.units (unit_id, unit_name) FROM stdin;
    public          postgres    false    232   S�      �          0    32849    users 
   TABLE DATA           $  COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
    public          postgres    false    224   v�      �          0    33221    waiting_list 
   TABLE DATA           �   COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM stdin;
    public          postgres    false    252   "�      �           0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);
          public          postgres    false    221            �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 61, true);
          public          postgres    false    237                        0    0    countries_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);
          public          postgres    false    217                       0    0 %   customer_tables_customer_table_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 82, true);
          public          postgres    false    253                       0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.customer_waitings_customer_waitings_id_seq', 1, false);
          public          postgres    false    283                       0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 21, true);
          public          postgres    false    245                       0    0    events_event_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.events_event_id_seq', 1, false);
          public          postgres    false    285                       0    0    favourites_favourites_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 53, true);
          public          postgres    false    249                       0    0    itemtype_item_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);
          public          postgres    false    266                       0    0    menu_categories_category_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 30, true);
          public          postgres    false    225                       0    0    menu_item_units_unit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);
          public          postgres    false    229            	           0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 62, true);
          public          postgres    false    233            
           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 12, true);
          public          postgres    false    227                       0    0    menu_modifiers_modifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);
          public          postgres    false    235                       0    0    order_items_order_item_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 174, true);
          public          postgres    false    257                       0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 185, true);
          public          postgres    false    259                       0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);
          public          postgres    false    277                       0    0    order_tables_order_table_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 40, true);
          public          postgres    false    261                       0    0    order_tax_order_tax_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 276, true);
          public          postgres    false    273                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 80, true);
          public          postgres    false    255                       0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 14, true);
          public          postgres    false    281                       0    0 $   payment_status_payment_status_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.payment_status_payment_status_id_seq', 2, true);
          public          postgres    false    279                       0    0     paymode_mode_payment_mode_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);
          public          postgres    false    275                       0    0    permissions_permission_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);
          public          postgres    false    264                       0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 19, true);
          public          postgres    false    247                       0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    215                       0    0    sections_section_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sections_section_id_seq', 12, true);
          public          postgres    false    239                       0    0    states_state_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);
          public          postgres    false    219                       0    0    table_status_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.table_status_status_id_seq', 5, true);
          public          postgres    false    269                       0    0    tables_table_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tables_table_id_seq', 13, true);
          public          postgres    false    241                       0    0    tax_type_tax_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);
          public          postgres    false    271                       0    0    taxes_tax_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.taxes_tax_id_seq', 13, true);
          public          postgres    false    243                       0    0    units_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);
          public          postgres    false    231                       0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 290, true);
          public          postgres    false    223                        0    0     waiting_list_waiting_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 37, true);
          public          postgres    false    251            �           2606    49171 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    263            ~           2606    32842    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    222            �           2606    33053 &   combine_modifier combine_modifier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);
 P   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_pkey;
       public            postgres    false    238            z           2606    32819    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    218            �           2606    33256 $   customer_tables customer_tables_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_pkey PRIMARY KEY (customer_table_id);
 N   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_pkey;
       public            postgres    false    254            �           2606    106533 (   customer_waitings customer_waitings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_pkey PRIMARY KEY (customer_waitings_id);
 R   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_pkey;
       public            postgres    false    284            �           2606    33159    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    246            �           2606    33157    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    246            �           2606    155705    events events_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    286            �           2606    33209    favourites favourites_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (favourites_id);
 D   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_pkey;
       public            postgres    false    250            �           2606    81953 ,   item_modifier_group item_modifier_group_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_pkey PRIMARY KEY (item_id, modifier_group_id);
 V   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_pkey;
       public            postgres    false    268    268            �           2606    73738    itemtype itemtype_item_type_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_item_type_key UNIQUE (item_type);
 I   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_item_type_key;
       public            postgres    false    267            �           2606    73736    itemtype itemtype_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_pkey PRIMARY KEY (itemtype_id);
 @   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_pkey;
       public            postgres    false    267            �           2606    32926 $   menu_categories menu_categories_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    226            �           2606    32960 $   menu_item_units menu_item_units_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);
 N   ALTER TABLE ONLY public.menu_item_units DROP CONSTRAINT menu_item_units_pkey;
       public            postgres    false    230            �           2606    33000    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    234            �           2606    32946 .   menu_modifier_groups menu_modifier_groups_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_pkey PRIMARY KEY (modifier_group_id);
 X   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_pkey;
       public            postgres    false    228            �           2606    33031 "   menu_modifiers menu_modifiers_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_pkey PRIMARY KEY (modifier_id);
 L   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_pkey;
       public            postgres    false    236            �           2606    33314    order_items order_items_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    258            �           2606    33329 $   order_modifiers order_modifiers_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_pkey PRIMARY KEY (order_modifier_id);
 N   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_pkey;
       public            postgres    false    260            �           2606    90206    order_status order_status_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public            postgres    false    278            �           2606    33341    order_tables order_tables_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_pkey PRIMARY KEY (order_table_id);
 H   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_pkey;
       public            postgres    false    262            �           2606    90182    order_tax order_tax_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_pkey PRIMARY KEY (order_tax_id);
 B   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_pkey;
       public            postgres    false    274            �           2606    33283    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    256            �           2606    98425    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    282            �           2606    98402 "   payment_status payment_status_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.payment_status
    ADD CONSTRAINT payment_status_pkey PRIMARY KEY (payment_status_id);
 L   ALTER TABLE ONLY public.payment_status DROP CONSTRAINT payment_status_pkey;
       public            postgres    false    280            �           2606    90199    payment_mode paymode_mode_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT paymode_mode_pkey PRIMARY KEY (payment_mode_id);
 H   ALTER TABLE ONLY public.payment_mode DROP CONSTRAINT paymode_mode_pkey;
       public            postgres    false    276            �           2606    65632    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    265            �           2606    33200    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    248            x           2606    32810    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            �           2606    33076    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    240            |           2606    32828    states states_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    220            �           2606    90149    table_status table_status_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.table_status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);
 H   ALTER TABLE ONLY public.table_status DROP CONSTRAINT table_status_pkey;
       public            postgres    false    270            �           2606    33091    tables tables_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_pkey;
       public            postgres    false    242            �           2606    90164    tax_type tax_type_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);
 @   ALTER TABLE ONLY public.tax_type DROP CONSTRAINT tax_type_pkey;
       public            postgres    false    272            �           2606    33113    taxes taxes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (tax_id);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public            postgres    false    244            �           2606    32986    units units_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public            postgres    false    232            �           2606    32863    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224            �           2606    32865    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    224            �           2606    32859    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            �           2606    32861    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    224            �           2606    33228    waiting_list waiting_list_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);
 H   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_pkey;
       public            postgres    false    252            �           2606    32843    cities cities_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_state_id_fkey;
       public          postgres    false    222    220    4988            �           2606    33054 8   combine_modifier combine_modifier_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_group_id_fkey;
       public          postgres    false    228    5002    238            �           2606    33059 2   combine_modifier combine_modifier_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_id_fkey;
       public          postgres    false    5010    236    238            �           2606    33257 0   customer_tables customer_tables_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_customer_id_fkey;
       public          postgres    false    246    5022    254            �           2606    33262 -   customer_tables customer_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_table_id_fkey;
       public          postgres    false    254    5016    242            �           2606    106534 4   customer_waitings customer_waitings_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_customer_id_fkey;
       public          postgres    false    5022    246    284            �           2606    106539 8   customer_waitings customer_waitings_waiting_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_waiting_list_id_fkey FOREIGN KEY (waiting_list_id) REFERENCES public.waiting_list(waiting_list_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_waiting_list_id_fkey;
       public          postgres    false    284    252    5028            �           2606    33160 !   customers customers_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_table_id_fkey;
       public          postgres    false    242    246    5016            �           2606    155706    events events_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.events DROP CONSTRAINT events_customer_id_fkey;
       public          postgres    false    286    5022    246            �           2606    155711    events events_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_status_id_fkey FOREIGN KEY (status_id) REFERENCES public.order_status(order_status_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.events DROP CONSTRAINT events_status_id_fkey;
       public          postgres    false    286    5058    278            �           2606    33210 "   favourites favourites_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_item_id_fkey;
       public          postgres    false    250    234    5008            �           2606    33215 "   favourites favourites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_user_id_fkey;
       public          postgres    false    250    4996    224            �           2606    90165    taxes fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);
 ;   ALTER TABLE ONLY public.taxes DROP CONSTRAINT fk_customer;
       public          postgres    false    272    5052    244            �           2606    131111    reviews fk_customer_review    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_customer_review;
       public          postgres    false    248    5022    246            �           2606    114723 !   order_items fk_order_category_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_category_key FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id);
 K   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order_category_key;
       public          postgres    false    258    5000    226            �           2606    98348 *   order_modifiers fk_order_modifier_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT fk_order_modifier_order_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id);
 T   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT fk_order_modifier_order_id;
       public          postgres    false    258    260    5034            �           2606    131106    reviews fk_order_review    FK CONSTRAINT     ~   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_order_review;
       public          postgres    false    248    5032    256            �           2606    81954 4   item_modifier_group item_modifier_group_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_item_id_fkey;
       public          postgres    false    268    234    5008            �           2606    81959 >   item_modifier_group item_modifier_group_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_modifier_group_id_fkey;
       public          postgres    false    5002    268    228            �           2606    73739    menu_items itemtype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT itemtype_id;
       public          postgres    false    267    5046    234            �           2606    33001 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    234    226    5000            �           2606    33011 ,   menu_items menu_items_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_modifier_group_id_fkey;
       public          postgres    false    234    228    5002            �           2606    33006 "   menu_items menu_items_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_unit_id_fkey;
       public          postgres    false    5006    234    232            �           2606    32947 :   menu_modifier_groups menu_modifier_groups_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_category_id_fkey;
       public          postgres    false    228    5000    226            �           2606    33032 4   menu_modifiers menu_modifiers_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_modifier_group_id_fkey;
       public          postgres    false    5002    236    228            �           2606    33042 *   menu_modifiers menu_modifiers_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_unit_id_fkey;
       public          postgres    false    232    5006    236            �           2606    98338 "   order_items order_item_modifier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_modifier_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 L   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_modifier_id;
       public          postgres    false    5010    258    236            �           2606    98343 '   order_modifiers order_item_modifiers_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_item_modifiers_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 Q   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_item_modifiers_id;
       public          postgres    false    236    5010    260            �           2606    98333    order_items order_item_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_order_id;
       public          postgres    false    256    5032    258            �           2606    33315 $   order_items order_items_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_item_id_fkey;
       public          postgres    false    258    5008    234            �           2606    33330 0   order_modifiers order_modifiers_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_modifier_id_fkey;
       public          postgres    false    5010    236    260            �           2606    90207     orders order_order_status_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_order_status_id_key;
       public          postgres    false    5058    256    278            �           2606    90212    orders order_payment_mode_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_payment_mode_id;
       public          postgres    false    5056    256    276            �           2606    33342 '   order_tables order_tables_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_order_id_fkey;
       public          postgres    false    262    256    5032            �           2606    33347 '   order_tables order_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_table_id_fkey;
       public          postgres    false    5016    262    242            �           2606    90183 !   order_tax order_tax_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_order_id_fkey;
       public          postgres    false    274    256    5032            �           2606    90188    order_tax order_tax_tax_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_tax_id_fkey;
       public          postgres    false    244    5018    274            �           2606    33284    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    246    5022    256            �           2606    33299    orders orders_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_review_id_fkey;
       public          postgres    false    256    248    5024            �           2606    98426    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    282    256    5032            �           2606    98431 &   payment payment_payment_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_payment_status_id_fkey;
       public          postgres    false    282    280    5060            �           2606    65633 $   permissions permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_role_id_fkey;
       public          postgres    false    216    265    4984            �           2606    32829    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public          postgres    false    218    4986    220            �           2606    90150    tables status_id    FK CONSTRAINT        ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);
 :   ALTER TABLE ONLY public.tables DROP CONSTRAINT status_id;
       public          postgres    false    270    5050    242            �           2606    33092    tables tables_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_section_id_fkey;
       public          postgres    false    242    5014    240            �           2606    32881    users users_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_fkey;
       public          postgres    false    222    4990    224            �           2606    32871    users users_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_fkey;
       public          postgres    false    218    4986    224            �           2606    32866    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    216    4984    224            �           2606    32876    users users_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_fkey;
       public          postgres    false    220    224    4988            �           2606    33245 )   waiting_list waiting_list_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_section_id_fkey;
       public          postgres    false    5014    252    240            �      x������ � �      �   �  x����n�0�ϻO���]I��[��h��s�e�f���~����,P�6�D�[8�CRH�e��b_-�y(�A�(e��^�պ�*���S�O.z[��T)Jݗu���r�;���z���?�B������Ʌ�hK � 7�����1^��gj�7��n�Znʮm�!os�],>Of/�C�C� }I뼤x�J��ɍ���Vg�|MS�K�RA���s7�ɻ���z�;�x
ˍ:$� �����g���l�@	R��zxX}�A
��H�!�R[�)�m��PQ�����̒TPQ�mv߯1W�
!��f�/>�#�ސ�,�l����):�"-DY���5}�,�@�Zf���1�x&�	�������!^H`�!e��Ov��:$)k��KW��O�t!�����-xraJ�0���6�GwI3)L8��9"�=��Ha�!em�����WR�qH9?[vy�����|C��e�_��œ;����6��jͫ$      �   �   x�=�Q� D��0��{�~��G�yvk�0/
S+�D�kWt�K�4��wW�N�CzHO�,k�A����(��(�]_hl���M�K�m�M��\�=�rߎMSS=t(ϓ%�|n�s�s:;����ݜ��n��1*�-��L��O�z�͕,Z��2á�
A���w����\~e��,��OJ\Z���w��z�Kק���LM      �   �  x�}��n�@F��>/���s#�J�zQ7���[3!����Z��{I���o}�w K�B�ln˻��Y����hVEӔ�Bv��/S�AWZA���~��Q�6dCa��J��"c2kZ[�ƭ굫�
B.�)��w�a��_���+�kڢ^����B^ӽD�j4� W���
Ǒ4� ��!��0������&�>N!
we����.ľOd,\C���1I<z2� �����I�VS�DY%�q�^�ݘ���N!�*:�%D2k8�(��Q΢#�`HY{�3�����4�dHYE���-Cʪ�Y"�0fHY{��,,RVŗ�rY�MX0�����l�S8��RVӶ��'��bHY����<,RV��ǫ���!eUd�B�I�c�!2�������e�SHo���EC�j�:�W%��������`ؐ���O>F�d�`ܐ��3�����      �   �  x��VK��8[�NQ�A���Yz='��c�t�]/I/���%�����v���!$�E�%��m�&�A��P�=X�@e���D�5=����d܇g��P]� �ߐ�Q��{u[HyD�t�*����~ �&�yxox��HOT�KM�!�"K}�����6,�d�ES��Xr�.5�$�լ�r�>y��)�Zme���*��r~�A�,��F/P<����k�"_e�i�1�ܨglh���t�4�'�݀t@�-AM��^�I	������N-����Dխ��Pi"Z�V�t��>5s��ݧy]a�����B]d�[�|ND�f>�&Um�e};4��"4^��#���Q4�/B�.���t�.mda������P��b|�&d^ۣs��H/��G���>^�kK�õuꦻ�?���ъ�v��7?�g�I�����Cp4�F�z�xB�>D���XH���fB��RǑ8^����۴2W�o!���.Q�>�%1O�H�y��ӵ��L)�F,��r�e��5�Ǽo��J���>g<����f���)k��xG*<o�{��HN%��B6��s���4=�7��)'��;���^}�W��!�Թ�C��{��d-_`��R�k��d��T�(��%n(z�Q�C-��ޓ?e`�D����ύ�RzҦ�l�������r�8G��������M��V^� ������O��2A��jV\�k�>g@N�5�0[��j�Ǫ��      �      x������ � �      �   [  x���Mo�@���_�;��3��_\( !�T�ʱ�:MlWv��3����I�C�"�#�~�����u�[`�^w�w˪Xo�ySA�5�u
H_)}E8C���s$мQ��$G�,�Ew�@��,����m�.��'O��mT���0)a/H�n�d���}Qw����خ�BQ�������PUY�`8���j�1�4�%���d8�q�$GA�^�Z���J���ׯ�2���7r<�Ӳ������&c��bSt+���)a{�A��*�v�
.�>�����.��)�`�A��JZ��l�¹g�О�N%	�gH�P�7{Ù2�,�f��2WJ�#ad̵"���$����B�z���dd '6ZEV�P9>C:!H���(�[��'�>�}CI'V�g*�/���A�<���vz�T6����]�	��,>������P�~$U�	&Lq�Dp�a�y�g�u�K��C��ӫ*�-��7�4�������D��ID�7�~v�+ڍT��/���Ku��3�H6R�;R^O��$C[��-V��3MF`7#�"��Bs�rjNJS��K!�`� 7���e$�O�PE���҅-;�$Y��]�e���      �      x������ � �      �     x�}��m1�dn��"�Z��&H��-^5#�QlP i@ $�${�=����9J%�c(b�d.�1gě�?DQ���Fʌ�-�k�O���Ȣ�ώ_���蘣&�������&-D%�c�"�}��A���^1޵wU��1v��c����@s�Wi�5aG$n�/�1���ch{�����t�/��	%�chv_�|�ú(F��d��^�_�iߔ�B�ף��[�x�	�8��Ίj!^��#��too��ӎ�k ��%ί      �   O   x�-���0г=L~I�K���@"<,l��ބ$B�n(ց!f?����a2�S�Z�V��r���w��w��v�      �   $   x�3�KM���2����Ӆr�A��y f� �`	      �   '  x���Mo�0���_��]��o|L�J=�C�s!`K�V@�j~}M�J�J�dϼ3㙱Q���r��Sߺ~.��s=�ߗ�<B �qu`"��)�XI��L�wL9�ހT���p���D8a�T)��&����ʇ��� ��a�1'��F�TR7��jl~�uWd��g~�@��(K�A!����Ak��|��t�M(n5s�P-�N�;��������ps�����K(~�{Qz��melː�}F���a������]:��h"�T&6O2�B����Mt�Y�F�HKkt��agb��qj��ڣ��b��y�~��TEA�EaӗAH�B��P7�_�kdjǙ��*���N^!��Uþ���e�6�cQ�D�qx!������0ޟ�?c�!��!�Z(��<B����N���6��񅡊Us��UZ��m!��}�N���f�|K�į6>Rn�Y���m�s�C����l�;��|,בa�j��h��Bco�׹o���"褢��*s�������}z���q*8S2s��rK	!� �٩p      �   .   x�3�,H.�4�4202�50"#C+S3+S=C3c<R\1z\\\ ��      �   �  x��X�n�8=�_����!EQ�8A�����zQ%*V�؅�����R�cY��)dv���8�y3&5[�py�����a[3Ђ��IVҥ��Ō�E�T�����0�� }%�J�H�T�TFI��(����d�&�ٮ����&[�w�G�.	�|ξ,�:�׭��]�����V�9!S��m*,�5J+�A"�X&�1 ���j���+�R� �@��)�~��q�8&�J3��s��f�\����������Zt���r�R�x�Z ����&�:�r:,S�p�(���YB�|�6��qw�v��_��Ѫ��B-֤�p��50�W�Hv�~�n�Œr�T�1׋�J0a�6�C �_�@�FH5	�%4�zUޯ��˻���"�)X�D�g��+��l���ϾWї�Xeт|�g�/闁�2ڄ�y���ѧ�=�#�}�ȎHJB�v�6��,'��C�|ܹͪr�{KB�~|���>�L�����8�Iа/�;��UI�bRE����	�����Q�Z�x��ׯ5�@}b��xq��&)RD�ȖT��;`�RӺVk{�l;H'O��]eq9A�
��~��b�"�������ꠁ���N,4G��N���`�v�RPl����=3��L���&�������"��`��J}n5t󘲈'q"���o�l(?f|[f�:������P���.������.7O��";YG�11a���_S����?~s~� �U���0� �>6̈́��:#��4��az�\Y8W��N�eS*`�����@O��s[ۓ��~�:q�������t�Ƹs. }�W���=��4.�G`?�O��OY�[�1���lо���a���t�7���V1��@!�c������rW�&?�P��R�L���*=���[�ٱs�~��f�:��v��25��71�u8j|j�u�L��ԟf�̍����D�$�� h��^?6K�i��@l�#�5�:�����a���Kk��{�_=���aVj�K�6gd�Î��}��;Wp����9W,^),�-A]����%�<��?�J����X�ǂ���`>֛ϾZ��N�P���S��r��G:���O�Kl��, 4��U}���]üc�X�T�� �ʻ��L�}��C�V����r�oמu�DBRNIxn܇)����-~:��O;گPҠ
t��{�r�0΃W2w��9�����0$)���9+��_���'(�(���L&��C)      �   �   x���;n�0@g��@~DY���m�����jI��Yr��N�+��>�����5�k?��	v�)Wc>��xI��ؿ #�e��b��"z�����q�M�v͛��"���p����}�>�~�b�S�u��u"xo�.�����RKa^R�c��B�Y��Ƭ+�c$g��������������I\�`ى��?v_���~�e*W�(�v�MBxK����T�X�2U(Qt�V���1�1��`      �      x��V�r1=K_a> �^�s�\X�J�\�f!&c��8)>��Bf1���N~��V��n�z_���*�` T�P����[ɾ��r���_�o(rg�g�V �z�|���i׳m�W/H��a"�3�d�d�"�������B�]VUѕU7;j9S���,.�:�����}��~q�peWLs��_֡�jN��vݶ�z��-~ԝrj�|W�]5$�`v1['$|Z���@�S01`"Z5��,�w��a�J�ȓ�W��ψ�z�A�^�����'E������>��j�n�7ž������(��O�Κ�#-������%�瞺�ބ@��-^0��~$�=㱐�gS��Ԗ�:�'舅!c0`�:�j�c,ߩVb_���i=�Am�Ԋ��N��CZ94���ҩ���x��d|H�����(��9�O���y�{B$�D�]��3+cP��PW�M?^j��12:#q���� ��Ӷ� 冗��Ѿ�+6�i �L�I���Xo�Znx}ޯ>����Ga����:��ה?�QK��J�M%�3�o�ѡs�Am��z���S,�͜%�N���Z�Ld"8��j��>;L3�����x��]����\���j,�$�Cڦk$2͑�/�E�>�8�3P#�O��Q�K�W�Wu�ݵw߶���;'*�Уw��Fu�)�V�O,�"�������m-�چ程�O9��6��:H+�X"s�! �EP��}��۳���88eՉp��8K��{?��b���Z��X?�      �   �  x��ZM��6<w��w_�?E���\��s	��=M$��߇r{���q0�Aw�ʤ�dI~�,(?����@)K)���?���V�B
4�Y����� ���������/��֞��#=��0����mJ�d�O��+9bH.��,U� ��Cy?�9n�ܴ"/jʕ3��s㕛 � z
�^?<�}��L+�M`|�PWv��c!��� /r�!z`k$TY�&��/�B[W���A�g�׋ �=8�]]]�FHF�X/�y��+�B�N�GHF�K�=��'��eŬ�ȋ| �G�r[@m+�Zl��8.�A[��W��l�{�{]j�q�!;w�6�g:�[�(�b^RӢ;"��wv'�S���g��JmA�3����'`;��{�>���V��ļ�G�"u�������߿}����??઀zJB���}'�}�Rw �PM��l�nS}�Q�����,cR���Ɛ�}�O_~��_��4;�����5YW�E�QP�	�r�y��%�lʽ�Vi��A2�>�ʩ��Xt����d1�`Q�gjY��&|QZVn����9��sg���%�ً�����o)q�����Ŀ�x(w5w,f�@�D�I�T�t]�;�o�a���4e���3��5��D��xу\�ܽ+il�B㔟�:u4�X��wu�@
D�l�������=��D�ч5HC�xނ��b[�6����.׆��<�<��!�<�#d;�����s#d>ɵQ\�!�g�J(|M|��G\��0-��&�0� u�9Hj��*u�
�������׶���]�.�'�Z�w𜒺{��B�c��w���{��݈`��Z�m-_K����'�N�u8}uT���,�<@��NQ���WqY��e�uB4Uy�7��cLj��M����4��Dn~J��_6�� �����c�/�jZ�D4�&x��V�>��)!dZc�w5��?������"�h�.ս[Bb�ӥ,�Ek��3�X�M7�R�f�]<�&��� ���k[��7!��d��Wo���B��Y����9f�M���������4p"���s��Ktq켝�J�����Z�\���]�ndn�Y��~^�����Jz�i�a��/k?���T��B�N��^��D���;S��� J��3]"�03�B��sэ�['�w�Ne��]aE2+=�h����3c]ɍ4	ĖB�%��4VZh���ЛG�e�㨲�-+r�k��(���m��V�	�k�O 59
|:�Of̘�uz��c|��7��X��5����ڃ��i&�>q�k4��	�B�f���ײ(z�rL#�����'�R����?�촁���u���
-�����ޕ�kQ,�4+� R1��=�h��X�`1��'��>Y���s��Mơ�7#]Ț���H� T�	�u�Z����ks�@�0	��6���֏'��@^�zГ��]oF��kû�	�&�'n䖢ޫ���'B�h�'�8%�E��4�4��؜��c=��-�]�i�#�*!;�G����6A�Ғ0������/R�ZOr�DN���^ZTL$h��&m��E����t7���� ��>��]^�^�ڢE��$�@�?��co��d��[m%XDȆ�+H��N��)���|YY�8�A���nB=��ԛf����rd�����%�7��g��s���M/�5�Բ�=_Å�b������|�1ɒ#      �   5  x���kn�8F���C|I�1+��_�Pnj=�hX @�|�!K�%�����O�P_�E�H��7��t�|��"��b� |A◎|��<��R1�{����K���/;>g�o����e��?IN�����NShl�C#�����lB{���F�.�H'��C{Q����!od�7�$�'�[����<������а~y�b��5���D��VT�����G�bO� ]�LzJI��%��`d� ����!�P3��!^�^2s��DH��K����t/�|���ʪ����:��Htl5O�~Z�q�zY�~}�)���g'{�Z�!k�2� �LR�bOϱ��������A�'{7L�G���������P�=�Ӊv(�s�'|��ѱP�o���^����BI/'�)|��T��Ǥ�C�dE�����״<r�'������X�m��؂�f�gG
?��a'��H���,v��!���Ӥt�`�xOw�BJ{����%�>o���֞��O)X���2$܋uem|���T���'�g���X3��*�{�g�?ۋ�z���2X�o>���],�˼~O"����F����n�����%u��;�"��+�>�?X��x�(e͟���bW�������P�.v�������P~����ʐ?۹ĵ���?,/p�y�Mb�����Um�&^��ÿ��&JP�,>��[��7A-?Z�$�i�n-~�%4������*�s2�b���3��:�Ȣ:��I�輍P�vҕ��7 �o�X0ދ�� �x�#ͯ�t�%`ًu��6&�dN��Z�[q2*[gp9ŗ�%?�� �A��ۆ@��5vG����
M����b͙.>��m�ziz�gG���O��G�6ε;�5k� yAD�F�L���6ң�����/�dkM5~t�#@u_�8�C�E@�en>�XK��Cc�C�V���#?V^t��{PX�3���.~���ί��E��o|l�8��VM��_�k���X�t�H����8�%��Q|���ZQ����I�#�[���#�Z���r�vg�Vl�ǦoCXօ��8���P�@����7Ȑ����Kx���2�^���'��D���aD<�S���Eg��Ė������ȷ���t�#���Ob�7?���7�m��t��$�9��rc�<��.CѹN�ݟđ/�����ࠜ)�^����C��~�A܋#�􋛭7��ۻW҃�,�^����UY���V�[��R���S�P� (��Gˋ�:�[�8x aGB��<�A�m8����w�w<�W�~-���R���6����׽8�!俜��T��FF{���ǐ�7�Up�G~������`��g)���p+����"y/N$ �wsPc[��:r[�r�/&woq��8�K�/���a�׷�k�o|����Iz�gG��|\��@�(�_ �GbK�v囯��.��#�A��H���^zd_�h�~k��y���g�_?~J�.}��{�v��>��#�?'��O��瞿X����=	�/p/֎����g�:���(�Ş��������      �   T   x�3�tK��IM�2���S���I�2�tN�KN���p:��䤖 ٦���Ee@��g�B@Q~zQjq1�9g@j^Jf^:W� ���      �   �   x�-�� C��0=	�K������#�BlsG]�y=�\�AG�c ����ּ_�ұ���"��`���ܨ�4�>~5�jq�M�/z�B)Wi@j�U$z&�焬!-�t?���Iy�H�g�ߏ�� j$�      �     x�]Vٵ�0�Nz�/,vS��_�Hvb�{�ǋ.�9競K��ғҝs!�+���ݮ�����ğ�G�/�����s;��3�~h�'D'1n8��k�A���G�κ"X��g�#�#BY9��C9s(1�r�P4���y�3w<�����|ĩ%ĩ�<�oP%F�3��~D��BL�W��%W]����G�� {�U_�tqH{�"�2���D�>���a���،3������N�[�>�gF3�Yx%ae
�ەh���gt��lx7;
�;�>5%b}�9es*�!6�S�IfO>��h�M��7�~����-�`�Z�ԟ���OhV�.��R�S����a�ۭ��sKLb�?�(%�$-u������QfQ3��[�a���3��mr�P�F���	CnP %Q�Õ0�fĺ�N�����:�Vb�8 9jS��sF���|e�Xwh�(6�iٞQ���J��{���(E^el������'ય��턡1?:��#\9�{.������}�i�7�p�=�Z�5���g��bV��vpω�)�-`\���X #�ev� \�d�%6x��z�J����=ΘЮ��d�Ҽ�Zո7[��~�aa+�l�Zl����˸e�T�(�f��Y�(|Iѵ�����Չ������`qZ��*Co!�6E����g
.�Y��,����	C�F���	C��X���"���g����wf%d#�ev��F*�����fa�>if�D��Y���dU�%��1�d!�eV��Fb�;�NQ�S����a-�īdX��E�Z������[�֭�\�H�IV�1Y�j���ĺ��r�2�Or'ه�Σư�|\7_s�U,Z��Umz��X��!���Ff��qk(X�^�P�N��Xk^�Ҍ��㾌���k>>Fe�+a`�.3R�[f��P]��l��|���Ϛa��慆ޘ`������3���Qe��=��U�V#��	��2#���
]�!����QS�MMk�Z�L!ZL%
L#~��������      �     x��ZM��6=�~E{\�!R$%���\r��ǹ�3Y��ȿe[.E�{1AϡM�zO��i��i��C�T��D�'��d
'�;�Bya���x��=&+�߾��_�2�S��8��,�@��!Rl���������UM+�[T	�x����W	8A)4����BeQm1�F&FB��p@�\�D����/ h�(<�^ �e.��;�X���H�
d��	�� d����!��]˟/�7� �)������㩴���㜟��{(K�xF�L.=�������O�9�>6�٧�ܧ@4޳�,�z-R
�;&�~~���P��xOy��_x�;��w���,E���X���� ���7���IC�q�/�d�$h��-Xf���>#C_?��~����K?��L��`J+�8� �ِC��%�Dp�{Ѱ�K�!�'s���)�����>�^����%ʢ1M!#���X���"�}��xQ�w���jR���R�}�5��/J���!f�_�fQ�ϵ��]�օ��d�'��p�����ĺ�E�:A�����J�|��� 0E�@'z1����Vı�^C�@�����J�^A
~�#�������>�~�:qlQP�*=d��;�R��" ����Ä��!  �rP�`�0v	�>��z���ϯ_��y����O_�$��'EzMmE����|��(�ϊFy�BѿU�?��񏡦x�U���[�l5}�-᳦Q��}K갫z�\�OS -T�U �
F��~�	i{k�<�
b�v��uQ4��Z��W02��jԪ�_A��3P<� ���}چ��"#�I�D�f�=��$�)������/A��z�7�tn$�|	P3�>Dz/�����������笟8Ǒ�ޤs�Q��?�Y��}4�IR�8�E���@N%���kb��f�����8Q�t��G߱M����^;�!(4H��V����C�	"�Է�;�e�u�}jV���4�Y=�N�E'������;����)wc�J����@��6Hf�,kCNsBAoj������!
!�� um7�����`���,�6d��bdb�/����;u��O���렶���+n�����[����� 8۱�ǵ/��-�je��n�'g��{R13P��m]M�t�b��#�Hap��u��S��T�r`���3H�h�'�%�����^���⌐��,$�;|�q<����L9�:Uw�F�{C_.�g'��T��"�q�^j�<S�%��5A�"��tdb�_�/�! �����^��P��\o��.�(N�X���"�/b��/�s�cw���tC�^9�@�"������b}����"d�Og�m�G>���9��u�*���X�����8�����|��F�[	���9�(�R�&��un��c�'m��z}����}�9��FZVn�ɧ�X翮��29��ژ�M��=��Q�ۻ���<$�{��*����&��'����. ���Z������-q�04�4�]�8� 9����R8��ĭ��i�['��Ja}����u�01��Z����k��B�BR��i]�+�������������BsC}'ԅ����f�z��B�9;1P������|G�������ĺ0�%��+ ޸�"�y�o�Q�O�S#K��:^=�b��Kߢ�Aht�`\���(�'�";���yu݀�!F����;&�~�t�B�T���)���=ص?�駚�!��F�m��������F_2�p!X��;n�G����K����{ۀi�����1;�?2���v�����:�F�/))`��#��ɉaZU�	J/c��X��h�k}������	�"pa"F��±*ͅ����s?�|����<��l���z�y�0sH��~ab)�'ʧ�(ł�H}�=O�۾P����8�8�i>�F���.�p{Jg�Ǣ�񥈍p~���0�oP�0o3��Ne�Ɗ�3ޞ�
������|����!d      �   �   x���9n�0Ek���\�Mm��&]���,#�=(��G>�4p�f@ $����ډ�Pg�R���}|}n^Cō���"]�SC2M�5�� ��&�(W��N���F�V��%6j��k���> �k.�t.nq��?��b�����!CW���Gʆ�R�<�<m�ÖY��~���.���n�	D6!3�W��N��R"kx�b[��@Ɠ���;F�erO[��cU�[p�s��l��e�����۶}xp��      �   )   x�3�H�K��K�2���2�tN,J�2R�\1z\\\ ��k      �   @   x�3�t��-�I-IM�4�4202�50�52U00�21�22�3253�0�+�e�閘�C�1z\\\ m<�      �   (  x����n�0E��W�by��*RwU�>vݴ�#EJ@� ��;8�JI`��l�A��\���v[��5��������eJ�]���m�5��&��
����>/�|����4�P�P:�/��x[��gwhj��g��bd�|��k
��}���k+)��42t�Zyk\y%��H�d�"C���Q>��tHiH�\�z+a�~tO/�J����-B	H|�@�VS����+j;:�%�6��@K|:dl����)c�<��M�P�'7�6���歿>a��Gٮ?%�sy�cX_؛�R~�W      �   �  x����n�@Eף�}�$���.Y4H�4��&�<��@V�ߗcD�#�ƀ�.xtyI��_�4$+�+BTH��|��}}C�����F������E�G�(Y���Hr	0 .���������|�?_���o��3��"�eI�5��4�7�����
IX��ǎSH���(2x=���ʤ��P-��3.��7#����^���U�{��w������ ���� 'Zւj�p��6Ϗ�~on?W��7�N	�e1�j�������̲���
�J��iQICG?�s����	<껶���>X9�2DG^B�F�P��������yR/�"�c֗yY�X��Ƽ�v���Jt#<�,��j � ��~r�N�8����.2f�7�I�ޤ�R.�m���{�Z�s�^=	���})F���^���v��>m�]k�R�*�@v"/�Qj��(����m�n���`v� ���4��4�?��61      �   m   x�}�1�0��>E.@d�4 ��ΝX��
�B��+���))A�A�0�D,�V����5-��{A��}@o�Ъ��N3���Iّ�ܚ1%��k��'�~[f�9�,      �   �   x���1n�0Eg��,�-�܂�֥��.j �;��l]�,�=�����m���W�k]6��Lk�����|���@��}���!b�l�9�	*7a��c<Ի��ѻ��&5V�&�iY/OP`?�Ώ�fv�Κ���p�i#?*GKZAm�@ۗ;_�;�H���X*�Zbx�s��g
!�x
�g      �   �  x����n�@E��W�l����.v� E�W�솶��baУ���EV���D�b�$�t;>[g	i���Щ褐�꺚ϴ��. �J�>����ч��*�B�E��r�Xh9G�+��>�c���v`�~��=�}��3ގ�k�����W�bc�x]��j5_�:+�UQ, �=��ߑᐾ���&�� ���}8�#d��v�9�ɶ.�BI�����䛍m"A�,B5m�S?�i�ГLC�EiN���dQ�(K�Z��0=����!��0Q���l���H*�(K�fB[�O�(�<k��`m�o�g��(�U�c:_�	�@ʲ�Nn����=XtHYV��&4�M<���C�Zd!����CA��JVrk��H
;)�f![k�D
+)k����)���ې�V�Ɨ|�}C
�)k�m�h.v|"����5�>�{��jC�zuq�����R�eֱ{���ڐ�����v�n�_$�6��s���{��      �   y   x���=
�0@�zr
/`�c:/��6�	H��mmlR?�x�5�m�mYk��\�ⅼ��	U�=����s�a)s����
�3z�l�J�{����p��Z�(!��*��1���K"      �   �  x���=n�0�k�N�����$�VS��9�R�����=���{�jy��"�F�ʅbF�ֺ���v.jy]���L�ͻ)�{���'J%H
}�j3KWL���~� �Һ0[/ N�2�&U(~� �N��<�'�c�t��w��~.n��Қ� ����H��#�p�����<3�qڠ�����}M��?*x�@YX��ʁ)�̝88*���l� ����k.D�z�R6́��!�8�z�;E�>����q��ď�ѹ��y�s�[��Xe��e<c�;���j�����bl`*��e<<�9
@-�F?7$�qe�*�u�--��CZ��|\��z���b#nn��D�k�^WS\��n�/����qC��^F!�)A(Ŷ�{�ʿ�š�^����hZ��e�N�90��������¾��a����!�3      �   H   x�3�t�I,Qp��/�+�4�4202�50�5�T02�21�20�327146�+�e��Z���W���J�11z\\\ lI�      �     x����N�0E��Wd?`�y�1����-�(��E��7H�|f��׏ϯ�`���(g�	�%�`�$U�FDXB�´2��+�ZT(�!A�>�.,M����+EQ�u�6���r=��;Y�BI�{���������՟��^L���2��6����Z܄�5r&S�[�}�g���_�R��J�{���%��|\0{���,<�[#[!�I��sIൻ�6�	�U)&-�1$P��9��]OG]rK''�1\�}�!�o8���      �      x�3�,H.����� �3      �   �	  x��X�n��}�|���^(����xM&�bǲc'@h�M��D�$%Y��[ݔ�L�I�Q��uj;UM�4zo�):r��U�dBG5�Yٺ̚�"i��\6�����r����B�X7�"��f�Ώ���W��~�9�FG����=y����g~��tW�i����L
���u�^�Q�vQF���T$Ғdu�r<�\=%�sE=)������1��ҽ��e�D�@� .�,���ӈ�f���h�c��A�*�{�A��rnk��6��W�rv��������uY��CJ�CiX�A��I^�F�{�� �J�l��U��D�lU�5��r<iE�n�q΅�X�X�s;����0�˝`��_��Ǽ�����,PZpn�Hл1C�)���3#�w��f�:��T����F{�u��+�F�v9CC[5y���l<�i4�ݨ�d�İjAD�]�L�j`��52�@�Dݽ�j�>-�@e�޽�^W;����$�	8=<�H"{C{[�����d�s�'��Ӎ�{�5�P��l5E��$�4(��)���1�d���Qy�.�4 �P|z�`���~0C#;�J\C��v>��z�-�z�(�7�$v^V���@����^���[��8��uxmg�4�
׭̂֍�"C��X3����"_�@t�9��B���[����[��\BX��x$��n�̧&�:�?�{��t�~1d��r'�l��U��yҔ:��*��i�Z7䖘�#1S�p�\2	��N��.l������Y�8���v�^�m5�Ꝩ�~����k��Z��Q���8O���"��U��[���i*�S��ZD<�:�a�DV�Y&��d�^�����ޙ�� ��  8����_�a�hU�Չ��[[%�E�WƷ��Z��:�O)�;a�*�������| �_��J'kvo����A�+��)�����[�x�l���Xw���!B�,R4M"N���TĲDf�I11�ETX���A^��
��Υ<��mЯ�������9q�"JwPvIʟ�(1&��ő� G�q��D�	�Fٗc�i%����fQ��Q��v�D����"�ۉ��`��}|�UhP�M�>�vl�39�S��HI���-X�3i�n�]��:��d�[�6��>6S��]��N����vE�A��l���2i�n��m!�`���;ގ�<tT�o��ý��~�����b��h.>,��v���w)-��C�cR�BGm'#�!H66J�Xf<�r��� �-/b�-�e&㧇Г)5�C:C��O�G-a&.R�<}����n�6�=?8~<?���o'��J�D������׳��C��z���g�Y3�P���a�9|��MJ�"MbY�tM��"�"N�vX�w�E�.�!:u�ՁO���@��8�}<¬�ɀ��`}l&������ZTvj�	fy(G�v�'�����J�N�0-�pF�8^�(09`��$fT�r��_�Ֆ���72'G��.o*_�{|�}	�_$��]/ N2��v_����b=�O�d���:������������0>��_����������ki�On2���qD�8���id ���i��2�0�ۦb
�@��p
�����逛�P}�\����O��Ȼ
�շ�>4����^�����v�흗8�l9���-�P�]������V�K����y�q�*�U;A�'=ݞ�v�IS����zB�Lӈ��(Gp���H�@�����M�l��zK���ӌ_=#��XOlD���Yw�����V�\]����y���bG��r�����[>mNtz]��m\��c�u8B�l50���`T�f��H��B+Ś�(IƩ�,1z;[��!�e"�J��9*� �>�����Q^dy�7tr�r�����[�9������,�����f"�*�r���y3�����z�z^ì�0�b1`x��q��M�K�I��ZeE����M������YLs�N��pF�t�����,��ja���ݰ�YeǱ�|�,������H-�抁�?���g��0tB�$�F�(si�0��f<�ˢ��ݔ��@�����\}v��f�}��Q���p�e�$Ϫ�n!{[W�=��gw��������IuY\\���␟ܮ9�{J�N�����uu�{㳗��X�+�j�A�Z�Hf�G��YV����n2�WV�����ȁ}���앫OY��h��¡�<o&� 7��Ȃ�=�m{e{��Yhc�b�ddR�t�G1��H&Xi����ZHZ���`��X*�1�Ko�;��g�yQ�:��@Z�x����쓹�������ǫ�٨<(?��\,�W���鑨�oO�{Ow!��=� ��$�-�"�JYb���,��>��R�́���<���10t�ׯ>�����7o���6A      �   �  x���Mk�0����Dhf4�:�\hZH��,%�:���1�����&k��R(�$=�z43�B�|c��1�M�4�*R��â�o��u��1��~�1�_��<
&��1�H���`8��'f��TB�%���<*���g��d��y\��� �hіi2"����A#A�\�����0=�� ;�>DV�O�J�mo���
5��3%��;�G �X}���n���9���M���|�VR|9�5
���Z�
�t��tNs��D���yz�����Y+)��Zd���VX[�Ɉ](�rB��Lq���i�).�	��6�=汓�))�dX[�^����['u�k��Z��i5�2	C�(���!����sLՐS}`Ֆj2�8.(������*��RMF*�jJ���{u;<����^�c��$׺W&�:mq�[�f�qr����<��H��V���y��u�u�#`^     