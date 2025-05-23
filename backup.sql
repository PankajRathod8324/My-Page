toc.dat                                                                                             0000600 0004000 0002000 00000267174 14767263103 0014471 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP   +    ,                }         	   PizzaShop    16.3    16.3    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         �           1262    32786 	   PizzaShop    DATABASE     ~   CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "PizzaShop";
                postgres    false                    1259    49167    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
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
          public          postgres    false    217         �            1259    33251    customer_tables    TABLE        CREATE TABLE public.customer_tables (
    customer_table_id integer NOT NULL,
    customer_id integer,
    table_id integer
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
          public          postgres    false    253         �            1259    33150 	   customers    TABLE     �  CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    table_id integer,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
          public          postgres    false    235                    1259    33306    order_items    TABLE     �  CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    item_id integer,
    date date DEFAULT now() NOT NULL,
    quantity integer NOT NULL,
    readyitemquantity integer NOT NULL,
    rate numeric(5,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
          public          postgres    false    261                    1259    90177 	   order_tax    TABLE     o   CREATE TABLE public.order_tax (
    order_tax_id integer NOT NULL,
    order_id integer,
    tax_id integer
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
          public          postgres    false    273                     1259    33275    orders    TABLE     -  CREATE TABLE public.orders (
    order_id integer NOT NULL,
    customer_id integer,
    date date DEFAULT now() NOT NULL,
    review_id integer,
    comment character varying(50),
    sub_total numeric(10,2) NOT NULL,
    no_of_person integer NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_status_id integer,
    payment_mode_id integer
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
          public          postgres    false    255                    1259    90194    payment_mode    TABLE     y   CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);
     DROP TABLE public.payment_mode;
       public         heap    postgres    false                    1259    90193     paymode_mode_payment_mode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paymode_mode_payment_mode_id_seq
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
          public          postgres    false    264         �            1259    33191    reviews    TABLE     m  CREATE TABLE public.reviews (
    review_id integer NOT NULL,
    rating integer,
    comment text,
    food integer,
    service integer,
    ambience integer,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
          public          postgres    false    247         �            1259    32803    roles    TABLE       CREATE TABLE public.roles (
    role_id integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    role_name text
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
          public          postgres    false    219                    1259    90142    table_status    TABLE     @  CREATE TABLE public.table_status (
    status_id integer NOT NULL,
    status_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    is_deleted boolean DEFAULT false
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
    tax_amount character varying(100) NOT NULL,
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
          public          postgres    false    231         �            1259    32849    users    TABLE     ]  CREATE TABLE public.users (
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
    last_login timestamp without time zone DEFAULT now(),
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
          public          postgres    false    223         �            1259    33221    waiting_list    TABLE     �  CREATE TABLE public.waiting_list (
    waiting_list_id integer NOT NULL,
    waiting_time timestamp without time zone NOT NULL,
    customer_id integer,
    table_id integer,
    section_id integer,
    name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    no_of_person integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
          public          postgres    false    251         �           2604    32838    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    222    221    222                    2604    33051 $   combine_modifier combine_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);
 S   ALTER TABLE public.combine_modifier ALTER COLUMN combine_modifier_id DROP DEFAULT;
       public          postgres    false    238    237    238         �           2604    32815    countries country_id    DEFAULT     |   ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    217    218    218         2           2604    33254 !   customer_tables customer_table_id    DEFAULT     �   ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);
 P   ALTER TABLE public.customer_tables ALTER COLUMN customer_table_id DROP DEFAULT;
       public          postgres    false    254    253    254         &           2604    33153    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    246    245    246         ,           2604    33205    favourites favourites_id    DEFAULT     �   ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);
 G   ALTER TABLE public.favourites ALTER COLUMN favourites_id DROP DEFAULT;
       public          postgres    false    249    250    250         F           2604    73732    itemtype itemtype_id    DEFAULT     x   ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);
 C   ALTER TABLE public.itemtype ALTER COLUMN itemtype_id DROP DEFAULT;
       public          postgres    false    266    267    267                     2604    32919    menu_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);
 J   ALTER TABLE public.menu_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    225    226    226                    2604    32956    menu_item_units unit_id    DEFAULT     �   ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);
 F   ALTER TABLE public.menu_item_units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    230    229    230                    2604    32991    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    233    234    234                    2604    32939 &   menu_modifier_groups modifier_group_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);
 U   ALTER TABLE public.menu_modifier_groups ALTER COLUMN modifier_group_id DROP DEFAULT;
       public          postgres    false    228    227    228                    2604    33024    menu_modifiers modifier_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);
 I   ALTER TABLE public.menu_modifiers ALTER COLUMN modifier_id DROP DEFAULT;
       public          postgres    false    235    236    236         7           2604    33309    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    258    257    258         ;           2604    33324 !   order_modifiers order_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);
 P   ALTER TABLE public.order_modifiers ALTER COLUMN order_modifier_id DROP DEFAULT;
       public          postgres    false    259    260    260         O           2604    90204    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public          postgres    false    277    278    278         ?           2604    33339    order_tables order_table_id    DEFAULT     �   ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);
 J   ALTER TABLE public.order_tables ALTER COLUMN order_table_id DROP DEFAULT;
       public          postgres    false    262    261    262         M           2604    90180    order_tax order_tax_id    DEFAULT     �   ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);
 E   ALTER TABLE public.order_tax ALTER COLUMN order_tax_id DROP DEFAULT;
       public          postgres    false    273    274    274         3           2604    33278    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    256    255    256         N           2604    90197    payment_mode payment_mode_id    DEFAULT     �   ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);
 K   ALTER TABLE public.payment_mode ALTER COLUMN payment_mode_id DROP DEFAULT;
       public          postgres    false    275    276    276         @           2604    65625    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public          postgres    false    264    265    265         )           2604    33194    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    248    247    248         �           2604    32806    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    216    215    216                    2604    33069    sections section_id    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    239    240    240         �           2604    32824    states state_id    DEFAULT     r   ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);
 >   ALTER TABLE public.states ALTER COLUMN state_id DROP DEFAULT;
       public          postgres    false    219    220    220         G           2604    90145    table_status status_id    DEFAULT     �   ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);
 E   ALTER TABLE public.table_status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    270    269    270                    2604    33087    tables table_id    DEFAULT     r   ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);
 >   ALTER TABLE public.tables ALTER COLUMN table_id DROP DEFAULT;
       public          postgres    false    242    241    242         J           2604    90160    tax_type tax_type_id    DEFAULT     |   ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);
 C   ALTER TABLE public.tax_type ALTER COLUMN tax_type_id DROP DEFAULT;
       public          postgres    false    271    272    272                     2604    33107    taxes tax_id    DEFAULT     l   ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);
 ;   ALTER TABLE public.taxes ALTER COLUMN tax_id DROP DEFAULT;
       public          postgres    false    244    243    244                    2604    32984    units unit_id    DEFAULT     n   ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);
 <   ALTER TABLE public.units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    231    232    232         �           2604    32852    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    224    223    224         /           2604    33224    waiting_list waiting_list_id    DEFAULT     �   ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);
 K   ALTER TABLE public.waiting_list ALTER COLUMN waiting_list_id DROP DEFAULT;
       public          postgres    false    251    252    252         �          0    49167    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    263       5256.dat _          0    32835    cities 
   TABLE DATA           p   COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    222       5215.dat o          0    33048    combine_modifier 
   TABLE DATA           k   COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
    public          postgres    false    238       5231.dat [          0    32812 	   countries 
   TABLE DATA           o   COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    218       5211.dat           0    33251    customer_tables 
   TABLE DATA           S   COPY public.customer_tables (customer_table_id, customer_id, table_id) FROM stdin;
    public          postgres    false    254       5247.dat w          0    33150 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    246       5239.dat {          0    33202 
   favourites 
   TABLE DATA           w   COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    250       5243.dat �          0    81949    item_modifier_group 
   TABLE DATA           g   COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
    public          postgres    false    268       5261.dat �          0    73729    itemtype 
   TABLE DATA           F   COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
    public          postgres    false    267       5260.dat c          0    32916    menu_categories 
   TABLE DATA           �   COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    226       5219.dat g          0    32953    menu_item_units 
   TABLE DATA           o   COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    230       5223.dat k          0    32988 
   menu_items 
   TABLE DATA              COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
    public          postgres    false    234       5227.dat e          0    32936    menu_modifier_groups 
   TABLE DATA           �   COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    228       5221.dat m          0    33021    menu_modifiers 
   TABLE DATA           �   COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    236       5229.dat �          0    33306    order_items 
   TABLE DATA           �   COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    258       5251.dat �          0    33321    order_modifiers 
   TABLE DATA           �   COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    260       5253.dat �          0    90201    order_status 
   TABLE DATA           J   COPY public.order_status (order_status_id, order_status_name) FROM stdin;
    public          postgres    false    278       5271.dat �          0    33336    order_tables 
   TABLE DATA           J   COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
    public          postgres    false    262       5255.dat �          0    90177 	   order_tax 
   TABLE DATA           C   COPY public.order_tax (order_tax_id, order_id, tax_id) FROM stdin;
    public          postgres    false    274       5267.dat �          0    33275    orders 
   TABLE DATA           �   COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id) FROM stdin;
    public          postgres    false    256       5249.dat �          0    90194    payment_mode 
   TABLE DATA           J   COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
    public          postgres    false    276       5269.dat �          0    65622    permissions 
   TABLE DATA           �   COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    265       5258.dat y          0    33191    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    248       5241.dat Y          0    32803    roles 
   TABLE DATA           e   COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name) FROM stdin;
    public          postgres    false    216       5209.dat q          0    33066    sections 
   TABLE DATA           �   COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    240       5233.dat ]          0    32821    states 
   TABLE DATA           t   COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    220       5213.dat �          0    90142    table_status 
   TABLE DATA           p   COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    270       5263.dat s          0    33084    tables 
   TABLE DATA           �   COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted) FROM stdin;
    public          postgres    false    242       5235.dat �          0    90157    tax_type 
   TABLE DATA           p   COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    272       5265.dat u          0    33104    taxes 
   TABLE DATA           �   COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
    public          postgres    false    244       5237.dat i          0    32981    units 
   TABLE DATA           3   COPY public.units (unit_id, unit_name) FROM stdin;
    public          postgres    false    232       5225.dat a          0    32849    users 
   TABLE DATA           $  COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
    public          postgres    false    224       5217.dat }          0    33221    waiting_list 
   TABLE DATA           �   COPY public.waiting_list (waiting_list_id, waiting_time, customer_id, table_id, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    252       5245.dat �           0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);
          public          postgres    false    221         �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 53, true);
          public          postgres    false    237         �           0    0    countries_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);
          public          postgres    false    217         �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 1, false);
          public          postgres    false    253         �           0    0    customers_customer_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);
          public          postgres    false    245         �           0    0    favourites_favourites_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 1, false);
          public          postgres    false    249         �           0    0    itemtype_item_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);
          public          postgres    false    266         �           0    0    menu_categories_category_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 26, true);
          public          postgres    false    225         �           0    0    menu_item_units_unit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);
          public          postgres    false    229         �           0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 53, true);
          public          postgres    false    233         �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 11, true);
          public          postgres    false    227         �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);
          public          postgres    false    235         �           0    0    order_items_order_item_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 1, false);
          public          postgres    false    257         �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 1, false);
          public          postgres    false    259         �           0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);
          public          postgres    false    277         �           0    0    order_tables_order_table_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 1, false);
          public          postgres    false    261         �           0    0    order_tax_order_tax_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 1, false);
          public          postgres    false    273         �           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 4, true);
          public          postgres    false    255         �           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);
          public          postgres    false    275         �           0    0    permissions_permission_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);
          public          postgres    false    264         �           0    0    reviews_review_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.reviews_review_id_seq', 4, true);
          public          postgres    false    247         �           0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    215         �           0    0    sections_section_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.sections_section_id_seq', 7, true);
          public          postgres    false    239         �           0    0    states_state_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);
          public          postgres    false    219         �           0    0    table_status_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.table_status_status_id_seq', 2, true);
          public          postgres    false    269         �           0    0    tables_table_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.tables_table_id_seq', 8, true);
          public          postgres    false    241         �           0    0    tax_type_tax_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);
          public          postgres    false    271         �           0    0    taxes_tax_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.taxes_tax_id_seq', 12, true);
          public          postgres    false    243         �           0    0    units_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);
          public          postgres    false    231         �           0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 284, true);
          public          postgres    false    223         �           0    0     waiting_list_waiting_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 1, false);
          public          postgres    false    251         �           2606    49171 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    263         W           2606    32842    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    222         m           2606    33053 &   combine_modifier combine_modifier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);
 P   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_pkey;
       public            postgres    false    238         S           2606    32819    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    218         �           2606    33256 $   customer_tables customer_tables_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_pkey PRIMARY KEY (customer_table_id);
 N   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_pkey;
       public            postgres    false    254         u           2606    33159    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    246         w           2606    33157    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    246         {           2606    33209    favourites favourites_pkey 
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
       public            postgres    false    267         a           2606    32926 $   menu_categories menu_categories_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    226         e           2606    32960 $   menu_item_units menu_item_units_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);
 N   ALTER TABLE ONLY public.menu_item_units DROP CONSTRAINT menu_item_units_pkey;
       public            postgres    false    230         i           2606    33000    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    234         c           2606    32946 .   menu_modifier_groups menu_modifier_groups_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_pkey PRIMARY KEY (modifier_group_id);
 X   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_pkey;
       public            postgres    false    228         k           2606    33031 "   menu_modifiers menu_modifiers_pkey 
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
       public            postgres    false    256         �           2606    90199    payment_mode paymode_mode_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT paymode_mode_pkey PRIMARY KEY (payment_mode_id);
 H   ALTER TABLE ONLY public.payment_mode DROP CONSTRAINT paymode_mode_pkey;
       public            postgres    false    276         �           2606    65632    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    265         y           2606    33200    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    248         Q           2606    32810    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    216         o           2606    33076    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    240         U           2606    32828    states states_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    220         �           2606    90149    table_status table_status_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.table_status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);
 H   ALTER TABLE ONLY public.table_status DROP CONSTRAINT table_status_pkey;
       public            postgres    false    270         q           2606    33091    tables tables_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_pkey;
       public            postgres    false    242         �           2606    90164    tax_type tax_type_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);
 @   ALTER TABLE ONLY public.tax_type DROP CONSTRAINT tax_type_pkey;
       public            postgres    false    272         s           2606    33113    taxes taxes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (tax_id);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public            postgres    false    244         g           2606    32986    units units_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public            postgres    false    232         Y           2606    32863    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    224         [           2606    32865    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    224         ]           2606    32859    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    224         _           2606    32861    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    224         }           2606    33234 #   waiting_list waiting_list_email_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_email_key UNIQUE (email);
 M   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_email_key;
       public            postgres    false    252                    2606    33230 "   waiting_list waiting_list_name_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_name_key UNIQUE (name);
 L   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_name_key;
       public            postgres    false    252         �           2606    33232 #   waiting_list waiting_list_phone_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_phone_key UNIQUE (phone);
 M   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_phone_key;
       public            postgres    false    252         �           2606    33228    waiting_list waiting_list_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);
 H   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_pkey;
       public            postgres    false    252         �           2606    32843    cities cities_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_state_id_fkey;
       public          postgres    false    220    4949    222         �           2606    33054 8   combine_modifier combine_modifier_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_group_id_fkey;
       public          postgres    false    238    4963    228         �           2606    33059 2   combine_modifier combine_modifier_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_id_fkey;
       public          postgres    false    4971    236    238         �           2606    33257 0   customer_tables customer_tables_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_customer_id_fkey;
       public          postgres    false    254    246    4983         �           2606    33262 -   customer_tables customer_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_table_id_fkey;
       public          postgres    false    4977    254    242         �           2606    33160 !   customers customers_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_table_id_fkey;
       public          postgres    false    242    246    4977         �           2606    33210 "   favourites favourites_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_item_id_fkey;
       public          postgres    false    250    234    4969         �           2606    33215 "   favourites favourites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_user_id_fkey;
       public          postgres    false    250    224    4957         �           2606    90165    taxes fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);
 ;   ALTER TABLE ONLY public.taxes DROP CONSTRAINT fk_customer;
       public          postgres    false    272    5019    244         �           2606    81954 4   item_modifier_group item_modifier_group_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_item_id_fkey;
       public          postgres    false    268    234    4969         �           2606    81959 >   item_modifier_group item_modifier_group_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_modifier_group_id_fkey;
       public          postgres    false    228    4963    268         �           2606    73739    menu_items itemtype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT itemtype_id;
       public          postgres    false    234    267    5013         �           2606    33001 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    234    4961    226         �           2606    33011 ,   menu_items menu_items_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_modifier_group_id_fkey;
       public          postgres    false    234    4963    228         �           2606    33006 "   menu_items menu_items_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_unit_id_fkey;
       public          postgres    false    4967    232    234         �           2606    32947 :   menu_modifier_groups menu_modifier_groups_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_category_id_fkey;
       public          postgres    false    226    4961    228         �           2606    33032 4   menu_modifiers menu_modifiers_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_modifier_group_id_fkey;
       public          postgres    false    228    4963    236         �           2606    33042 *   menu_modifiers menu_modifiers_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_unit_id_fkey;
       public          postgres    false    236    232    4967         �           2606    33315 $   order_items order_items_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_item_id_fkey;
       public          postgres    false    234    4969    258         �           2606    33330 0   order_modifiers order_modifiers_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_modifier_id_fkey;
       public          postgres    false    260    236    4971         �           2606    90207     orders order_order_status_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_order_status_id_key;
       public          postgres    false    278    5025    256         �           2606    90212    orders order_payment_mode_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_payment_mode_id;
       public          postgres    false    256    276    5023         �           2606    33342 '   order_tables order_tables_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_order_id_fkey;
       public          postgres    false    256    4999    262         �           2606    33347 '   order_tables order_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_table_id_fkey;
       public          postgres    false    4977    242    262         �           2606    90183 !   order_tax order_tax_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_order_id_fkey;
       public          postgres    false    4999    274    256         �           2606    90188    order_tax order_tax_tax_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_tax_id_fkey;
       public          postgres    false    4979    274    244         �           2606    33284    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    4983    246    256         �           2606    33299    orders orders_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_review_id_fkey;
       public          postgres    false    248    4985    256         �           2606    65633 $   permissions permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_role_id_fkey;
       public          postgres    false    265    216    4945         �           2606    32829    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public          postgres    false    220    218    4947         �           2606    90150    tables status_id    FK CONSTRAINT        ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);
 :   ALTER TABLE ONLY public.tables DROP CONSTRAINT status_id;
       public          postgres    false    5017    242    270         �           2606    33092    tables tables_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_section_id_fkey;
       public          postgres    false    242    240    4975         �           2606    32881    users users_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_fkey;
       public          postgres    false    224    4951    222         �           2606    32871    users users_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_fkey;
       public          postgres    false    218    224    4947         �           2606    32866    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    4945    216    224         �           2606    32876    users users_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_fkey;
       public          postgres    false    220    4949    224         �           2606    33235 *   waiting_list waiting_list_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_customer_id_fkey;
       public          postgres    false    246    4983    252         �           2606    33245 )   waiting_list waiting_list_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_section_id_fkey;
       public          postgres    false    240    252    4975         �           2606    33240 '   waiting_list waiting_list_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_table_id_fkey;
       public          postgres    false    242    252    4977                                                                                                                                                                                                                                                                                                                                                                                                            5256.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5215.dat                                                                                            0000600 0004000 0002000 00000004112 14767263103 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	Surat	1	2025-02-12 01:23:26.224593	1	2025-02-12 01:23:26.224593
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                      5231.dat                                                                                            0000600 0004000 0002000 00000000720 14767263103 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	7	4	f
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
29	5	36	f
30	6	37	f
31	5	38	f
32	5	39	f
33	5	40	f
34	6	41	f
35	6	42	f
36	6	43	f
37	5	44	f
38	2	45	f
39	6	46	f
40	\N	3	f
41	\N	10	f
42	10	6	f
43	10	13	f
44	10	17	f
45	6	12	f
47	4	1	f
51	11	46	f
52	11	18	f
53	4	47	f
\.


                                                5211.dat                                                                                            0000600 0004000 0002000 00000004027 14767263103 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	India	2	2025-02-21 02:00:49.499576	2	2025-02-21 02:00:49.499576
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         5247.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5239.dat                                                                                            0000600 0004000 0002000 00000000574 14767263103 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Nistha	4	nish@gmail.com	9841325670	1	2025-03-21 02:08:53.124914	1	2025-03-21 02:08:53.124914
2	Om	3	om@gmail.com	0526987432	1	2025-03-21 02:08:53.124914	1	2025-03-21 02:08:53.124914
3	Alex	2	alex@gmail.com	98653205874	1	2025-03-21 02:08:53.124914	1	2025-03-21 02:08:53.124914
4	Priyanshi	1	pri@gmail.com	1256347895	1	2025-03-21 02:08:53.124914	1	2025-03-21 02:08:53.124914
\.


                                                                                                                                    5243.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5261.dat                                                                                            0000600 0004000 0002000 00000000150 14767263103 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        36	4	2	4
