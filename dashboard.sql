PGDMP  &    	                }         	   PizzaShop    16.3    16.3 0   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32786 	   PizzaShop    DATABASE     ~   CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "PizzaShop";
                postgres    false                       1259    49167    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
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
          public          postgres    false    245            �            1259    33202 
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    "is_Deleted" boolean
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
          public          postgres    false    251                       2604    32838    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    222    221    222            $           2604    33051 $   combine_modifier combine_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);
 S   ALTER TABLE public.combine_modifier ALTER COLUMN combine_modifier_id DROP DEFAULT;
       public          postgres    false    237    238    238                        2604    32815    countries country_id    DEFAULT     |   ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    217    218    218            B           2604    33254 !   customer_tables customer_table_id    DEFAULT     �   ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);
 P   ALTER TABLE public.customer_tables ALTER COLUMN customer_table_id DROP DEFAULT;
       public          postgres    false    254    253    254            i           2604    106531 &   customer_waitings customer_waitings_id    DEFAULT     �   ALTER TABLE ONLY public.customer_waitings ALTER COLUMN customer_waitings_id SET DEFAULT nextval('public.customer_waitings_customer_waitings_id_seq'::regclass);
 U   ALTER TABLE public.customer_waitings ALTER COLUMN customer_waitings_id DROP DEFAULT;
       public          postgres    false    284    283    284            4           2604    33153    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    245    246    246            :           2604    33205    favourites favourites_id    DEFAULT     �   ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);
 G   ALTER TABLE public.favourites ALTER COLUMN favourites_id DROP DEFAULT;
       public          postgres    false    249    250    250            Y           2604    73732    itemtype itemtype_id    DEFAULT     x   ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);
 C   ALTER TABLE public.itemtype ALTER COLUMN itemtype_id DROP DEFAULT;
       public          postgres    false    266    267    267                       2604    32919    menu_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);
 J   ALTER TABLE public.menu_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    226    225    226                       2604    32956    menu_item_units unit_id    DEFAULT     �   ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);
 F   ALTER TABLE public.menu_item_units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    229    230    230                       2604    32991    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    233    234    234                       2604    32939 &   menu_modifier_groups modifier_group_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);
 U   ALTER TABLE public.menu_modifier_groups ALTER COLUMN modifier_group_id DROP DEFAULT;
       public          postgres    false    227    228    228                        2604    33024    menu_modifiers modifier_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);
 I   ALTER TABLE public.menu_modifiers ALTER COLUMN modifier_id DROP DEFAULT;
       public          postgres    false    235    236    236            J           2604    33309    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    257    258    258            N           2604    33324 !   order_modifiers order_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);
 P   ALTER TABLE public.order_modifiers ALTER COLUMN order_modifier_id DROP DEFAULT;
       public          postgres    false    259    260    260            b           2604    90204    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public          postgres    false    278    277    278            R           2604    33339    order_tables order_table_id    DEFAULT     �   ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);
 J   ALTER TABLE public.order_tables ALTER COLUMN order_table_id DROP DEFAULT;
       public          postgres    false    262    261    262            `           2604    90180    order_tax order_tax_id    DEFAULT     �   ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);
 E   ALTER TABLE public.order_tax ALTER COLUMN order_tax_id DROP DEFAULT;
       public          postgres    false    274    273    274            E           2604    33278    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    256    255    256            f           2604    98421    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    281    282    282            a           2604    90197    payment_mode payment_mode_id    DEFAULT     �   ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);
 K   ALTER TABLE public.payment_mode ALTER COLUMN payment_mode_id DROP DEFAULT;
       public          postgres    false    275    276    276            c           2604    98398     payment_status payment_status_id    DEFAULT     �   ALTER TABLE ONLY public.payment_status ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_status_payment_status_id_seq'::regclass);
 O   ALTER TABLE public.payment_status ALTER COLUMN payment_status_id DROP DEFAULT;
       public          postgres    false    279    280    280            S           2604    65625    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public          postgres    false    265    264    265            7           2604    33194    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    247    248    248            �           2604    32806    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    215    216    216            &           2604    33069    sections section_id    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    239    240    240                       2604    32824    states state_id    DEFAULT     r   ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);
 >   ALTER TABLE public.states ALTER COLUMN state_id DROP DEFAULT;
       public          postgres    false    219    220    220            Z           2604    90145    table_status status_id    DEFAULT     �   ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);
 E   ALTER TABLE public.table_status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    269    270    270            *           2604    33087    tables table_id    DEFAULT     r   ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);
 >   ALTER TABLE public.tables ALTER COLUMN table_id DROP DEFAULT;
       public          postgres    false    242    241    242            ]           2604    90160    tax_type tax_type_id    DEFAULT     |   ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);
 C   ALTER TABLE public.tax_type ALTER COLUMN tax_type_id DROP DEFAULT;
       public          postgres    false    271    272    272            .           2604    33107    taxes tax_id    DEFAULT     l   ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);
 ;   ALTER TABLE public.taxes ALTER COLUMN tax_id DROP DEFAULT;
       public          postgres    false    244    243    244                       2604    32984    units unit_id    DEFAULT     n   ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);
 <   ALTER TABLE public.units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    232    231    232            	           2604    32852    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    223    224    224            =           2604    33224    waiting_list waiting_list_id    DEFAULT     �   ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);
 K   ALTER TABLE public.waiting_list ALTER COLUMN waiting_list_id DROP DEFAULT;
       public          postgres    false    252    251    252            �          0    49167    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    263   K�      �          0    32835    cities 
   TABLE DATA           p   COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    222   h�      �          0    33048    combine_modifier 
   TABLE DATA           k   COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
    public          postgres    false    238   W�      �          0    32812 	   countries 
   TABLE DATA           o   COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    218   #�      �          0    33251    customer_tables 
   TABLE DATA           k   COPY public.customer_tables (customer_table_id, customer_id, table_id, "IsActive", created_at) FROM stdin;
    public          postgres    false    254   �      �          0    106528    customer_waitings 
   TABLE DATA           _   COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM stdin;
    public          postgres    false    284   4�      �          0    33150 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM stdin;
    public          postgres    false    246   Q�      �          0    33202 
   favourites 
   TABLE DATA           w   COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    250   9�      �          0    81949    item_modifier_group 
   TABLE DATA           g   COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
    public          postgres    false    268   Q�      �          0    73729    itemtype 
   TABLE DATA           F   COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
    public          postgres    false    267   ��      �          0    32916    menu_categories 
   TABLE DATA           �   COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    226   ߪ      �          0    32953    menu_item_units 
   TABLE DATA           o   COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    230   x�      �          0    32988 
   menu_items 
   TABLE DATA              COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
    public          postgres    false    234   ��      �          0    32936    menu_modifier_groups 
   TABLE DATA           �   COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    228   f�      �          0    33021    menu_modifiers 
   TABLE DATA           �   COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    236   W�      �          0    33306    order_items 
   TABLE DATA           �   COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM stdin;
    public          postgres    false    258   _�      �          0    33321    order_modifiers 
   TABLE DATA           �   COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM stdin;
    public          postgres    false    260   ~�      �          0    90201    order_status 
   TABLE DATA           J   COPY public.order_status (order_status_id, order_status_name) FROM stdin;
    public          postgres    false    278   H�      �          0    33336    order_tables 
   TABLE DATA           J   COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
    public          postgres    false    262   ��      �          0    90177 	   order_tax 
   TABLE DATA           M   COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM stdin;
    public          postgres    false    274   $�      �          0    33275    orders 
   TABLE DATA           0  COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM stdin;
    public          postgres    false    256   ��      �          0    98418    payment 
   TABLE DATA           �   COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM stdin;
    public          postgres    false    282   ��      �          0    90194    payment_mode 
   TABLE DATA           J   COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
    public          postgres    false    276   ��      �          0    98395    payment_status 
   TABLE DATA           �   COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    280   ��      �          0    65622    permissions 
   TABLE DATA           �   COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    265   .�      �          0    33191    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM stdin;
    public          postgres    false    248   _�      �          0    32803    roles 
   TABLE DATA           o   COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM stdin;
    public          postgres    false    216   �      �          0    33066    sections 
   TABLE DATA           �   COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    240   ��      �          0    32821    states 
   TABLE DATA           t   COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    220   C�      �          0    90142    table_status 
   TABLE DATA              COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM stdin;
    public          postgres    false    270   3�      �          0    33084    tables 
   TABLE DATA           �   COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM stdin;
    public          postgres    false    242   ��      �          0    90157    tax_type 
   TABLE DATA           p   COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    272   o�      �          0    33104    taxes 
   TABLE DATA           �   COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
    public          postgres    false    244   ��      �          0    32981    units 
   TABLE DATA           3   COPY public.units (unit_id, unit_name) FROM stdin;
    public          postgres    false    232   ��      �          0    32849    users 
   TABLE DATA           $  COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
    public          postgres    false    224   ��      �          0    33221    waiting_list 
   TABLE DATA           �   COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM stdin;
    public          postgres    false    252   ��      �           0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);
          public          postgres    false    221            �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 56, true);
          public          postgres    false    237            �           0    0    countries_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);
          public          postgres    false    217            �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 67, true);
          public          postgres    false    253            �           0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.customer_waitings_customer_waitings_id_seq', 1, false);
          public          postgres    false    283            �           0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 18, true);
          public          postgres    false    245            �           0    0    favourites_favourites_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 52, true);
          public          postgres    false    249            �           0    0    itemtype_item_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);
          public          postgres    false    266            �           0    0    menu_categories_category_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 26, true);
          public          postgres    false    225            �           0    0    menu_item_units_unit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);
          public          postgres    false    229            �           0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 53, true);
          public          postgres    false    233            �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 11, true);
          public          postgres    false    227            �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);
          public          postgres    false    235            �           0    0    order_items_order_item_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 166, true);
          public          postgres    false    257            �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 178, true);
          public          postgres    false    259            �           0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);
          public          postgres    false    277            �           0    0    order_tables_order_table_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 30, true);
          public          postgres    false    261                        0    0    order_tax_order_tax_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 254, true);
          public          postgres    false    273                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 74, true);
          public          postgres    false    255                       0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 12, true);
          public          postgres    false    281                       0    0 $   payment_status_payment_status_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.payment_status_payment_status_id_seq', 2, true);
          public          postgres    false    279                       0    0     paymode_mode_payment_mode_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);
          public          postgres    false    275                       0    0    permissions_permission_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);
          public          postgres    false    264                       0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 17, true);
          public          postgres    false    247                       0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    215                       0    0    sections_section_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_section_id_seq', 7, true);
          public          postgres    false    239            	           0    0    states_state_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);
          public          postgres    false    219            
           0    0    table_status_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.table_status_status_id_seq', 5, true);
          public          postgres    false    269                       0    0    tables_table_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tables_table_id_seq', 13, true);
          public          postgres    false    241                       0    0    tax_type_tax_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);
          public          postgres    false    271                       0    0    taxes_tax_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.taxes_tax_id_seq', 13, true);
          public          postgres    false    243                       0    0    units_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);
          public          postgres    false    231                       0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 289, true);
          public          postgres    false    223                       0    0     waiting_list_waiting_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 24, true);
          public          postgres    false    251            �           2606    49171 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    263            q           2606    32842    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    222            �           2606    33053 &   combine_modifier combine_modifier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);
 P   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_pkey;
       public            postgres    false    238            m           2606    32819    countries countries_pkey 
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
       public            postgres    false    246            �           2606    33209    favourites favourites_pkey 
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
       public            postgres    false    267            {           2606    32926 $   menu_categories menu_categories_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    226                       2606    32960 $   menu_item_units menu_item_units_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);
 N   ALTER TABLE ONLY public.menu_item_units DROP CONSTRAINT menu_item_units_pkey;
       public            postgres    false    230            �           2606    33000    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    234            }           2606    32946 .   menu_modifier_groups menu_modifier_groups_pkey 
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
       public            postgres    false    248            k           2606    32810    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216            �           2606    33076    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    240            o           2606    32828    states states_pkey 
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
       public            postgres    false    232            s           2606    32863    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224            u           2606    32865    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    224            w           2606    32859    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224            y           2606    32861    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    224            �           2606    33234 #   waiting_list waiting_list_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_email_key UNIQUE (email);
 M   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_email_key;
       public            postgres    false    252            �           2606    33230 "   waiting_list waiting_list_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_name_key;
       public            postgres    false    252            �           2606    33232 #   waiting_list waiting_list_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_phone_key;
       public            postgres    false    252            �           2606    33228    waiting_list waiting_list_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);
 H   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_pkey;
       public            postgres    false    252            �           2606    32843    cities cities_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_state_id_fkey;
       public          postgres    false    220    222    4975            �           2606    33054 8   combine_modifier combine_modifier_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_group_id_fkey;
       public          postgres    false    238    4989    228            �           2606    33059 2   combine_modifier combine_modifier_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_id_fkey;
       public          postgres    false    236    238    4997            �           2606    33257 0   customer_tables customer_tables_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_customer_id_fkey;
       public          postgres    false    246    5009    254            �           2606    33262 -   customer_tables customer_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_table_id_fkey;
       public          postgres    false    254    242    5003            �           2606    106534 4   customer_waitings customer_waitings_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_customer_id_fkey;
       public          postgres    false    284    5009    246            �           2606    106539 8   customer_waitings customer_waitings_waiting_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_waiting_list_id_fkey FOREIGN KEY (waiting_list_id) REFERENCES public.waiting_list(waiting_list_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_waiting_list_id_fkey;
       public          postgres    false    252    5021    284            �           2606    33160 !   customers customers_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_table_id_fkey;
       public          postgres    false    246    242    5003            �           2606    33210 "   favourites favourites_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_item_id_fkey;
       public          postgres    false    4995    234    250            �           2606    33215 "   favourites favourites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_user_id_fkey;
       public          postgres    false    4983    250    224            �           2606    90165    taxes fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);
 ;   ALTER TABLE ONLY public.taxes DROP CONSTRAINT fk_customer;
       public          postgres    false    244    5045    272            �           2606    131111    reviews fk_customer_review    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_customer_review;
       public          postgres    false    248    246    5009            �           2606    114723 !   order_items fk_order_category_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_category_key FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id);
 K   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order_category_key;
       public          postgres    false    226    4987    258            �           2606    98348 *   order_modifiers fk_order_modifier_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT fk_order_modifier_order_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id);
 T   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT fk_order_modifier_order_id;
       public          postgres    false    5027    260    258            �           2606    131106    reviews fk_order_review    FK CONSTRAINT     ~   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_order_review;
       public          postgres    false    5025    256    248            �           2606    81954 4   item_modifier_group item_modifier_group_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_item_id_fkey;
       public          postgres    false    4995    268    234            �           2606    81959 >   item_modifier_group item_modifier_group_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_modifier_group_id_fkey;
       public          postgres    false    228    4989    268            �           2606    73739    menu_items itemtype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT itemtype_id;
       public          postgres    false    234    5039    267            �           2606    33001 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    226    4987    234            �           2606    33011 ,   menu_items menu_items_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_modifier_group_id_fkey;
       public          postgres    false    234    4989    228            �           2606    33006 "   menu_items menu_items_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_unit_id_fkey;
       public          postgres    false    4993    232    234            �           2606    32947 :   menu_modifier_groups menu_modifier_groups_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_category_id_fkey;
       public          postgres    false    4987    228    226            �           2606    33032 4   menu_modifiers menu_modifiers_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_modifier_group_id_fkey;
       public          postgres    false    4989    236    228            �           2606    33042 *   menu_modifiers menu_modifiers_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_unit_id_fkey;
       public          postgres    false    232    4993    236            �           2606    98338 "   order_items order_item_modifier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_modifier_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 L   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_modifier_id;
       public          postgres    false    258    236    4997            �           2606    98343 '   order_modifiers order_item_modifiers_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_item_modifiers_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 Q   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_item_modifiers_id;
       public          postgres    false    4997    260    236            �           2606    98333    order_items order_item_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_order_id;
       public          postgres    false    258    5025    256            �           2606    33315 $   order_items order_items_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_item_id_fkey;
       public          postgres    false    4995    234    258            �           2606    33330 0   order_modifiers order_modifiers_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_modifier_id_fkey;
       public          postgres    false    260    236    4997            �           2606    90207     orders order_order_status_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_order_status_id_key;
       public          postgres    false    256    278    5051            �           2606    90212    orders order_payment_mode_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_payment_mode_id;
       public          postgres    false    276    256    5049            �           2606    33342 '   order_tables order_tables_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_order_id_fkey;
       public          postgres    false    5025    262    256            �           2606    33347 '   order_tables order_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_table_id_fkey;
       public          postgres    false    242    262    5003            �           2606    90183 !   order_tax order_tax_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_order_id_fkey;
       public          postgres    false    256    5025    274            �           2606    90188    order_tax order_tax_tax_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_tax_id_fkey;
       public          postgres    false    5005    244    274            �           2606    33284    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    246    256    5009            �           2606    33299    orders orders_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_review_id_fkey;
       public          postgres    false    5011    248    256            �           2606    98426    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    282    256    5025            �           2606    98431 &   payment payment_payment_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_payment_status_id_fkey;
       public          postgres    false    5053    282    280            �           2606    65633 $   permissions permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_role_id_fkey;
       public          postgres    false    216    4971    265            �           2606    32829    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public          postgres    false    218    4973    220            �           2606    90150    tables status_id    FK CONSTRAINT        ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);
 :   ALTER TABLE ONLY public.tables DROP CONSTRAINT status_id;
       public          postgres    false    270    5043    242            �           2606    33092    tables tables_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_section_id_fkey;
       public          postgres    false    5001    240    242            �           2606    32881    users users_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_fkey;
       public          postgres    false    222    224    4977            �           2606    32871    users users_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_fkey;
       public          postgres    false    4973    224    218            �           2606    32866    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    4971    224    216            �           2606    32876    users users_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_fkey;
       public          postgres    false    4975    224    220            �           2606    33245 )   waiting_list waiting_list_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_section_id_fkey;
       public          postgres    false    5001    240    252            �      x������ � �      �   �  x����n�0�ϻO���]I��[��h��s�e�f���~����,P�6�D�[8�CRH�e��b_-�y(�A�(e��^�պ�*���S�O.z[��T)Jݗu���r�;���z���?�B������Ʌ�hK � 7�����1^��gj�7��n�Znʮm�!os�],>Of/�C�C� }I뼤x�J��ɍ���Vg�|MS�K�RA���s7�ɻ���z�;�x
ˍ:$� �����g���l�@	R��zxX}�A
��H�!�R[�)�m��PQ�����̒TPQ�mv߯1W�
!��f�/>�#�ސ�,�l����):�"-DY���5}�,�@�Zf���1�x&�	�������!^H`�!e��Ov��:$)k��KW��O�t!�����-xraJ�0���6�GwI3)L8��9"�=��Ha�!em�����WR�qH9?[vy�����|C��e�_��œ;����6��jͫ$      �   �   x�=���0�v1�` ���
�N�%܎s�"�#a6�Vz�rצ�R�6i�S�]�]�U�tH�t��A��p1�, -E�:7�Mc�|��lS+�'�fŦ��sS�V����b?7�s�s����E�m�sp��G���%2�)��7����/2ИhE+��vhe$�%��KI.�\���2�4�O���F�      �   �  x�}��n�@F��>/���s#�J�zQ7���[3!����Z��{I���o}�w K�B�ln˻��Y����hVEӔ�Bv��/S�AWZA���~��Q�6dCa��J��"c2kZ[�ƭ굫�
B.�)��w�a��_���+�kڢ^����B^ӽD�j4� W���
Ǒ4� ��!��0������&�>N!
we����.ľOd,\C���1I<z2� �����I�VS�DY%�q�^�ݘ���N!�*:�%D2k8�(��Q΢#�`HY{�3�����4�dHYE���-Cʪ�Y"�0fHY{��,,RVŗ�rY�MX0�����l�S8��RVӶ��'��bHY����<,RV��ǫ���!eUd�B�I�c�!2�������e�SHo���EC�j�:�W%��������`ؐ���O>F�d�`ܐ��3�����      �   ;  x��Tɍ1|�D�	,��"c����`J�]�c��נP$��AG�F�O�O�Y��,i���rm������Q6 e�B��P��ʢL`�P�Ef�dY���ʂ�1��K{5����j܄�ZԻ�R�-:<����Qd}����	��"����{;��a��R�:;�3j��&T��aK���&�a��9Қ�����Ǳb�Z)0����ˆ�Y�Y��-1���.�,�Ip)�֗^`��y��nb�vc���,��C�F'R�@�����\~Q��$�.�y���p>7�K�t���9�r���~N��	�Syۥ�g�j��]��"��%ܙ�[ԟ鲛s�0s�� p�uW���+�R�@K_)l�^�`N��#���lW���R��-Xzek�6L@%u,����[8+�B���������xGS��%]oDD�l[�*�n��p�����p�A�r,y�`4�����NWys�M��me]C-�� ��Y��'�UZz��aE)�����f���_u���Zߺi?ꐊ��+��{-�z�[����	�ek���ȹm����P�:h      �      x������ � �      �   �  x���Mn�0�ףS�������@�H{�lXC��v`eQ߾#�@(�E6���G>>�<�����ŧ�>w/����1%����t��Bw�ڨ�Q33�0|��=U�/� �6��2�� ���|���(׎$9|>��UCV
�Ny��-(�^V6MLNԗ�r��ai8ԘBR�a�������؞�óM%��`�tKC�QGt�*p�O�~�m>@�ݸ��+��Q䅩Z~T���u	��S���=�6�p���@:�ֈ�E/�ߑkĂ�:�$I��_���Ub�؝��v���SW��,Q	1�-�Õ����(A��Mjc�����11���/_�#���8nhqq�`_�hT��yU7o�"���.Ӽ)d�Ⲟ���O��5e�M��9��)o��(��a�:�=!�h=�H��'f��O�x��1���$����o�Z	1���G��=0��|�A�n�
�몪�-7F      �     x�}��m1�dn��"�Z��&H��-^5#�QlP i@ $�${�=����9J%�c(b�d.�1gě�?DQ���Fʌ�-�k�O���Ȣ�ώ_���蘣&�������&-D%�c�"�}��A���^1޵wU��1v��c����@s�Wi�5aG$n�/�1���ch{�����t�/��	%�chv_�|�ú(F��d��^�_�iߔ�B�ף��[�x�	�8��Ίj!^��#��too��ӎ�k ��%ί      �   J   x�-���0г�
�v��?G�T\�����wB��7g@�`aw٭;Z��B^�f!<��$f�^"���      �   $   x�3�KM���2����Ӆr�A��y f� �`	      �   �  x����n�0D�˯���]rI��$(�C��1U�l5�Pn���K-��*c�����hv�>t���~���i��\s���ô���,�Y3%��ĸ��r*bXMOO_�|��pB6�Q\�)r���b�}�Β�Ē�5QO\���n���ma��d�a�
!��0�ݼ��'��.�hʷQ�
��U�[�����O�u����K41�uT��,\�Cs���aQ��� &�ۢ���P1�j{Vٜ�2�X�i�y�B�(�C>��<���~�t��Q?�W�˸�$W:�0T�j�]v��i&'�mI�'�t�
l>m���&ȴ1��W��p�5o�wx�o��x>�o��-��F�!V�bc�\���_̇Z}ܥ�C��U��R�'$�1�      �   .   x�3�,H.�4�4202�50"#C+S3+S=C3c<R\1z\\\ ��      �   �  x��X]o�J}^~��^��;���[HT)��B"�}q�:D�I���;���ظ�Jd��93�930�+2}q�"]E���$B1���/��L�$ϲ�,O��������PCCf"&�%(3��{A ��.���m8����ā��Tx�w�	y�e��;Wζ�KUlֵ�qB%#��@*.%�~�x*E&�ڹmt;w�t�,�ZK���R&��whQ���R\*�z-Bx-�~�T��TS& �� 1J(fK��F��'���C� �ൊ�;T`�&��*e����*$�ܬ�7�l:O��T�!7�k%��MP#�0��D�O���ǲ���y��������+�ȮX", �n�7@ߡ@4����c=��2���:�U�����;uAL���2���s;3�Y�	�E�cGn#���|��ݷ���[/�N2S�8���wh�#���� ��$hص	W	�}]R��D��0��C�)�%`28�V��t����o�F�|��B�p�.
6a�j��~�+��Ļ�ڧcZ����|�:��������k� P�)�*`�S�gm^;��otLFfe�W�]n4%F��m�X0��ئQݧ�E]}�4_�~&0EA*��~0l?���DH*l,��� =3�3���gy�䗓�wW	0*$0m��@����������� t����,>��`}���̂*�Yw�{�; y-o������|Y��7��";�XL!6D?�V������V���_8?�2Nv�j��0� �Vn�w�2E�m���ftG\�9���& ����sC;=�d��#����R�0u�_g�ͅJY�rK�q.� ��!�v��s?.��H<�v2"�[d����t��=囉+\������T[�X7���8����?����ۼ�5��;�
ι�q?X�g���,=LN֮��G'�.�^����P�Ѱe?�á�JWőZ���ǘ���Dl�z�U�%�Z�7��ܭ�b�'6��s=+��1�e #����{��{�i����T��ڕW�k4s|���|+��'W~s����,%dvhs!��]3K��婣1��ǩfho��c���Z�6ht�
]pG09Y�#'��׀Jx8������?������i�v�+qH�߲��D����f�s�9�������Ɖ      �   �   x����n1E��W��</��mR'�@�hr6n`��ٯA��`1��h��{V�q,����T{��\��2�~�~�I�^,abI	�Mh<N�h_���_L>8�A���{���}> �\�|��<�N��64�2����N,��w*>25��`�9m�-���P-q�����vMh��[��ͷ�.���:��)qMhoa_�e�h�$NB�ST�Mh���}�X      �   �  x��V�R�0=K_1� Tݭ]9��\�P)8rqy�@���=�P^&΄�:�Yݭ�OO"�-k�JaP ����}ݭx\�]��O��q#@�=}v����y��0i���:�>
/�{
�{
҉�5*8�@���}��p"R����DX&m���q�����'�4 '/��ˋn6�pQ��z2��(N��-����5���.�L�	\⿌E�h�ڊ/��6[����һ"�a\	��&�q�3Pj����&����&u��u�����^�NXA���X� ����4���y<F�EP"��쩫���'��(����\BTơ�z�ڍȷG�	���y��(M�qG��Y	���u��d�g���%�;(h�a��1(��f1��F�lE�"k��[aJ6�}�#W�!iR�G����è�f��훱uE�R��1	ěY���gYƠ��{Y������{�#��'��y0�� Jq��C���E�^h>?d�As3c���.��!(y�ק��w7�����/ί/N��rw;�-y��I��?��b�!�^,?����Ш㇋?&����>�� ���CK��T ��`Y%��9?l�U^Ts��!�؟)�G���Wc���#�V]��T�a��w���O�@�$�����K���e�i��_��j�űJ�t��"(Q\���a���jeVD�)#������J�����W8+��Ҋ�oL,s��G�����k�-7'�mٟ�8eѱp�W+C�cJ;7?�䭒R�cH>W      �     x���ώ9���O�/@)���{�Z��J;� �~����)
��� ?�؟���F��	�C�(7��J�R���~�H2C�]���Cʿԉn�����_?~y�����޾w����q&?�������/}F�� �X��0�LY#l������7>D��i!�f�IM9sHm���-� � z؞ܡ�t�A'(� :�ن�-�O��H�ؗ��"t[!���z7�^�Xkh*��<ԉ�*[��3�?8{	ŗ��#p-��4�j=��Y��>�ֆ*7��i����q�?��E#�K���j!ThN6Q*6q#�#p�,��N�J5t�V_�q=��k�d�w���{e�J�<j`�:V��bό�R.m�C}冞u,����n�8�2Su��츁.y�ݏ?�>?�����ۗho:ϱY���R�~�H��w�S~/G��?�_�o<�]F�*���+w������gu�b��ʃ�Z�'�Bm�F2����[�8cܝ�RJi/8�G�:���2r\V˩�*�����7ԩ�L����������e�'�M_�����I3�Ҍ3�,˄���o���0͔�[��D����.�e|�_<���y9|��T�%���2��%���m�ٝ��f%�^g<%��sBG��;�xrC6�-;�5���$�,{����qț�Fvu��{��M3�)kA��9�v���ex4��H�!�I������dW�X��̇�
�q���3�iN�)A��3�`��=:��Ш]'A�����'ˠAw�ȫ���[�/��$Y�+L2���I$��$�י��z�23�� ;��t�ċ.�~.!��j�}�+x�R�o�Q���-1R�t�8��Oh���.M�}W*��uX����{{C��~�����}�˫��@�~
ʟ!ގ�g�7���m�k���X��D-��F�uѡ��UK܎�>��Y��r�9�W�gγ�\��O�@�/5ݺ<B�[lJ�q�ܿ ],��e��W�u��I�0��i�Pk<�X�uʩ6dm��`q]�������oJ����:�N�vi��\ਔ;��c�˳��xK]W`Y�͟��zE��Ȋ����K�p�$
��%��7"{80s�/�XRn��g�^%�Lef��[�������X�%���C��}��J�35���g�x��䕈��jt����+�NR��YF2n;7�u`�lי��3�-���Z�r%^�K�>w�dӒ���]�`�Λ���W^�^���"�;���%�ڜ^L1��Q�����Y7'�m�ـv�3P�ަ�<~�j�t5�2/�	�9�R`�g$��&��L�1�]�yKBw�hg0�r������FVK]�}�A����Y��
��DL�����3F�c�.BHg<�ߏoԑ������+�����Տ�u"+R����LAx>�/���@N�a���s7�j�*,�tS�g@�pӟ@�U���z�J��d*�Jy��2����5��-l�F~ˋ'�c�ւ9���然�k|��E����4���
m����s�ްkx�!�\�w������;�8,�O��~�qS{�      �   �  x�����8FWG1	�!^� 6��?���n밭e�>�#��%} >�P�I��'}(m)����?)�)�D�d ���|� _���#�� �	v���I?T���|��ė�3�+�[����xy�˟$;��huh�)4���������lBk���F�>v�-��֢r;WMC��S�t��<�o�S����<������а~y�b��5���D��RT���� �O�bO� ]hO�	JI��%��`dN �g�Z��r����G/���L"$��%�.�b�{�Q_R婤���8��Htl5w�~Z�q�zyt��=�]����N֢�6fC֔��w��2IY�==��"��iF�{\����<H0�o��Cr[�#_C���N;ڦ�
̡�D�zE�B����k��{w%��̻���RYj�����!A^�#?��q˝�@����X�m��؂�f�gG
?��a;��H���,v��!���Ӥt�`�xOw�BJk����%�>'Bejkwq��]�A�ź�6>��D�%յ8�	��CyC��e-֌l������������c��<�o����],�˼~O"����F����n�����%u�ڋ���Ǝ�d����K�������)��]�.p�sL⋡�]�b���k��P�����ʐ������?,/p�y�Mb�����Um�&^��ÿ��&JP�,������EP˷�2�uZ���ϸ��_ܽ��M�uN�Y��puF�P�YT�=�#���
�J:R��� D��&�kq���}���6�,k�.1��$���Zq)NBe�.��R����P�:�[�Bu�y��������Z�I���p �Xs��O�t�^����� c� �ӟ=����s�Nb͚+@^��%�������F/�s�|��|'��ZS���O���kG~h޷(���gkI5~h�w�����8�c�E;a}���!{�������;��vҵ�����nՔ���k�l��O�D@��\�ā/��o��d-֊j�X�_LJ��oq��nT��k�n�w�y۝�Z����aY��ő�^�����A�}��o��z�o1��Qf\���d��(�X?���⺋�����L�1:=�3Ã��8�-�G7��D-���X����)��� D[j#Bt��<C6�ܘ;w�����Pt.��f�'q�K���0�x�(gʲk?n�P�7��y���/��fO������+��b�m-�v������fO�[��R���]�P� (��[�0�u�� q� *¶�*�~ �8��p������w<ǫA�v��Q���6����׵8�!���k�z{#��XV�c���*8�?�#��!;���,]�<�>���,�
�4@KV$��ɀDd�njlz����=����{8�^�%ȗ�Tz3��[Y���7��s"�~���Ğ�w����U�      �   T   x�3�tK��IM�2���S���I�2�tN�KN���p:��䤖 ٦���Ee@��g�B@Q~zQjq1�9g@j^Jf^:W� ���      �   h   x�-��AB�X�ψ���l�u|M����"���͹�0��#!����ry���i4ԣ��E�q��ؘ��e-G���X��㬉��A�zf��b�      �   �  x�]V˵� ['�L�@S��_�H����-^t���B�s�J���)=)�9�]Y���v	����;�e~�*��^�9=�H��3�]�m�!'�ᇆ��BƱ���6!�����V�ꙡ��� ��5�Y���A,��Wc\;k��pI!O�G�"!O)����Aј��3�#COrb����.�ʘj�o�4�<��؅V{C�ӈE�������%Z�����No{�͘!`0��i�Ji�{Ę#�}fp��-);#�n7��'��X�vd�޸�h\�D{Ք����	w�I�@pd��TNZ&�3�����6�u���\�+��L6��5��R�?�yy��~R�N����s�n;�[bk���J�(�e�������f����[�b���[e�I�T	Cw�-s'���Dy7�P��2W�}PJ��0��Q���M%��-R_�+C?`ݩ٢8X���\��}�,��e�1���}��=�����E�'�ԗWs;a��k�!��=�(�G�Z��}���7�ľ:�Z�u����8�Ǫ���vĞ'&WPa��S"r�,c�ؖ��'��}0�����ӻZw2��xƔv[ѕ��l4�� �u�5�۷ۨ�2��:�!Z/�ʾ�Q(͉��V�p�bj�O;���NՉ�������瘪0U�V�O)J�Ag	�Y��*�ԅ�\	C�Fl��	C��\������s��(�枇�C��2W��R�k��J�p�W��jn4�^�@NR�l	4�kVb[f#�(sG�I*�;��nno1Y'^-��〬`Ⱥ�U��_��{�z��`��F8Nְ:a�Ķ���|ez����uX!t5r2W�s�5�^=��V�]ͧ���z@#�|x�hTV=^��ej!�;�V�<�4C��x/��h�Z��Ls!�Jl���s��F7�i      �   �  x���=��6�g�_q���)����ҡ��1K�� A������ud��	�"�P~D�⇌q�4`@~�4�}]��0�0���F�!4?z
8A�FdF����z����0!L �2���F�Hq����˯������ݢ��݉7�gr��[2~
<A�tK1r�n����cAi�u���|n��Qx=7֥��Fܵ[nz����(���.��`H�M=6�)�Qe!y��n���� 8���J�4�w��R�*���8�uzB�L�#��j�n��9u��S0�^��O�i�@4�W��%H)�Q[�����ȅBr%Rٰ�W��Id^��-�(E�öv�]`/�=lZ��f��e�L����.LXF����n���Wԛ?eL�D�J�`p�)��q�A�4��q
jH��6�h����T����c�7¡H^�I�j#d���A&=�2�=���R�9u��OtMZk��^��Br�azȣ�����]�ž�4�s���	6����R�a�ʭ�<�[��&M�
�z�z��n�}QjU�Q	�L.�w����LQkFV�I�R�L���n��"��I7^2�t��$>C��/�>�|�6p�^�np�]|F��2��������N���ϲɲ@�����J��ݟ/O_�����鯗�^�������� hķ��R��@�V��g�c�Ǎ�e�����;���w��n%�g�
�[AZ�	g��|'x����}�NT�38�����a;������~'�hjY����x nũצ_�O��#j�d��;�5��	���*�=�i����/�1E\nc�r�.>�F^���\�]䰵���\v)&b���iE�[ȡ�� �3`�2s^��-�whZHD8G��;��e��=��׽�M��fFLU�SINW��mWpp�Ϭ��X��w��Ljk����]�e���Pǥ�]$��ѵۦ�b$:���L����({�#��*S��>��[E���Sw�6�]A�3�d�G�	��L[+ �Y.ϭ�6�iL(�M��݄�/���_�_�1�*[7/�{�=qcm��Kd��6`�݄�/Ž��ۏr5��c.y�j_܅z^4�E4�'����Tv���0��{�_�t�E&�s�<8���U.�5��&�a3��M��ݪ�R�?���I*<��,i�MܦQ m�����j�&%�ܟ��l1���I L�>�	^�!�y��
��3,-ZY�!��3j��[w�,u,U!���I�?,T�	kz�E���k�������h�k�� o�����eQ�s�֥�9��B_��?�"�Ԝe����z�c� ��pYV�p�����v;�^��?'S�e��{����;��zz`굢`�ǵ[ꋩ���iC��q�V�5oGЧ��k*Q���GvK}Q'Ϳ1��G��Id��a5_��L&V*=mɡ��V�u���L����Hx��I��a	�N���c-����n�/je�98�4�i/� ��B��q�jZ׊�uݮ������q,Ar0�^n�R��]�˭ĭ5�.��+4��7e�G=3p��gv���ZS?6�k����BR�b��Vl�A`�<Xo�-����Y��7����n��\R#�r��*�l�]�p(��*���ޏh�l�ɶ�|99J��q[���xo���}��{�l��6���S���G���-5>�^��^ّ���e��Y�s.�e��j���1�q���-u|���_�D[o�dq{;�n�%)�6      �   �   x���1n!���s���Z�3�6�H�.}�/E�ݍ�D��O`��Ta\�� �;�&�!]�i�O{���<*��y�t�.��-j�ǥ5�154c\5���^Zw!,c��djR��WG�kA�Zl۲��NKK���?��͸���>.M�����c��Hy~�S<5�fC����~�c@����xj�V�q���y钬��qq�|�7�tl      �   )   x�3�H�K��K�2���2�tN,J�2R�\1z\\\ ��k      �   @   x�3�t��-�I-IM�4�4202�50�52U00�21�22�3253�0�+�e�閘�C�1z\\\ m<�      �   !  x����j�0E��W�"4��e�J����Ǯ��Q ��`ِ��Xm��/<E�s4�
/)����67�o*4��A��X���]�'U�N�6��A�һ`�D�b�w�)��m3T�c�o��ClOǔ�M�n���u�9��oﹾ����Gq>;�d���m��`��@xۧ��rm%�=G�JBt�Zyk\y!!#(!36�y��T��/�"����ack55pM;k��W�:�%z6��]�%>M1[��7�l�'>^PUA|���!ȗ����:�v}JP����a}a�JJ�EW       �   �  x����N�0���S�0����w�h��H{�KŎ�Pi���㌨�mQ�2RU?��ϟ4d��4$�BTH��|��⡾#����c#G���z�i��_�Y�J��/�\�m�� uQg��hL����j�ｲyŖ"\$�,	rS�h�K3x;����k�8��MMD�����azu�,
���r
>c[�d�C���/����`o�����P�ϙ��gP��r���P����q�}y�����\jߌ:%H��b��~} ��Jw+��p*�+E :�����~N�Dә��	<鿾_���M�#/!�G�P�����O�n8�yQ/�"�c֟�-F�U��s�K;RPG%�I�b�H}���x��C����f3��G�ޤ�R.�ݸ�x�Z�k��2
�$X���[1��z纮� Z�8      �   m   x�}�1�0��>E.@d�4 ��ΝX��
�B��+���))A�A�0�D,�V����5-��{A��}@o�Ъ��N3���Iّ�ܚ1%��k��'�~[f�9�,      �   �   x���1�0��+�ĺ�/��5
 %]�đ���1i��iv��1��|��=�\U0���9L���4� ��F[7�F�����BE�Z8Mc�Y�_�6pX�x�"T}�������M��9���P�G�i��zӡw(E��F)�tNp      �   �  x����n�@E��W�l����.v� E�W�솶��baУ���EV���D�b�$�t;>[g	i���Щ褐�꺚ϴ��. �J�>����ч��*�B�E��r�Xh9G�+��>�c���v`�~��=�}��3ގ�k�����W�bc�x]��j5_�:+�UQ, �=��ߑᐾ���&�� ���}8�#d��v�9�ɶ.�BI�����䛍m"A�,B5m�S?�i�ГLC�EiN���dQ�(K�Z��0=����!��0Q���l���H*�(K�fB[�O�(�<k��`m�o�g��(�U�c:_�	�@ʲ�Nn����=XtHYV��&4�M<���C�Zd!����CA��JVrk��H
;)�f![k�D
+)k����)���ې�V�Ɨ|�}C
�)k�m�h.v|"����5�>�{��jC�zuq�����R�eֱ{���ڐ�����v�n�_$�6��s���{��      �   y   x���=
�0@�zr
/`�c:/��6�	H��mmlR?�x�5�m�mYk��\�ⅼ��	U�=����s�a)s����
�3z�l�J�{����p��Z�(!��*��1���K"      �   �  x���Mn�0���)��_���]W��j�(r�RJ�f�{1����==�oW.�F�ʅ|g��\�P|%����±#u�'��[\�m������u��^'����3��� ���Z��|���J�����y�Ѻa����?v���1���X^��iZ��T�X"x-�Ő)QW�1Hm�#�(�g*�S���Ej�*):��3Ť��0V�A�t����[��0�k�p��� jk��I��r���$�G�A<z᎞7��;��$��WOAP66�J�C�(�� ��!JKJ{��,�Z<R�g�`R�RRrn�y� l����Ht���Zgňr/x�ţ�e�h���ݹ�l��@�r��BK���˾2ppTZ�g3�C0d���c���\p��r�1R��s+�_h-�A�2i����l^`۶�Z5�      �   H   x�3�t�I,Qp��/�+�4�4202�50�5�T02�21�20�327146�+�e��Z���W���J�11z\\\ lI�      �     x����n�0Eg�+����܊ݺ$�Ե�
t���J��h�j)��G$/3\?>�&�f@`d;��'4�䂑�T)cH@a	��^�䆮kQ�<������4ᲯW����m:����z c7v����>v� y���GGk����^L���2��6����ں	�k�L�<��,��޺� [u��RN,c�v�zz:�u-�ZQ�y��/�]aw��sao�� �����(m\x=؞MH��H1ii�!�Jl�9���7	��      �      x�3�,H.����� �3      �   �  x��X[s��~~���)s���$XX�'��r����ؖ�$�����3�CrV��)p�G�����Q��;�-�+�-\�nA&�qDQg��m�K�Y���z�-�z�d�
�A�����֯�X����xu��hq�>O��b<���x�ɓt{�\�������ۦΓo��eR(tT��̵G��F��1.�R�XKR�ԥ���rM�t�5�U������&�j��\�hr|ո$!�&�(�"�4�$�l����������P�J���ޣ�y��-*��Ӯ�W^�;�Z/]��ڶ��nr�!%ء4,� �u��l�	��&%����2 ���a��/W���i�-]=��"��0V�8��@,�����.W-CpC0�� �����j���l�캭+T��4�a�`J�� z���n���Ԑ
����h/��~����n�hl����? j����0j�#1��Z�-�E����`���Qo?��������e���w�7�N��J��a����J$���ΪzYڀ�l|����9c��o?���֡ӥm�q��e2ž�8�V����g���bŧ7F�<�� 34�+��T^kW�e�����B���|A���}fWu�<\������A\�E��+_�7v�@�p��,hØ)2����0���T����`��i��? ���d%��ʢ/���fe��A�^F�|jR����1�8:^�{���!kE��A�`��}*��n��0n�<]�o�C�Y?3%�'�e� �p��@�A��[�.8^��C��y`���^c�>�z�g��чO��Z8�Z٘�,�m*�Z5�1K�%nj���;k�E��cLle^�Bf�� �9 ���"8x��o��f�j�A�2��l���&+-��2��
��a�T>�|����!����@����A���dC�ζAS�!s[7��"�� �+��B'C��E�h�ŜW���,
�cbē��>*���I���
��Υ<�4lЯ�����9/�s�tD����?�QbL*Kc7@�,�8Ù�3���O�P�J0�����qm�J��0p�=f(��E&�������#��v�Р�L}���`rf��屒���[�XҀݚ�<��u���6l�K�?4S��]��A����qU~�&Y�uh��id�k��) �B��
�	+:ۏ�<tT�o��ý��~�����j��+h.>,sЦ����)-��C�CR�BGm'c�!H66΋T<�r-�� �=/bM��&���C�ɔ�!�!�Ձ'У�0W�K������ʖ����㳻��6y3o�u��RU]Җ���9ӻd����Ù�w��n|����	s&(��;7)��<Kql�g�14�S��؊4w�aߙ�mQBtڼh�B�A��Y�a �x�Y�Ɉ��`	6���G~P������2�#|���p�F�h%C�
G�[8��8^D���1�(�U�\����)�h�{�S�I}[v��)=>ҿH�Y����ׅ^�s�޼k��r7Y�dy�Ѻ�]���vy}2{s=N_}Mvg3=_��@r-�`�{��Bjnx�<Mcnm��8gZq�L(���냘�4Pz'�B�|��at�t��H�:�?��ӯ=�Bch����J�?�@��=���F��zg�=�y�� �s� ����BЛ�� we�0yμ2�z��� �������!>ynҴ�0�Q�@@H��R�eR�.�2�Hb��]�U�Λ���N�Б���3b�@�iV�.��I۶�U����-����i���XT��[���%-���w�����kÿ�o���mq���,�����KΎ� Z-��Q����0ɽM�z���bm���g3�9a�˲����S�0/�6�������G��Q(�pE��O�ߠ����e�<v�ۻ��q��ߖj��OW�N^7W�͇���/q�_�v��}OקNU����M�=��7�X3��AvY��Xf2�2G��V��4�>�ԡ}O��&�xD�H�D*a({�j\VEY����pƦs����!{D���C�ڝ���v���*_'f������>�t}<{���5]����*m��og��x�B���Qi^X&b�
t�|1g�8W�eFOSg����?�xM��	�ޏ�3W�Ň3��D+�&���C��ܴ"��L�oz���`�M�K�������	�$-b�a����K��7��0���}��:Ŀ��w(�'/^��*���      �   �   x���1�0Eg�\�Q�8N�� �R�
"@��'E���������FQ�~�,���D` ��a���l�7�_Ro��H���5�r��I��ŁP�k�C 8�EDY䜑Ax�B��WʊM���B��%��������u���Fˆ�o-<�X���ZY��S���Q�Z�     