PGDMP         !                {            Shop    15.2    15.2 5    5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    26988    Shop    DATABASE     z   CREATE DATABASE "Shop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE "Shop";
                postgres    false            �            1259    26990    category    TABLE     [   CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying(255)
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    26989    category_id_seq    SEQUENCE     �   CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.category_id_seq;
       public          postgres    false    215            9           0    0    category_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;
          public          postgres    false    214            �            1259    26997    image    TABLE     ~   CREATE TABLE public.image (
    id integer NOT NULL,
    file_name character varying(255),
    product_id integer NOT NULL
);
    DROP TABLE public.image;
       public         heap    postgres    false            �            1259    26996    image_id_seq    SEQUENCE     �   CREATE SEQUENCE public.image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.image_id_seq;
       public          postgres    false    217            :           0    0    image_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.image_id_seq OWNED BY public.image.id;
          public          postgres    false    216            �            1259    35198    orders    TABLE       CREATE TABLE public.orders (
    id integer NOT NULL,
    count integer NOT NULL,
    date_time timestamp(6) without time zone,
    number character varying(255),
    price real NOT NULL,
    status smallint,
    person_id integer NOT NULL,
    product_id integer NOT NULL
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    35197    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    225            ;           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    224            �            1259    27004    person    TABLE     �   CREATE TABLE public.person (
    id integer NOT NULL,
    login character varying(100),
    password character varying(255),
    role character varying(255)
);
    DROP TABLE public.person;
       public         heap    postgres    false            �            1259    27003    person_id_seq    SEQUENCE     �   CREATE SEQUENCE public.person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.person_id_seq;
       public          postgres    false    219            <           0    0    person_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.person_id_seq OWNED BY public.person.id;
          public          postgres    false    218            �            1259    27013    product    TABLE     �  CREATE TABLE public.product (
    id integer NOT NULL,
    date_time timestamp(6) without time zone,
    description text NOT NULL,
    price real NOT NULL,
    seller character varying(255) NOT NULL,
    title text NOT NULL,
    warehouse character varying(255) NOT NULL,
    category_id integer NOT NULL,
    CONSTRAINT product_price_check CHECK ((price >= (1)::double precision))
);
    DROP TABLE public.product;
       public         heap    postgres    false            �            1259    35181    product_cart    TABLE     m   CREATE TABLE public.product_cart (
    id integer NOT NULL,
    person_id integer,
    product_id integer
);
     DROP TABLE public.product_cart;
       public         heap    postgres    false            �            1259    35180    product_cart_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_cart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.product_cart_id_seq;
       public          postgres    false    223            =           0    0    product_cart_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.product_cart_id_seq OWNED BY public.product_cart.id;
          public          postgres    false    222            �            1259    27012    product_id_seq    SEQUENCE     �   CREATE SEQUENCE public.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.product_id_seq;
       public          postgres    false    221            >           0    0    product_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.product_id_seq OWNED BY public.product.id;
          public          postgres    false    220            ~           2604    26993    category id    DEFAULT     j   ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);
 :   ALTER TABLE public.category ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215                       2604    27000    image id    DEFAULT     d   ALTER TABLE ONLY public.image ALTER COLUMN id SET DEFAULT nextval('public.image_id_seq'::regclass);
 7   ALTER TABLE public.image ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    35201 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    225    225            �           2604    27007 	   person id    DEFAULT     f   ALTER TABLE ONLY public.person ALTER COLUMN id SET DEFAULT nextval('public.person_id_seq'::regclass);
 8   ALTER TABLE public.person ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    27016 
   product id    DEFAULT     h   ALTER TABLE ONLY public.product ALTER COLUMN id SET DEFAULT nextval('public.product_id_seq'::regclass);
 9   ALTER TABLE public.product ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    35184    product_cart id    DEFAULT     r   ALTER TABLE ONLY public.product_cart ALTER COLUMN id SET DEFAULT nextval('public.product_cart_id_seq'::regclass);
 >   ALTER TABLE public.product_cart ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    222    223            (          0    26990    category 
   TABLE DATA                 public          postgres    false    215   p9       *          0    26997    image 
   TABLE DATA                 public          postgres    false    217   �9       2          0    35198    orders 
   TABLE DATA                 public          postgres    false    225   �>       ,          0    27004    person 
   TABLE DATA                 public          postgres    false    219   �@       .          0    27013    product 
   TABLE DATA                 public          postgres    false    221   �A       0          0    35181    product_cart 
   TABLE DATA                 public          postgres    false    223   �R       ?           0    0    category_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.category_id_seq', 3, true);
          public          postgres    false    214            @           0    0    image_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.image_id_seq', 60, true);
          public          postgres    false    216            A           0    0    orders_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.orders_id_seq', 9, true);
          public          postgres    false    224            B           0    0    person_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.person_id_seq', 2, true);
          public          postgres    false    218            C           0    0    product_cart_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.product_cart_id_seq', 13, true);
          public          postgres    false    222            D           0    0    product_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.product_id_seq', 12, true);
          public          postgres    false    220            �           2606    26995    category category_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.category DROP CONSTRAINT category_pkey;
       public            postgres    false    215            �           2606    27002    image image_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.image DROP CONSTRAINT image_pkey;
       public            postgres    false    217            �           2606    35203    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    225            �           2606    27011    person person_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.person DROP CONSTRAINT person_pkey;
       public            postgres    false    219            �           2606    35186    product_cart product_cart_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT product_cart_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT product_cart_pkey;
       public            postgres    false    223            �           2606    27021    product product_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.product DROP CONSTRAINT product_pkey;
       public            postgres    false    221            �           2606    27023 $   product uk_qka6vxqdy1dprtqnx9trdd47c 
   CONSTRAINT     `   ALTER TABLE ONLY public.product
    ADD CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c UNIQUE (title);
 N   ALTER TABLE ONLY public.product DROP CONSTRAINT uk_qka6vxqdy1dprtqnx9trdd47c;
       public            postgres    false    221            �           2606    35204 "   orders fk1b0m4muwx1t377w9if3w6wwqn    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn FOREIGN KEY (person_id) REFERENCES public.person(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk1b0m4muwx1t377w9if3w6wwqn;
       public          postgres    false    219    225    3210            �           2606    27029 #   product fk1mtsbur82frn64de7balymq9s    FK CONSTRAINT     �   ALTER TABLE ONLY public.product
    ADD CONSTRAINT fk1mtsbur82frn64de7balymq9s FOREIGN KEY (category_id) REFERENCES public.category(id);
 M   ALTER TABLE ONLY public.product DROP CONSTRAINT fk1mtsbur82frn64de7balymq9s;
       public          postgres    false    215    3206    221            �           2606    35209 "   orders fk787ibr3guwp6xobrpbofnv7le    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk787ibr3guwp6xobrpbofnv7le FOREIGN KEY (product_id) REFERENCES public.product(id);
 L   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk787ibr3guwp6xobrpbofnv7le;
       public          postgres    false    221    225    3212            �           2606    27024 !   image fkgpextbyee3uk9u6o2381m7ft1    FK CONSTRAINT     �   ALTER TABLE ONLY public.image
    ADD CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1 FOREIGN KEY (product_id) REFERENCES public.product(id);
 K   ALTER TABLE ONLY public.image DROP CONSTRAINT fkgpextbyee3uk9u6o2381m7ft1;
       public          postgres    false    221    3212    217            �           2606    35192 (   product_cart fkhpnrxdy3jhujameyod08ilvvw    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw FOREIGN KEY (product_id) REFERENCES public.product(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fkhpnrxdy3jhujameyod08ilvvw;
       public          postgres    false    221    223    3212            �           2606    35187 (   product_cart fksgnkc1ko2i1o9yr2p63ysq3rn    FK CONSTRAINT     �   ALTER TABLE ONLY public.product_cart
    ADD CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn FOREIGN KEY (person_id) REFERENCES public.person(id);
 R   ALTER TABLE ONLY public.product_cart DROP CONSTRAINT fksgnkc1ko2i1o9yr2p63ysq3rn;
       public          postgres    false    223    3210    219            (      x���v
Q���W((M��L�KN,IM�/�T��L�Q�K�M�Ts�	uV�0�QP�0����x��uMk.OҌ01���ۀ�2�01�b�Ŧ�.l���b����b녽v\�1�� �6VG      *   �  x���ͪe�F��g�n�:H�#��(����Q�J���4�&��ҍ�� �L.�;YW[_����������O����Ǘ?�������s<���������������������O������?����}||ӵ��=�u`���t�mRW{�翾����~��ݧ;Ğ��j�ƽWD�md�43�%��WG�O.�lH��`���v�ԟ�*�&Q'���`�ځ�l0� S�h�{<�U�Z9�T��j� tO�>:�3>�eȷ�T��4i��� [�����h�U߲�ɷ�o�Y�*�<\�<�	�R�,"�N^���G�����>s:����0��x�'^�Z��sy��"��y��$v���|c�>�*�+?��x��X[Y��G�������f��⌥�YRuKD�їеp��y��=r��.�js��N��<�"�Ze��bm��sI�i�Ѳ��'>
sԙ�Y�z��>�O|���4@�91OX@�G�z��k|�#���]65@�ز�[͏
���W|�#�~����.0멟�V�{lث-�
?���߰/	m���?X<�ry4���$O�{��C��+����?Ѱ����}�3r<+a��I�2��;�P��M��L�Ԃ�+�݀�Zi��W��F�P˜J�
mͼΈJ�aD�Rv���ːG@nm����Η�a
V���T1��~��oc����B�Y�ry�J�=I�{�B�m�KB��GB;�ZNTͰ�2�wM7��մVk��>�#���)�.
�qN����9*;2���}䑐�,m� �<�-'B|�6���5��}䑐�lvz��|��M�,��c�.SJK籠�,A�6�HH*��d��d��0sۣAN��!�Y̮ �G	Ս�fZ��N�L�n󔼷m�4g�
�}�qPi�f�/^�IY�:7�2�+Q����H.o//1ѠK.lֳ3�:D]E{d����<�/�N)-�7(M�:����&_t-��<��9y���8�� ���m튽�B�|�5�#�`jڳD˪o� �2���^$mt��>�({GZ�p
�dd�&���h�Q�����cu՚C����������ܑ�$����r�4�]dH[��<�rLf�� J�rY����~�I�l:SpX���gg��ί��1ý��kpG>����|y�H��%Yp�:�4�O�E�#���*f��|��k$򅽆��2_�kG:�Zmw0��]2��= T0��OAY�ݻ���&�      2   �  x����j1 ໟB�$t�hF3�hs�!CI�I{�[04��w߿��{(N!;B�`>�h�����E-�^���~�r�ٕ�۫�U�T���S%N�uZ��N��Tw���V���)N���f�z���mʜ���S?��x|V�Щ6oРՆ4�28X?ӛ����:�hFa9VM9X-�"/cb�ql���N�Na�w���e�� ����||2������W��
d0�7�ɇ� L�<斷-QS���'�6UIb�R�&ೂ0��ɑ|��r��&d�d��m�,>s��h�&p�Dqo�EA�BڣgqYSh�X���=Gs�����`l����!EN�yLM�������$HGA�d����Sh�����?�;g�D�]�d0h���X��A�;X���_�;Q����[��0|��[�a��&��y      ,   �   x���Ok�0 �"�$6β��l��S�o[{�F	Fc�Z��~�2v����=~a���=�}�6�������e6�`��u'�X(��|��ށ	��E����L��hf.�2�K/.�@g���U�;P�$ϕ���r�Ĳ�i�$.�|N�}�������Ț��`���j����uC�sܡEW�V�>�}�B�B:lN��� 
�|����:��UB~a��sw��B^:      .      x��ZKo����=<Z�mN>� D���\�""z�����􊒥pmځG�,;A$��p���ݝ�f�Q�����}PD�I�LOwu=������s����̕w�{�ܻ��[��{[wo�_�1�6o�����;��7�Ǎ����{;�w�����:=�޸ukc+0;�;��׿�mm����m�q�>��ݭ?ؼy������_�a�U���W��l�Mf'�(�����9�}�w�������YY
�y�^�;+K&oe��ɾ�R�f=���~����c�w��w�wM�G�����g��g��&K���4�vc�,��=�N��c���(��J��q6��$E�~�yZ��')�6�'�1��L6���G<��N�ad�͊��V�h�G��`v�!/25�dH���#�{�3C�V�O��8��槡y�aD�����3����c� +Cz�nvȏR�:2,�!=Nh�͛�NOh�����E�(��B�AĊ�X��	�mD�4�"d8�?�[�~��:��ϔ��|������Vh��I��^��UɠZ��#)z<�Ƣ��wh��q���ŦS3��Lb��Y�bDک[ �ӫ+M�k��qّH�'��������)k�b���yP�A�%�R��O�γ�W�54�]����Y���b�MԕN���Z����yh�D���NG�ڟ2��X���k2��­i� ������P��O��]�'R��$���K�E`�������W� &e<��s�ДG�1:۪e�wi�#'ь��߰�'�`��PJ�R.W�J}I�L�"�K��l�)�xU��ð�찈B���
:�D{ �wᒼ�KZ��E��c(o�m[�Z�`��H�6;�i>��ub�e$���Y��s�i�hHΆ:�ǪL1(�d[���VՕzu��z��]���X�n��Cޱ��gl9HZ̲R�/UW+˴����b�."Q�3?�'{�K�|'�a8($>v�v ����A�?!��G����	$*(~D�oBm�)�%���	ˇ����?]H�@��żp�����,�ȷ�LnH�!Mu�|2�쫊#���\�2�<�i{H�!'g�DKp E���PJ"X�I(�.�+Ӈ��ң�ur#Qg�9|,|��M��<�{!4#rl�jl��)v�����
�� lQ�ħ�0��������+B
!����C؍�GI�����!s"͘�Ȧ�g��U��Ŝ�s���i�Ԇ�v��!�L|I��%��`J�lc�E�!?���=�ZŲ b�0k:@L@\��h�v`n�m�J�(,wa��g���Ƣ�8�>�;{�wy`�Ҍ0�){A`�t�b`��`}N�l�����\y���R��S��4�Mi}����C�3�������g�$'�X8	�������WG�d��������jݔ+��j��T��j�ʵ�?V~����j�L�G=XFb�e�$T[jK�KR�D�j�Rtv(M~0l tg��p�a8E����"M̫���0!���KX���Y߳ӂ|͠�Ï��D����4̯ ��q4ƖK�!��~c�U��'� ��Q��z��S!/!���,%M\�t[	8)�+͒��b;�)^3NZ��(c3ʫ����X4' �3^pd��ɪ	�vLKf��bRN�H�6��D�'3�j�"�)���=�ss��xJj�/��f
V���m�N 'GJק|`dR��'�.ɏ�RB�2ꆅ�|+�pJo��7�s�g�|X�괃"����Ӽ4���V�aG��K�j�M%��!�ַ{�5�9�d��	]���R[�u,���h���YF�@R��'4�8r���B;Ne1�1?��1�P�	��/��l^�C-2�i*�R��"/���"{�A�+�UOZ� =��7�@�,K˥a�P���]T�-�����Sfo��(������º�|�:�r(��P���.K��R�\/U���K��?G�ZW�j[gH
����`o�3���NJk�
�C�	ܽ�>��&��c��!�(EW�OΦ�>��J�]&D7����-����((w[v§d���5�K>D���J���bg���DѠx�;�v�8�NRmo�/9X�b=k4)��בm��M�~�h0B�C@6H+h@
kJ$�������7�[�����u��@��C�?�<����	-,]�~��*&��ld��>��P+AÐ?3B�9�#�����/����]x�`��YQ-"�I���j9�@zʇVS��_~�"lq�X��-�G�,6��к�8����/�v��Gd���L�R��|0����@E�0�@�D��2�;�{�AB����m���d�I�"Yu�����œ.6������`�]��j���b��h$^ �~�yc�͈y1$i���ߍlg���^}<@J�����)����m�
#�d�)��}S�B��\[al��!��%1�_hV=�����5ʀ!�\{�G�Tl���o����XsUt�_����KڰJ��eVG�j7�sk(~���*n��;K�ޟ:�G�x=è�:J�^�TD�8*��^�\*r�G�5��KNF����%U;�����Rx磘��h�y>慅���E�����Q���T3��V�6[�$�dY�/T{�9ǲb�83s/Jl�F=�$=&{Z�͡#���->�Z_۾�v��qY�Š�6#9)<1�/U.���cf�ϛw�|�'��v�5�t!��Sc��q@3`ѥ�'��ZKkiH���,����L�F�(�c-߬t���/4n~,�
��=�Yc}���$�l��6nol��v���+Oa����R��Xj��(�J�KK+��R�	�5'L�Bށ�О�u�q-c�-c�� ��D��
ŵ#e3��I����R�K����t�_@
��J��eq1���dMM��ʦ��EP��XZ�U��%\�ţ�"�_;Vt�=C��Iv�0ٿ�||FX���J��+�U~�m����������$�rDI�["��� -�3�nf�j�H������񨭘g�"\�@���ʋ䰔'=���B,��p���dkVLI��i�����?iW7������k�+�;5��v&w���q����U�H��ɇHj��a��ĲM�L� f>.N����Ko#�ڑ���T$-0�V�z�SVJH�H��dwIȱ���5���7�����^�ͨWI,Mp����΢�k��\�
Ɯ"���FS���S=�ˠ��3�^�O�]��x{&�t�����-�F���*����(��(����8����sw��I?�z[��w_.HK]1N�zb(6���T"�ސJ��*s@5�/$6�iC��6g���s|6��Uзs�#��Ӕ�
N�����,	�+��6���!��"��~�t���KE)�r���z��wi�Xw��[�.3�q_q�-lP��P�^������e ��B@�]Ikc�;�A4'~boEh㝙���3��c��IM�%�Z�����U"��~�����;g���ka
?洲�9�WJ�J�^�B̧��ӢfMPY꡴v�N�!�����������wSu���V�f��	�$����*�@�����@��>��_��B�)�b��0��%jIgF�`P��!K�4�Þ	��<%�ik
w��;mɳ�c��l���
��D���N��@���_f_���nn�\�f�tV��8���U�Jie�V_���.�V���phx����5�e0��]��*���	
�U��F�nt`�f��J����.� {7n�m��}�w�Ġ�^"�9�+��W���Ty>u�S2�_�.�ġ��%���,4��1�����2����d��6x���;�;oH���.b��ϵ}@�l���z�p`M�i��Y����Em{��������z'p��4)�$�GZ��}{��S��GO���Y���ľ�:�R`�g��>�K;{�N���%�,)#u	Zzk������Ijq_���% ���bt�F��~�DFɩ[ WZن{�a8S	$c��w�ր�/t�#\�������|z�2=N�1BQ��caJ����âm��Sq.�   ����^^�r��G�
���<D�%�x(��C?�ݜ~Gܻz!�O@>����:�i%�G��cm���J��nfL�u2�z!Q)����7���4��� �#��T�^IjGTrB�ܱ�i���ϡ
ԪEAj�R�X*o����ef�m$���X:5!]�{kmks�� �M�[�;��퐀���m^��s�޽���+7Ο��j�=�U�~v[6�Z�Rn,UK�JE�Pc�B(m�������x������vv�u��g_��_��Ϝ�0y�      0   
   x���         