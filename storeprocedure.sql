PGDMP  -    9                }         	   PizzaShop    16.3    16.3 :   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    32786 	   PizzaShop    DATABASE     ~   CREATE DATABASE "PizzaShop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';
    DROP DATABASE "PizzaShop";
                postgres    false            �           0    0 	   PizzaShop    DATABASE PROPERTIES     =   ALTER DATABASE "PizzaShop" SET "TimeZone" TO 'Asia/Kolkata';
                     postgres    false            5           1255    188716 *   get_kot_details_by_category(integer, text)    FUNCTION     3  CREATE FUNCTION public.get_kot_details_by_category(p_category_id integer, p_status text) RETURNS jsonb
    LANGUAGE plpgsql
    AS $$
DECLARE
    result JSONB;
BEGIN
    -- Your core logic goes here (see below)
    
    WITH order_data AS (
        SELECT
            o.order_id,
            TO_CHAR(NOW() - o.created_at, 'HH24:MI:SS') AS occupiedtime,
            o.order_instructions,
            oi.order_item_id,
            oi.item_id,
            mi.item_name,
            oi.rate,
            CASE
                WHEN p_status = 'In Progress' THEN oi.quantity - oi.readyitemquantity
                ELSE oi.readyitemquantity
            END AS quantity,
            oi.item_instructions,
            p_status AS status,
            om.modifier_id,
            mm.modifier_name,
            om.rate AS modifier_rate,
            ct.table_id,
            t.table_name,
            s.section_name
        FROM orders o
        JOIN order_items oi ON o.order_id = oi.order_id
        JOIN menu_items mi ON oi.item_id = mi.item_id
        LEFT JOIN order_modifiers om ON oi.order_item_id = om.order_item_id
        LEFT JOIN menu_modifiers mm ON om.modifier_id = mm.modifier_id
        LEFT JOIN customers c ON o.customer_id = c.customer_id
        LEFT JOIN customer_tables ct ON c.customer_id = ct.customer_id AND ct.isactive = TRUE
        LEFT JOIN tables t ON ct.table_id = t.table_id
        LEFT JOIN sections s ON t.section_id = s.section_id
        WHERE o.order_status_id NOT IN (3, 4)
            AND oi.item_id IS NOT NULL
            AND (p_category_id = 0 OR (oi.category_id = p_category_id AND mi.category_id = p_category_id))
            AND (
                (p_status = 'In Progress' AND (oi.quantity - oi.readyitemquantity) > 0)
                OR (p_status != 'In Progress' AND oi.readyitemquantity > 0)
            )
    ),

    -- Build modifiers JSON array for each order_item
    item_with_modifiers AS (
        SELECT
            order_id,
            order_item_id,
            jsonb_build_object(
                'ItemId', item_id,
                'ItemName', item_name,
                'Rate', rate,
                'Quantity', quantity,
                'ItemInstructions', item_instructions,
                'Status', status,
                'Modifiers', jsonb_agg(
                    jsonb_build_object(
                        'ModifierId', modifier_id,
                        'ModifierName', modifier_name,
                        'ModifierRate', modifier_rate,
                        'Quantity', 1
                    )
                ) FILTER (WHERE modifier_id IS NOT NULL)
            ) AS item_json
        FROM order_data
        GROUP BY order_id, order_item_id, item_id, item_name, rate, quantity, item_instructions, status
    ),

    -- Group all items under each order
    final_data AS (
        SELECT
            order_id,
            jsonb_agg(item_json) AS order_items
        FROM item_with_modifiers
        GROUP BY order_id
    )

    -- Final JSON object per order
    SELECT jsonb_agg(
        jsonb_build_object(
            'OrderId', od.order_id,
            'OccupiedTime', (SELECT occupiedtime FROM order_data WHERE order_id = od.order_id LIMIT 1),
            'OrderInstructions', (SELECT order_instructions FROM order_data WHERE order_id = od.order_id LIMIT 1),
            'CustomerTables', (
                SELECT jsonb_agg(jsonb_build_object(
                    'TableId', table_id,
                    'TableName', table_name,
                    'SectionName', section_name
                )) FROM (
                    SELECT DISTINCT table_id, table_name, section_name
                    FROM order_data
                    WHERE order_id = od.order_id
                ) tbl
            ),
            'OrderItems', od.order_items
        )
    ) INTO result
    FROM final_data od;

    RETURN result;
END;
$$;
 X   DROP FUNCTION public.get_kot_details_by_category(p_category_id integer, p_status text);
       public          postgres    false            4           1255    188719    get_order_section()    FUNCTION     W  CREATE FUNCTION public.get_order_section() RETURNS TABLE(section_id integer, section_name text, table_id integer, table_name text, status_name text, capacity integer, customer_id integer, order_id integer, total_amount numeric, created_at timestamp without time zone)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    SELECT
        s.section_id,
        s.section_name,
        t.table_id,
        t.table_name,
        st.status_name,
        t.capacity,
        o.customer_id,
        o.order_id ,
        o.total_amount,
        o.created_at
    FROM sections s
    JOIN tables t ON t.section_id = s.section_id
    JOIN table_status st ON st.status_id = t.status_id
    LEFT JOIN customer_tables ct ON ct.table_id = t.table_id AND ct.isactive = true
    LEFT JOIN orders o ON o.customer_id = ct.customer_id AND o.order_status_id = 6;
END;
$$;
 *   DROP FUNCTION public.get_order_section();
       public          postgres    false            7           1255    188720    get_order_section_json()    FUNCTION     �  CREATE FUNCTION public.get_order_section_json() RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result JSON;
BEGIN
    -- Step 1: Create temp table
    CREATE TEMP TABLE temp_order_section (
        section_id INT,
        section_name TEXT,
        table_id INT,
        table_name TEXT,
        status_name TEXT,
        capacity INT,
        customer_id INT,
        order_id INT,
        total_amount NUMERIC,
        created_at TIMESTAMP
    ) ON COMMIT DROP;

    -- Step 2: Insert required joined and filtered data
    INSERT INTO temp_order_section
    SELECT
        s.section_id,
        s.section_name ,
        t.table_id ,
        t.table_name,
        st.status_name,
        t.capacity,
        o.customer_id,
        o.order_id,
        o.total_amount,
        o.created_at
    FROM sections s
    JOIN tables t ON t.section_id = s.section_id
    JOIN table_status st ON st.status_id = t.status_id
    LEFT JOIN customer_tables ct ON ct.table_id  = t.table_id  AND ct.isactive = true
    LEFT JOIN orders o ON o.customer_id = ct.customer_id AND o.order_status_id = 6;

    -- Step 3: Convert to JSON
    SELECT json_agg(temp_order_section) INTO result
    FROM temp_order_section;

    -- Step 4: Return JSON
    RETURN result;
END;
$$;
 /   DROP FUNCTION public.get_order_section_json();
       public          postgres    false            6           1255    188717    prepare_items(jsonb) 	   PROCEDURE     S  CREATE PROCEDURE public.prepare_items(IN p_items jsonb)
    LANGUAGE plpgsql
    AS $$
DECLARE
    item JSONB;
    v_order_id INT;
    v_item_id INT;
    v_quantity INT;
    v_status TEXT;
    v_quantity_total INT;
    v_ready_total INT;
BEGIN
    FOR item IN SELECT * FROM jsonb_array_elements(p_items)
    LOOP
        v_order_id := (item ->> 'OrderId')::INT;
        v_item_id := (item ->> 'ItemId')::INT;
        v_quantity := (item ->> 'Quantity')::INT;
        v_status := item ->> 'Status';

        IF v_status = 'In Progress' THEN
            UPDATE order_items
            SET readyitemquantity = readyitemquantity + v_quantity
            WHERE order_id = v_order_id AND item_id = v_item_id;
        ELSE
            UPDATE order_items
            SET readyitemquantity = GREATEST(readyitemquantity - v_quantity, 0)
            WHERE order_id = v_order_id AND item_id = v_item_id;
        END IF;

        SELECT quantity, readyitemquantity
        INTO v_quantity_total, v_ready_total
        FROM order_items
        WHERE order_id = v_order_id AND item_id = v_item_id;

        UPDATE order_items
        SET status = CASE
                        WHEN v_ready_total = v_quantity_total THEN 'Ready'
                        ELSE 'In Progress'
                    END
        WHERE order_id = v_order_id AND item_id = v_item_id;
    END LOOP;