37	7	1	3
38	4	1	4
39	7	1	5
41	6	2	4
42	2	1	4
42	4	1	4
51	2	1	4
52	7	1	4
53	5	1	4
50	6	2	4
\.


                                                                                                                                                                                                                                                                                                                                                                                                                        5260.dat                                                                                            0000600 0004000 0002000 00000000046 14767263103 0014257 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Veg	\N
2	Non-Veg	\N
3	Vegan	\N
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          5219.dat                                                                                            0000600 0004000 0002000 00000002447 14767263103 0014272 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        11	PanCake	This is Description	f	0	2025-03-02 21:11:45.492532	0	2025-03-02 21:11:45.492532
12	Sizzler	This is Description	f	0	2025-03-02 21:52:02.32054	0	2025-03-02 21:52:02.32054
14	Pav-Bhaji	This is Description	f	0	2025-03-02 22:25:09.852032	0	2025-03-02 22:25:09.852032
15	Momos	This is Description	f	0	2025-03-03 00:07:33.552168	0	2025-03-03 00:07:33.552168
10	caefcasdf	\N	t	0	2025-03-02 21:04:38.168855	0	2025-03-02 21:04:38.168855
6	Sandwich 	This is Description	f	1	2025-02-28 01:04:58.871341	1	2025-02-28 01:04:58.871341
13	Ice-Cream	This is Description	t	0	2025-03-02 22:20:27.638712	0	2025-03-02 22:20:27.638712
21	Shake	This is Description	f	0	2025-03-04 05:08:04.591461	0	2025-03-04 05:08:04.591461
7	Dessert	This is Description	f	1	2025-02-28 01:04:58.871341	1	2025-02-28 01:04:58.871341
23	Dosa	This is Description Of Dosa	f	0	2025-03-04 21:35:49.880107	0	2025-03-04 21:35:49.880107
9	Frenkie	This is Descript	f	1	2025-02-28 03:55:34.457521	1	2025-02-28 03:55:34.457521
25	gbgdf	\N	t	0	2025-03-06 21:21:31.987696	0	2025-03-06 21:21:31.987696
8	Burger	This is Descriptiond	f	1	2025-02-28 01:04:58.871341	1	2025-02-28 01:04:58.871341
24	Pastry	This is Description	t	0	2025-03-06 21:21:13.381378	0	2025-03-06 21:21:13.381378
26	frffr	frdrfff	f	0	2025-03-19 04:39:39.157648	0	2025-03-19 04:39:39.157648
\.


                                                                                                                                                                                                                         5223.dat                                                                                            0000600 0004000 0002000 00000000101 14767263103 0014246 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pcs	1	2025-03-03 21:56:05.1863	1	2025-03-03 21:56:05.1863
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                               5227.dat                                                                                            0000600 0004000 0002000 00000010366 14767263103 0014270 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        26	21	AlmondShake	250.00	1	1	t	f	0.00	AS	thskfjkl,fgm,.	\N	f	\N	0	2025-03-07 03:50:29.234064	0	2025-03-07 03:50:29.234064	\N	t
5	9	Cheese Frenkie	100.00	1	1	t	t	8.00	CF	This is Description	\N	f	\N	0	2025-03-04 03:36:29.720185	0	2025-03-04 03:36:29.720185	1	\N
6	8	Cheese Burger	150.00	1	1	t	t	6.00	CB	This is Description	\N	f	\N	0	2025-03-04 03:37:46.020005	0	2025-03-04 03:37:46.020005	1	\N
28	21	Almond Shake	340.00	1	1	t	f	0.00	AS	fddsdsdsd	\N	f	\N	0	2025-03-07 04:04:05.345758	0	2025-03-07 04:04:05.345758	1	t
10	15	Paneer Cheese Momos	220.00	1	1	t	f	0.00	PCM	This is Description	\N	f	\N	0	2025-03-04 05:04:49.731456	0	2025-03-04 05:04:49.731456	1	\N
24	21	AlmondShake	250.00	1	1	t	f	0.00	AS	This is Description	\N	f	\N	0	2025-03-07 03:49:23.724273	0	2025-03-07 03:49:23.724273	1	t
8	12	Chinese Sizzler	350.00	2	1	t	f	0.00	CS	This is Description	\N	f	\N	0	2025-03-04 03:40:33.445641	0	2025-03-04 03:40:33.445641	1	\N
25	21	AlmondShake	250.00	1	1	t	f	0.00	AS	This is Description	\N	f	\N	0	2025-03-07 03:49:28.032884	0	2025-03-07 03:49:28.032884	1	t
30	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	\N	0	2025-03-07 04:15:30.243069	0	2025-03-07 04:15:30.243069	1	t
31	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:40.832681	0	2025-03-07 04:16:40.832681	1	t
32	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:40.872124	0	2025-03-07 04:16:40.872124	1	t
22	15	Cheese Momos	150.00	4	1	t	f	0.00	CM	This is Description	\N	f	\N	0	2025-03-05 03:43:58.022331	0	2025-03-05 03:43:58.022331	1	\N
23	8	Chicken Burger	250.00	1	1	f	t	10.00	CB	This is Description	\N	f	\N	0	2025-03-05 05:07:38.559972	0	2025-03-05 05:07:38.559972	2	\N
34	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:17:48.387132	0	2025-03-07 04:17:48.387132	1	t
29	21	Almond Shake	340.00	1	1	t	f	0.00	AS	fddsdsdsd	\N	f	\N	0	2025-03-07 04:12:24.298438	0	2025-03-07 04:12:24.298438	1	t
50	15	Special Momos	2.00	3	1	t	f	0.00	SM	fwrfrf	\N	f	\N	0	2025-03-18 20:58:05.111218	0	2025-03-18 20:58:05.111218	1	\N
36	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:18:21.275857	0	2025-03-07 04:18:21.275857	1	t
35	21	Almond Shake	180.00	1	1	t	f	0.00	AS	sdfkjvbhksfnvkjv	\N	f	4	0	2025-03-07 04:17:55.329296	0	2025-03-07 04:17:55.329296	1	t
3	6	Punjabi Tadka Sandwich	200.00	3	1	t	f	10.00	PTS	This is Sandwich Item Description	\N	f	2	1	2025-03-03 21:58:28.406747	1	2025-03-03 21:58:28.406747	1	\N
40	9	Cheese Butter Frenkie	20.00	12	1	t	f	0.00	\N	\N	\N	f	\N	0	2025-03-12 04:59:22.453615	0	2025-03-12 04:59:22.453615	\N	\N
9	14	Special Pav-Bhaji	80.00	10	1	t	t	0.00	SP	This is Description	\N	f	\N	0	2025-03-04 03:41:22.014435	0	2025-03-04 03:41:22.014435	1	\N
33	21	Almond Shake	180.00	1	1	t	f	0.00	AS	fcfsddssfd	\N	f	4	0	2025-03-07 04:16:42.56601	0	2025-03-07 04:16:42.56601	1	\N
39	23	Cheese Dosa	130.00	1	1	t	f	0.00	CD	sfsdfssff	\N	f	7	0	2025-03-07 05:10:52.345699	0	2025-03-07 05:10:52.345699	1	\N
41	21	srfddfsdsfsdf	40.00	3	1	f	f	0.00		fvddf	\N	f	\N	0	2025-03-12 05:14:32.907135	0	2025-03-12 05:14:32.907135	1	\N
42	12	Maxican Sizzler	20.00	5	1	f	f	0.00	MS	ffrfefeff	\N	f	\N	0	2025-03-12 20:43:51.602962	0	2025-03-12 20:43:51.602962	1	\N
51	15	Mexican Momos	200.00	3	1	t	f	0.00	MM	csrfrsefr	\N	f	\N	0	2025-03-18 20:59:07.760694	0	2025-03-18 20:59:07.760694	1	\N
27	15	Chicken Momos	212.00	1	1	t	f	0.00	d	csdsdsfd	\N	f	\N	0	2025-03-07 03:55:00.95263	0	2025-03-07 03:55:00.95263	2	\N
37	15	Special Momos	250.00	2	1	t	f	0.00	SM	fddvdfa	\N	f	7	0	2025-03-07 04:40:52.074115	0	2025-03-07 04:40:52.074115	1	f
52	15	Italian Momos	250.00	3	1	t	f	0.00	IM	deaef	\N	f	\N	0	2025-03-18 20:59:46.158633	0	2025-03-18 20:59:46.158633	1	\N
53	15	Authentic Momos	270.00	2	1	t	f	0.00	AM	fcsfs	\N	f	\N	0	2025-03-18 21:00:25.199334	0	2025-03-18 21:00:25.199334	1	\N
38	23	Butter Dosa	120.00	3	1	t	f	0.00	BD	efdeeded	\N	f	4	0	2025-03-07 05:09:32.290533	0	2025-03-07 05:09:32.290533	1	\N
7	11	Standard PanCake!!	100.00	2	1	t	t	12.00	SP	This is Description	\N	f	\N	0	2025-03-04 03:39:09.653191	0	2025-03-04 03:39:09.653191	1	\N
43	14	Cheese Pav-Bhaji	120.00	1	1	f	f	2.00	CPB	dejdoeldke	\N	f	\N	0	2025-03-17 21:25:40.152883	0	2025-03-17 21:25:40.152883	1	\N
44	14	Cheese Pav-Bhaji	120.00	1	1	f	f	2.00	CPB	dejdoeldke	\N	f	\N	0	2025-03-17 21:25:42.695003	0	2025-03-17 21:25:42.695003	1	\N
\.


                                                                                                                                                                                                                                                                          5221.dat                                                                                            0000600 0004000 0002000 00000001202 14767263103 0014247 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	Toppings	This is Description	f	\N	0	2025-03-04 21:34:58.243419	0	2025-03-04 21:34:58.243419
