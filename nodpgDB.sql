toc.dat                                                                                             0000600 0004000 0002000 00000012610 14405035616 0014443 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP                           {         
   films_node    14.7    14.7                0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                    0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                    0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                    1262    16497 
   films_node    DATABASE     U   CREATE DATABASE films_node WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';
    DROP DATABASE films_node;
                postgres    false         �            1259    16503    film    TABLE     �   CREATE TABLE public.film (
    id integer NOT NULL,
    film_name character varying(128) NOT NULL,
    release_year integer NOT NULL
);
    DROP TABLE public.film;
       public         heap    postgres    false         �            1259    16525 
   film_genre    TABLE     `   CREATE TABLE public.film_genre (
    film_id integer NOT NULL,
    genre_id integer NOT NULL
);
    DROP TABLE public.film_genre;
       public         heap    postgres    false         �            1259    16523    film_id_seq    SEQUENCE     �   ALTER TABLE public.film ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    210         �            1259    16498    genre    TABLE     g   CREATE TABLE public.genre (
    id integer NOT NULL,
    genre_name character varying(128) NOT NULL
);
    DROP TABLE public.genre;
       public         heap    postgres    false         �            1259    16524    genre_id_seq    SEQUENCE     �   ALTER TABLE public.genre ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    209                   0    16503    film 
   TABLE DATA           ;   COPY public.film (id, film_name, release_year) FROM stdin;
    public          postgres    false    210       3589.dat           0    16525 
   film_genre 
   TABLE DATA           7   COPY public.film_genre (film_id, genre_id) FROM stdin;
    public          postgres    false    213       3592.dat           0    16498    genre 
   TABLE DATA           /   COPY public.genre (id, genre_name) FROM stdin;
    public          postgres    false    209       3588.dat            0    0    film_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.film_id_seq', 7, true);
          public          postgres    false    211                    0    0    genre_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.genre_id_seq', 9, true);
          public          postgres    false    212         t           2606    16529    film_genre film_genre_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (film_id, genre_id);
 D   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT film_genre_pkey;
       public            postgres    false    213    213         r           2606    16507    film film_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.film DROP CONSTRAINT film_pkey;
       public            postgres    false    210         p           2606    16502    genre genre_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.genre DROP CONSTRAINT genre_pkey;
       public            postgres    false    209         u           1259    16545    fki_film_genre_film_id    INDEX     P   CREATE INDEX fki_film_genre_film_id ON public.film_genre USING btree (film_id);
 *   DROP INDEX public.fki_film_genre_film_id;
       public            postgres    false    213         v           1259    16556    fki_film_genre_genre_id_fkey    INDEX     W   CREATE INDEX fki_film_genre_genre_id_fkey ON public.film_genre USING btree (genre_id);
 0   DROP INDEX public.fki_film_genre_genre_id_fkey;
       public            postgres    false    213         w           2606    16546    film_genre film_genre_film_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) ON DELETE CASCADE NOT VALID;
 G   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT film_genre_film_id;
       public          postgres    false    3442    210    213         x           2606    16551 #   film_genre film_genre_genre_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id) ON DELETE CASCADE NOT VALID;
 M   ALTER TABLE ONLY public.film_genre DROP CONSTRAINT film_genre_genre_id_fkey;
       public          postgres    false    213    3440    209                                                                                                                                3589.dat                                                                                            0000600 0004000 0002000 00000000140 14405035616 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        2	ooopp	2109
3	air	1999
5	Форест Гамп	1994
6	Астрал	2011
7	Маска	1994
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                3592.dat                                                                                            0000600 0004000 0002000 00000000021 14405035616 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        5	7
6	8
7	9
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               3588.dat                                                                                            0000600 0004000 0002000 00000000114 14405035616 0014261 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	action
2	Боевик
7	Драма
8	Ужас
9	Фантастика
\.


                                                                                                                                                                                                                                                                                                                                                                                                                                                    restore.sql                                                                                         0000600 0004000 0002000 00000011356 14405035616 0015376 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 14.7
-- Dumped by pg_dump version 14.7

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

DROP DATABASE films_node;
--
-- Name: films_node; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE films_node WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE films_node OWNER TO postgres;

\connect films_node

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
-- Name: film; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film (
    id integer NOT NULL,
    film_name character varying(128) NOT NULL,
    release_year integer NOT NULL
);


ALTER TABLE public.film OWNER TO postgres;

--
-- Name: film_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.film_genre (
    film_id integer NOT NULL,
    genre_id integer NOT NULL
);


ALTER TABLE public.film_genre OWNER TO postgres;

--
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.film ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id integer NOT NULL,
    genre_name character varying(128) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- Name: genre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.genre ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.genre_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film (id, film_name, release_year) FROM stdin;
\.
COPY public.film (id, film_name, release_year) FROM '$$PATH$$/3589.dat';

--
-- Data for Name: film_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.film_genre (film_id, genre_id) FROM stdin;
\.
COPY public.film_genre (film_id, genre_id) FROM '$$PATH$$/3592.dat';

--
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, genre_name) FROM stdin;
\.
COPY public.genre (id, genre_name) FROM '$$PATH$$/3588.dat';

--
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.film_id_seq', 7, true);


--
-- Name: genre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genre_id_seq', 9, true);


--
-- Name: film_genre film_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_pkey PRIMARY KEY (film_id, genre_id);


--
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- Name: fki_film_genre_film_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_film_genre_film_id ON public.film_genre USING btree (film_id);


--
-- Name: fki_film_genre_genre_id_fkey; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX fki_film_genre_genre_id_fkey ON public.film_genre USING btree (genre_id);


--
-- Name: film_genre film_genre_film_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_film_id FOREIGN KEY (film_id) REFERENCES public.film(id) ON DELETE CASCADE NOT VALID;


--
-- Name: film_genre film_genre_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.film_genre
    ADD CONSTRAINT film_genre_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genre(id) ON DELETE CASCADE NOT VALID;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  