END;
$$;
 7   DROP PROCEDURE public.prepare_items(IN p_items jsonb);
       public          postgres    false                       1259    49167    __EFMigrationsHistory    TABLE     �   CREATE TABLE public."__EFMigrationsHistory" (
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
       public          postgres    false    232            �           0    0    cities_city_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.cities_city_id_seq OWNED BY public.cities.city_id;
          public          postgres    false    231            �            1259    33048    combine_modifier    TABLE     �   CREATE TABLE public.combine_modifier (
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
       public          postgres    false    248            �           0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE public.combine_modifier_combine_modifier_id_seq OWNED BY public.combine_modifier.combine_modifier_id;
          public          postgres    false    247            �            1259    32812 	   countries    TABLE     ?  CREATE TABLE public.countries (
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
       public          postgres    false    228            �           0    0    countries_country_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.countries_country_id_seq OWNED BY public.countries.country_id;
          public          postgres    false    227                       1259    33251    customer_tables    TABLE     �   CREATE TABLE public.customer_tables (
    customer_table_id integer NOT NULL,
    customer_id integer,
    table_id integer,
    isactive boolean DEFAULT true,
    created_at timestamp with time zone DEFAULT now() NOT NULL
);
 #   DROP TABLE public.customer_tables;
       public         heap    postgres    false                       1259    33250 %   customer_tables_customer_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_tables_customer_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.customer_tables_customer_table_id_seq;
       public          postgres    false    264            �           0    0 %   customer_tables_customer_table_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.customer_tables_customer_table_id_seq OWNED BY public.customer_tables.customer_table_id;
          public          postgres    false    263            &           1259    106528    customer_waitings    TABLE     �   CREATE TABLE public.customer_waitings (
    customer_waitings_id integer NOT NULL,
    customer_id integer,
    waiting_list_id integer
);
 %   DROP TABLE public.customer_waitings;
       public         heap    postgres    false            %           1259    106527 *   customer_waitings_customer_waitings_id_seq    SEQUENCE     �   CREATE SEQUENCE public.customer_waitings_customer_waitings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public.customer_waitings_customer_waitings_id_seq;
       public          postgres    false    294            �           0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.customer_waitings_customer_waitings_id_seq OWNED BY public.customer_waitings.customer_waitings_id;
          public          postgres    false    293                        1259    33150 	   customers    TABLE     �  CREATE TABLE public.customers (
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
       public          postgres    false    256            �           0    0    customers_customer_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;
          public          postgres    false    255            (           1259    155694    events    TABLE       CREATE TABLE public.events (
    event_id integer NOT NULL,
    customer_id integer,
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
    event_type character varying(50),
    is_deleted boolean DEFAULT false,
    event_status character varying(50)
);
    DROP TABLE public.events;
       public         heap    postgres    false            '           1259    155693    events_event_id_seq    SEQUENCE     �   CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.events_event_id_seq;
       public          postgres    false    296            �           0    0    events_event_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;
          public          postgres    false    295                       1259    33202 
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
       public         heap    postgres    false                       1259    33201    favourites_favourites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.favourites_favourites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.favourites_favourites_id_seq;
       public          postgres    false    260            �           0    0    favourites_favourites_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.favourites_favourites_id_seq OWNED BY public.favourites.favourites_id;
          public          postgres    false    259                       1259    81949    item_modifier_group    TABLE     �   CREATE TABLE public.item_modifier_group (
    item_id integer NOT NULL,
    modifier_group_id integer NOT NULL,
    min_selection integer,
    max_selection integer
);
 '   DROP TABLE public.item_modifier_group;
       public         heap    postgres    false                       1259    73729    itemtype    TABLE     �   CREATE TABLE public.itemtype (
    itemtype_id integer NOT NULL,
    item_type character varying(100) NOT NULL,
    item_photo text
);
    DROP TABLE public.itemtype;
       public         heap    postgres    false                       1259    73728    itemtype_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.itemtype_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.itemtype_item_id_seq;
       public          postgres    false    277            �           0    0    itemtype_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.itemtype_item_id_seq OWNED BY public.itemtype.itemtype_id;
          public          postgres    false    276            �            1259    32916    menu_categories    TABLE     �  CREATE TABLE public.menu_categories (
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
       public          postgres    false    236            �           0    0    menu_categories_category_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.menu_categories_category_id_seq OWNED BY public.menu_categories.category_id;
          public          postgres    false    235            �            1259    32953    menu_item_units    TABLE     ?  CREATE TABLE public.menu_item_units (
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
       public          postgres    false    240            �           0    0    menu_item_units_unit_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.menu_item_units_unit_id_seq OWNED BY public.menu_item_units.unit_id;
          public          postgres    false    239            �            1259    32988 
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
       public          postgres    false    244            �           0    0    menu_items_item_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.menu_items_item_id_seq OWNED BY public.menu_items.item_id;
          public          postgres    false    243            �            1259    32936    menu_modifier_groups    TABLE     �  CREATE TABLE public.menu_modifier_groups (
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
       public          postgres    false    238            �           0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public.menu_modifier_groups_modifier_group_id_seq OWNED BY public.menu_modifier_groups.modifier_group_id;
          public          postgres    false    237            �            1259    33021    menu_modifiers    TABLE       CREATE TABLE public.menu_modifiers (
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
       public          postgres    false    246            �           0    0    menu_modifiers_modifier_id_seq    SEQUENCE OWNED BY     a   ALTER SEQUENCE public.menu_modifiers_modifier_id_seq OWNED BY public.menu_modifiers.modifier_id;
          public          postgres    false    245                       1259    33306    order_items    TABLE     X  CREATE TABLE public.order_items (
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
       public         heap    postgres    false                       1259    33305    order_items_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.order_items_order_item_id_seq;
       public          postgres    false    268            �           0    0    order_items_order_item_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;
          public          postgres    false    267                       1259    33321    order_modifiers    TABLE     �  CREATE TABLE public.order_modifiers (
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
       public         heap    postgres    false                       1259    33320 %   order_modifiers_order_modifier_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_modifiers_order_modifier_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.order_modifiers_order_modifier_id_seq;
       public          postgres    false    270            �           0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.order_modifiers_order_modifier_id_seq OWNED BY public.order_modifiers.order_modifier_id;
          public          postgres    false    269                        1259    90201    order_status    TABLE     y   CREATE TABLE public.order_status (
    order_status_id integer NOT NULL,
    order_status_name character varying(100)
);
     DROP TABLE public.order_status;
       public         heap    postgres    false                       1259    90200     order_status_order_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_status_order_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.order_status_order_status_id_seq;
       public          postgres    false    288            �           0    0     order_status_order_status_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.order_status_order_status_id_seq OWNED BY public.order_status.order_status_id;
          public          postgres    false    287                       1259    33336    order_tables    TABLE     v   CREATE TABLE public.order_tables (
    order_table_id integer NOT NULL,
    order_id integer,
    table_id integer
);
     DROP TABLE public.order_tables;
       public         heap    postgres    false                       1259    33335    order_tables_order_table_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tables_order_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.order_tables_order_table_id_seq;
       public          postgres    false    272            �           0    0    order_tables_order_table_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.order_tables_order_table_id_seq OWNED BY public.order_tables.order_table_id;
          public          postgres    false    271                       1259    90177 	   order_tax    TABLE     �   CREATE TABLE public.order_tax (
    order_tax_id integer NOT NULL,
    order_id integer,
    tax_id integer,
    tax_rate numeric
);
    DROP TABLE public.order_tax;
       public         heap    postgres    false                       1259    90176    order_tax_order_tax_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_tax_order_tax_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.order_tax_order_tax_id_seq;
       public          postgres    false    284            �           0    0    order_tax_order_tax_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.order_tax_order_tax_id_seq OWNED BY public.order_tax.order_tax_id;
          public          postgres    false    283            
           1259    33275    orders    TABLE     #  CREATE TABLE public.orders (
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
       public         heap    postgres    false            	           1259    33274    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public          postgres    false    266            �           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public          postgres    false    265            $           1259    98418    payment    TABLE     ~  CREATE TABLE public.payment (
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
       public         heap    postgres    false                       1259    90194    payment_mode    TABLE     y   CREATE TABLE public.payment_mode (
    payment_mode_id integer NOT NULL,
    payment_mode_name character varying(100)
);
     DROP TABLE public.payment_mode;
       public         heap    postgres    false            #           1259    98417    payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.payment_payment_id_seq;
       public          postgres    false    292            �           0    0    payment_payment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.payment_payment_id_seq OWNED BY public.payment.payment_id;
          public          postgres    false    291            "           1259    98395    payment_status    TABLE     I  CREATE TABLE public.payment_status (
    payment_status_id integer NOT NULL,
    payment_status_name character varying(100),
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
 "   DROP TABLE public.payment_status;
       public         heap    postgres    false            !           1259    98394 $   payment_status_payment_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.payment_status_payment_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.payment_status_payment_status_id_seq;
       public          postgres    false    290            �           0    0 $   payment_status_payment_status_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE public.payment_status_payment_status_id_seq OWNED BY public.payment_status.payment_status_id;
          public          postgres    false    289                       1259    90193     paymode_mode_payment_mode_id_seq    SEQUENCE     �   CREATE SEQUENCE public.paymode_mode_payment_mode_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.paymode_mode_payment_mode_id_seq;
       public          postgres    false    286            �           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.paymode_mode_payment_mode_id_seq OWNED BY public.payment_mode.payment_mode_id;
          public          postgres    false    285                       1259    65622    permissions    TABLE     �  CREATE TABLE public.permissions (
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
       public         heap    postgres    false                       1259    65621    permissions_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.permissions_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.permissions_permission_id_seq;
       public          postgres    false    275                        0    0    permissions_permission_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.permissions_permission_id_seq OWNED BY public.permissions.permission_id;
          public          postgres    false    274                       1259    33191    reviews    TABLE     �  CREATE TABLE public.reviews (
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
       public         heap    postgres    false                       1259    33190    reviews_review_id_seq    SEQUENCE     �   CREATE SEQUENCE public.reviews_review_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.reviews_review_id_seq;
       public          postgres    false    258                       0    0    reviews_review_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.reviews_review_id_seq OWNED BY public.reviews.review_id;
          public          postgres    false    257            �            1259    32803    roles    TABLE     0  CREATE TABLE public.roles (
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
       public          postgres    false    226                       0    0    roles_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;
          public          postgres    false    225            �            1259    33066    sections    TABLE     �  CREATE TABLE public.sections (
    section_id integer NOT NULL,
    section_name character varying(100) NOT NULL,
    section_decription text,
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
       public          postgres    false    250                       0    0    sections_section_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.sections_section_id_seq OWNED BY public.sections.section_id;
          public          postgres    false    249            �            1259    32821    states    TABLE     P  CREATE TABLE public.states (
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
       public          postgres    false    230                       0    0    states_state_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.states_state_id_seq OWNED BY public.states.state_id;
          public          postgres    false    229                       1259    90142    table_status    TABLE     j  CREATE TABLE public.table_status (
    status_id integer NOT NULL,
    status_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL,
    occupied_time time without time zone
);
     DROP TABLE public.table_status;
       public         heap    postgres    false                       1259    90141    table_status_status_id_seq    SEQUENCE     �   CREATE SEQUENCE public.table_status_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.table_status_status_id_seq;
       public          postgres    false    280                       0    0    table_status_status_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.table_status_status_id_seq OWNED BY public.table_status.status_id;
          public          postgres    false    279            �            1259    33084    tables    TABLE     �  CREATE TABLE public.tables (
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
       public          postgres    false    252                       0    0    tables_table_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.tables_table_id_seq OWNED BY public.tables.table_id;
          public          postgres    false    251                       1259    90157    tax_type    TABLE     @  CREATE TABLE public.tax_type (
    tax_type_id integer NOT NULL,
    tax_type_name character varying(100) NOT NULL,
    created_by integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    modified_by integer NOT NULL,
    modified_at timestamp without time zone DEFAULT now() NOT NULL
);
    DROP TABLE public.tax_type;
       public         heap    postgres    false                       1259    90156    tax_type_tax_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tax_type_tax_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.tax_type_tax_type_id_seq;
       public          postgres    false    282                       0    0    tax_type_tax_type_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.tax_type_tax_type_id_seq OWNED BY public.tax_type.tax_type_id;
          public          postgres    false    281            �            1259    33104    taxes    TABLE     �  CREATE TABLE public.taxes (
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
       public          postgres    false    254                       0    0    taxes_tax_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.taxes_tax_id_seq OWNED BY public.taxes.tax_id;
          public          postgres    false    253            �            1259    32981    units    TABLE     j   CREATE TABLE public.units (
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
       public          postgres    false    242            	           0    0    units_unit_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.units_unit_id_seq OWNED BY public.units.unit_id;
          public          postgres    false    241            �            1259    32849    users    TABLE     O  CREATE TABLE public.users (
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
       public          postgres    false    234            
           0    0    users_user_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;
          public          postgres    false    233                       1259    33221    waiting_list    TABLE     Y  CREATE TABLE public.waiting_list (
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
       public         heap    postgres    false                       1259    33220     waiting_list_waiting_list_id_seq    SEQUENCE     �   CREATE SEQUENCE public.waiting_list_waiting_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.waiting_list_waiting_list_id_seq;
       public          postgres    false    262                       0    0     waiting_list_waiting_list_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.waiting_list_waiting_list_id_seq OWNED BY public.waiting_list.waiting_list_id;
          public          postgres    false    261                       2604    32838    cities city_id    DEFAULT     p   ALTER TABLE ONLY public.cities ALTER COLUMN city_id SET DEFAULT nextval('public.cities_city_id_seq'::regclass);
 =   ALTER TABLE public.cities ALTER COLUMN city_id DROP DEFAULT;
       public          postgres    false    232    231    232            8           2604    33051 $   combine_modifier combine_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.combine_modifier ALTER COLUMN combine_modifier_id SET DEFAULT nextval('public.combine_modifier_combine_modifier_id_seq'::regclass);
 S   ALTER TABLE public.combine_modifier ALTER COLUMN combine_modifier_id DROP DEFAULT;
       public          postgres    false    247    248    248                       2604    32815    countries country_id    DEFAULT     |   ALTER TABLE ONLY public.countries ALTER COLUMN country_id SET DEFAULT nextval('public.countries_country_id_seq'::regclass);
 C   ALTER TABLE public.countries ALTER COLUMN country_id DROP DEFAULT;
       public          postgres    false    227    228    228            V           2604    33254 !   customer_tables customer_table_id    DEFAULT     �   ALTER TABLE ONLY public.customer_tables ALTER COLUMN customer_table_id SET DEFAULT nextval('public.customer_tables_customer_table_id_seq'::regclass);
 P   ALTER TABLE public.customer_tables ALTER COLUMN customer_table_id DROP DEFAULT;
       public          postgres    false    263    264    264            }           2604    106531 &   customer_waitings customer_waitings_id    DEFAULT     �   ALTER TABLE ONLY public.customer_waitings ALTER COLUMN customer_waitings_id SET DEFAULT nextval('public.customer_waitings_customer_waitings_id_seq'::regclass);
 U   ALTER TABLE public.customer_waitings ALTER COLUMN customer_waitings_id DROP DEFAULT;
       public          postgres    false    293    294    294            H           2604    33153    customers customer_id    DEFAULT     ~   ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);
 D   ALTER TABLE public.customers ALTER COLUMN customer_id DROP DEFAULT;
       public          postgres    false    255    256    256            ~           2604    155697    events event_id    DEFAULT     r   ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);
 >   ALTER TABLE public.events ALTER COLUMN event_id DROP DEFAULT;
       public          postgres    false    295    296    296            N           2604    33205    favourites favourites_id    DEFAULT     �   ALTER TABLE ONLY public.favourites ALTER COLUMN favourites_id SET DEFAULT nextval('public.favourites_favourites_id_seq'::regclass);
 G   ALTER TABLE public.favourites ALTER COLUMN favourites_id DROP DEFAULT;
       public          postgres    false    259    260    260            m           2604    73732    itemtype itemtype_id    DEFAULT     x   ALTER TABLE ONLY public.itemtype ALTER COLUMN itemtype_id SET DEFAULT nextval('public.itemtype_item_id_seq'::regclass);
 C   ALTER TABLE public.itemtype ALTER COLUMN itemtype_id DROP DEFAULT;
       public          postgres    false    277    276    277            !           2604    32919    menu_categories category_id    DEFAULT     �   ALTER TABLE ONLY public.menu_categories ALTER COLUMN category_id SET DEFAULT nextval('public.menu_categories_category_id_seq'::regclass);
 J   ALTER TABLE public.menu_categories ALTER COLUMN category_id DROP DEFAULT;
       public          postgres    false    235    236    236            )           2604    32956    menu_item_units unit_id    DEFAULT     �   ALTER TABLE ONLY public.menu_item_units ALTER COLUMN unit_id SET DEFAULT nextval('public.menu_item_units_unit_id_seq'::regclass);
 F   ALTER TABLE public.menu_item_units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    239    240    240            -           2604    32991    menu_items item_id    DEFAULT     x   ALTER TABLE ONLY public.menu_items ALTER COLUMN item_id SET DEFAULT nextval('public.menu_items_item_id_seq'::regclass);
 A   ALTER TABLE public.menu_items ALTER COLUMN item_id DROP DEFAULT;
       public          postgres    false    243    244    244            %           2604    32939 &   menu_modifier_groups modifier_group_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifier_groups ALTER COLUMN modifier_group_id SET DEFAULT nextval('public.menu_modifier_groups_modifier_group_id_seq'::regclass);
 U   ALTER TABLE public.menu_modifier_groups ALTER COLUMN modifier_group_id DROP DEFAULT;
       public          postgres    false    238    237    238            4           2604    33024    menu_modifiers modifier_id    DEFAULT     �   ALTER TABLE ONLY public.menu_modifiers ALTER COLUMN modifier_id SET DEFAULT nextval('public.menu_modifiers_modifier_id_seq'::regclass);
 I   ALTER TABLE public.menu_modifiers ALTER COLUMN modifier_id DROP DEFAULT;
       public          postgres    false    246    245    246            ^           2604    33309    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public          postgres    false    268    267    268            b           2604    33324 !   order_modifiers order_modifier_id    DEFAULT     �   ALTER TABLE ONLY public.order_modifiers ALTER COLUMN order_modifier_id SET DEFAULT nextval('public.order_modifiers_order_modifier_id_seq'::regclass);
 P   ALTER TABLE public.order_modifiers ALTER COLUMN order_modifier_id DROP DEFAULT;
       public          postgres    false    270    269    270            v           2604    90204    order_status order_status_id    DEFAULT     �   ALTER TABLE ONLY public.order_status ALTER COLUMN order_status_id SET DEFAULT nextval('public.order_status_order_status_id_seq'::regclass);
 K   ALTER TABLE public.order_status ALTER COLUMN order_status_id DROP DEFAULT;
       public          postgres    false    288    287    288            f           2604    33339    order_tables order_table_id    DEFAULT     �   ALTER TABLE ONLY public.order_tables ALTER COLUMN order_table_id SET DEFAULT nextval('public.order_tables_order_table_id_seq'::regclass);
 J   ALTER TABLE public.order_tables ALTER COLUMN order_table_id DROP DEFAULT;
       public          postgres    false    271    272    272            t           2604    90180    order_tax order_tax_id    DEFAULT     �   ALTER TABLE ONLY public.order_tax ALTER COLUMN order_tax_id SET DEFAULT nextval('public.order_tax_order_tax_id_seq'::regclass);
 E   ALTER TABLE public.order_tax ALTER COLUMN order_tax_id DROP DEFAULT;
       public          postgres    false    283    284    284            Y           2604    33278    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public          postgres    false    266    265    266            z           2604    98421    payment payment_id    DEFAULT     x   ALTER TABLE ONLY public.payment ALTER COLUMN payment_id SET DEFAULT nextval('public.payment_payment_id_seq'::regclass);
 A   ALTER TABLE public.payment ALTER COLUMN payment_id DROP DEFAULT;
       public          postgres    false    291    292    292            u           2604    90197    payment_mode payment_mode_id    DEFAULT     �   ALTER TABLE ONLY public.payment_mode ALTER COLUMN payment_mode_id SET DEFAULT nextval('public.paymode_mode_payment_mode_id_seq'::regclass);
 K   ALTER TABLE public.payment_mode ALTER COLUMN payment_mode_id DROP DEFAULT;
       public          postgres    false    285    286    286            w           2604    98398     payment_status payment_status_id    DEFAULT     �   ALTER TABLE ONLY public.payment_status ALTER COLUMN payment_status_id SET DEFAULT nextval('public.payment_status_payment_status_id_seq'::regclass);
 O   ALTER TABLE public.payment_status ALTER COLUMN payment_status_id DROP DEFAULT;
       public          postgres    false    290    289    290            g           2604    65625    permissions permission_id    DEFAULT     �   ALTER TABLE ONLY public.permissions ALTER COLUMN permission_id SET DEFAULT nextval('public.permissions_permission_id_seq'::regclass);
 H   ALTER TABLE public.permissions ALTER COLUMN permission_id DROP DEFAULT;
       public          postgres    false    274    275    275            K           2604    33194    reviews review_id    DEFAULT     v   ALTER TABLE ONLY public.reviews ALTER COLUMN review_id SET DEFAULT nextval('public.reviews_review_id_seq'::regclass);
 @   ALTER TABLE public.reviews ALTER COLUMN review_id DROP DEFAULT;
       public          postgres    false    257    258    258                       2604    32806    roles role_id    DEFAULT     n   ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);
 <   ALTER TABLE public.roles ALTER COLUMN role_id DROP DEFAULT;
       public          postgres    false    226    225    226            :           2604    33069    sections section_id    DEFAULT     z   ALTER TABLE ONLY public.sections ALTER COLUMN section_id SET DEFAULT nextval('public.sections_section_id_seq'::regclass);
 B   ALTER TABLE public.sections ALTER COLUMN section_id DROP DEFAULT;
       public          postgres    false    249    250    250                       2604    32824    states state_id    DEFAULT     r   ALTER TABLE ONLY public.states ALTER COLUMN state_id SET DEFAULT nextval('public.states_state_id_seq'::regclass);
 >   ALTER TABLE public.states ALTER COLUMN state_id DROP DEFAULT;
       public          postgres    false    230    229    230            n           2604    90145    table_status status_id    DEFAULT     �   ALTER TABLE ONLY public.table_status ALTER COLUMN status_id SET DEFAULT nextval('public.table_status_status_id_seq'::regclass);
 E   ALTER TABLE public.table_status ALTER COLUMN status_id DROP DEFAULT;
       public          postgres    false    280    279    280            >           2604    33087    tables table_id    DEFAULT     r   ALTER TABLE ONLY public.tables ALTER COLUMN table_id SET DEFAULT nextval('public.tables_table_id_seq'::regclass);
 >   ALTER TABLE public.tables ALTER COLUMN table_id DROP DEFAULT;
       public          postgres    false    252    251    252            q           2604    90160    tax_type tax_type_id    DEFAULT     |   ALTER TABLE ONLY public.tax_type ALTER COLUMN tax_type_id SET DEFAULT nextval('public.tax_type_tax_type_id_seq'::regclass);
 C   ALTER TABLE public.tax_type ALTER COLUMN tax_type_id DROP DEFAULT;
       public          postgres    false    282    281    282            B           2604    33107    taxes tax_id    DEFAULT     l   ALTER TABLE ONLY public.taxes ALTER COLUMN tax_id SET DEFAULT nextval('public.taxes_tax_id_seq'::regclass);
 ;   ALTER TABLE public.taxes ALTER COLUMN tax_id DROP DEFAULT;
       public          postgres    false    254    253    254            ,           2604    32984    units unit_id    DEFAULT     n   ALTER TABLE ONLY public.units ALTER COLUMN unit_id SET DEFAULT nextval('public.units_unit_id_seq'::regclass);
 <   ALTER TABLE public.units ALTER COLUMN unit_id DROP DEFAULT;
       public          postgres    false    241    242    242                       2604    32852    users user_id    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    234    233    234            Q           2604    33224    waiting_list waiting_list_id    DEFAULT     �   ALTER TABLE ONLY public.waiting_list ALTER COLUMN waiting_list_id SET DEFAULT nextval('public.waiting_list_waiting_list_id_seq'::regclass);
 K   ALTER TABLE public.waiting_list ALTER COLUMN waiting_list_id DROP DEFAULT;
       public          postgres    false    262    261    262            �          0    49167    __EFMigrationsHistory 
   TABLE DATA           R   COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
    public          postgres    false    273   |�      �          0    32835    cities 
   TABLE DATA           p   COPY public.cities (city_id, state_id, city_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    232   ��      �          0    33048    combine_modifier 
   TABLE DATA           k   COPY public.combine_modifier (combine_modifier_id, modifier_group_id, modifier_id, is_deleted) FROM stdin;
    public          postgres    false    248   ��      �          0    32812 	   countries 
   TABLE DATA           o   COPY public.countries (country_id, country_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    228   h�      �          0    33251    customer_tables 
   TABLE DATA           i   COPY public.customer_tables (customer_table_id, customer_id, table_id, isactive, created_at) FROM stdin;
    public          postgres    false    264   .�      �          0    106528    customer_waitings 
   TABLE DATA           _   COPY public.customer_waitings (customer_waitings_id, customer_id, waiting_list_id) FROM stdin;
    public          postgres    false    294   ��      �          0    33150 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, name, table_id, email, phone, created_by, created_at, modified_by, modified_at, date, noofperson) FROM stdin;
    public          postgres    false    256   ��      �          0    155694    events 
   TABLE DATA             COPY public.events (event_id, customer_id, event_date, event_start_time, event_end_time, order_type, isac, noofperson, special_instruction, billing_address, created_by, created_at, modified_by, modified_at, event_type, is_deleted, event_status) FROM stdin;
    public          postgres    false    296   �      �          0    33202 
   favourites 
   TABLE DATA           w   COPY public.favourites (favourites_id, item_id, user_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    260   ��      �          0    81949    item_modifier_group 
   TABLE DATA           g   COPY public.item_modifier_group (item_id, modifier_group_id, min_selection, max_selection) FROM stdin;
    public          postgres    false    278    �      �          0    73729    itemtype 
   TABLE DATA           F   COPY public.itemtype (itemtype_id, item_type, item_photo) FROM stdin;
    public          postgres    false    277   a�      �          0    32916    menu_categories 
   TABLE DATA           �   COPY public.menu_categories (category_id, category_name, category_description, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    236   ��      �          0    32953    menu_item_units 
   TABLE DATA           o   COPY public.menu_item_units (unit_id, unit_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    240   ��      �          0    32988 
   menu_items 
   TABLE DATA              COPY public.menu_items (item_id, category_id, item_name, rate, quantity, unit_id, is_available, tax_default, tax_percentage, short_code, description, category_photo, is_favourite, modifier_group_id, created_by, created_at, modified_by, modified_at, itemtype_id, "is_Deleted") FROM stdin;
    public          postgres    false    244   
�      �          0    32936    menu_modifier_groups 
   TABLE DATA           �   COPY public.menu_modifier_groups (modifier_group_id, modifier_group_name, modifier_group_decription, is_deleted, category_id, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    238   �      �          0    33021    menu_modifiers 
   TABLE DATA           �   COPY public.menu_modifiers (modifier_id, modifier_name, modifier_group_id, modifier_rate, is_deleted, unit_id, quantity, modifier_decription, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    246   $�      �          0    33306    order_items 
   TABLE DATA           �   COPY public.order_items (order_item_id, item_id, date, quantity, readyitemquantity, rate, created_by, created_at, modified_by, modified_at, order_id, modifier_id, category_id, item_instructions, status, uid) FROM stdin;
    public          postgres    false    268   6�      �          0    33321    order_modifiers 
   TABLE DATA           �   COPY public.order_modifiers (order_modifier_id, modifier_id, date, quantity, rate, created_by, created_at, modified_by, modified_at, order_item_id, item_id, uid) FROM stdin;
    public          postgres    false    270   .�      �          0    90201    order_status 
   TABLE DATA           J   COPY public.order_status (order_status_id, order_status_name) FROM stdin;
    public          postgres    false    288   ��      �          0    33336    order_tables 
   TABLE DATA           J   COPY public.order_tables (order_table_id, order_id, table_id) FROM stdin;
    public          postgres    false    272   6�      �          0    90177 	   order_tax 
   TABLE DATA           M   COPY public.order_tax (order_tax_id, order_id, tax_id, tax_rate) FROM stdin;
    public          postgres    false    284   ��      �          0    33275    orders 
   TABLE DATA           0  COPY public.orders (order_id, customer_id, date, review_id, comment, sub_total, no_of_person, total_amount, created_by, created_at, modified_by, modified_at, order_status_id, payment_mode_id, invoice_no, order_duration, placed_on, order_type, order_instructions, "Is_SGST_Include", sgst_amt) FROM stdin;
    public          postgres    false    266   ��      �          0    98418    payment 
   TABLE DATA           �   COPY public.payment (payment_id, order_id, payment_status_id, amount, created_by, created_at, modified_by, modified_at, payment_mode) FROM stdin;
    public          postgres    false    292   ��      �          0    90194    payment_mode 
   TABLE DATA           J   COPY public.payment_mode (payment_mode_id, payment_mode_name) FROM stdin;
    public          postgres    false    286          �          0    98395    payment_status 
   TABLE DATA           �   COPY public.payment_status (payment_status_id, payment_status_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    290   Y      �          0    65622    permissions 
   TABLE DATA           �   COPY public.permissions (permission_id, role_id, permission_name, can_view, can_add_edit, can_delete, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    275   �      �          0    33191    reviews 
   TABLE DATA           �   COPY public.reviews (review_id, rating, comment, food, service, ambience, created_by, created_at, modified_by, modified_at, order_id, customer_id) FROM stdin;
    public          postgres    false    258   �      �          0    32803    roles 
   TABLE DATA           o   COPY public.roles (role_id, created_by, created_at, modified_by, modified_at, role_name, priority) FROM stdin;
    public          postgres    false    226   H      �          0    33066    sections 
   TABLE DATA           �   COPY public.sections (section_id, section_name, section_decription, is_deleted, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    250   �      �          0    32821    states 
   TABLE DATA           t   COPY public.states (state_id, country_id, state_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    230   �      �          0    90142    table_status 
   TABLE DATA              COPY public.table_status (status_id, status_name, created_by, created_at, modified_by, modified_at, occupied_time) FROM stdin;
    public          postgres    false    280   �      �          0    33084    tables 
   TABLE DATA           �   COPY public.tables (table_id, table_name, section_id, capacity, created_by, created_at, modified_by, modified_at, status_id, is_deleted, occupied_time) FROM stdin;
    public          postgres    false    252   	      �          0    90157    tax_type 
   TABLE DATA           p   COPY public.tax_type (tax_type_id, tax_type_name, created_by, created_at, modified_by, modified_at) FROM stdin;
    public          postgres    false    282   �
      �          0    33104    taxes 
   TABLE DATA           �   COPY public.taxes (tax_id, tax_name, is_enabled, is_default, created_by, created_at, modified_by, modified_at, tax_type_id, tax_amount, is_deleted) FROM stdin;
    public          postgres    false    254   7      �          0    32981    units 
   TABLE DATA           3   COPY public.units (unit_id, unit_name) FROM stdin;
    public          postgres    false    242   J      �          0    32849    users 
   TABLE DATA           $  COPY public.users (user_id, first_name, last_name, username, role_id, email, password, phone, profile_photo, address, country_id, state_id, city_id, zipcode, created_by, created_at, modified_by, modified_at, last_login, reset_token, reset_token_expirytime, is_active, is_deleted) FROM stdin;
    public          postgres    false    234   m      �          0    33221    waiting_list 
   TABLE DATA           �   COPY public.waiting_list (waiting_list_id, waiting_time, section_id, name, first_name, last_name, phone, email, no_of_person, created_by, created_at, modified_by, modified_at, is_deleted) FROM stdin;
    public          postgres    false    262                    0    0    cities_city_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.cities_city_id_seq', 29, true);
          public          postgres    false    231                       0    0 (   combine_modifier_combine_modifier_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('public.combine_modifier_combine_modifier_id_seq', 62, true);
          public          postgres    false    247                       0    0    countries_country_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.countries_country_id_seq', 29, true);
          public          postgres    false    227                       0    0 %   customer_tables_customer_table_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.customer_tables_customer_table_id_seq', 91, true);
          public          postgres    false    263                       0    0 *   customer_waitings_customer_waitings_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.customer_waitings_customer_waitings_id_seq', 1, false);
          public          postgres    false    293                       0    0    customers_customer_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.customers_customer_id_seq', 21, true);
          public          postgres    false    255                       0    0    events_event_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.events_event_id_seq', 3, true);
          public          postgres    false    295                       0    0    favourites_favourites_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.favourites_favourites_id_seq', 53, true);
          public          postgres    false    259                       0    0    itemtype_item_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.itemtype_item_id_seq', 3, true);
          public          postgres    false    276                       0    0    menu_categories_category_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.menu_categories_category_id_seq', 30, true);
          public          postgres    false    235                       0    0    menu_item_units_unit_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.menu_item_units_unit_id_seq', 1, true);
          public          postgres    false    239                       0    0    menu_items_item_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.menu_items_item_id_seq', 62, true);
          public          postgres    false    243                       0    0 *   menu_modifier_groups_modifier_group_id_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public.menu_modifier_groups_modifier_group_id_seq', 12, true);
          public          postgres    false    237                       0    0    menu_modifiers_modifier_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.menu_modifiers_modifier_id_seq', 47, true);
          public          postgres    false    245                       0    0    order_items_order_item_id_seq    SEQUENCE SET     M   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 187, true);
          public          postgres    false    267                       0    0 %   order_modifiers_order_modifier_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('public.order_modifiers_order_modifier_id_seq', 193, true);
          public          postgres    false    269                       0    0     order_status_order_status_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_status_order_status_id_seq', 7, true);
          public          postgres    false    287                       0    0    order_tables_order_table_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.order_tables_order_table_id_seq', 50, true);
          public          postgres    false    271                       0    0    order_tax_order_tax_id_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.order_tax_order_tax_id_seq', 303, true);
          public          postgres    false    283                       0    0    orders_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.orders_order_id_seq', 87, true);
          public          postgres    false    265                        0    0    payment_payment_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.payment_payment_id_seq', 18, true);
          public          postgres    false    291            !           0    0 $   payment_status_payment_status_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.payment_status_payment_status_id_seq', 2, true);
          public          postgres    false    289            "           0    0     paymode_mode_payment_mode_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.paymode_mode_payment_mode_id_seq', 4, true);
          public          postgres    false    285            #           0    0    permissions_permission_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.permissions_permission_id_seq', 22, true);
          public          postgres    false    274            $           0    0    reviews_review_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.reviews_review_id_seq', 23, true);
          public          postgres    false    257            %           0    0    roles_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);
          public          postgres    false    225            &           0    0    sections_section_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.sections_section_id_seq', 41, true);
          public          postgres    false    249            '           0    0    states_state_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.states_state_id_seq', 29, true);
          public          postgres    false    229            (           0    0    table_status_status_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.table_status_status_id_seq', 5, true);
          public          postgres    false    279            )           0    0    tables_table_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.tables_table_id_seq', 19, true);
          public          postgres    false    251            *           0    0    tax_type_tax_type_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.tax_type_tax_type_id_seq', 2, true);
          public          postgres    false    281            +           0    0    taxes_tax_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.taxes_tax_id_seq', 13, true);
          public          postgres    false    253            ,           0    0    units_unit_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.units_unit_id_seq', 1, false);
          public          postgres    false    241            -           0    0    users_user_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_user_id_seq', 290, true);
          public          postgres    false    233            .           0    0     waiting_list_waiting_list_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.waiting_list_waiting_list_id_seq', 39, true);
          public          postgres    false    261            �           2606    49171 .   __EFMigrationsHistory PK___EFMigrationsHistory 
   CONSTRAINT     {   ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");
 \   ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
       public            postgres    false    273            �           2606    32842    cities cities_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);
 <   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_pkey;
       public            postgres    false    232            �           2606    33053 &   combine_modifier combine_modifier_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_pkey PRIMARY KEY (combine_modifier_id);
 P   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_pkey;
       public            postgres    false    248            �           2606    32819    countries countries_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (country_id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    228            �           2606    33256 $   customer_tables customer_tables_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_pkey PRIMARY KEY (customer_table_id);
 N   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_pkey;
       public            postgres    false    264            �           2606    106533 (   customer_waitings customer_waitings_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_pkey PRIMARY KEY (customer_waitings_id);
 R   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_pkey;
       public            postgres    false    294            �           2606    33159    customers customers_email_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);
 G   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_email_key;
       public            postgres    false    256            �           2606    33157    customers customers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    256            �           2606    155705    events events_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);
 <   ALTER TABLE ONLY public.events DROP CONSTRAINT events_pkey;
       public            postgres    false    296            �           2606    33209    favourites favourites_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_pkey PRIMARY KEY (favourites_id);
 D   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_pkey;
       public            postgres    false    260            �           2606    81953 ,   item_modifier_group item_modifier_group_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_pkey PRIMARY KEY (item_id, modifier_group_id);
 V   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_pkey;
       public            postgres    false    278    278            �           2606    73738    itemtype itemtype_item_type_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_item_type_key UNIQUE (item_type);
 I   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_item_type_key;
       public            postgres    false    277            �           2606    73736    itemtype itemtype_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.itemtype
    ADD CONSTRAINT itemtype_pkey PRIMARY KEY (itemtype_id);
 @   ALTER TABLE ONLY public.itemtype DROP CONSTRAINT itemtype_pkey;
       public            postgres    false    277            �           2606    32926 $   menu_categories menu_categories_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.menu_categories
    ADD CONSTRAINT menu_categories_pkey PRIMARY KEY (category_id);
 N   ALTER TABLE ONLY public.menu_categories DROP CONSTRAINT menu_categories_pkey;
       public            postgres    false    236            �           2606    32960 $   menu_item_units menu_item_units_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.menu_item_units
    ADD CONSTRAINT menu_item_units_pkey PRIMARY KEY (unit_id);
 N   ALTER TABLE ONLY public.menu_item_units DROP CONSTRAINT menu_item_units_pkey;
       public            postgres    false    240            �           2606    33000    menu_items menu_items_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_pkey PRIMARY KEY (item_id);
 D   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_pkey;
       public            postgres    false    244            �           2606    32946 .   menu_modifier_groups menu_modifier_groups_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_pkey PRIMARY KEY (modifier_group_id);
 X   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_pkey;
       public            postgres    false    238            �           2606    33031 "   menu_modifiers menu_modifiers_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_pkey PRIMARY KEY (modifier_id);
 L   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_pkey;
       public            postgres    false    246            �           2606    33314    order_items order_items_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public            postgres    false    268            �           2606    33329 $   order_modifiers order_modifiers_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_pkey PRIMARY KEY (order_modifier_id);
 N   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_pkey;
       public            postgres    false    270            �           2606    90206    order_status order_status_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.order_status
    ADD CONSTRAINT order_status_pkey PRIMARY KEY (order_status_id);
 H   ALTER TABLE ONLY public.order_status DROP CONSTRAINT order_status_pkey;
       public            postgres    false    288            �           2606    33341    order_tables order_tables_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_pkey PRIMARY KEY (order_table_id);
 H   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_pkey;
       public            postgres    false    272            �           2606    90182    order_tax order_tax_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_pkey PRIMARY KEY (order_tax_id);
 B   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_pkey;
       public            postgres    false    284            �           2606    33283    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    266            �           2606    98425    payment payment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (payment_id);
 >   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_pkey;
       public            postgres    false    292            �           2606    98402 "   payment_status payment_status_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.payment_status
    ADD CONSTRAINT payment_status_pkey PRIMARY KEY (payment_status_id);
 L   ALTER TABLE ONLY public.payment_status DROP CONSTRAINT payment_status_pkey;
       public            postgres    false    290            �           2606    90199    payment_mode paymode_mode_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.payment_mode
    ADD CONSTRAINT paymode_mode_pkey PRIMARY KEY (payment_mode_id);
 H   ALTER TABLE ONLY public.payment_mode DROP CONSTRAINT paymode_mode_pkey;
       public            postgres    false    286            �           2606    65632    permissions permissions_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);
 F   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_pkey;
       public            postgres    false    275            �           2606    33200    reviews reviews_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (review_id);
 >   ALTER TABLE ONLY public.reviews DROP CONSTRAINT reviews_pkey;
       public            postgres    false    258            �           2606    32810    roles roles_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);
 :   ALTER TABLE ONLY public.roles DROP CONSTRAINT roles_pkey;
       public            postgres    false    226            �           2606    33076    sections sections_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.sections
    ADD CONSTRAINT sections_pkey PRIMARY KEY (section_id);
 @   ALTER TABLE ONLY public.sections DROP CONSTRAINT sections_pkey;
       public            postgres    false    250            �           2606    32828    states states_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (state_id);
 <   ALTER TABLE ONLY public.states DROP CONSTRAINT states_pkey;
       public            postgres    false    230            �           2606    90149    table_status table_status_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.table_status
    ADD CONSTRAINT table_status_pkey PRIMARY KEY (status_id);
 H   ALTER TABLE ONLY public.table_status DROP CONSTRAINT table_status_pkey;
       public            postgres    false    280            �           2606    33091    tables tables_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_pkey PRIMARY KEY (table_id);
 <   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_pkey;
       public            postgres    false    252            �           2606    90164    tax_type tax_type_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.tax_type
    ADD CONSTRAINT tax_type_pkey PRIMARY KEY (tax_type_id);
 @   ALTER TABLE ONLY public.tax_type DROP CONSTRAINT tax_type_pkey;
       public            postgres    false    282            �           2606    33113    taxes taxes_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT taxes_pkey PRIMARY KEY (tax_id);
 :   ALTER TABLE ONLY public.taxes DROP CONSTRAINT taxes_pkey;
       public            postgres    false    254            �           2606    32986    units units_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.units
    ADD CONSTRAINT units_pkey PRIMARY KEY (unit_id);
 :   ALTER TABLE ONLY public.units DROP CONSTRAINT units_pkey;
       public            postgres    false    242            �           2606    32863    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    234            �           2606    32865    users users_phone_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_phone_key;
       public            postgres    false    234            �           2606    32859    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    234            �           2606    32861    users users_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_username_key;
       public            postgres    false    234            �           2606    33228    waiting_list waiting_list_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_pkey PRIMARY KEY (waiting_list_id);
 H   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_pkey;
       public            postgres    false    262            �           2606    32843    cities cities_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.cities DROP CONSTRAINT cities_state_id_fkey;
       public          postgres    false    230    5003    232            �           2606    33054 8   combine_modifier combine_modifier_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_group_id_fkey;
       public          postgres    false    5017    248    238            �           2606    33059 2   combine_modifier combine_modifier_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.combine_modifier
    ADD CONSTRAINT combine_modifier_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 \   ALTER TABLE ONLY public.combine_modifier DROP CONSTRAINT combine_modifier_modifier_id_fkey;
       public          postgres    false    246    248    5025            �           2606    33257 0   customer_tables customer_tables_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_customer_id_fkey;
       public          postgres    false    264    5037    256            �           2606    33262 -   customer_tables customer_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_tables
    ADD CONSTRAINT customer_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 W   ALTER TABLE ONLY public.customer_tables DROP CONSTRAINT customer_tables_table_id_fkey;
       public          postgres    false    5031    252    264                       2606    106534 4   customer_waitings customer_waitings_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_customer_id_fkey;
       public          postgres    false    256    5037    294            	           2606    106539 8   customer_waitings customer_waitings_waiting_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customer_waitings
    ADD CONSTRAINT customer_waitings_waiting_list_id_fkey FOREIGN KEY (waiting_list_id) REFERENCES public.waiting_list(waiting_list_id) ON DELETE SET NULL;
 b   ALTER TABLE ONLY public.customer_waitings DROP CONSTRAINT customer_waitings_waiting_list_id_fkey;
       public          postgres    false    262    5043    294            �           2606    33160 !   customers customers_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_table_id_fkey;
       public          postgres    false    256    5031    252            
           2606    155706    events events_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.events DROP CONSTRAINT events_customer_id_fkey;
       public          postgres    false    256    5037    296            �           2606    33210 "   favourites favourites_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_item_id_fkey;
       public          postgres    false    5023    260    244            �           2606    33215 "   favourites favourites_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.favourites
    ADD CONSTRAINT favourites_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.favourites DROP CONSTRAINT favourites_user_id_fkey;
       public          postgres    false    260    5011    234            �           2606    90165    taxes fk_customer    FK CONSTRAINT     �   ALTER TABLE ONLY public.taxes
    ADD CONSTRAINT fk_customer FOREIGN KEY (tax_type_id) REFERENCES public.tax_type(tax_type_id);
 ;   ALTER TABLE ONLY public.taxes DROP CONSTRAINT fk_customer;
       public          postgres    false    5067    282    254            �           2606    131111    reviews fk_customer_review    FK CONSTRAINT     �   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_customer_review FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_customer_review;
       public          postgres    false    256    5037    258            �           2606    114723 !   order_items fk_order_category_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT fk_order_category_key FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id);
 K   ALTER TABLE ONLY public.order_items DROP CONSTRAINT fk_order_category_key;
       public          postgres    false    268    236    5015            �           2606    98348 *   order_modifiers fk_order_modifier_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT fk_order_modifier_order_id FOREIGN KEY (order_item_id) REFERENCES public.order_items(order_item_id);
 T   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT fk_order_modifier_order_id;
       public          postgres    false    270    268    5049            �           2606    131106    reviews fk_order_review    FK CONSTRAINT     ~   ALTER TABLE ONLY public.reviews
    ADD CONSTRAINT fk_order_review FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 A   ALTER TABLE ONLY public.reviews DROP CONSTRAINT fk_order_review;
       public          postgres    false    258    266    5047                       2606    81954 4   item_modifier_group item_modifier_group_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE CASCADE;
 ^   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_item_id_fkey;
       public          postgres    false    278    5023    244                       2606    81959 >   item_modifier_group item_modifier_group_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.item_modifier_group
    ADD CONSTRAINT item_modifier_group_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.item_modifier_group DROP CONSTRAINT item_modifier_group_modifier_group_id_fkey;
       public          postgres    false    238    278    5017            �           2606    73739    menu_items itemtype_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT itemtype_id FOREIGN KEY (itemtype_id) REFERENCES public.itemtype(itemtype_id) ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT itemtype_id;
       public          postgres    false    5061    277    244            �           2606    33001 &   menu_items menu_items_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_category_id_fkey;
       public          postgres    false    236    244    5015            �           2606    33011 ,   menu_items menu_items_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 V   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_modifier_group_id_fkey;
       public          postgres    false    5017    244    238            �           2606    33006 "   menu_items menu_items_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_items
    ADD CONSTRAINT menu_items_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 L   ALTER TABLE ONLY public.menu_items DROP CONSTRAINT menu_items_unit_id_fkey;
       public          postgres    false    5021    242    244            �           2606    32947 :   menu_modifier_groups menu_modifier_groups_category_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifier_groups
    ADD CONSTRAINT menu_modifier_groups_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.menu_categories(category_id) ON DELETE SET NULL;
 d   ALTER TABLE ONLY public.menu_modifier_groups DROP CONSTRAINT menu_modifier_groups_category_id_fkey;
       public          postgres    false    5015    238    236            �           2606    33032 4   menu_modifiers menu_modifiers_modifier_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_modifier_group_id_fkey FOREIGN KEY (modifier_group_id) REFERENCES public.menu_modifier_groups(modifier_group_id) ON DELETE SET NULL;
 ^   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_modifier_group_id_fkey;
       public          postgres    false    246    5017    238            �           2606    33042 *   menu_modifiers menu_modifiers_unit_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.menu_modifiers
    ADD CONSTRAINT menu_modifiers_unit_id_fkey FOREIGN KEY (unit_id) REFERENCES public.units(unit_id) ON DELETE SET NULL;
 T   ALTER TABLE ONLY public.menu_modifiers DROP CONSTRAINT menu_modifiers_unit_id_fkey;
       public          postgres    false    246    5021    242            �           2606    98338 "   order_items order_item_modifier_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_modifier_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 L   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_modifier_id;
       public          postgres    false    246    5025    268            �           2606    98343 '   order_modifiers order_item_modifiers_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_item_modifiers_id FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id);
 Q   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_item_modifiers_id;
       public          postgres    false    270    5025    246            �           2606    98333    order_items order_item_order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_item_order_id FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 I   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_item_order_id;
       public          postgres    false    268    266    5047            �           2606    33315 $   order_items order_items_item_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_item_id_fkey FOREIGN KEY (item_id) REFERENCES public.menu_items(item_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_item_id_fkey;
       public          postgres    false    244    5023    268            �           2606    33330 0   order_modifiers order_modifiers_modifier_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_modifiers
    ADD CONSTRAINT order_modifiers_modifier_id_fkey FOREIGN KEY (modifier_id) REFERENCES public.menu_modifiers(modifier_id) ON DELETE SET NULL;
 Z   ALTER TABLE ONLY public.order_modifiers DROP CONSTRAINT order_modifiers_modifier_id_fkey;
       public          postgres    false    246    5025    270            �           2606    90207     orders order_order_status_id_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_order_status_id_key FOREIGN KEY (order_status_id) REFERENCES public.order_status(order_status_id);
 J   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_order_status_id_key;
       public          postgres    false    266    5073    288            �           2606    90212    orders order_payment_mode_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_payment_mode_id FOREIGN KEY (payment_mode_id) REFERENCES public.payment_mode(payment_mode_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT order_payment_mode_id;
       public          postgres    false    266    286    5071            �           2606    33342 '   order_tables order_tables_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_order_id_fkey;
       public          postgres    false    266    5047    272                        2606    33347 '   order_tables order_tables_table_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tables
    ADD CONSTRAINT order_tables_table_id_fkey FOREIGN KEY (table_id) REFERENCES public.tables(table_id) ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.order_tables DROP CONSTRAINT order_tables_table_id_fkey;
       public          postgres    false    252    272    5031                       2606    90183 !   order_tax order_tax_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 K   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_order_id_fkey;
       public          postgres    false    5047    266    284                       2606    90188    order_tax order_tax_tax_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_tax
    ADD CONSTRAINT order_tax_tax_id_fkey FOREIGN KEY (tax_id) REFERENCES public.taxes(tax_id) ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.order_tax DROP CONSTRAINT order_tax_tax_id_fkey;
       public          postgres    false    254    284    5033            �           2606    33284    orders orders_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id) ON DELETE SET NULL;
 H   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_customer_id_fkey;
       public          postgres    false    256    5037    266            �           2606    33299    orders orders_review_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_review_id_fkey FOREIGN KEY (review_id) REFERENCES public.reviews(review_id) ON DELETE SET NULL;
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_review_id_fkey;
       public          postgres    false    266    5039    258                       2606    98426    payment payment_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_order_id_fkey;
       public          postgres    false    292    266    5047                       2606    98431 &   payment payment_payment_status_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.payment
    ADD CONSTRAINT payment_payment_status_id_fkey FOREIGN KEY (payment_status_id) REFERENCES public.payment_status(payment_status_id) ON DELETE SET NULL;
 P   ALTER TABLE ONLY public.payment DROP CONSTRAINT payment_payment_status_id_fkey;
       public          postgres    false    290    292    5075                       2606    65633 $   permissions permissions_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE SET NULL;
 N   ALTER TABLE ONLY public.permissions DROP CONSTRAINT permissions_role_id_fkey;
       public          postgres    false    226    275    4999            �           2606    32829    states states_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.states DROP CONSTRAINT states_country_id_fkey;
       public          postgres    false    5001    230    228            �           2606    90150    tables status_id    FK CONSTRAINT        ALTER TABLE ONLY public.tables
    ADD CONSTRAINT status_id FOREIGN KEY (status_id) REFERENCES public.table_status(status_id);
 :   ALTER TABLE ONLY public.tables DROP CONSTRAINT status_id;
       public          postgres    false    280    5065    252            �           2606    33092    tables tables_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tables
    ADD CONSTRAINT tables_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 G   ALTER TABLE ONLY public.tables DROP CONSTRAINT tables_section_id_fkey;
       public          postgres    false    5029    250    252            �           2606    32881    users users_city_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id) ON DELETE SET NULL;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_city_id_fkey;
       public          postgres    false    232    234    5005            �           2606    32871    users users_country_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(country_id) ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.users DROP CONSTRAINT users_country_id_fkey;
       public          postgres    false    228    5001    234            �           2606    32866    users users_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_role_id_fkey FOREIGN KEY (role_id) REFERENCES public.roles(role_id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.users DROP CONSTRAINT users_role_id_fkey;
       public          postgres    false    234    226    4999            �           2606    32876    users users_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_state_id_fkey FOREIGN KEY (state_id) REFERENCES public.states(state_id) ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.users DROP CONSTRAINT users_state_id_fkey;
       public          postgres    false    234    230    5003            �           2606    33245 )   waiting_list waiting_list_section_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.waiting_list
    ADD CONSTRAINT waiting_list_section_id_fkey FOREIGN KEY (section_id) REFERENCES public.sections(section_id) ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.waiting_list DROP CONSTRAINT waiting_list_section_id_fkey;
       public          postgres    false    250    5029    262            �      x������ � �      �   �  x����n�0�ϻO���]I��[��h��s�e�f���~����,P�6�D�[8�CRH�e��b_-�y(�A�(e��^�պ�*���S�O.z[��T)Jݗu���r�;���z���?�B������Ʌ�hK � 7�����1^��gj�7��n�Znʮm�!os�],>Of/�C�C� }I뼤x�J��ɍ���Vg�|MS�K�RA���s7�ɻ���z�;�x
ˍ:$� �����g���l�@	R��zxX}�A
��H�!�R[�)�m��PQ�����̒TPQ�mv߯1W�
!��f�/>�#�ސ�,�l����):�"-DY���5}�,�@�Zf���1�x&�	�������!^H`�!e��Ov��:$)k��KW��O�t!�����-xraJ�0���6�GwI3)L8��9"�=��Ha�!em�����WR�qH9?[vy�����|C��e�_��œ;����6��jͫ$      �   �   x�=���0D��a�`�N�����#�m�H�S��V�v���R�i�����%]����^�KYvD�&F����R�yCs��tn��&�4Z��5ُbS�ӹii����d�b>7�9�9����E�nN�`7Ǐ����T&��d���J�1Q�a8TΨ��`yz��_��ee���x��٨GJ\���_�;��xڦ���Q>����>N�      �   �  x�}��n�@F��>/���s#�J�zQ7���[3!����Z��{I���o}�w K�B�ln˻��Y����hVEӔ�Bv��/S�AWZA���~��Q�6dCa��J��"c2kZ[�ƭ굫�
B.�)��w�a��_���+�kڢ^����B^ӽD�j4� W���
Ǒ4� ��!��0������&�>N!
we����.ľOd,\C���1I<z2� �����I�VS�DY%�q�^�ݘ���N!�*:�%D2k8�(��Q΢#�`HY{�3�����4�dHYE���-Cʪ�Y"�0fHY{��,,RVŗ�rY�MX0�����l�S8��RVӶ��'��bHY����<,RV��ǫ���!eUd�B�I�c�!2�������e�SHo���EC�j�:�W%��������`ؐ���O>F�d�`ܐ��3�����      �   Z  x��VIn1<�_�{���������4����}��dU����>�>H����Dꨝ�9@��Bz�wd~"$hs&W��$�{5
)��ص��$�rt�'$u��R�a!ͫO��?1:q��(A�CY.�՛
�mh����.�ɛ
�d�Wd-	y�_�1H�����ˋR��ɅR���0�}ˤ�<�|璉Xs!N21LAg��F�k��L(��	�.�m0J�hoQ%�L�ܵ�zC�E��6�$�w.���Œ��y��Bx�iz_2;ZK��n5��z��5$#�5{��7}���S��E����l�>j��rb'fƌ�[�!Q^����s�ڐ�v<S/]p,SpR�&�-9��xa�`8T�^�L�6OGh=1:�C�*�I$�(<s���r�����{"�K=��Rh�Y��^T��i��wkW���H VMo����Ɖ(ۤ|�mR��� ��>Ǐ�ȑ����E��{nX�O��Źu�.�&��Y�6�G����%�\6T�K@�ڦ����CQ�M=�L�3�6r�A���f�"�x����!+�m_��iGŚf�˥C�kM���h"�O~��u@s��y��F��y�����E���"Ն��{W���F&����F)�Hun�v�p!����0���n�l�= �3��#׊�����σ�Z��F�G��VmDY��+/JC�L_'��6��lb;Ld�K�т4��PQֻq	dh�~�8�F}��0\_ۨe�cB�ͯ��%q�v�ݵZF���K&�;$T}��s��F�>�3�/�a��$��9��~@���C����(O8�{����3N܌��[�p^�X�&Nޮ#tp>�i� 9a %      �      x������ � �      �   Z  x���M��@��ί�m4���Ņ$$�$8�%tӏm���
��i��6�j�@�2���Ol�6���f�;�^͛j���̿mg/W�f;[��ɕы&�����V��#��s$�7`� M]�?z\9�4�uL�	�	�Wd'hQ�P��h�iOHN���z]� �J�GT'�|���p�d#�!uLrh���ժ�-���S�^"Zq�t�����>
�d|A�e��7���S����a��(R��u(ɨ�@��j�:@���btB,~e��2$�$X�!f���ha��=���j�A6IL��4^FH$=����7o���:�X>�cA��P����ΖA��Q�qN0��z���j�y��� k�sy,?A�:K�2m��DqX`T������;X�̢�[�gh��s���d]7x12�!��(R
u��V����4����Yw|"�tomxQrl���~Q�
\�׏ ��[�.xGO��sI6� �بo6MF4B.o����Bo_6�a�y_mWj����y����5AL�u��vtL�O�,w��Z�]>ZvZ_��8��T�.[.�.��jw��~��]��U*�.��A�-���	dD�l      �   �   x��ѱ�@�<��\{�!l�Btu��i<8y{�2����'�R$ A*:��2"Q�"˥��DB�J���?���
�<$����|�?=��U�uN:�4�TF��3"k�����PCQ9c�5 �dT�
	�a�4�����b���C��cƙ�5�K6�^-/���m}cx
9�A| ���z      �     x�}��m1�dn��"�Z��&H��-^5#�QlP i@ $�${�=����9J%�c(b�d.�1gě�?DQ���Fʌ�-�k�O���Ȣ�ώ_���蘣&�������&-D%�c�"�}��A���^1޵wU��1v��c����@s�Wi�5aG$n�/�1���ch{�����t�/��	%�chv_�|�ú(F��d��^�_�iߔ�B�ף��[�x�	�8��Ίj!^��#��too��ӎ�k ��%ί      �   Q   x�-���0��RLd.;�%��X[<.�C��-�VM����NG��7t����)����)��vL���H����%�      �   $   x�3�KM���2����Ӆr�A��y f� �`	      �   '  x���Mo�0���_��]��o|L�J=�C�s!`K�V@�j~}M�J�J�dϼ3㙱Q���r��Sߺ~.��s=�ߗ�<B �qu`"��)�XI��L�wL9�ހT���p���D8a�T)��&����ʇ��� ��a�1'��F�TR7��jl~�uWd��g~�@��(K�A!����Ak��|��t�M(n5s�P-�N�;��������ps�����K(~�{Qz��melː�}F���a������]:��h"�T&6O2�B����Mt�Y�F�HKkt��agb��qj��ڣ��b��y�~��TEA�EaӗAH�B��P7�_�kdjǙ��*���N^!��Uþ���e�6�cQ�D�qx!������0ޟ�?c�!��!�Z(��<B����N���6��񅡊Us��UZ��m!��}�N���f�|K�į6>Rn�Y���m�s�C����l�;��|,בa�j��h��Bco�׹o���"褢��*s�������}z���q*8S2s��rK	!� �٩p      �   .   x�3�,H.�4�4202�50"#C+S3+S=C3c<R\1z\\\ ��      �      x��X�n�:}6_�}�z�;��VZ�T��Bb�O��&NI�P��{�~�;@	�l�jTAO�9Ϝ��I�f�.��e4Y?�kZp!0�J���0���(��2c?��F7�/���J�H5pa������J6k�U�m�h�������I��n�ȧ����#z]�:�T�M�^�B�����hSay�QZ9��2���f��yv_�$�b�:�L��K�P��1�T�Q$��DWs�j��h���l�L�&oТS���J�à��tD�6)ԡ��k�aɘ� D9��P����O�;��ef��gG�b��X�bµ���0^�b ���a�*fs��C�@\�^+�����P`p��$��$j�WJh����_,?�w��Yv-R�P����z�@����>����Y�Ȣ�Ư*��73ne�	1���ݝ�M�N#�}fώHJB�v�6��	,G��]�|ݸբr;�[KB�~}���>�LN��zq���a[&Rw$�o���Ť��G�=A/!!�����"f���KR����w���,mMR��\�-�S'�!KM�Z�el��� �<-X^t���%+�j�O���G�V�n_uP��x�wb�9*mt2���c����`����3�8a�I?s^�D~>��t���P�v��o����S�!N�0��ݙ�������\Ǳ�_������E����/�r�L�β�u$#���n���j,�x���S������?Y��S��Lx��3��N���̕�s�;��dX6E�����J���-���mGю�g�:�n	~Q��AWi�;���z�~�r�L��e��x�����X�eA��o|��IjfpKW�<�Z�~�=
�s;�q��)7ek��
�
)%�d�ҳNܿU��;�8ʹɄZ'�֮ܜ����&&�V�`�G��&[V/����fB������J�N�N���a��'�$kW�Y�]ևg�	y*��U�/�Cv��/�0�8�S������%����LP��3~�x�S$�u$�������mF���d�!�YM�_���'t��p��!��}���췪��e�ۺ��o�>@�|.��m��\���
����?�,���]�j���KϺ�a@R~���w����/��r�9=th�BI�"С�Cb�A���T^��e��fg�^N�Ðt���������{�^�dd������@_�O�ܭ�*����͇� ��?S��U�.�E<��#�����w      �   �   x���;n�0@g��@~DY���m�����jI��Yr��N�+��>�����5�k?��	v�)Wc>��xI��ؿ #�e��b��"z�����q�M�v͛��"���p����}�>�~�b�S�u��u"xo�.�����RKa^R�c��B�Y��Ƭ+�c$g��������������I\�`ى��?v_���~�e*W�(�v�MBxK����T�X�2U(Qt�V���1�1��`      �     x��V�r1=K_a> �^��8�����L�&c��8)>��Lf1G'�R/�_w�Իr��QVa�Z���~]�+9�M_�������E@���
 Y/ǀ�s�v��������>|��+��.��|a}�Q�z�I�4���벯�~q�r�B���5�������MW�hz���E_W}=6�+��b��X�YP[������,��U��_W�B6��gH�>!�1΂��z�c�+WO�"?�H��>���U���r/�}
{��9���Y=b�,�9L��'�`^F�{�Y<c�P�]�k���>YL�U_./$�<�yʂ��\;��pB�0�l�ςZ�y��w��84Rd�q�SP[;�b�s��PJFC�a�2C�^�̀!1
��OA�q�!{�Г^�v��>և33�Nү&H�/SP�z����0�����:#<�Szj�q;� ��IȨ�^ޕ����b��(��)ŎA-�\�P�����b������f�G�@��r��9��N�g+��NѡK��Am�	�z�I��x"��0T@�'t:5���$"�1�,����u\fVmU�˕�1��8+kq�1�����;�al��[a�=���H�G�sbj$��[?Jui�~�鶻���v�v��D%� z�.jT7����x��Ѱ�P�����ʁچ#���#˩/��o�Ҋ@����p!j��0�q8
��,��JTv�Ya�r��:���þ�^��5�vĩ��^�,�n�d@�~�ӟ���'��;�      �   �  x��ZM��<���w��$���!A��^�!����ڗ��P==3�)���1��JE��n��&�/������n(iI��������j��U�/IV�!����H����>���������w��zW�!�ɖ�}N�\��'HD�xW�A��]r�d!P(9 w 9���O�㶠�M+�5s�{����s3� �����_@?@W��5g��D�0x�rc��yB��2���y�#�k%�����r]�"+ԥr!o"�L���ǵ��+��� K�z�޾�fH?����[�����o5%s�(�ȃ| �[��ա�iM�P��'���-^������Z�Z�*f�ֺ���W�w:�k�H���RӤ;"��7v#�S���g�FS�ζG��ݭww�z<s�ϼ~@Z��Ԋ�Z��D�~�������߿}�����
(�M(~�׏d��uB��	�*�&���kw�V����˘r&�����}��>�����T=�����59���P%'�Ū��]�Q�{-����|��[�K�BS|�iSZ�E��y�A�F�Ɗp��(�^�-s�#d��E�n�1�i]ekߒ�|w!�p7���C����c2�dt�A�)�S��Su	�������R3Kq�A$���$���Jd�=S���a��S�N�V�5�bU]�#��Ӭ�%�P����=��D�ѻ9HC��߂��b]J�n��!�����<�y��_!UE�y�G����^���FH���J~�������Ǐ���Bs
��0����� ��R-���"�{{��j��b?nԹy�S���mw!̾� �;K;P��<�F�nDp��Z�l-K�́S�d��*������a&Fr�@����DsxqM��@1���̅�P�M�2� ���1eu�n"��vw@}���r�)�rl���NvO��'�[4W(ab;�a7�kE��r���wQ!�#��ql �F%��D4�8uٽ�-.���唋S�#��SM7�R���+y2�8>�L���±oB��d)�eo���B�߷�Y��%f�9F����������4p w����ׇ���y�TSQ�����t���]vG�2��,C�?�m2��
���B��p��/k��f�,A[q!�L�{/��'���l�T0yOD"H&�虺�'̌��b:�Xt#$;���+j�����\aAR3=�䠸�^gƲ�3��-��0�S[��Eo�B+I�mG���\��"��f�k���v���ݪW��'�R��P�����1�_�C�������5�huƪ��O�	dg�7k��o3��Y_��O �m����X%�W�!`dݶ�p���QfN���N��9��}��㛱B�y���\��cQL�r�F��'+��B���`1����
o�b��j+�~�b�(/�Uj�A������:~����]_�'�2t¦����<���dh�ȃ6�t�"�n���;�j=��.��4<�@�����������+?�ԧ�v�mb2'c�F�2�>D�^����h,�Ԥux�<����Ȍ�\ʝת���B�!���*F��tm�3��l#���c=���{���WF��Յ쬇j�ƚo8D␖� �Xψrx��˩�X�j�Lk��G�JBr�Ly������4�������h�by���R��̾��);�9�R{�#��5���??���������8�x�ɨ}�R{�<�T8���>B�.��q��z�,k{d@����S!#�>{���Սڝ�3=��[�ؼ��:�R�#�^�U^��H��
��r�R��2Y:�{���n�Օ`!N E�v_��{�׭���1T�S`�cܙ�>x\6�g8j+��̭�u#:'��.�ܞ��q;aэQ�V�L诗��ylkJ[�Ԇ
�dF}V���'�~R�k$��n,�ő���b��(�֕�ơg���<�R%�p�G�>���"��;���{�}�]��V4Y�38�h�O=
�?f���$Q�.KMc�
!:���u����zzs�      �   �  x���kn�8F����IQ"��Y���:�tS�aE�(�9d)��� ^���I��WzQ:R������TN�� �^�T_� _��KF>�� �	N��*��I^T�%j|~���?������y����'�i�;��[���24��(�^�����.K8҉�(��C{Qr;WIC��*o:BM�O��8�s04h/����B��ˢ;T��Z�C[Q��`����>�{:�Lg���k���-i�#�d��ދR	5�|��1����m&�v�j7�JUً=_�/��*���p^�w����)�o���ܻ^��_��r2Z����^���tȚ�|(�׽��K,.l������ ��������k:�bN�{q�K(����D=S�9��6W��h(�7�R#��㭻���ϜO�jJu�YL::�J��@P�^�����G���w?y����-8���Xp&q4@���zB:*W��"`��P� �ȼ?M�@�L��F�ZIh/z�����FOm�)�����x!�@½�+k�C�x߈�Id/|�x�P9��=#����7�l��{q\�1�/��������Zr���I0֞!���fk��z�dhgI�í�����Ǝ֤��,�+�x�()����bW��9�9	&��]�f���{�������@�l��v ������%��o���T����xA���8��o����S~�Ł���zDˣ�L�O�wk�3���gw���2'�,z%ܝ%�yoDa�ynO���@�m��i'])�sS ��Fp�e�{q��#��H�+*�	2�E_b���#��1�q+NBek�\O��:I-ϡ:�>�[�Bu�e����ȗ��Za�I욺8�A����*���K�3>�8�: �s�|$�i�\���Ys�
"r 7�������9��6�y��̢�T�G7�7D��5�#?4�[3��g��?4�;�mu���8�c�E'�?߃�e�=��%u�_�o��d/��~�cs�ٷjJ����ۢ���}# �c.N���X�7D�	���?��7��G��8�c7*Cص^�;��΢Wl�ǦoCh����8�՛�^���b��x�~]�G���b� ��q/z;��~�Q��~(Q��)z?k��3�etzD.����א��t�!���O��˛_R��A���F:��x�Z�`W�1w������Ptn��f�'q�s��[�T
ދޏ?��awĽ8�k���jqS��ֽ��U��Eo�m�*2,n�Z�zF�:�G��d��@���(�eq ���(�z$N�đ߆���鿿���0\_ڵ�k?K��ͯm8��y�/׽8�!�?���T~{#�����1�����8�?�#�}C���_�v�mw�Ys+�����e/N8 ��9�f]�E�-@%z����8�^�5�g*}(����E���/���v?I����מ�K>�D����{$��+�|I}|p��d��t��z�%G���f�'�{��#��?vx��ɾ]��W��w��>��#��f�'q�瞿X���o��YN�����E�}|��()��8�K�?Њ�p=�)q-;�٨�����u=��?m��-�m5��ߕ\!g_��k�n�\i��?~k����6�`��b�I���K��'�2�'ѽ���___�C���      �   T   x�3�tK��IM�2���S���I�2�tN�KN���p:��䤖 ٦���Ee@��g�B@Q~zQjq1�9g@j^Jf^:W� ���      �   �   x�-��0ߢ���q/鿎��_�l!@r���hQ#�Eu�(��&�h(�S7*�A%�/�V�A�jS����q�6X,�̵$WZ�ߦ����n���\�ו;�w��n�hN�M�	�d�����&�O���%搊ٳ%���8�Dbv�D�-ј�0E���n�������3�.�      �   �  x�]W[�� �N��^~�����_G%H��ӏ���8FL���~�+���t�\�����t�U���߻����ZyZ����N�����Ls~�/�x��#9BƱ�+���6(�j�irgY4f�3����PV%�P�J���5�<=yy~֎��Ѕk
yj>����z�߿/�-f�3��vd��BN��XPW��8�ʵ=3��4|��0*/�u��?Z�H�h����޵�ڡ\-�g��b��jw�}�8G`��8L��>��3���B��A	��f:��ێ��N�wM�X�hN�pל�<���)���|a�ѶOv_$�$z�k���jh���4���~B���v�)59U*��s����ΞX��~H����t��� �V�`�uf�Y�,lc��,t�f�>e��0t׉e�;a�
�$껹�ڔXV�7��hq"#�%$Gm6b��EM�|e��;5[�e鞋&��;^���6�k�QJ{��W���6|]�zZ}}=����ѱ��C��e�(T��+N�k����7�����Y�I5V�?W���='&�0\@i�x��J,+l�A���jJt��y�\�ѝ�+=�Xc\��aaxo[���\/�n0l�˖�E�v��.��"D�4%�/jD�&ũ�=�pN�;U'�#�S��85�T����F�9E�Sj𙂇�r�e.F�u��Xl�!��
w+3�^�׈�fn��W�0��<�B�J,+l���R�kQ���a��4��"�h�����*�%��HnĲ�B�(玮ST���2��1Y'^-��c@��}����[`���]�H�I�1Y#���lĲ�~_��'��l#
���1؜���.��z �5�]E��F8.��0$ӱz�QY%{�
���B�	7�fuN!��5�e��Ȇ�ٸ��W��nĲ�(�/�6�C5YsW�5�����=����Wc�-�ch�sc��vnL�E�a��\B�6T�F�pc@#d'�FaCU#N݆�F87���I��Ԍ���f6����T�Ŵ˩�2{�r�z�z��� o��Je��ztސ���4j�����jD���(�j�D�S)}���G����u�Eˠ�?Ч�ٻ�~�	��(x=��/��(�<����~wi��{�P����
ow*���h�-�6>��*Ѣ�{���t�NB      �   '	  x��ZM�ݶ]���tY<��IR���t���.�1��(���"��CI��%�z�p`/l����̧�q��y��c������#�u
'�;��i�Q�d�����_���b��� �1��:.�,@L������������L�|<'�BL+� g�U���q�����z
#��]P8\���U�g#�>�� ��z"�9 ;w02i	���@
#�2���&��9�Z���fSAt�&-~��_] �����?�a?��;�]@0e�9=�O���dF{���Ȥ���O. I}l���'5�Y�.�v-���;&-����I�О�������_eǟ:��;�Ť9kV���&-�|��p! ����y˓|��N�ؒ`��тyV唝�32i�۫��W�0v�gW��c\��DA-�S�K�D p�{Ԡ�K��C4%u�Y�H7�餝��g�˗��\H�i	�]ߤ��o��\�X�lŋ{��x���@��bP��/J��"�)��?�j��kW�;���M�`#
X�\�V������p��� �2� `$�@'xJfZB+��Фa����p�rs~�#���7��ۧO���NB5
2Ӄ&� �A�R]�b8*�;L��<�Q�>D:;�O��z���/�_~����V�?�x�#��ʈ��"M�{m>��[�3�Q^�`�O���?�1�DG�Z9��	y�%I-�o�%|�4
��o��2���*���.xf0
��3PKH�3X"�+�Z�:�b��B��K�`d��jԪ��A��3P<� �A|ֆ�LB��ޤѨY}O`T
y��%X�x�q�K�n��0FGF#�NF�͗ %�ClW�xʸ)�M_-�r��� �Fz�NH�������h��ƾqJ��3�@�9���k�6�+h\�X4uE�Ɖ�8�s�>���@X�͜�����4�\�F�ouMھ�rh;�!�m����k]a��M���5���D�m"L�I{����"%N�ؼ��x7���Mb3v浡�E�Qћ�G&����r��Bsw&m7Q�����`uL�ܬ�5d��bd��\�Ʌ���Y?z�s��Akϝ�7��3d���oMZ��r!��~Z�����ҪV�	�&irf ͻ�2h3�2ږՔMǑ�����B����dsL��dR��A�X'h`�ARO�=묉����*.�gQ��a�B���u�4{�ӛw���TٍB��-�z��8{�qҁO��G���5z���.,	:euV�#������@������K�Rjel6כ_^�
d���LZ�닓�YC_Ķ�_ɓ��;� ��t�l�r���E�㚴�����مľ��?�������"e����暴�/v��������[��Y������_�s̤�R�&-��
\]X��'N���9�T��+j���3a���0.b�,.��5i�]���(�l�Jc�7��zΛ��n��>�����!\���u>\X"O}�I���w rT.����0.�<X�s���I��q�z��9M��m�� e$�=(�6����p�)���OZZж&���`v:�(�'�.Rf����,�?{�A���Z�_�����rC�&ԅ��IK`�@�\��srb�|2���������9ճ��0�5`&-x�6!���~�|���ɇ��x�hr�G_����-������k��_u��R>���c��b ����1i�ӥ|֤:lM1�(g�`��d<��br*ۍP���M?&-|��� #hׅ��y�-��Y<�V�I����1��u�E��s�#�����/����F]�����'�91�+��F�� �,A�Lx�~��}.�fh������|����*Rӻ����}l�v?���?�U�U6Z����:ӣ����kw��YU7�_���R��d1l�j'���'��q�q��+lo��~j�K�/�6c�O"t��¤�a劣GZX� )�J���̖��1a���T��m`���|�r��G�T�"72iX�߇���""V�X��/���H���1Н�����է� -3l�è4��pa�t{iM��S��i��N�B���QJ�Z<��oץ	�v:�0i!S�>Ed]u�k�sKr��q�K��4;8�V��k��7��8�ק�0��Y���M�� TyG���>1���\"0�E/�IYϐ�OYž��3F�%�UpmڒU�$��z�v���{a�f猷�H4�mڮ�x��X��+��s�\>�hIMd-$�p��&������"eO�kc�a��n���X      �   N  x���;nD!Ek�*���?�fiҥ����$�M""�|0�`
�R�#��ہ�;qiB���������TQ�(����]�c-�f{8m��.��6�k������ip6�Q�ǖ�F�RO@h[6]�����3[��=�HqV��i#��5��F��	n���\6��E�sj_L������.p����Q��o�֎��pc�å�9l�����w�⑗�=\�
n���.��A1ǳRk*{�l
>獤]'����%GJ�|5i{�t>?�f��e�%Él�=�.������~�Z��T=����������A{8m��v�}� ˳      �   )   x�3�H�K��K�2���2�tN,J�2R�\1z\\\ ��k      �   @   x�3�t��-�I-IM�4�4202�50�52U00�21�22�3253�0�+�e�閘�C�1z\\\ m<�      �   2  x����j�0E��W�"4��%�J����Ǯ��Q �����;���کR�7��3�sG����}hX2�h67hoJ�K���8�*r$�m��>��ͦ����3�V�������g�JB�tE�*r�g"ޅ�M�s�$G�o/�˥!�/�?�R$?�1��М�m;�0�N���o��e1�Jc�Y��B���/�tK�Fqұ�\���Zeh'"$�˖���Ie�Jba�+��*rPT���]�AM���fCM�~_�l�%}��2P�M�A��z���'{}�m�����~ǐn�Upο �V�      �   M  x����N�P���S�y �l_���@jQ+Q uÆ�i C�}��SC2
�,�����ņ��o6$P%�!xQB���-5�Sy��O�q#�ʋz��͝�(�/|@�WU�πp^dn�ڤ��}�m��ߛG��^(�'l��U�/���j�l� ^m����>$az>��c�YMD�e�ףn��PR2�J���(��a�^�߸�_�;��Vם�>x2��8�JPC�P2�kQj�p�?��o��o�~��܌:%�T��X�}���c��I�l	8WЕ" �Ӭ���ap�P�����o��h�A�ː<��1�9�/g�{����-�G�R<�~,�bB3�<��#uT��d^Ld�X ��~k�b1�Pg�[|b,<=�;1�&���r����W�N�ƜR5e5,;��+&6[wCx��q����u�ղ[4v��.��"*�Q ��̵P.�7˧���a�`񙠼�M��]����%�ڀ�A�A�4�(D�1Y�I��Ն��0Z,�v4�� ��cT�fŤ�Ւ%�.����@A�1E�|�ޙ�%ۗ?��z��6���R�*��hvW̖�߶�?�-v�      �   m   x�}�1�0��>E.@d�4 ��ΝX��
�B��+���))A�A�0�D,�V����5-��{A��}@o�Ъ��N3���Iّ�ܚ1%��k��'�~[f�9�,      �   �   x����N�@�g�S�r�}�9�V�	�DF�D�6W%���W�������vӲ^�ݱ���im�w7��e:_�2�0r�bj�o0y2O���0d���-~]2�$g�}֔�
C��̯��o�\�E��h�������h�G˨U��q���&�����k����bNYЪ0�c��A�C��	��      �   �  x����n�@E��W�l����.v� E�W�솶��baУ���EV���D�b�$�t;>[g	i���Щ褐�꺚ϴ��. �J�>����ч��*�B�E��r�Xh9G�+��>�c���v`�~��=�}��3ގ�k�����W�bc�x]��j5_�:+�UQ, �=��ߑᐾ���&�� ���}8�#d��v�9�ɶ.�BI�����䛍m"A�,B5m�S?�i�ГLC�EiN���dQ�(K�Z��0=����!��0Q���l���H*�(K�fB[�O�(�<k��`m�o�g��(�U�c:_�	�@ʲ�Nn����=XtHYV��&4�M<���C�Zd!����CA��JVrk��H
;)�f![k�D
+)k����)���ې�V�Ɨ|�}C
�)k�m�h.v|"����5�>�{��jC�zuq�����R�eֱ{���ڐ�����v�n�_$�6��s���{��      �   y   x���=
�0@�zr
/`�c:/��6�	H��mmlR?�x�5�m�mYk��\�ⅼ��	U�=����s�a)s����
�3z�l�J�{����p��Z�(!��*��1���K"      �   �  x���1n#1Ek�J��@~���$]*��� ��"�_�1{��,���|���hz;i�d�v$9rτ�K7�����k���2�0�E�C6�5@5@x�emX/����A޺� ��&��jvd��#�!^*����	��~����鑐�e4��c_\�Iz{�B��d�����ڤ��)��xQ�7�$s
!��K��q�Jä0���i���2�@�U�.�sd�)��Ԋ)Y�}�J
Ϛ�F���h}!�)��"�k�-C����`�/�%��c�mP/�&���򍫐i$Ū�|_|
����b#N�}~���^y_��2`�'80�Z�Z<�t�V$��������H'Gч���!�|�>���y���%�һr��}}6�"����ü���Z���턡�����Wc��53�<��˨z:�Na�^'��t�d������ŷ�ho�6�>��p�#Z>      �   H   x�3�t�I,Qp��/�+�4�4202�50�5�T02�21�20�327146�+�e��Z���W���J�11z\\\ lI�      �     x����N�0E��Wd?`�y�1����-�(��E��7H�|<w�3\?>�&�f@`d;��'4�䂑�T)cH@a	��^�䆮kQ�<������4Ჿ#�E-�!�t����@�n�dQ%}������WG��?�[;1��jc��7���k�&t��3��޺��K}wz:��/�h�Լw���_�������U���pkDേ��ل�*���6��Ķ�9��z$u�-RN,c�6B�w�O�-k����7p�      �      x�3�,H.����� �3      �   �	  x��X[S��~��
?��9uJf�W��BHB,撤��5�F��-I�!�~{F6��*����׷�{����t9-�F��aܴ"�ʟ��.�s�O�ZںޔUJ�R*�4,��)�X���Uo� �\�1�tP0�%=�L��v�<^��P)�'W������]9��"�J7V�8��@,���޹�/Z���`��N��ۯ���4/l��.T��4�n�QJ�� z������y�	��[��7�˝���_A�0:��9ڪ��@����N�A�F�= c$�P"z��dVV68X#�p��N��ۯ�&�U^袌�»�Ϋ�j��v�x�D8���Idoh'E9�m@N6>g}���1�ػ�_�Nu����V3T�8N�H��	�b__s+@�j�-'��Lbŧ7F�܍� 34���T^m�y�����B���|A4ѽ�Cbe�<\������N\�E��K_�7v>sj|nZ��3E���fP{WE�t��<�s���h7�m�Y���E_�U1A��?�z�-�I�������<�b�oY+B���	�ۯ`��:O��B'9`\y<��V���~$fJ��K�2���Ɂ��܅���\�?��>����k�ۭ�Z����TG��;q��Vk�D�je#Γ8��H"!$M1��%nl���;i�E�3�#����L�L`��D�GI�\QO˦���������,8x�@9����_�a�hU�Չ�б��ܢ�+�I��V��N�S��NX�J8��:�0�1H����ɚ��?��ch���!h�>dn�ƛV$^��b�-�]�df�P4�M���#�2�,�YfRL�x�F��w�Wm��m�s)�pu��f�C�@'�;�9��@o�Ȃ��]���9J���bq$��QC#�E%8Qi´QV�0Դ�Lp��aY��Q��v�D����"��G���-��n�n��O�[�LN����4R�f��E:���ܥ1M�c/L&���`ӻp�c3%��%P��.�4���^�W�h��M�6^�A&��M��-��@��zG۱���*�-�|����^x���]��~�Ňe
���4�� ����vhy,@
Y訍��d�5�&�Fiˌ'P�}$��E�z�e�J�a��z2���cHg�~u�	��%��Ej���w���s���<���������p�?���*�S���_瓯g)�����f��H�����^�d�|�0�	
�y�&�S�&1�,�:��Q�SY�N;��3〢���:����P|P��}7�}<¬�ɀ��`}l&������ZVvf�)�y(G�v�' �F+:U8´�h��70p��Q:`r�x_Įz���?���=��y3���AdA�.�-���Bac�b�ddR���QL�,�	V�8�ߌ۬*G�`p!��j�̬�0��%:w����"o�[�):�����Qy�7$e�{���fm��$W��r���r�<;�ez��(��X���f����|�u6�������`r|5��~�oΏ�'z4�8����Z��S�j+�����*����ot�$!֌�r�z#�'�Mp�,�c�� �7��Џ1���N��	~K{tE��nϭ�P�9iK�lG�0���y��ؖI���%R8��V~�I��E�qea��s��'^7�B[�t{^��yu�45q�Q�<��Q���$1��F��8���<JZ�X���n�U�M���κ�W;��Փn�:4vx�[����mЀ��ܐ�u�5���"]�������7]\7oɦ:�����`�W_�^������d5ڻ�WVg��;U��(�ψ�re0�&J(I#�R*(��VKi�L���\��u��r�u��Я��+3���������l���;�sYo��|u��/�oV�)��������1�5�tvS�}�m\�#�u8B���?�iR4)LR�Q&��ޣc,#�c
E�3>���^t���"~8b�~_��0�sh�X�r���ߓ����^��ˣռ��?�%���ZჃ��J���×�o�(�O���>g��?,o]�Q'��̺�����uV��z��Y<����_]�YaN�+��i�ξ~��>�?\-���֟��Q,F2_�ʽ���*�����?��ԗ��b?��X%�6�D�K���|_��e���d��;<`d�W(B�r��%���sE��/Ҡ�����<����t�m]�aX��ns�`g�������t�N��$���f���'ty��^���on�;�8
=�)s�X������:&� �$�%�p�m��v���5=�D��K%e�\��8��Ӽ(Q�WA �c���3�}�'˩#6iɏ�g��8�T�r���]��o'oE�:~��ػ;�s�l�C�t
�B�JYb`,��d)�u2ɾK�݀�/O�K�H[��oL����O.����͛ !4      �   �  x���Kk�0���}��}��:д�.�J�qZ�eb(����[��@A+�p���+!t(7�o0��po�`6d����<�O+E����}��������ЩL��6i�qf��I&�!�ؠ+��όև6_�����	���`�<�e�Y�a����)K�HiJ��}��/���(�8�$�ϱ�A�����j+��F��҅;�=�' 1b�~��ߙ�F{S*�<��\|��cfUB]ь�B�3�6g%i?I��п�����	k
i�' 3�^���Y��Q,��d�c�dSt�X(|�*
�Ł+�
ԖF��B���d19�ix��r� �}���_�s5�:PU��Y��4K�N,�$�Ǫ<�<͔FU���K�:VU�9Q�B���I���) �����)���-�`*���$aJ2���}�r��[I^0x4�n\cZ:]��(��*��6����L��jj�Q�tV!Lq�.g�^2�Ӈ����j���G�4�?��z     