6	Crust Option	This is Description	f	\N	0	2025-03-04 21:41:06.28655	0	2025-03-04 21:41:06.28655
2	Veggies	This is Description	f	6	1	2025-03-03 21:55:03.741296	1	2025-03-03 21:55:03.741296
4	Size	This is Descriptions	f	\N	0	2025-03-04 21:33:19.540832	0	2025-03-04 21:33:19.540832
7	Sauce Option	\N	f	\N	0	2025-03-05 23:23:22.455157	0	2025-03-05 23:23:22.455157
10	Pizza Options	This is Description	f	\N	0	2025-03-11 03:35:58.752366	0	2025-03-11 03:35:58.752366
11	Veggiesss	eeeeee	f	\N	0	2025-03-18 21:43:42.028518	0	2025-03-18 21:43:42.028518
\.


                                                                                                                                                                                                                                                                                                                                                                                              5229.dat                                                                                            0000600 0004000 0002000 00000005174 14767263103 0014273 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	Large	4	180.00	f	1	1	This is Description	0	2025-03-05 00:46:46.06743	0	2025-03-05 00:46:46.06743
4	Tomato	7	30.00	f	1	2	This is Description	0	2025-03-05 23:23:54.861182	0	2025-03-05 23:23:54.861182
5	Thin	6	80.00	f	1	2	cdcdcdc	0	2025-03-10 21:35:02.926946	0	2025-03-10 21:35:02.926946
8	BBQ	7	120.00	f	1	1	cddascds	0	2025-03-10 21:43:29.927241	0	2025-03-10 21:43:29.927241
9	Alfredo	7	150.00	f	1	3	cdacsa	0	2025-03-10 23:06:50.451562	0	2025-03-10 23:06:50.451562
11	Capsicum	2	30.00	f	1	1	cddad	0	2025-03-10 23:26:11.461773	0	2025-03-10 23:26:11.461773
35	Extra Large	6	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:40:14.549941	0	2025-03-11 01:40:14.549941
36	Extra Large	5	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:50:07.586778	0	2025-03-11 01:50:07.586778
37	Extra Large	6	200.00	f	1	1	cdsdcsd	0	2025-03-11 01:55:36.77268	0	2025-03-11 01:55:36.77268
39	Chillie Flaxes	5	20.00	f	1	1	cdsdcsd	0	2025-03-11 01:58:45.450769	0	2025-03-11 01:58:45.450769
40	Chillie Flaxes	5	20.00	f	1	1	cdsdcsd	0	2025-03-11 02:03:00.871922	0	2025-03-11 02:03:00.871922
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
7	Gluten-Free	6	120.00	t	1	1	cddscsdc	0	2025-03-10 21:42:30.36607	0	2025-03-10 21:42:30.36607
12	Olives	2	80.00	f	1	6	elnrlkjnrfl	0	2025-03-10 23:36:34.016165	0	2025-03-10 23:36:34.016165
1	Small	4	80.00	f	1	1	This is Description	0	2025-03-04 22:50:10.446444	0	2025-03-04 22:50:10.446444
47	Tomato	\N	180.00	f	1	5	gfrsf	0	2025-03-12 20:54:56.377107	0	2025-03-12 20:54:56.377107
\.


                                                                                                                                                                                                                                                                                                                                                                                                    5251.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5253.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5271.dat                                                                                            0000600 0004000 0002000 00000000121 14767263103 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Failed
2	On Hold
3	Cancelled
4	Completed
5	Served
6	In Progress
7	Pending
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                               5255.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014256 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5267.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           5249.dat                                                                                            0000600 0004000 0002000 00000000641 14767263103 0014267 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	4	2025-03-21	4	comment	140.00	4	420.00	1	2025-03-21 02:39:30.822061	1	2025-03-21 02:39:30.822061	4	4
2	3	2025-03-21	3	comment	180.00	8	620.00	1	2025-03-21 02:39:30.822061	1	2025-03-21 02:39:30.822061	3	3
3	2	2025-03-21	2	comment	240.00	4	580.00	1	2025-03-21 02:39:30.822061	1	2025-03-21 02:39:30.822061	2	2
4	1	2025-03-21	1	comment	120.00	3	480.00	1	2025-03-21 02:39:30.822061	1	2025-03-21 02:39:30.822061	1	1
\.


                                                                                               5269.dat                                                                                            0000600 0004000 0002000 00000000043 14767263103 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Pending
2	UPI
3	Card
4	Cash
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             5258.dat                                                                                            0000600 0004000 0002000 00000003167 14767263103 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        21	2	Order	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
22	2	Cutomers	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
2	1	Users	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
3	1	RoleAndPermission	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
5	1	TableAndSection	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
6	1	TaxAndFee	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
7	1	Order	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
8	1	Customers	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
13	3	Menu	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
14	3	TableAndSection	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
15	3	TaxAndFee	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
16	3	Order	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
17	3	Cutomers	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
18	3	User	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
4	1	Menu	t	f	f	1	2025-02-26 21:23:41.010877	1	2025-02-26 21:23:41.010877
20	2	TaxAndFee	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
11	2	Menu	t	t	t	2	2025-02-26 21:31:36.594255	2	2025-02-26 21:31:36.594255
9	2	User	t	t	t	2	2025-02-26 21:30:20.643594	2	2025-02-26 21:30:20.643594
10	2	RoleAndPermission	t	t	t	2	2025-02-26 21:31:36.594255	2	2025-02-26 21:31:36.594255
12	3	RoleAndPermission	t	f	f	3	2025-02-26 21:34:19.205695	3	2025-02-26 21:34:19.205695
19	2	TableAndSection	t	t	t	2	2025-02-26 21:34:48.396584	2	2025-02-26 21:34:48.396584
\.


                                                                                                                                                                                                                                                                                                                                                                                                         5241.dat                                                                                            0000600 0004000 0002000 00000000455 14767263103 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533
2	3	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533
3	4	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533
4	5	\N	\N	\N	\N	1	2025-03-21 02:25:33.036533	1	2025-03-21 02:25:33.036533
\.


                                                                                                                                                                                                                   5209.dat                                                                                            0000600 0004000 0002000 00000000326 14767263103 0014263 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	1	2025-02-12 01:21:00.266079	1	2025-02-12 01:21:00.266079	Chef
2	2	2025-02-21 01:55:29.22341	2	2025-02-21 01:55:29.22341	Super Admin
3	3	2025-02-21 01:55:29.22341	3	2025-02-21 01:55:29.22341	Account Manager
\.


                                                                                                                                                                                                                                                                                                          5233.dat                                                                                            0000600 0004000 0002000 00000000727 14767263103 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        3	Ground Floor!!	This is Description	f	1	2025-03-18 03:39:32.994072	1	2025-03-18 03:39:32.994072
5	Second Floor!!	This is Description	f	0	2025-03-18 05:41:47.792747	0	2025-03-18 05:41:47.792747
4	First Floor!!	This is Description	f	1	2025-03-18 03:39:32.994072	1	2025-03-18 03:39:32.994072
6	Temp	This is Description	f	0	2025-03-18 22:43:27.867362	0	2025-03-18 22:43:27.867362
7	Temp 2	This is Description	t	0	2025-03-18 22:44:09.809607	0	2025-03-18 22:44:09.809607
\.


                                         5213.dat                                                                                            0000600 0004000 0002000 00000004103 14767263103 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	2	Gujarat	1	2025-02-12 01:22:46.241827	1	2025-02-12 01:22:46.241827
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


                                                                                                                                                                                                                                                                                                                                                                                                                                                             5263.dat                                                                                            0000600 0004000 0002000 00000000220 14767263103 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Available	1	2025-03-18 23:31:37.210533	1	2025-03-18 23:31:37.210533
2	Occupied	1	2025-03-18 23:31:37.210533	1	2025-03-18 23:31:37.210533
\.


                                                                                                                                                                                                                                                                                                                                                                                5235.dat                                                                                            0000600 0004000 0002000 00000001107 14767263103 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	GT1	3	4	1	2025-03-18 23:40:30.425251	1	2025-03-18 23:40:30.425251	1	f
8	GT8	4	5	0	2025-03-19 03:17:28.361469	0	2025-03-19 03:17:28.361469	2	f
4	GT4	3	5	0	2025-03-19 02:25:19.952279	0	2025-03-19 02:25:19.952279	2	t
6	GT6	3	5	0	2025-03-19 02:58:59.071788	0	2025-03-19 02:58:59.071788	1	t
7	GT7	3	5	0	2025-03-19 03:17:03.567207	0	2025-03-19 03:17:03.567207	2	t
5	GT5!!	5	5	0	2025-03-19 02:40:53.123992	0	2025-03-19 02:40:53.123992	1	f
3	GT3	3	5	0	2025-03-19 02:22:12.292961	0	2025-03-19 02:22:12.292961	2	f
2	GT2	3	2	1	2025-03-18 23:40:52.836319	1	2025-03-18 23:40:52.836319	2	f
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                         5265.dat                                                                                            0000600 0004000 0002000 00000000224 14767263103 0014262 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Flat Amount	1	2025-03-19 21:46:02.274135	1	2025-03-19 21:46:02.274135
2	Percentage	1	2025-03-19 21:46:02.274135	1	2025-03-19 21:46:02.274135
\.


                                                                                                                                                                                                                                                                                                                                                                            5237.dat                                                                                            0000600 0004000 0002000 00000001460 14767263103 0014264 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	CGST	t	t	1	2025-03-19 21:55:55.688245	1	2025-03-19 21:55:55.688245	1	2.00	f
6	Temp 4!!	t	f	0	2025-03-20 05:36:16.568972	0	2025-03-20 05:36:16.568972	1	$10.00	f
4	Temp 2!!	t	t	0	2025-03-20 05:10:29.271542	0	2025-03-20 05:10:29.271542	1	100.00	f
5	Temp 3!!	t	f	0	2025-03-20 05:34:37.567623	0	2025-03-20 05:34:37.567623	2	2.00%	f
10	Temp 7	t	f	0	2025-03-20 21:52:00.430232	0	2025-03-20 21:52:00.430232	1	$8.00	f
7	Temp 5	t	f	0	2025-03-20 05:36:30.263938	0	2025-03-20 05:36:30.263938	1	$10.00	t
9	Temp 6	t	f	0	2025-03-20 21:50:40.984317	0	2025-03-20 21:50:40.984317	1	$8.00	t
1	SGST	t	f	1	2025-03-19 21:55:55.688245	1	2025-03-19 21:55:55.688245	2	10%	t
11	Temp 8	t	t	0	2025-03-20 21:53:41.34579	0	2025-03-20 21:53:41.34579	1	$8.00	t
12	SGST	t	t	0	2025-03-20 22:52:15.481647	0	2025-03-20 22:52:15.481647	2	8.00%	f
\.


                                                                                                                                                                                                                5225.dat                                                                                            0000600 0004000 0002000 00000000013 14767263103 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	pcs
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     5217.dat                                                                                            0000600 0004000 0002000 00000012123 14767263103 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        255	Alice	Johnson	alice_johnson	3	alice@example.com	password3	11122263333	/images/2aa885e5-d87a-44cb-ab5c-5562d03b0a1e_9e8264e7-8285-4f08-9789-a6dff505f6c7_Screenshot (6).png	789 Oak St	2	1	1	554321	3	2025-02-21 03:38:32	3	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
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
269	Oscar	Garcia	oscar_garcia	3	oscar@example.com	password17	5556667777	\N	1414 Ash St	16	22	23	999996	17	2025-02-21 03:38:32	17	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	f
259	Eve	Wilson	eve_wilson	1	eve@example.com	password7	5556267777	/images/6f91572f-72dc-4114-9ef7-3fc6ff9d0195_Screenshot (3).png	404 Birch St	6	12	18	778889	7	2025-02-21 03:38:32	7	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
265	Kate	White	kate_white	3	kate@example.com	password13	1112224333	/images/199b673b-5d13-4492-905b-c0c7dc3897a8_Screenshot (9).png	1010 Cypress St	12	18	19	555556	13	2025-02-21 03:38:32	13	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
264	Jack	Jackson	jack_jackson	2	jack@example.com	password12	9990001111	/images/ca9021ed-76af-4653-8f69-9084edb2dae3_Screenshot (10).png	909 Redwood St	11	17	18	444445	12	2025-02-21 03:38:32	12	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
277	Wendy	Scott	wendy_scott	1	wendy@example.com	password25	7778889999	\N	2222 Elm St	14	20	26	77777	25	2025-02-21 03:38:32	25	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	f
262	Hank	Anderson	hank_anderson	1	hank@example.com	password10	3333445555	/images/6205be2a-fc66-4853-ac5a-dfb6f4c267f2_Screenshot (12).png	707 Spruce St	9	15	21	222292	10	2025-02-21 03:38:32	10	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
279	prakash	Mali	jack	1	prakash@gmail.com	123	09876543214	\N	fsdfs	2	2	2	546733	\N	2025-02-25 22:36:34.760327	\N	2025-02-25 22:36:34.760327	2025-02-25 22:36:34.760327	\N	\N	t	f
254	Jane	Smith	jane_smith	2	jane@example.com	password2	09876554321	/images/4e748980-0221-4419-acc0-80cdcb9bebff_9cf67f1d-6650-4137-8629-4255c037035a_Screenshot (10).png	456 Elm St	1	5	2	678590	2	2025-02-21 03:38:32	2	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
284	om	bhatt	om123	2	tatva.pci71@outlook.com	om123	9876585243	/images/41568d49-fe81-4055-83bd-65b5d8e50045_8efc06e3-498b-4d1a-8c32-ee0db2e0dee1_2aa885e5-d87a-44cb-ab5c-5562d03b0a1e_9e8264e7-8285-4f08-9789-a6dff505f6c7_Screenshot (6).png	fsdfs	11	17	23	12312	\N	2025-03-18 02:59:00.422908	\N	2025-03-18 02:59:00.422908	2025-03-18 02:59:00.422908	\N	\N	t	f
278	Jack	Decker	jack1234	2	tatvasoft.pct71@outlook.com	$2a$11$Io3YCRWBMe/G7nGi8kSYI.F/NzcS0jpPSZlbXBKKDLLGuPuCn0Fo2	1978523657	/images/fea97f8e-f19e-4671-861f-2eb7e4da4818_Screenshot (8).png	328478 SATret	1	5	11	453556	2	2025-02-21 03:38:32	2	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	t	f
282	Priyanshi	Sojitra	pri123	1	tatva.pci72@outlook.com	pri123	1548695325	/images/659a4fc7-d3d8-4d91-839a-c720cb1d8c3d_2aa885e5-d87a-44cb-ab5c-5562d03b0a1e_9e8264e7-8285-4f08-9789-a6dff505f6c7_Screenshot (6).png	ddfff	16	22	28	234455	\N	2025-03-18 02:49:57.57204	\N	2025-03-18 02:49:57.57204	2025-03-18 02:49:57.57204	\N	\N	t	f
267	Mia	Martin	mia_martin	1	mia@example.com	password15	7778839999	\N	1212 Poplar St	14	15	3	777778	15	2025-02-21 03:38:32	15	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
261	Grace	Taylor	grace_taylor	2	grace@example.com	password9	0001812222	/images/dd9bbf2b-a266-4620-9cb2-13d979b1e10f_Screenshot (11).png	606 Chestnut St	8	14	20	111112	9	2025-02-21 03:38:32	9	2025-02-21 03:38:32	2025-02-21 03:38:32	\N	\N	f	t
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                             5245.dat                                                                                            0000600 0004000 0002000 00000000005 14767263103 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000223434 14767263103 0015405 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
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
    table_id integer
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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    table_id integer,
    email character varying(50) NOT NULL,
    phone character varying(50) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    tax_id integer
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
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    order_status_id integer,
    payment_mode_id integer
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
-- Name: payment_mode; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);


ALTER TABLE public.payment_mode OWNER TO postgres;

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
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    role_name text
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
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
    is_deleted boolean DEFAULT false
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
    tax_amount character varying(100) NOT NULL,
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
    last_login timestamp without time zone DEFAULT now(),
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
    waiting_time timestamp without time zone NOT NULL,
    customer_id integer,
    table_id integer,
    section_id integer,
    name character varying(50) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    phone character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    no_of_person integer NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: payment_mode payment_mode_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);


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
COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM '$$PATH$$/5256.dat';

--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5215.dat';

--
-- Data for Name: combine_modifier; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
\.
COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM '$$PATH$$/5231.dat';

--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5211.dat';

--
-- Data for Name: customer_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customer_tables (customer_table_id, customer_id, table_id) FROM stdin;
\.
COPY public.customer_tables (customer_table_id, customer_id, table_id) FROM '$$PATH$$/5247.dat';

--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5239.dat';

--
-- Data for Name: favourites; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5243.dat';

--
-- Data for Name: item_modifier_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
\.
COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM '$$PATH$$/5261.dat';

--
-- Data for Name: itemtype; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
\.
COPY public.itemtype (itemtype_id, item_type, item_photo) FROM '$$PATH$$/5260.dat';

--
-- Data for Name: menu_categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5219.dat';

--
-- Data for Name: menu_item_units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5223.dat';

--
-- Data for Name: menu_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
\.
COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM '$$PATH$$/5227.dat';

--
-- Data for Name: menu_modifier_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5221.dat';

--
-- Data for Name: menu_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5229.dat';

--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5251.dat';

--
-- Data for Name: order_modifiers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5253.dat';

--
-- Data for Name: order_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_status (order_status_id, order_status_name) FROM stdin;
\.
COPY public.order_status (order_status_id, order_status_name) FROM '$$PATH$$/5271.dat';

--
-- Data for Name: order_tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
\.
COPY public.order_tables (order_table_id, order_id, table_id) FROM '$$PATH$$/5255.dat';

--
-- Data for Name: order_tax; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_tax (order_tax_id, order_id, tax_id) FROM stdin;
\.
COPY public.order_tax (order_tax_id, order_id, tax_id) FROM '$$PATH$$/5267.dat';

--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id) FROM stdin;
\.
COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id) FROM '$$PATH$$/5249.dat';

--
-- Data for Name: payment_mode; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
\.
COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM '$$PATH$$/5269.dat';

--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5258.dat';

--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5241.dat';

--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name) FROM stdin;
\.
COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name) FROM '$$PATH$$/5209.dat';

--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5233.dat';

--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5213.dat';

--
-- Data for Name: table_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5263.dat';

--
-- Data for Name: tables; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted) FROM stdin;
\.
COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted) FROM '$$PATH$$/5235.dat';

--
-- Data for Name: tax_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5265.dat';

--
-- Data for Name: taxes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
\.
COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM '$$PATH$$/5237.dat';

--
-- Data for Name: units; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.units (unit_id, unit_name) FROM stdin;
\.
COPY public.units (unit_id, unit_name) FROM '$$PATH$$/5225.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
\.
COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM '$$PATH$$/5217.dat';

--
-- Data for Name: waiting_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.waiting_list (waiting_list_id, waiting_time, customer_id, table_id, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at) FROM stdin;
\.
COPY public.waiting_list (waiting_list_id, waiting_time, customer_id, table_id, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at) FROM '$$PATH$$/5245.dat';

--
-- Name: cities_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);


--
-- Name: combine_modifier_combine_modifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 53, true);


--
-- Name: countries_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);


--
-- Name: customer_tables_customer_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 1, false);


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 4, true);


--
-- Name: favourites_favourites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 1, false);


--
-- Name: itemtype_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);


--
-- Name: menu_categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 26, true);


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

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 1, false);


--
-- Name: order_modifiers_order_modifier_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 1, false);


--
-- Name: order_status_order_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);


--
-- Name: order_tables_order_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 1, false);


--
-- Name: order_tax_order_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 1, false);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.reviews_review_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.table_status_status_id_seq', 2, true);


--
-- Name: tables_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tables_table_id_seq', 8, true);


--
-- Name: tax_type_tax_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);


--
-- Name: taxes_tax_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taxes_tax_id_seq', 12, true);


--
-- Name: units_unit_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 284, true);


--
-- Name: waiting_list_waiting_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 1, false);


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
-- Name: waiting_list waiting_list_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_email_key UNIQUE (email);


--
-- Name: waiting_list waiting_list_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_name_key UNIQUE (name);


--
-- Name: waiting_list waiting_list_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_phone_key UNIQUE (phone);


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
-- Name: waiting_list waiting_list_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;


--
-- Name: waiting_list waiting_list_section_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;


--
-- Name: waiting_list waiting_list_table_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    