create table "group"
(
  id   bigserial not null
    constraint group_pkey
      primary key,
  name text      not null
);

create table role
(
  id          bigserial not null
    constraint role_pkey
      primary key,
  name        text      not null,
  description text
);

create table role_group
(
  role_id  bigint not null
    constraint role_group_role_id_fk
      references role,
  group_id bigint not null
    constraint role_group_group_id_fk
      references "group",
  constraint role_group_pk
    primary key (group_id, role_id)
);

create table "user"
(
  id         bigserial            not null
    constraint user_pkey
      primary key,
  name       text                 not null,
  password   text                 not null,
  active     boolean default true not null,
  email      text,
  username   text                 not null,
  id_unidade bigint               not null
);

create table group_user
(
  group_id bigint not null
    constraint group_user_group_group_id_fk
      references "group",
  user_id  bigint not null
    constraint group_user_user_id_fk
      references "user",
  constraint group_user_pk
    primary key (user_id, group_id)
);


INSERT INTO public."group" (id, name)
VALUES (1, 'ADMINISTRADOR');
INSERT INTO public."group" (id, name)
VALUES (2, 'USER');

INSERT INTO public."role" (id, name, description)
VALUES (2, 'ROLE_USER', 'Usuários em geral');
INSERT INTO public."role" (id, name, description)
VALUES (1, 'ROLE_ADMIN', 'Administradores em Geral');

INSERT INTO public."user" (id, name, password, active, email, username, id_unidade)
VALUES (1, 'Diego', '$2a$10$pDE360m8v2Asjfq1/bg1UesAVST10REHyufnx6QlRNpQbLaRtR3ua', true, 'dmendes@ma.sesc.com.br',
        'diego', 2);

INSERT INTO public."group_user" (group_id, user_id)
VALUES (1, 1);

INSERT INTO public."role_group" (role_id, group_id)
VALUES (1, 1);

CREATE TABLE public.estado
(
  id       bigint                NOT NULL,
  codigouf integer               NOT NULL,
  nome     character varying(50) NOT NULL,
  uf       character(2)          NOT NULL,
  regiao   integer               NOT NULL
);

CREATE SEQUENCE public.estado_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

ALTER SEQUENCE public.estado_id_seq OWNED BY public.estado.id;

CREATE TABLE public.lista_cbo
(
  co_cbo                        text NOT NULL,
  ds_atividade_profissional     text,
  tp_classificacao_profissional text,
  tp_cbo_saude                  text,
  st_cbo_regulamentado          text,
  no_ano_cmpt                   text
);

CREATE TABLE public.municipio
(
  id                 bigint                 NOT NULL,
  codigo             integer                NOT NULL,
  nome               character varying(255) NOT NULL,
  uf                 character(2)           NOT NULL,
  codigo_mun_datasus integer
);

CREATE SEQUENCE public.municipio_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

ALTER SEQUENCE public.municipio_id_seq OWNED BY public.municipio.id;

CREATE TABLE public.tipo_pessoa
(
  id               integer NOT NULL,
  desc_tipo_pessoa text
);

ALTER TABLE ONLY public.estado
  ALTER COLUMN id SET DEFAULT nextval('public.estado_id_seq'::regclass);

ALTER TABLE ONLY public.municipio
  ALTER COLUMN id SET DEFAULT nextval('public.municipio_id_seq'::regclass);

INSERT INTO public.estado
VALUES (1, 12, 'Acre', 'AC', 1);
INSERT INTO public.estado
VALUES (2, 27, 'Alagoas', 'AL', 2);
INSERT INTO public.estado
VALUES (3, 16, 'Amapá', 'AP', 1);
INSERT INTO public.estado
VALUES (4, 13, 'Amazonas', 'AM', 1);
INSERT INTO public.estado
VALUES (5, 29, 'Bahia', 'BA', 2);
INSERT INTO public.estado
VALUES (6, 23, 'Ceará', 'CE', 2);
INSERT INTO public.estado
VALUES (7, 53, 'Distrito Federal', 'DF', 5);
INSERT INTO public.estado
VALUES (8, 32, 'Espírito Santo', 'ES', 3);
INSERT INTO public.estado
VALUES (9, 52, 'Goiás', 'GO', 5);
INSERT INTO public.estado
VALUES (10, 21, 'Maranhão', 'MA', 2);
INSERT INTO public.estado
VALUES (11, 51, 'Mato Grosso', 'MT', 5);
INSERT INTO public.estado
VALUES (12, 50, 'Mato Grosso do Sul', 'MS', 5);
INSERT INTO public.estado
VALUES (13, 31, 'Minas Gerais', 'MG', 3);
INSERT INTO public.estado
VALUES (14, 15, 'Pará', 'PA', 1);
INSERT INTO public.estado
VALUES (15, 25, 'Paraíba', 'PB', 2);
INSERT INTO public.estado
VALUES (16, 41, 'Paraná', 'PR', 4);
INSERT INTO public.estado
VALUES (17, 26, 'Pernambuco', 'PE', 2);
INSERT INTO public.estado
VALUES (18, 22, 'Piauí', 'PI', 2);
INSERT INTO public.estado
VALUES (19, 33, 'Rio de Janeiro', 'RJ', 3);
INSERT INTO public.estado
VALUES (20, 24, 'Rio Grande do Norte', 'RN', 2);
INSERT INTO public.estado
VALUES (21, 43, 'Rio Grande do Sul', 'RS', 4);
INSERT INTO public.estado
VALUES (22, 11, 'Rondônia', 'RO', 1);
INSERT INTO public.estado
VALUES (23, 14, 'Roraima', 'RR', 1);
INSERT INTO public.estado
VALUES (24, 42, 'Santa Catarina', 'SC', 4);
INSERT INTO public.estado
VALUES (25, 35, 'São Paulo', 'SP', 3);
INSERT INTO public.estado
VALUES (26, 28, 'Sergipe', 'SE', 2);
INSERT INTO public.estado
VALUES (27, 17, 'Tocantins', 'TO', 1);

INSERT INTO public.lista_cbo
VALUES ('513435', 'ATENDENTE DE LANCHONETE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513440', 'BARISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513505', 'AUXILIAR NOS SERVICOS DE ALIMENTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513605', 'CHURRASQUEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513610', 'PIZZAIOLO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513615', 'SUSHIMAN', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514105', 'ASCENSORISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514110', 'GARAGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514115', 'SACRISTAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514120', 'ZELADOR DE EDIFICIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514205', 'COLETOR DE LIXO DOMICILIAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514215', 'VARREDOR DE RUA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514225', 'TRABALHADOR DE SERVICOS DE LIMPEZA E CONSERVACAO DE AREAS PUBLICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514230', 'COLETOR DE RESIDUOS SOLIDOS DE SERVICOS DE SAUDE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514305', 'LIMPADOR DE VIDROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514310', 'AUXILIAR DE MANUTENCAO PREDIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514315', 'LIMPADOR DE FACHADAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514320', 'FAXINEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514325', 'TRABALHADOR DA MANUTENCAO DE EDIFICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('514330', 'LIMPADOR DE PISCINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515105', 'AGENTE COMUNITARIO DE SAUDE', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515110', 'ATENDENTE DE ENFERMAGEM', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('515115', 'PARTEIRA LEIGA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515120', 'VISITADOR SANITARIO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515125', 'AGENTE INDIGENA DE SAUDE', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515130', 'AGENTE INDIGENA DE SANEAMENTO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515135', 'SOCORRISTA (EXCETO MEDICOS E ENFERMEIROS)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('5152A1', 'MICROSCOPISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515205', 'AUXILIAR DE BANCO DE SANGUE', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515210', 'AUXILIAR DE FARMACIA DE MANIPULACAO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515215', 'AUXILIAR DE LABORATORIO DE ANALISES CLINICAS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515220', 'AUXILIAR DE LABORATORIO DE IMUNOBIOLOGICOS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515225', 'AUXILIAR DE PRODUCAO FARMACEUTICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515305', 'EDUCADOR SOCIAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515310', 'AGENTE DE ACAO SOCIAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515315', 'MONITOR DE DEPENDENTE QUIMICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515320', 'CONSELHEIRO TUTELAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515325', 'SOCIOEDUCADOR', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516105', 'BARBEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516110', 'CABELEIREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516120', 'MANICURE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516125', 'MAQUIADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516130', 'MAQUIADOR DE CARACTERIZACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516140', 'PEDICURE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516205', 'BABA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516210', 'CUIDADOR DE IDOSOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516215', 'MAE SOCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516220', 'CUIDADOR EM SAUDE', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516305', 'LAVADEIRO, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516310', 'LAVADOR DE ROUPAS A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516315', 'LAVADOR DE ARTEFATOS DE TAPECARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516320', 'LIMPADOR A SECO, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516325', 'PASSADOR DE ROUPAS EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516330', 'TINGIDOR DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516335', 'CONFERENTEEXPEDIDOR DE ROUPAS (LAVANDERIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516340', 'ATENDENTE DE LAVANDERIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516345', 'AUXILIAR DE LAVANDERIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516405', 'LAVADOR DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516410', 'LIMPADOR DE ROUPAS A SECO, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516415', 'PASSADOR DE ROUPAS, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516505', 'AGENTE FUNERARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516605', 'OPERADOR DE FORNO (SERVICOS FUNERARIOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516610', 'SEPULTADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516705', 'ASTROLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516710', 'NUMEROLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516805', 'ESOTERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('516810', 'PARANORMAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517105', 'BOMBEIRO DE AERODROMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517110', 'BOMBEIRO DE SEGURANCA DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517115', 'SALVAVIDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517205', 'AGENTE DE POLICIA FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517210', 'POLICIAL RODOVIARIO FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517215', 'GUARDACIVIL MUNICIPAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517220', 'AGENTE DE TRANSITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517305', 'AGENTE DE PROTECAO DE AEROPORTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517310', 'AGENTE DE SEGURANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517315', 'AGENTE DE SEGURANCA PENITENCIARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517320', 'VIGIA FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517325', 'VIGIA PORTUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517330', 'VIGILANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517335', 'GUARDA PORTUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517405', 'PORTEIRO (HOTEL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517410', 'PORTEIRO DE EDIFICIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517415', 'PORTEIRO DE LOCAIS DE DIVERSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517420', 'VIGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519105', 'CICLISTA MENSAGEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519110', 'MOTOCICLISTA NO TRANSPORTE DE DOCUMENTOS E PEQUENOS VOLUMES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519205', 'CATADOR DE MATERIAL RECICLAVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519210', 'SELECIONADOR DE MATERIAL RECICLAVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519215', 'OPERADOR DE PRENSA DE MATERIAL RECICLAVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519305', 'AUXILIAR DE VETERINARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519310', 'ESTETICISTA DE ANIMAIS DOMESTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519315', 'BANHISTA DE ANIMAIS DOMESTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519320', 'TOSADOR DE ANIMAIS DOMESTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519805', 'PROFISSIONAL DO SEXO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519905', 'CARTAZEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519910', 'CONTROLADOR DE PRAGAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519915', 'ENGRAXATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519920', 'GANDULA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519925', 'GUARDADOR DE VEICULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519930', 'LAVADOR DE GARRAFAS, VIDROS E OUTROS UTENSILIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519935', 'LAVADOR DE VEICULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519940', 'LEITURISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519945', 'RECEPCIONISTA DE CASAS DE ESPETACULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('520105', 'SUPERVISOR DE VENDAS DE SERVICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('520110', 'SUPERVISOR DE VENDAS COMERCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521105', 'VENDEDOR EM COMERCIO ATACADISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521110', 'VENDEDOR DE COMERCIO VAREJISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521115', 'PROMOTOR DE VENDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521120', 'DEMONSTRADOR DE MERCADORIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521125', 'REPOSITOR DE MERCADORIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521130', 'ATENDENTE DE FARMACIA  BALCONISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521135', 'FRENTISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('523105', 'INSTALADOR DE CORTINAS E PERSIANAS, PORTAS SANFONADAS E BOXE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('523110', 'INSTALADOR DE SOM E ACESSORIOS DE VEICULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('523115', 'CHAVEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524105', 'VENDEDOR EM DOMICILIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524205', 'FEIRANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524210', 'JORNALEIRO (EM BANCA DE JORNAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524215', 'VENDEDOR PERMISSIONARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524305', 'VENDEDOR AMBULANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('524310', 'PIPOQUEIRO AMBULANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('611005', 'PRODUTOR AGROPECUARIO, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612005', 'PRODUTOR AGRICOLA POLIVALENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612105', 'PRODUTOR DE ARROZ', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612110', 'PRODUTOR DE CANADEACUCAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612115', 'PRODUTOR DE CEREAIS DE INVERNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612120', 'PRODUTOR DE GRAMINEAS FORRAGEIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612125', 'PRODUTOR DE MILHO E SORGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612205', 'PRODUTOR DE ALGODAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612210', 'PRODUTOR DE CURAUA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612215', 'PRODUTOR DE JUTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612220', 'PRODUTOR DE RAMI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612225', 'PRODUTOR DE SISAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612305', 'PRODUTOR NA OLERICULTURA DE LEGUMES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612310', 'PRODUTOR NA OLERICULTURA DE RAIZES, BULBOS E TUBERCULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612315', 'PRODUTOR NA OLERICULTURA DE TALOS, FOLHAS E FLORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612320', 'PRODUTOR NA OLERICULTURA DE FRUTOS E SEMENTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612405', 'PRODUTOR DE FLORES DE CORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612410', 'PRODUTOR DE FLORES EM VASO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612415', 'PRODUTOR DE FORRACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612420', 'PRODUTOR DE PLANTAS ORNAMENTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612505', 'PRODUTOR DE ARVORES FRUTIFERAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612510', 'PRODUTOR DE ESPECIES FRUTIFERAS RASTEIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612515', 'PRODUTOR DE ESPECIES FRUTIFERAS TREPADEIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612605', 'CAFEICULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612610', 'PRODUTOR DE CACAU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612615', 'PRODUTOR DE ERVAMATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612620', 'PRODUTOR DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612625', 'PRODUTOR DE GUARANA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612705', 'PRODUTOR DA CULTURA DE AMENDOIM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612710', 'PRODUTOR DA CULTURA DE CANOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612715', 'PRODUTOR DA CULTURA DE COCODABAIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612720', 'PRODUTOR DA CULTURA DE DENDE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612725', 'PRODUTOR DA CULTURA DE GIRASSOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612730', 'PRODUTOR DA CULTURA DE LINHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612735', 'PRODUTOR DA CULTURA DE MAMONA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612740', 'PRODUTOR DA CULTURA DE SOJA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612805', 'PRODUTOR DE ESPECIARIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('612810', 'PRODUTOR DE PLANTAS AROMATICAS E MEDICINAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613005', 'CRIADOR EM PECUARIA POLIVALENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613010', 'CRIADOR DE ANIMAIS DOMESTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613105', 'CRIADOR DE ASININOS E MUARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613110', 'CRIADOR DE BOVINOS (CORTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613115', 'CRIADOR DE BOVINOS (LEITE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613120', 'CRIADOR DE BUBALINOS (CORTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613125', 'CRIADOR DE BUBALINOS (LEITE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613130', 'CRIADOR DE EQINOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613205', 'CRIADOR DE CAPRINOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613210', 'CRIADOR DE OVINOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613215', 'CRIADOR DE SUINOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613305', 'AVICULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613310', 'CUNICULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613405', 'APICULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613410', 'CRIADOR DE ANIMAIS PRODUTORES DE VENENO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613415', 'MINHOCULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('613420', 'SERICULTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('620105', 'SUPERVISOR DE EXPLORACAO AGRICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('620110', 'SUPERVISOR DE EXPLORACAO AGROPECUARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('620115', 'SUPERVISOR DE EXPLORACAO PECUARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('621005', 'TRABALHADOR AGROPECUARIO EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622005', 'CASEIRO (AGRICULTURA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622010', 'JARDINEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622015', 'TRABALHADOR NA PRODUCAO DE MUDAS E SEMENTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622020', 'TRABALHADOR VOLANTE DA AGRICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622105', 'TRABALHADOR DA CULTURA DE ARROZ', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622110', 'TRABALHADOR DA CULTURA DE CANADEACUCAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622115', 'TRABALHADOR DA CULTURA DE MILHO E SORGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622120', 'TRABALHADOR DA CULTURA DE TRIGO, AVEIA, CEVADA E TRITICALE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622205', 'TRABALHADOR DA CULTURA DE ALGODAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622210', 'TRABALHADOR DA CULTURA DE SISAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622215', 'TRABALHADOR DA CULTURA DO RAMI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622305', 'TRABALHADOR NA OLERICULTURA (FRUTOS E SEMENTES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622310', 'TRABALHADOR NA OLERICULTURA (LEGUMES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622315', 'TRABALHADOR NA OLERICULTURA (RAIZES, BULBOS E TUBERCULOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622320', 'TRABALHADOR NA OLERICULTURA (TALOS, FOLHAS E FLORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622405', 'TRABALHADOR NO CULTIVO DE FLORES E FOLHAGENS DE CORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622410', 'TRABALHADOR NO CULTIVO DE FLORES EM VASO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622415', 'TRABALHADOR NO CULTIVO DE FORRACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622420', 'TRABALHADOR NO CULTIVO DE MUDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622425', 'TRABALHADOR NO CULTIVO DE PLANTAS ORNAMENTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622505', 'TRABALHADOR NO CULTIVO DE ARVORES FRUTIFERAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622510', 'TRABALHADOR NO CULTIVO DE ESPECIES FRUTIFERAS RASTEIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622515', 'TRABALHADOR NO CULTIVO DE TREPADEIRAS FRUTIFERAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622605', 'TRABALHADOR DA CULTURA DE CACAU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622610', 'TRABALHADOR DA CULTURA DE CAFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622615', 'TRABALHADOR DA CULTURA DE ERVAMATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622620', 'TRABALHADOR DA CULTURA DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622625', 'TRABALHADOR DA CULTURA DE GUARANA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622705', 'TRABALHADOR NA CULTURA DE AMENDOIM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622710', 'TRABALHADOR NA CULTURA DE CANOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622715', 'TRABALHADOR NA CULTURA DE COCODABAIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622720', 'TRABALHADOR NA CULTURA DE DENDE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622725', 'TRABALHADOR NA CULTURA DE MAMONA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622730', 'TRABALHADOR NA CULTURA DE SOJA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622735', 'TRABALHADOR NA CULTURA DO GIRASSOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622740', 'TRABALHADOR NA CULTURA DO LINHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622805', 'TRABALHADOR DA CULTURA DE ESPECIARIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('622810', 'TRABALHADOR DA CULTURA DE PLANTAS AROMATICAS E MEDICINAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623005', 'ADESTRADOR DE ANIMAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623010', 'INSEMINADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623015', 'TRABALHADOR DE PECUARIA POLIVALENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623020', 'TRATADOR DE ANIMAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623105', 'TRABALHADOR DA PECUARIA (ASININOS E MUARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623110', 'TRABALHADOR DA PECUARIA (BOVINOS CORTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623115', 'TRABALHADOR DA PECUARIA (BOVINOS LEITE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623120', 'TRABALHADOR DA PECUARIA (BUBALINOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623125', 'TRABALHADOR DA PECUARIA (EQINOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623205', 'TRABALHADOR DA CAPRINOCULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623210', 'TRABALHADOR DA OVINOCULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623215', 'TRABALHADOR DA SUINOCULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623305', 'TRABALHADOR DA AVICULTURA DE CORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623310', 'TRABALHADOR DA AVICULTURA DE POSTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623315', 'OPERADOR DE INCUBADORA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623320', 'TRABALHADOR DA CUNICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623325', 'SEXADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623405', 'TRABALHADOR EM CRIATORIOS DE ANIMAIS PRODUTORES DE VENENO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623410', 'TRABALHADOR NA APICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623415', 'TRABALHADOR NA MINHOCULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623420', 'TRABALHADOR NA SERICICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('630105', 'SUPERVISOR DA AQICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('630110', 'SUPERVISOR DA AREA FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631005', 'CATADOR DE CARANGUEJOS E SIRIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631010', 'CATADOR DE MARISCOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631015', 'PESCADOR ARTESANAL DE LAGOSTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631020', 'PESCADOR ARTESANAL DE PEIXES E CAMAROES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631105', 'PESCADOR ARTESANAL DE AGUA DOCE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631205', 'PESCADOR INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631210', 'PESCADOR PROFISSIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631305', 'CRIADOR DE CAMAROES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631310', 'CRIADOR DE JACARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631315', 'CRIADOR DE MEXILHOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631320', 'CRIADOR DE OSTRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631325', 'CRIADOR DE PEIXES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631330', 'CRIADOR DE QUELONIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631335', 'CRIADOR DE RAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631405', 'GELADOR INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631410', 'GELADOR PROFISSIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631415', 'PROEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('631420', 'REDEIRO (PESCA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632005', 'GUIA FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632010', 'RAIZEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632015', 'VIVEIRISTA FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632105', 'CLASSIFICADOR DE TORAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632110', 'CUBADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632115', 'IDENTIFICADOR FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632120', 'OPERADOR DE MOTOSSERRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632125', 'TRABALHADOR DE EXTRACAO FLORESTAL, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632205', 'SERINGUEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632210', 'TRABALHADOR DA EXPLORACAO DE ESPECIES PRODUTORAS DE GOMAS NAO ELASTICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632215', 'TRABALHADOR DA EXPLORACAO DE RESINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632305', 'TRABALHADOR DA EXPLORACAO DE ANDIROBA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632310', 'TRABALHADOR DA EXPLORACAO DE BABACU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632315', 'TRABALHADOR DA EXPLORACAO DE BACABA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632320', 'TRABALHADOR DA EXPLORACAO DE BURITI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632325', 'TRABALHADOR DA EXPLORACAO DE CARNAUBA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632330', 'TRABALHADOR DA EXPLORACAO DE COCODAPRAIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632335', 'TRABALHADOR DA EXPLORACAO DE COPAIBA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632340', 'TRABALHADOR DA EXPLORACAO DE MALVA (PAINA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632345', 'TRABALHADOR DA EXPLORACAO DE MURUMURU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632350', 'TRABALHADOR DA EXPLORACAO DE OITICICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632355', 'TRABALHADOR DA EXPLORACAO DE OURICURI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632360', 'TRABALHADOR DA EXPLORACAO DE PEQUI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632365', 'TRABALHADOR DA EXPLORACAO DE PIACAVA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632370', 'TRABALHADOR DA EXPLORACAO DE TUCUM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632405', 'TRABALHADOR DA EXPLORACAO DE ACAI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632410', 'TRABALHADOR DA EXPLORACAO DE CASTANHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632415', 'TRABALHADOR DA EXPLORACAO DE PINHAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632420', 'TRABALHADOR DA EXPLORACAO DE PUPUNHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632505', 'TRABALHADOR DA EXPLORACAO DE ARVORES E ARBUSTOS PRODUTORES DE SUBSTANCIAS AROMAT , MEDIC  E TOXICAS',
        '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632510', 'TRABALHADOR DA EXPLORACAO DE CIPOS PRODUTORES DE SUBSTANCIAS AROMATICAS, MEDICINAIS E TOXICAS', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632515', 'TRABALHADOR DA EXPLORACAO DE MADEIRAS TANANTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632520', 'TRABALHADOR DA EXPLORACAO DE RAIZES PRODUTORAS DE SUBSTANCIAS AROMATICAS, MEDICINAIS E TOXICAS', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632525', 'TRABALHADOR DA EXTRACAO DE SUBSTANCIAS AROMATICAS, MEDICINAIS E TOXICAS, EM GERAL', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('632605', 'CARVOEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632610', 'CARBONIZADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('632615', 'AJUDANTE DE CARVOARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('641005', 'OPERADOR DE COLHEITADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('641010', 'OPERADOR DE MAQUINAS DE BENEFICIAMENTO DE PRODUTOS AGRICOLAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('641015', 'TRATORISTA AGRICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('642005', 'OPERADOR DE COLHEDOR FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('642010', 'OPERADOR DE MAQUINAS FLORESTAIS ESTATICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('642015', 'OPERADOR DE TRATOR FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('643005', 'TRABALHADOR NA OPERACAO DE SISTEMA DE IRRIGACAO LOCALIZADA (MICROASPERSAO E GOTEJAMENTO)', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('721325', 'POLIDOR DE METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721405', 'OPERADOR DE CENTRO DE USINAGEM COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721410', 'OPERADOR DE FRESADORA COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721415', 'OPERADOR DE MANDRILADORA COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721420', 'OPERADOR DE MAQUINA ELETROEROSAO, A FIO, COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721425', 'OPERADOR DE RETIFICADORA COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721430', 'OPERADOR DE TORNO COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722105', 'FORJADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722110', 'FORJADOR A MARTELO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722115', 'FORJADOR PRENSISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722205', 'FUNDIDOR DE METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722210', 'LINGOTADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722215', 'OPERADOR DE ACABAMENTO DE PECAS FUNDIDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722220', 'OPERADOR DE MAQUINA CENTRIFUGADORA DE FUNDICAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722225', 'OPERADOR DE MAQUINA DE FUNDIR SOB PRESSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722230', 'OPERADOR DE VAZAMENTO (LINGOTAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722235', 'PREPARADOR DE PANELAS (LINGOTAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722305', 'MACHEIRO, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722310', 'MACHEIRO, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722315', 'MOLDADOR, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722320', 'MOLDADOR, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722325', 'OPERADOR DE EQUIPAMENTOS DE PREPARACAO DE AREIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722330', 'OPERADOR DE MAQUINA DE MOLDAR AUTOMATIZADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722405', 'CABLEADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722410', 'ESTIRADOR DE TUBOS DE METAL SEM COSTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('722415', 'TREFILADOR DE METAIS, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723105', 'CEMENTADOR DE METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723110', 'NORMALIZADOR DE METAIS E DE COMPOSITOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723115', 'OPERADOR DE EQUIPAMENTO PARA RESFRIAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723120', 'OPERADOR DE FORNO DE TRATAMENTO TERMICO DE METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723125', 'TEMPERADOR DE METAIS E DE COMPOSITOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723205', 'DECAPADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723210', 'FOSFATIZADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723215', 'GALVANIZADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723220', 'METALIZADOR A PISTOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723225', 'METALIZADOR (BANHO QUENTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723230', 'OPERADOR DE MAQUINA RECOBRIDORA DE ARAME', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723235', 'OPERADOR DE ZINCAGEM (PROCESSO ELETROLITICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723240', 'OXIDADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723305', 'OPERADOR DE EQUIPAMENTO DE SECAGEM DE PINTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723310', 'PINTOR A PINCEL E ROLO (EXCETO OBRAS E ESTRUTURAS METALICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723315', 'PINTOR DE ESTRUTURAS METALICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723320', 'PINTOR DE VEICULOS (FABRICACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723325', 'PINTOR POR IMERSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('723330', 'PINTOR, A PISTOLA (EXCETO OBRAS E ESTRUTURAS METALICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724105', 'ASSENTADOR DE CANALIZACAO (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724110', 'ENCANADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724115', 'INSTALADOR DE TUBULACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724120', 'INSTALADOR DE TUBULACOES (AERONAVES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724125', 'INSTALADOR DE TUBULACOES (EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724130', 'INSTALADOR DE TUBULACOES DE GAS COMBUSTIVEL (PRODUCAO E DISTRIBUICAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724135', 'INSTALADOR DE TUBULACOES DE VAPOR (PRODUCAO E DISTRIBUICAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724205', 'MONTADOR DE ESTRUTURAS METALICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724210', 'MONTADOR DE ESTRUTURAS METALICAS DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724215', 'REBITADOR A MARTELO PNEUMATICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724220', 'PREPARADOR DE ESTRUTURAS METALICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724225', 'RISCADOR DE ESTRUTURAS METALICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724230', 'REBITADOR, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724305', 'BRASADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724310', 'OXICORTADOR A MAO E A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724315', 'SOLDADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724320', 'SOLDADOR A OXIGAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724325', 'SOLDADOR ELETRICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724405', 'CALDEIREIRO (CHAPAS DE COBRE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724410', 'CALDEIREIRO (CHAPAS DE FERRO E ACO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724415', 'CHAPEADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724420', 'CHAPEADOR DE CARROCERIAS METALICAS (FABRICACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724425', 'CHAPEADOR NAVAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724430', 'CHAPEADOR DE AERONAVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724435', 'FUNILEIRO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724440', 'SERRALHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724505', 'OPERADOR DE MAQUINA DE CILINDRAR CHAPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724510', 'OPERADOR DE MAQUINA DE DOBRAR CHAPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724515', 'PRENSISTA (OPERADOR DE PRENSA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724605', 'OPERADOR DE LACOS DE CABOS DE ACO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('724610', 'TRANCADOR DE CABOS DE ACO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725005', 'AJUSTADOR FERRAMENTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725010', 'AJUSTADOR MECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725015', 'AJUSTADOR MECANICO (USINAGEM EM BANCADA E EM MAQUINASFERRAMENTAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725020', 'AJUSTADOR MECANICO EM BANCADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725025', 'AJUSTADOR NAVAL (REPARO E CONSTRUCAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725105', 'MONTADOR DE MAQUINAS, MOTORES E ACESSORIOS (MONTAGEM EM SERIE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725205', 'MONTADOR DE MAQUINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725210', 'MONTADOR DE MAQUINAS GRAFICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725215', 'MONTADOR DE MAQUINAS OPERATRIZES PARA MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725220', 'MONTADOR DE MAQUINAS TEXTEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725225', 'MONTADOR DE MAQUINASFERRAMENTAS (USINAGEM DE METAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725305', 'MONTADOR DE EQUIPAMENTO DE LEVANTAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725310', 'MONTADOR DE MAQUINAS AGRICOLAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725315', 'MONTADOR DE MAQUINAS DE MINAS E PEDREIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725320', 'MONTADOR DE MAQUINAS DE TERRAPLENAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725405', 'MECANICO MONTADOR DE MOTORES DE AERONAVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725410', 'MECANICO MONTADOR DE MOTORES DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725415', 'MECANICO MONTADOR DE MOTORES DE EXPLOSAO E DIESEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725420', 'MECANICO MONTADOR DE TURBOALIMENTADORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725505', 'MONTADOR DE VEICULOS (LINHA DE MONTAGEM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725510', 'OPERADOR DE TIME DE MONTAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725605', 'MONTADOR DE ESTRUTURAS DE AERONAVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725610', 'MONTADOR DE SISTEMAS DE COMBUSTIVEL DE AERONAVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('725705', 'MECANICO DE REFRIGERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('730105', 'SUPERVISOR DE MONTAGEM E INSTALACAO ELETROELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731105', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS (APARELHOS MEDICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731110', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS (COMPUTADORES E EQUIPAMENTOS AUXILIARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731115', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (INSTRUMENTOS DE MEDICAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731120', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (APARELHOS ELETRODOMESTICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731125', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (CENTRAIS ELETRICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731130', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (MOTORES E DINAMOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731135', 'MONTADOR DE EQUIPAMENTOS ELETRICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731140', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS (INSTALACOES DE SINALIZACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731145', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS (MAQUINAS INDUSTRIAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731150', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731155', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (ELEVADORES E EQUIPAMENTOS SIMILARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731160', 'MONTADOR DE EQUIPAMENTOS ELETRICOS (TRANSFORMADORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731165', 'BOBINADOR ELETRICISTA, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731170', 'BOBINADOR ELETRICISTA, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731175', 'OPERADOR DE LINHA DE MONTAGEM (APARELHOS ELETRICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731180', 'OPERADOR DE LINHA DE MONTAGEM (APARELHOS ELETRONICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731205', 'MONTADOR DE EQUIPAMENTOS ELETRONICOS (ESTACAO DE RADIO, TV E EQUIPAMENTOS DE RADAR)', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('731305', 'INSTALADORREPARADOR DE EQUIPAMENTOS DE COMUTACAO EM TELEFONIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731310', 'INSTALADORREPARADOR DE EQUIPAMENTOS DE ENERGIA EM TELEFONIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731315', 'INSTALADORREPARADOR DE EQUIPAMENTOS DE TRANSMISSAO EM TELEFONIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731320', 'INSTALADORREPARADOR DE LINHAS E APARELHOS DE TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731325', 'INSTALADORREPARADOR DE REDES E CABOS TELEFONICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('731330', 'REPARADOR DE APARELHOS DE TELECOMUNICACOES EM LABORATORIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715410', 'OPERADOR DE BOMBA DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732105', 'ELETRICISTA DE MANUTENCAO DE LINHAS ELETRICAS, TELEFONICAS E DE COMUNICACAO DE DADOS', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('716610', 'PINTOR DE OBRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716615', 'REVESTIDOR DE INTERIORES (PAPEL, MATERIAL PLASTICO E EMBORRACHADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('717005', 'DEMOLIDOR DE EDIFICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('717010', 'OPERADOR DE MARTELETE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('717015', 'POCEIRO (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('717020', 'SERVENTE DE OBRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('717025', 'VIBRADORISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720105', 'MESTRE (AFIADOR DE FERRAMENTAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720110', 'MESTRE DE CALDEIRARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720115', 'MESTRE DE FERRAMENTARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720120', 'MESTRE DE FORJARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720125', 'MESTRE DE FUNDICAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720130', 'MESTRE DE GALVANOPLASTIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720135', 'MESTRE DE PINTURA (TRATAMENTO DE SUPERFICIES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720140', 'MESTRE DE SOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720145', 'MESTRE DE TREFILACAO DE METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720150', 'MESTRE DE USINAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720155', 'MESTRE SERRALHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720160', 'SUPERVISOR DE CONTROLE DE TRATAMENTO TERMICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720205', 'MESTRE (CONSTRUCAO NAVAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720210', 'MESTRE (INDUSTRIA DE AUTOMOTORES E MATERIAL DE TRANSPORTES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720215', 'MESTRE (INDUSTRIA DE MAQUINAS E OUTROS EQUIPAMENTOS MECANICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('720220', 'MESTRE DE CONSTRUCAO DE FORNOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721105', 'FERRAMENTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721110', 'FERRAMENTEIRO DE MANDRIS, CALIBRADORES E OUTROS DISPOSITIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721115', 'MODELADOR DE METAIS (FUNDICAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721205', 'OPERADOR DE MAQUINA DE ELETROEROSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721210', 'OPERADOR DE MAQUINAS OPERATRIZES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721215', 'OPERADOR DE MAQUINASFERRAMENTA CONVENCIONAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721220', 'OPERADOR DE USINAGEM CONVENCIONAL POR ABRASAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721225', 'PREPARADOR DE MAQUINASFERRAMENTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721305', 'AFIADOR DE CARDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721310', 'AFIADOR DE CUTELARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721315', 'AFIADOR DE FERRAMENTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('721320', 'AFIADOR DE SERRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('643010', 'TRABALHADOR NA OPERACAO DE SISTEMA DE IRRIGACAO POR ASPERSAO (PIVO CENTRAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('643015', 'TRABALHADOR NA OPERACAO DE SISTEMAS CONVENCIONAIS DE IRRIGACAO POR ASPERSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('643020', 'TRABALHADOR NA OPERACAO DE SISTEMAS DE IRRIGACAO E ASPERSAO (ALTO PROPELIDO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('643025', 'TRABALHADOR NA OPERACAO DE SISTEMAS DE IRRIGACAO POR SUPERFICIE E DRENAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710105', 'SUPERVISOR DE APOIO OPERACIONAL NA MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710110', 'SUPERVISOR DE EXTRACAO DE SAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710115', 'SUPERVISOR DE PERFURACAO E DESMONTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710120', 'SUPERVISOR DE PRODUCAO NA MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710125', 'SUPERVISOR DE TRANSPORTE NA MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710205', 'MESTRE (CONSTRUCAO CIVIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710210', 'MESTRE DE LINHAS (FERROVIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710215', 'INSPETOR DE TERRAPLENAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710220', 'SUPERVISOR DE USINA DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('710225', 'FISCAL DE PATIO DE USINA DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711105', 'AMOSTRADOR DE MINERIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711110', 'CANTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711115', 'DESTROCADOR DE PEDRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711120', 'DETONADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711125', 'ESCORADOR DE MINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711130', 'MINEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711205', 'OPERADOR DE CAMINHAO (MINAS E PEDREIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711210', 'OPERADOR DE CARREGADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711215', 'OPERADOR DE MAQUINA CORTADORA (MINAS E PEDREIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711220', 'OPERADOR DE MAQUINA DE EXTRACAO CONTINUA (MINAS DE CARVAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711225', 'OPERADOR DE MAQUINA PERFURADORA (MINAS E PEDREIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711230', 'OPERADOR DE MAQUINA PERFURATRIZ', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711235', 'OPERADOR DE MOTONIVELADORA (EXTRACAO DE MINERAIS SOLIDOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711240', 'OPERADOR DE SCHUTTHECAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711245', 'OPERADOR DE TRATOR (MINAS E PEDREIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711305', 'OPERADOR DE SONDA DE PERCUSSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711310', 'OPERADOR DE SONDA ROTATIVA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711315', 'SONDADOR (POCOS DE PETROLEO E GAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711320', 'SONDADOR DE POCOS (EXCETO DE PETROLEO E GAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711325', 'PLATAFORMISTA (PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711330', 'TORRISTA (PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711405', 'GARIMPEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('711410', 'OPERADOR DE SALINA (SAL MARINHO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712105', 'MOLEIRO DE MINERIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712110', 'OPERADOR DE APARELHO DE FLOTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712115', 'OPERADOR DE APARELHO DE PRECIPITACAO (MINAS DE OURO OU PRATA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712120', 'OPERADOR DE BRITADOR DE MANDIBULAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712125', 'OPERADOR DE ESPESSADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712130', 'OPERADOR DE JIG (MINAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712135', 'OPERADOR DE PENEIRAS HIDRAULICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712205', 'CORTADOR DE PEDRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712210', 'GRAVADOR DE INSCRICOES EM PEDRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712215', 'GRAVADOR DE RELEVOS EM PEDRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712220', 'POLIDOR DE PEDRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712225', 'TORNEIRO (LAVRA DE PEDRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('712230', 'TRACADOR DE PEDRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715105', 'OPERADOR DE BATEESTACAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715110', 'OPERADOR DE COMPACTADORA DE SOLOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715115', 'OPERADOR DE ESCAVADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715120', 'OPERADOR DE MAQUINA DE ABRIR VALAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715125', 'OPERADOR DE MAQUINAS DE CONSTRUCAO CIVIL E MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715130', 'OPERADOR DE MOTONIVELADORA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715135', 'OPERADOR DE PA CARREGADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715140', 'OPERADOR DE PAVIMENTADORA (ASFALTO, CONCRETO E MATERIAIS SIMILARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715145', 'OPERADOR DE TRATOR DE LAMINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715205', 'CALCETEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715210', 'PEDREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715215', 'PEDREIRO (CHAMINES INDUSTRIAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715220', 'PEDREIRO (MATERIAL REFRATARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715225', 'PEDREIRO (MINERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715230', 'PEDREIRO DE EDIFICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715305', 'ARMADOR DE ESTRUTURA DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715310', 'MOLDADOR DE CORPOS DE PROVA EM USINAS DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715315', 'ARMADOR DE ESTRUTURA DE CONCRETO ARMADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715405', 'OPERADOR DE BETONEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715415', 'OPERADOR DE CENTRAL DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715505', 'CARPINTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715510', 'CARPINTEIRO (ESQUADRIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715515', 'CARPINTEIRO (CENARIOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715520', 'CARPINTEIRO (MINERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715525', 'CARPINTEIRO DE OBRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715530', 'CARPINTEIRO (TELHADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715535', 'CARPINTEIRO DE FORMAS PARA CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715540', 'CARPINTEIRO DE OBRAS CIVIS DE ARTE (PONTES, TUNEIS, BARRAGENS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715545', 'MONTADOR DE ANDAIMES (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715605', 'ELETRICISTA DE INSTALACOES (CENARIOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715610', 'ELETRICISTA DE INSTALACOES (EDIFICIOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715615', 'ELETRICISTA DE INSTALACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715705', 'APLICADOR DE ASFALTO IMPERMEABILIZANTE (COBERTURAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715710', 'INSTALADOR DE ISOLANTES ACUSTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715715', 'INSTALADOR DE ISOLANTES TERMICOS (REFRIGERACAO E CLIMATIZACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715720', 'INSTALADOR DE ISOLANTES TERMICOS DE CALDEIRA E TUBULACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715725', 'INSTALADOR DE MATERIAL ISOLANTE, A MAO (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('715730', 'INSTALADOR DE MATERIAL ISOLANTE, A MAQUINA (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716105', 'ACABADOR DE SUPERFICIES DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716110', 'REVESTIDOR DE SUPERFICIES DE CONCRETO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716205', 'TELHADOR (TELHAS DE ARGILA E MATERIAS SIMILARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716210', 'TELHADOR (TELHAS DE CIMENTOAMIANTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716215', 'TELHADOR (TELHAS METALICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716220', 'TELHADOR (TELHAS PLATICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716305', 'VIDRACEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716310', 'VIDRACEIRO (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716315', 'VIDRACEIRO (VITRAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716405', 'GESSEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716505', 'ASSOALHADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716510', 'LADRILHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716515', 'PASTILHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716520', 'LUSTRADOR DE PISO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716525', 'MARMORISTA (CONSTRUCAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716530', 'MOSAISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716535', 'TAQUEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('716605', 'CALAFETADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010105', 'OFICIAL GENERAL DA AERONAUTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010110', 'OFICIAL GENERAL DO EXERCITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010115', 'OFICIAL GENERAL DA MARINHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010205', 'OFICIAL DA AERONAUTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010210', 'OFICIAL DO EXERCITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010215', 'OFICIAL DA MARINHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010305', 'PRACA DA AERONAUTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010310', 'PRACA DO EXERCITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('010315', 'PRACA DA MARINHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020105', 'CORONEL DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020110', 'TENENTECORONEL DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020115', 'MAJOR DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020205', 'CAPITAO DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020305', 'PRIMEIRO TENENTE DE POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('020310', 'SEGUNDO TENENTE DE POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('021105', 'SUBTENENTE DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('021110', 'SARGENTO DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('021205', 'CABO DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('021210', 'SOLDADO DA POLICIA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('030105', 'CORONEL BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('030110', 'MAJOR BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('030115', 'TENENTECORONEL BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('030205', 'CAPITAO BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('030305', 'TENENTE DO CORPO DE BOMBEIROS MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('031105', 'SUBTENENTE BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('031110', 'SARGENTO BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('031205', 'CABO BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('031210', 'SOLDADO BOMBEIRO MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111105', 'SENADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111110', 'DEPUTADO FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111115', 'DEPUTADO ESTADUAL E DISTRITAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111120', 'VEREADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111205', 'PRESIDENTE DA REPUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111210', 'VICEPRESIDENTE DA REPUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111215', 'MINISTRO DE ESTADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111220', 'SECRETARIOEXECUTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111225', 'MEMBRO SUPERIOR DO PODER EXECUTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111230', 'GOVERNADOR DE ESTADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111235', 'GOVERNADOR DO DISTRITO FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111240', 'VICEGOVERNADOR DE ESTADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111245', 'VICEGOVERNADOR DO DISTRITO FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111250', 'PREFEITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111255', 'VICEPREFEITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111305', 'MINISTRO DO SUPREMO TRIBUNAL FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111310', 'MINISTRO DO SUPERIOR TRIBUNAL DE JUSTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111315', 'MINISTRO DO SUPERIOR TRIBUNAL MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111320', 'MINISTRO DO SUPERIOR TRIBUNAL DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111325', 'JUIZ DE DIREITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111330', 'JUIZ FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111335', 'JUIZ AUDITOR FEDERAL  JUSTICA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111340', 'JUIZ AUDITOR ESTADUAL  JUSTICA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111345', 'JUIZ DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111405', 'DIRIGENTE DO SERVICO PUBLICO FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111410', 'DIRIGENTE DO SERVICO PUBLICO ESTADUAL E DISTRITAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111415', 'DIRIGENTE DO SERVICO PUBLICO MUNICIPAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111505', 'ESPECIALISTA DE POLITICAS PUBLICAS E GESTAO GOVERNAMENTAL  EPPGG', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('111510', 'ANALISTA DE PLANEJAMENTO E ORCAMENTO  APO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('113005', 'CACIQUE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('113010', 'LIDER DE COMUNIDADE CAICARA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('113015', 'MEMBRO DE LIDERANCA QUILOMBOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('114105', 'DIRIGENTE DE PARTIDO POLITICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('114205', 'DIRIGENTES DE ENTIDADES DE TRABALHADORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('114210', 'DIRIGENTES DE ENTIDADES PATRONAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('114305', 'DIRIGENTE E ADMINISTRADOR DE ORGANIZACAO RELIGIOSA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('114405', 'DIRIGENTE E ADMINISTRADOR DE ORGANIZACAO DA SOCIEDADE CIVIL SEM FINS LUCRATIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('121005', 'DIRETOR DE PLANEJAMENTO ESTRATEGICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('121010', 'DIRETOR GERAL DE EMPRESA E ORGANIZACOES (EXCETO DE INTERESSE PUBLICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122105', 'DIRETOR DE PRODUCAO E OPERACOES EM EMPRESA AGROPECUARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122110', 'DIRETOR DE PRODUCAO E OPERACOES EM EMPRESA AQICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122115', 'DIRETOR DE PRODUCAO E OPERACOES EM EMPRESA FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122120', 'DIRETOR DE PRODUCAO E OPERACOES EM EMPRESA PESQUEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122205', 'DIRETOR DE PRODUCAO E OPERACOES DA INDUSTRIA DE TRANSFORMACAO, EXTRACAO MINERAL E UTILIDADES', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122305', 'DIRETOR DE OPERACOES DE OBRAS PUBLICA E CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122405', 'DIRETOR DE OPERACOES COMERCIAIS (COMERCIO ATACADISTA E VAREJISTA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122505', 'DIRETOR DE PRODUCAO E OPERACOES DE ALIMENTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122510', 'DIRETOR DE PRODUCAO E OPERACOES DE HOTEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122515', 'DIRETOR DE PRODUCAO E OPERACOES DE TURISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122520', 'TURISMOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122605', 'DIRETOR DE OPERACOES DE CORREIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122610', 'DIRETOR DE OPERACOES DE SERVICOS DE ARMAZENAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122615', 'DIRETOR DE OPERACOES DE SERVICOS DE TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122620', 'DIRETOR DE OPERACOES DE SERVICOS DE TRANSPORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122705', 'DIRETOR COMERCIAL EM OPERACOES DE INTERMEDIACAO FINANCEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122710', 'DIRETOR DE PRODUTOS BANCARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122715', 'DIRETOR DE CREDITO RURAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122720', 'DIRETOR DE CAMBIO E COMERCIO EXTERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122725', 'DIRETOR DE COMPLIANCE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122730', 'DIRETOR DE CREDITO (EXCETO CREDITO IMOBILIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122735', 'DIRETOR DE CREDITO IMOBILIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122740', 'DIRETOR DE LEASING', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122745', 'DIRETOR DE MERCADO DE CAPITAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122750', 'DIRETOR DE RECUPERACAO DE CREDITOS EM OPERACOES DE INTERMEDIACAO FINANCEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('122755', 'DIRETOR DE RISCOS DE MERCADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123105', 'DIRETOR ADMINISTRATIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123110', 'DIRETOR ADMINISTRATIVO E FINANCEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123115', 'DIRETOR FINANCEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123205', 'DIRETOR DE RECURSOS HUMANOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123210', 'DIRETOR DE RELACOES DE TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123305', 'DIRETOR COMERCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123310', 'DIRETOR DE MARKETING', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123405', 'DIRETOR DE SUPRIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123410', 'DIRETOR DE SUPRIMENTOS NO SERVICO PUBLICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123605', 'DIRETOR DE SERVICOS DE INFORMATICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123705', 'DIRETOR DE PESQUISA E DESENVOLVIMENTO (PD)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('123805', 'DIRETOR DE MANUTENCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131105', 'DIRETOR DE SERVICOS CULTURAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131110', 'DIRETOR DE SERVICOS SOCIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131115', 'GERENTE DE SERVICOS CULTURAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131120', 'GERENTE DE SERVICOS SOCIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('1312C1', 'SANITARISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131205', 'DIRETOR DE SERVICOS DE SAUDE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('131210', 'GERENTE DE SERVICOS DE SAUDE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('131215', 'TECNOLOGO EM GESTAO HOSPITALAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131305', 'DIRETOR DE INSTITUICAO EDUCACIONAL DA AREA PRIVADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131310', 'DIRETOR DE INSTITUICAO EDUCACIONAL PUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131315', 'GERENTE DE INSTITUICAO EDUCACIONAL DA AREA PRIVADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131320', 'GERENTE DE SERVICOS EDUCACIONAIS DA AREA PUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141105', 'GERENTE DE PRODUCAO E OPERACOES AQICOLAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141110', 'GERENTE DE PRODUCAO E OPERACOES FLORESTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141115', 'GERENTE DE PRODUCAO E OPERACOES AGROPECUARIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141120', 'GERENTE DE PRODUCAO E OPERACOES PESQUEIRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141205', 'GERENTE DE PRODUCAO E OPERACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141305', 'GERENTE DE PRODUCAO E OPERACOES DA CONSTRUCAO CIVIL E OBRAS PUBLICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141405', 'COMERCIANTE ATACADISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141410', 'COMERCIANTE VAREJISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141415', 'GERENTE DE LOJA E SUPERMERCADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141420', 'GERENTE DE OPERACOES DE SERVICOS DE ASSISTENCIA TECNICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141505', 'GERENTE DE HOTEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141510', 'GERENTE DE RESTAURANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141515', 'GERENTE DE BAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141520', 'GERENTE DE PENSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141525', 'GERENTE DE TURISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141605', 'GERENTE DE OPERACOES DE TRANSPORTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141610', 'GERENTE DE OPERACOES DE CORREIOS E TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141615', 'GERENTE DE LOGISTICA (ARMAZENAGEM E DISTRIBUICAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141705', 'GERENTE DE PRODUTOS BANCARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141710', 'GERENTE DE AGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141715', 'GERENTE DE CAMBIO E COMERCIO EXTERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141720', 'GERENTE DE CREDITO E COBRANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141725', 'GERENTE DE CREDITO IMOBILIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141730', 'GERENTE DE CREDITO RURAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('141735', 'GERENTE DE RECUPERACAO DE CREDITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142105', 'GERENTE ADMINISTRATIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142110', 'GERENTE DE RISCOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142115', 'GERENTE FINANCEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142120', 'TECNOLOGO EM GESTAO ADMINISTRATIVO FINANCEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142205', 'GERENTE DE RECURSOS HUMANOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142210', 'GERENTE DE DEPARTAMENTO PESSOAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142305', 'GERENTE COMERCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142310', 'GERENTE DE COMUNICACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142315', 'GERENTE DE MARKETING', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142320', 'GERENTE DE VENDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142325', 'RELACOES PUBLICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142330', 'ANALISTA DE NEGOCIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142335', 'ANALISTA DE PESQUISA DE MERCADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142340', 'OUVIDOR', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142405', 'GERENTE DE COMPRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142410', 'GERENTE DE SUPRIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142415', 'GERENTE DE ALMOXARIFADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142505', 'GERENTE DE REDE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142510', 'GERENTE DE DESENVOLVIMENTO DE SISTEMAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142515', 'GERENTE DE PRODUCAO DE TECNOLOGIA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142520', 'GERENTE DE PROJETOS DE TECNOLOGIA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142525', 'GERENTE DE SEGURANCA DE TECNOLOGIA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142530', 'GERENTE DE SUPORTE TECNICO DE TECNOLOGIA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142535', 'TECNOLOGO EM GESTAO DA TECNOLOGIA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142605', 'GERENTE DE PESQUISA E DESENVOLVIMENTO (PD)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142610', 'ESPECIALISTA EM DESENVOLVIMENTO DE CIGARROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142705', 'GERENTE DE PROJETOS E SERVICOS DE MANUTENCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('142710', 'TECNOLOGO EM SISTEMAS BIOMEDICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201105', 'BIOENGENHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201110', 'BIOTECNOLOGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201115', 'GENETICISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201205', 'PESQUISADOR EM METROLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201210', 'ESPECIALISTA EM CALIBRACOES METROLOGICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201215', 'ESPECIALISTA EM ENSAIOS METROLOGICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201220', 'ESPECIALISTA EM INSTRUMENTACAO METROLOGICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('201225', 'ESPECIALISTA EM MATERIAIS DE REFERENCIA METROLOGICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('202105', 'ENGENHEIRO MECATRONICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('202110', 'ENGENHEIRO DE CONTROLE E AUTOMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('202115', 'TECNOLOGO EM MECATRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('202120', 'TECNOLOGO EM AUTOMACAO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203005', 'PESQUISADOR EM BIOLOGIA AMBIENTAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203010', 'PESQUISADOR EM BIOLOGIA ANIMAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203015', 'PESQUISADOR EM BIOLOGIA DE MICROORGANISMOS E PARASITAS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203020', 'PESQUISADOR EM BIOLOGIA HUMANA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('203025', 'PESQUISADOR EM BIOLOGIA VEGETAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203105', 'PESQUISADOR EM CIENCIAS DA COMPUTACAO E INFORMATICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203110', 'PESQUISADOR EM CIENCIAS DA TERRA E MEIO AMBIENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203115', 'PESQUISADOR EM FISICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203120', 'PESQUISADOR EM MATEMATICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203125', 'PESQUISADOR EM QUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203205', 'PESQUISADOR DE ENGENHARIA CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203210', 'PESQUISADOR DE ENGENHARIA E TECNOLOGIA (OUTRAS AREAS DA ENGENHARIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203215', 'PESQUISADOR DE ENGENHARIA ELETRICA E ELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203220', 'PESQUISADOR DE ENGENHARIA MECANICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203225', 'PESQUISADOR DE ENGENHARIA METALURGICA, DE MINAS E DE MATERIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203230', 'PESQUISADOR DE ENGENHARIA QUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203305', 'PESQUISADOR DE CLINICA MEDICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203310', 'PESQUISADOR DE MEDICINA BASICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203315', 'PESQUISADOR EM MEDICINA VETERINARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203320', 'PESQUISADOR EM SAUDE COLETIVA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203405', 'PESQUISADOR EM CIENCIAS AGRONOMICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203410', 'PESQUISADOR EM CIENCIAS DA PESCA E AQICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203415', 'PESQUISADOR EM CIENCIAS DA ZOOTECNIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203420', 'PESQUISADOR EM CIENCIAS FLORESTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203505', 'PESQUISADOR EM CIENCIAS SOCIAIS E HUMANAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203510', 'PESQUISADOR EM ECONOMIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203515', 'PESQUISADOR EM CIENCIAS DA EDUCACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203520', 'PESQUISADOR EM HISTORIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('203525', 'PESQUISADOR EM PSICOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('204105', 'PERITO CRIMINAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211105', 'ATUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211110', 'ESPECIALISTA EM PESQUISA OPERACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211115', 'MATEMATICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211120', 'MATEMATICO APLICADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211205', 'ESTATISTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211210', 'ESTATISTICO (ESTATISTICA APLICADA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('211215', 'ESTATISTICO TEORICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212205', 'ENGENHEIRO DE APLICATIVOS EM COMPUTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212210', 'ENGENHEIRO DE EQUIPAMENTOS EM COMPUTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212215', 'ENGENHEIROS DE SISTEMAS OPERACIONAIS EM COMPUTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212305', 'ADMINISTRADOR DE BANCO DE DADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212310', 'ADMINISTRADOR DE REDES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212315', 'ADMINISTRADOR DE SISTEMAS OPERACIONAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212320', 'ADMINISTRADOR EM SEGURANCA DA INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212405', 'ANALISTA DE DESENVOLVIMENTO DE SISTEMAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212410', 'ANALISTA DE REDES E DE COMUNICACAO DE DADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212415', 'ANALISTA DE SISTEMAS DE AUTOMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('212420', 'ANALISTA DE SUPORTE COMPUTACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213105', 'FISICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213110', 'FISICO (ACUSTICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213115', 'FISICO (ATOMICA E MOLECULAR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213120', 'FISICO (COSMOLOGIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213125', 'FISICO (ESTATISTICA E MATEMATICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213130', 'FISICO (FLUIDOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213135', 'FISICO (INSTRUMENTACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213140', 'FISICO (MATERIA CONDENSADA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213145', 'FISICO (MATERIAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213150', 'FISICO (MEDICINA)', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('213155', 'FISICO (NUCLEAR E REATORES)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213160', 'FISICO (OPTICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213165', 'FISICO (PARTICULAS E CAMPOS)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213170', 'FISICO (PLASMA)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213175', 'FISICO (TERMICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213205', 'QUIMICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213210', 'QUIMICO INDUSTRIAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213215', 'TECNOLOGO EM PROCESSOS QUIMICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213305', 'ASTRONOMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213310', 'GEOFISICO ESPACIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213315', 'METEOROLOGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213405', 'GEOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213410', 'GEOLOGO DE ENGENHARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213415', 'GEOFISICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213420', 'GEOQUIMICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213425', 'HIDROGEOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213430', 'PALEONTOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213435', 'PETROGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('213440', 'OCEANOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214005', 'ENGENHEIRO AMBIENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214010', 'TECNOLOGO EM MEIO AMBIENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214105', 'ARQUITETO DE EDIFICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214110', 'ARQUITETO DE INTERIORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214115', 'ARQUITETO DE PATRIMONIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214120', 'ARQUITETO PAISAGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214125', 'ARQUITETO URBANISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214130', 'URBANISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214205', 'ENGENHEIRO CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214210', 'ENGENHEIRO CIVIL (AEROPORTOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214215', 'ENGENHEIRO CIVIL (EDIFICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214220', 'ENGENHEIRO CIVIL (ESTRUTURAS METALICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214225', 'ENGENHEIRO CIVIL (FERROVIAS E METROVIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214230', 'ENGENHEIRO CIVIL (GEOTECNIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214235', 'ENGENHEIRO CIVIL (HIDROLOGIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214240', 'ENGENHEIRO CIVIL (HIDRAULICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214245', 'ENGENHEIRO CIVIL (PONTES E VIADUTOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214250', 'ENGENHEIRO CIVIL (PORTOS E VIAS NAVEGAVEIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214255', 'ENGENHEIRO CIVIL (RODOVIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214260', 'ENGENHEIRO CIVIL (SANEAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214265', 'ENGENHEIRO CIVIL (TUNEIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214270', 'ENGENHEIRO CIVIL (TRANSPORTES E TRANSITO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214280', 'TECNOLOGO EM CONSTRUCAO CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214305', 'ENGENHEIRO ELETRICISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214310', 'ENGENHEIRO ELETRONICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214315', 'ENGENHEIRO ELETRICISTA DE MANUTENCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214320', 'ENGENHEIRO ELETRICISTA DE PROJETOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214325', 'ENGENHEIRO ELETRONICO DE MANUTENCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214330', 'ENGENHEIRO ELETRONICO DE PROJETOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214335', 'ENGENHEIRO DE MANUTENCAO DE TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214340', 'ENGENHEIRO DE TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214345', 'ENGENHEIRO PROJETISTA DE TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214350', 'ENGENHEIRO DE REDES DE COMUNICACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214360', 'TECNOLOGO EM ELETRICIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214365', 'TECNOLOGO EM ELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214370', 'TECNOLOGO EM TELECOMUNICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214405', 'ENGENHEIRO MECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214410', 'ENGENHEIRO MECANICO AUTOMOTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214415', 'ENGENHEIRO MECANICO (ENERGIA NUCLEAR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214420', 'ENGENHEIRO MECANICO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214425', 'ENGENHEIRO AERONAUTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214430', 'ENGENHEIRO NAVAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214435', 'TECNOLOGO EM FABRICACAO MECANICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214505', 'ENGENHEIRO QUIMICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214510', 'ENGENHEIRO QUIMICO (INDUSTRIA QUIMICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214515', 'ENGENHEIRO QUIMICO (MINERACAO, METALURGIA, SIDERURGIA, CIMENTEIRA E CERAMICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214520', 'ENGENHEIRO QUIMICO (PAPEL E CELULOSE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214525', 'ENGENHEIRO QUIMICO (PETROLEO E BORRACHA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214530', 'ENGENHEIRO QUIMICO (UTILIDADES E MEIO AMBIENTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214535', 'TECNOLOGO EM PRODUCAO SULCROALCOOLEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214605', 'ENGENHEIRO DE MATERIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214610', 'ENGENHEIRO METALURGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214615', 'TECNOLOGO EM METALURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214705', 'ENGENHEIRO DE MINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214710', 'ENGENHEIRO DE MINAS (BENEFICIAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214715', 'ENGENHEIRO DE MINAS (LAVRA A CEU ABERTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214720', 'ENGENHEIRO DE MINAS (LAVRA SUBTERRANEA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214725', 'ENGENHEIRO DE MINAS (PESQUISA MINERAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214730', 'ENGENHEIRO DE MINAS (PLANEJAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214735', 'ENGENHEIRO DE MINAS (PROCESSO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214740', 'ENGENHEIRO DE MINAS (PROJETO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214745', 'TECNOLOGO EM PETROLEO E GAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214750', 'TECNOLOGO EM ROCHAS ORNAMENTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214805', 'ENGENHEIRO AGRIMENSOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214810', 'ENGENHEIRO CARTOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214905', 'ENGENHEIRO DE PRODUCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214910', 'ENGENHEIRO DE CONTROLE DE QUALIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214915', 'ENGENHEIRO DE SEGURANCA DO TRABALHO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214920', 'ENGENHEIRO DE RISCOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214925', 'ENGENHEIRO DE TEMPOS E MOVIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214930', 'TECNOLOGO EM PRODUCAO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214935', 'TECNOLOGO EM SEGURANCA DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215105', 'AGENTE DE MANOBRA E DOCAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215110', 'CAPITAO DE MANOBRA DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215115', 'COMANDANTE DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215120', 'COORDENADOR DE OPERACOES DE COMBATE A POLUICAO NO MEIO AQUAVIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215125', 'IMEDIATO DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215130', 'INSPETOR DE TERMINAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215135', 'INSPETOR NAVAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215140', 'OFICIAL DE QUARTO DE NAVEGACAO DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215145', 'PRATICO DE PORTOS DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215150', 'VISTORIADOR NAVAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215205', 'OFICIAL SUPERIOR DE MAQUINAS DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215210', 'PRIMEIRO OFICIAL DE MAQUINAS DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215215', 'SEGUNDO OFICIAL DE MAQUINAS DA MARINHA MERCANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215220', 'SUPERINTENDENTE TECNICO NO TRANSPORTE AQUAVIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215305', 'PILOTO DE AERONAVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215310', 'PILOTO DE ENSAIOS EM VOO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('215315', 'INSTRUTOR DE VOO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('221105', 'BIOLOGO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('221205', 'BIOMEDICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('222105', 'ENGENHEIRO AGRICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('222110', 'ENGENHEIRO AGRONOMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('222115', 'ENGENHEIRO DE PESCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('222120', 'ENGENHEIRO FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('222205', 'ENGENHEIRO DE ALIMENTOS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('222215', 'TECNOLOGO EM ALIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('2231A1', 'MEDICO BRONCOESOFALOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('2231F8', 'MEDICO EM MEDICINA PREVENTIVA E SOCIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('2231F9', 'MEDICO RESIDENTE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('2231G1', 'MEDICO CARDIOLOGISTA INTERVENCIONISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223119', 'MEDICO EM ELETROENCEFALOGRAFIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223150', 'MEDICO PERITO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223204', 'CIRURGIAO DENTISTA  AUDITOR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223208', 'CIRURGIAO DENTISTA  CLINICO GERAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223212', 'CIRURGIAO DENTISTA  ENDODONTISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223216', 'CIRURGIAO DENTISTA  EPIDEMIOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223220', 'CIRURGIAO DENTISTA  ESTOMATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223224', 'CIRURGIAO DENTISTA  IMPLANTODONTISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223228', 'CIRURGIAO DENTISTA  ODONTOGERIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223232', 'CIRURGIAO DENTISTA  ODONTOLOGISTA LEGAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223236', 'CIRURGIAO DENTISTA  ODONTOPEDIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223240', 'CIRURGIAO DENTISTA  ORTOPEDISTA E ORTODONTISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223244', 'CIRURGIAO DENTISTA  PATOLOGISTA BUCAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223248', 'CIRURGIAO DENTISTA  PERIODONTISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223252', 'CIRURGIAO DENTISTA  PROTESIOLOGO BUCOMAXILOFACIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223256', 'CIRURGIAO DENTISTA  PROTESISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223260', 'CIRURGIAO DENTISTA  RADIOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223264', 'CIRURGIAO DENTISTA  REABILITADOR ORAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223268', 'CIRURGIAO DENTISTA  TRAUMATOLOGISTA BUCOMAXILOFACIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223272', 'CIRURGIAO DENTISTA DE SAUDE COLETIVA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223276', 'CIRURGIAO DENTISTA  ODONTOLOGIA DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223280', 'CIRURGIAO DENTISTA  DENTISTICA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223284', 'CIRURGIAO DENTISTA  DISFUNCAO TEMPOROMANDIBULAR E DOR OROFACIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223288', 'CIRURGIAO DENTISTA  ODONTOLOGIA PARA PACIENTES COM NECESSIDADES ESPECIAIS', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223293', 'CIRURGIAODENTISTA DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223305', 'MEDICO VETERINARIO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223310', 'ZOOTECNISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223405', 'FARMACEUTICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223415', 'FARMACEUTICO ANALISTA CLINICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223420', 'FARMACEUTICO DE ALIMENTOS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223425', 'FARMACEUTICO PRATICAS INTEGRATIVAS E COMPLEMENTARES', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223430', 'FARMACEUTICO EM SAUDE PUBLICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223435', 'FARMACEUTICO INDUSTRIAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223440', 'FARMACEUTICO TOXICOLOGISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223445', 'FARMACEUTICO HOSPITALAR E CLINICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('2235C3', 'ENFERMEIRO ESTOMATERAPEUTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223505', 'ENFERMEIRO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223510', 'ENFERMEIRO AUDITOR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223515', 'ENFERMEIRO DE BORDO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223520', 'ENFERMEIRO DE CENTRO CIRURGICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223525', 'ENFERMEIRO DE TERAPIA INTENSIVA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223530', 'ENFERMEIRO DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223535', 'ENFERMEIRO NEFROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223540', 'ENFERMEIRO NEONATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223545', 'ENFERMEIRO OBSTETRICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223550', 'ENFERMEIRO PSIQUIATRICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223555', 'ENFERMEIRO PUERICULTOR E PEDIATRICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223560', 'ENFERMEIRO SANITARISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223565', 'ENFERMEIRO DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223570', 'PERFUSIONISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('2236I1', 'TECNICO EM ORIENTACAO E MOBILIDADE DE CEGOS E DEFICIENTES VISUAIS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223605', 'FISIOTERAPEUTA GERAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223625', 'FISIOTERAPEUTA RESPIRATORIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223630', 'FISIOTERAPEUTA NEUROFUNCIONAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223635', 'FISIOTERAPEUTA TRAUMATOORTOPEDICA FUNCIONAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223640', 'FISIOTERAPEUTA OSTEOPATA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223645', 'FISIOTERAPEUTA QUIROPRAXISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223650', 'FISIOTERAPEUTA ACUPUNTURISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223655', 'FISIOTERAPEUTA ESPORTIVO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223660', 'FISIOTERAPEUTA DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223705', 'DIETISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223710', 'NUTRICIONISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223810', 'FONOAUDIOLOGO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223815', 'FONOAUDIOLOGO EDUCACIONAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223820', 'FONOAUDIOLOGO EM AUDIOLOGIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223825', 'FONOAUDIOLOGO EM DISFAGIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223830', 'FONOAUDIOLOGO EM LINGUAGEM', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223835', 'FONOAUDIOLOGO EM MOTRICIDADE OROFACIAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223840', 'FONOAUDIOLOGO EM SAUDE COLETIVA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223845', 'FONOAUDIOLOGO EM VOZ', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('223905', 'TERAPEUTA OCUPACIONAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223910', 'ORTOPTISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('2241E1', 'PROFISSIONAL DE EDUCACAO FISICA NA SAUDE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('224105', 'AVALIADOR FISICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224110', 'LUDOMOTRICISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224115', 'PREPARADOR DE ATLETA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224120', 'PREPARADOR FISICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224125', 'TECNICO DE DESPORTO INDIVIDUAL E COLETIVO (EXCETO FUTEBOL)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224130', 'TECNICO DE LABORATORIO E FISCALIZACAO DESPORTIVA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('224135', 'TREINADOR PROFISSIONAL DE FUTEBOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('225103', 'MEDICO INFECTOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225105', 'MEDICO ACUPUNTURISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225106', 'MEDICO LEGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225109', 'MEDICO NEFROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225110', 'MEDICO ALERGISTA E IMUNOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225112', 'MEDICO NEUROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225115', 'MEDICO ANGIOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225118', 'MEDICO NUTROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225120', 'MEDICO CARDIOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225121', 'MEDICO ONCOLOGISTA CLINICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225122', 'MEDICO CANCEROLOGISTA PEDIATRICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225124', 'MEDICO PEDIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225125', 'MEDICO CLINICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225127', 'MEDICO PNEUMOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225130', 'MEDICO DE FAMILIA E COMUNIDADE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225133', 'MEDICO PSIQUIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225135', 'MEDICO DERMATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225136', 'MEDICO REUMATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225139', 'MEDICO SANITARISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225140', 'MEDICO DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225142', 'MEDICO DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225145', 'MEDICO EM MEDICINA DE TRAFEGO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225148', 'MEDICO ANATOMOPATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225150', 'MEDICO EM MEDICINA INTENSIVA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225151', 'MEDICO ANESTESIOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225155', 'MEDICO ENDOCRINOLOGISTA E METABOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225160', 'MEDICO FISIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225165', 'MEDICO GASTROENTEROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225170', 'MEDICO GENERALISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225175', 'MEDICO GENETICISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225180', 'MEDICO GERIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225185', 'MEDICO HEMATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225195', 'MEDICO HOMEOPATA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225203', 'MEDICO EM CIRURGIA VASCULAR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225210', 'MEDICO CIRURGIAO CARDIOVASCULAR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225215', 'MEDICO CIRURGIAO DE CABECA E PESCOCO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225220', 'MEDICO CIRURGIAO DO APARELHO DIGESTIVO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225225', 'MEDICO CIRURGIAO GERAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225230', 'MEDICO CIRURGIAO PEDIATRICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225235', 'MEDICO CIRURGIAO PLASTICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225240', 'MEDICO CIRURGIAO TORACICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225250', 'MEDICO GINECOLOGISTA E OBSTETRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225255', 'MEDICO MASTOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225260', 'MEDICO NEUROCIRURGIAO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225265', 'MEDICO OFTALMOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225270', 'MEDICO ORTOPEDISTA E TRAUMATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225275', 'MEDICO OTORRINOLARINGOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225280', 'MEDICO COLOPROCTOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225285', 'MEDICO UROLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225290', 'MEDICO CANCEROLOGISTA CIRURGICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225295', 'MEDICO CIRURGIAO DA MAO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225305', 'MEDICO CITOPATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225310', 'MEDICO EM ENDOSCOPIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225315', 'MEDICO EM MEDICINA NUCLEAR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225320', 'MEDICO EM RADIOLOGIA E DIAGNOSTICO POR IMAGEM', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225325', 'MEDICO PATOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225330', 'MEDICO RADIOTERAPEUTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225335', 'MEDICO PATOLOGISTA CLINICO  MEDICINA LABORATORIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225340', 'MEDICO HEMOTERAPEUTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225345', 'MEDICO HIPERBARISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225350', 'MEDICO NEUROFISIOLOGISTA CLINICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('226105', 'QUIROPRAXISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('226110', 'OSTEOPATA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('226305', 'MUSICOTERAPEUTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('226310', 'ARTETERAPEUTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('226315', 'EQUOTERAPEUTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234735', 'PROFESSOR DE FILOSOFIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231105', 'PROFESSOR DE NIVEL SUPERIOR NA EDUCACAO INFANTIL (QUATRO A SEIS ANOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231110', 'PROFESSOR DE NIVEL SUPERIOR NA EDUCACAO INFANTIL (ZERO A TRES ANOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231205', 'PROFESSOR DA EDUCACAO DE JOVENS E ADULTOS DO ENSINO FUNDAMENTAL (PRIMEIRA A QUARTA SERIE)', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('231210', 'PROFESSOR DE NIVEL SUPERIOR DO ENSINO FUNDAMENTAL (PRIMEIRA A QUARTA SERIE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231305', 'PROFESSOR DE CIENCIAS EXATAS E NATURAIS DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231310', 'PROFESSOR DE EDUCACAO ARTISTICA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231315', 'PROFESSOR DE EDUCACAO FISICA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231320', 'PROFESSOR DE GEOGRAFIA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231325', 'PROFESSOR DE HISTORIA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231330', 'PROFESSOR DE LINGUA ESTRANGEIRA MODERNA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231335', 'PROFESSOR DE LINGUA PORTUGUESA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('231340', 'PROFESSOR DE MATEMATICA DO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232105', 'PROFESSOR DE ARTES NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232110', 'PROFESSOR DE BIOLOGIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232115', 'PROFESSOR DE DISCIPLINAS PEDAGOGICAS NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232120', 'PROFESSOR DE EDUCACAO FISICA NO ENSINO MEDIO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('232125', 'PROFESSOR DE FILOSOFIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232130', 'PROFESSOR DE FISICA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232135', 'PROFESSOR DE GEOGRAFIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232140', 'PROFESSOR DE HISTORIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232145', 'PROFESSOR DE LINGUA E LITERATURA BRASILEIRA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232150', 'PROFESSOR DE LINGUA ESTRANGEIRA MODERNA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232155', 'PROFESSOR DE MATEMATICA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232160', 'PROFESSOR DE PSICOLOGIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232165', 'PROFESSOR DE QUIMICA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('232170', 'PROFESSOR DE SOCIOLOGIA NO ENSINO MEDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233105', 'PROFESSOR DA AREA DE MEIO AMBIENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233110', 'PROFESSOR DE DESENHO TECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233115', 'PROFESSOR DE TECNICAS AGRICOLAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233120', 'PROFESSOR DE TECNICAS COMERCIAIS E SECRETARIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233125', 'PROFESSOR DE TECNICAS DE ENFERMAGEM', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233130', 'PROFESSOR DE TECNICAS INDUSTRIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233135', 'PROFESSOR DE TECNOLOGIA E CALCULO TECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233205', 'INSTRUTOR DE APRENDIZAGEM E TREINAMENTO AGROPECUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233210', 'INSTRUTOR DE APRENDIZAGEM E TREINAMENTO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233215', 'PROFESSOR DE APRENDIZAGEM E TREINAMENTO COMERCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233220', 'PROFESSOR INSTRUTOR DE ENSINO E APRENDIZAGEM AGROFLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('233225', 'PROFESSOR INSTRUTOR DE ENSINO E APRENDIZAGEM EM SERVICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234105', 'PROFESSOR DE MATEMATICA APLICADA (NO ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234110', 'PROFESSOR DE MATEMATICA PURA (NO ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234115', 'PROFESSOR DE ESTATISTICA (NO ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234120', 'PROFESSOR DE COMPUTACAO (NO ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234125', 'PROFESSOR DE PESQUISA OPERACIONAL (NO ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234205', 'PROFESSOR DE FISICA (ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234210', 'PROFESSOR DE QUIMICA (ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234215', 'PROFESSOR DE ASTRONOMIA (ENSINO SUPERIOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234305', 'PROFESSOR DE ARQUITETURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234310', 'PROFESSOR DE ENGENHARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234315', 'PROFESSOR DE GEOFISICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234320', 'PROFESSOR DE GEOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234405', 'PROFESSOR DE CIENCIAS BIOLOGICAS DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234410', 'PROFESSOR DE EDUCACAO FISICA NO ENSINO SUPERIOR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('234415', 'PROFESSOR DE ENFERMAGEM DO ENSINO SUPERIOR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('234420', 'PROFESSOR DE FARMACIA E BIOQUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234425', 'PROFESSOR DE FISIOTERAPIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234430', 'PROFESSOR DE FONOAUDIOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234435', 'PROFESSOR DE MEDICINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234440', 'PROFESSOR DE MEDICINA VETERINARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234445', 'PROFESSOR DE NUTRICAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234450', 'PROFESSOR DE ODONTOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234455', 'PROFESSOR DE TERAPIA OCUPACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234460', 'PROFESSOR DE ZOOTECNIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234505', 'PROFESSOR DE ENSINO SUPERIOR NA AREA DE DIDATICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253225', 'OPERADOR DE NEGOCIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234510', 'PROFESSOR DE ENSINO SUPERIOR NA AREA DE ORIENTACAO EDUCACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234515', 'PROFESSOR DE ENSINO SUPERIOR NA AREA DE PESQUISA EDUCACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234520', 'PROFESSOR DE ENSINO SUPERIOR NA AREA DE PRATICA DE ENSINO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234604', 'PROFESSOR DE LINGUA ALEMA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234608', 'PROFESSOR DE LINGUA ITALIANA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234612', 'PROFESSOR DE LINGUA FRANCESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234616', 'PROFESSOR DE LINGUA INGLESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234620', 'PROFESSOR DE LINGUA ESPANHOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234624', 'PROFESSOR DE LINGUA PORTUGUESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234628', 'PROFESSOR DE LITERATURA BRASILEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234632', 'PROFESSOR DE LITERATURA PORTUGUESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234636', 'PROFESSOR DE LITERATURA ALEMA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234640', 'PROFESSOR DE LITERATURA COMPARADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234644', 'PROFESSOR DE LITERATURA ESPANHOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234648', 'PROFESSOR DE LITERATURA FRANCESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234652', 'PROFESSOR DE LITERATURA INGLESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234656', 'PROFESSOR DE LITERATURA ITALIANA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234660', 'PROFESSOR DE LITERATURA DE LINGUAS ESTRANGEIRAS MODERNAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234664', 'PROFESSOR DE OUTRAS LINGUAS E LITERATURAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234668', 'PROFESSOR DE LINGUAS ESTRANGEIRAS MODERNAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234672', 'PROFESSOR DE LINGISTICA E LINGISTICA APLICADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234676', 'PROFESSOR DE FILOLOGIA E CRITICA TEXTUAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234680', 'PROFESSOR DE SEMIOTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234684', 'PROFESSOR DE TEORIA DA LITERATURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234705', 'PROFESSOR DE ANTROPOLOGIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234710', 'PROFESSOR DE ARQUIVOLOGIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234715', 'PROFESSOR DE BIBLIOTECONOMIA DO ENSIO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234720', 'PROFESSOR DE CIENCIA POLITICA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234725', 'PROFESSOR DE COMUNICACAO SOCIAL DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234730', 'PROFESSOR DE DIREITO DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234740', 'PROFESSOR DE GEOGRAFIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234745', 'PROFESSOR DE HISTORIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234750', 'PROFESSOR DE JORNALISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234755', 'PROFESSOR DE MUSEOLOGIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234760', 'PROFESSOR DE PSICOLOGIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234765', 'PROFESSOR DE SERVICO SOCIAL DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234770', 'PROFESSOR DE SOCIOLOGIA DO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234805', 'PROFESSOR DE ECONOMIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234810', 'PROFESSOR DE ADMINISTRACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234815', 'PROFESSOR DE CONTABILIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234905', 'PROFESSOR DE ARTES DO ESPETACULO NO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234910', 'PROFESSOR DE ARTES VISUAIS NO ENSINO SUPERIOR (ARTES PLASTICAS E MULTIMIDIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('234915', 'PROFESSOR DE MUSICA NO ENSINO SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239205', 'PROFESSOR DE ALUNOS COM DEFICIENCIA AUDITIVA E SURDOS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239210', 'PROFESSOR DE ALUNOS COM DEFICIENCIA FISICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239215', 'PROFESSOR DE ALUNOS COM DEFICIENCIA MENTAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239220', 'PROFESSOR DE ALUNOS COM DEFICIENCIA MULTIPLA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239225', 'PROFESSOR DE ALUNOS COM DEFICIENCIA VISUAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239405', 'COORDENADOR PEDAGOGICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239410', 'ORIENTADOR EDUCACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239415', 'PEDAGOGO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239420', 'PROFESSOR DE TECNICAS E RECURSOS AUDIOVISUAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239425', 'PSICOPEDAGOGO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239430', 'SUPERVISOR DE ENSINO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('239435', 'DESIGNER EDUCACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241005', 'ADVOGADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241010', 'ADVOGADO DE EMPRESA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241015', 'ADVOGADO (DIREITO CIVIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241020', 'ADVOGADO (DIREITO PUBLICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241025', 'ADVOGADO (DIREITO PENAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241030', 'ADVOGADO (AREAS ESPECIAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241035', 'ADVOGADO (DIREITO DO TRABALHO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241040', 'CONSULTOR JURIDICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241205', 'ADVOGADO DA UNIAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241210', 'PROCURADOR AUTARQUICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241215', 'PROCURADOR DA FAZENDA NACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241220', 'PROCURADOR DO ESTADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241225', 'PROCURADOR DO MUNICIPIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241230', 'PROCURADOR FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241235', 'PROCURADOR FUNDACIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241305', 'OFICIAL DE REGISTRO DE CONTRATOS MARITIMOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241310', 'OFICIAL DO REGISTRO CIVIL DE PESSOAS JURIDICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241315', 'OFICIAL DO REGISTRO CIVIL DE PESSOAS NATURAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241320', 'OFICIAL DO REGISTRO DE DISTRIBUICOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241325', 'OFICIAL DO REGISTRO DE IMOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241330', 'OFICIAL DO REGISTRO DE TITULOS E DOCUMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241335', 'TABELIAO DE NOTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('241340', 'TABELIAO DE PROTESTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242205', 'PROCURADOR DA REPUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242210', 'PROCURADOR DE JUSTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242215', 'PROCURADOR DE JUSTICA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242220', 'PROCURADOR DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242225', 'PROCURADOR REGIONAL DA REPUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242230', 'PROCURADOR REGIONAL DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242235', 'PROMOTOR DE JUSTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242240', 'SUBPROCURADOR DE JUSTICA MILITAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242245', 'SUBPROCURADORGERAL DA REPUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242250', 'SUBPROCURADORGERAL DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242305', 'DELEGADO DE POLICIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242405', 'DEFENSOR PUBLICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242410', 'PROCURADOR DA ASSISTENCIA JUDICIARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242905', 'OFICIAL DE INTELIGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('242910', 'OFICIAL TECNICO DE INTELIGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251105', 'ANTROPOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251110', 'ARQUEOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251115', 'CIENTISTA POLITICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251120', 'SOCIOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251205', 'ECONOMISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251210', 'ECONOMISTA AGROINDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251215', 'ECONOMISTA FINANCEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251220', 'ECONOMISTA INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251225', 'ECONOMISTA DO SETOR PUBLICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251230', 'ECONOMISTA AMBIENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251235', 'ECONOMISTA REGIONAL E URBANO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251305', 'GEOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251405', 'FILOSOFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('251505', 'PSICOLOGO EDUCACIONAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251510', 'PSICOLOGO CLINICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251515', 'PSICOLOGO DO ESPORTE', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251520', 'PSICOLOGO HOSPITALAR', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251525', 'PSICOLOGO JURIDICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251530', 'PSICOLOGO SOCIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251535', 'PSICOLOGO DO TRANSITO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251540', 'PSICOLOGO DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251545', 'NEUROPSICOLOGO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251550', 'PSICANALISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251555', 'PSICOLOGO ACUPUNTURISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251605', 'ASSISTENTE SOCIAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('251610', 'ECONOMISTA DOMESTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252105', 'ADMINISTRADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252205', 'AUDITOR (CONTADORES E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252210', 'CONTADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252215', 'PERITO CONTABIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252305', 'SECRETARIA EXECUTIVA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252310', 'SECRETARIO BILINGE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252315', 'SECRETARIA TRILINGE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252320', 'TECNOLOGO EM SECRETARIADO ESCOLAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252405', 'ANALISTA DE RECURSOS HUMANOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252505', 'ADMINISTRADOR DE FUNDOS E CARTEIRAS DE INVESTIMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252510', 'ANALISTA DE CAMBIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252515', 'ANALISTA DE COBRANCA (INSTITUICOES FINANCEIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252525', 'ANALISTA DE CREDITO (INSTITUICOES FINANCEIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252530', 'ANALISTA DE CREDITO RURAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252535', 'ANALISTA DE LEASING', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252540', 'ANALISTA DE PRODUTOS BANCARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252545', 'ANALISTA FINANCEIRO (INSTITUICOES FINANCEIRAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252605', 'GESTOR EM SEGURANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253110', 'REDATOR DE PUBLICIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253115', 'AGENTE PUBLICITARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253205', 'GERENTE DE CAPTACAO (FUNDOS E INVESTIMENTOS INSTITUCIONAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253210', 'GERENTE DE CLIENTES ESPECIAIS (PRIVATE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253215', 'GERENTE DE CONTAS  PESSOA FISICA E JURIDICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253220', 'GERENTE DE GRANDES CONTAS (CORPORATE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253305', 'CORRETOR DE VALORES, ATIVOS FINANCEIROS, MERCADORIAS E DERIVATIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254105', 'AUDITORFISCAL DA RECEITA FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254110', 'TECNICO DA RECEITA FEDERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254205', 'AUDITORFISCAL DA PREVIDENCIA SOCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254305', 'AUDITORFISCAL DO TRABALHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254310', 'AGENTE DE HIGIENE E SEGURANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254405', 'FISCAL DE TRIBUTOS ESTADUAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254410', 'FISCAL DE TRIBUTOS MUNICIPAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254415', 'TECNICO DE TRIBUTOS ESTADUAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254420', 'TECNICO DE TRIBUTOS MUNICIPAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261105', 'ARQUIVISTA PESQUISADOR (JORNALISMO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261110', 'ASSESSOR DE IMPRENSA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261115', 'DIRETOR DE REDACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261120', 'EDITOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261125', 'JORNALISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261130', 'PRODUTOR DE TEXTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261135', 'REPORTER (EXCLUSIVE RADIO E TELEVISAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261140', 'REVISOR DE TEXTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261205', 'BIBLIOTECARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261210', 'DOCUMENTALISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261215', 'ANALISTA DE INFORMACOES (PESQUISADOR DE INFORMACOES DE REDE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261305', 'ARQUIVISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261310', 'MUSEOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261405', 'FILOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261410', 'INTERPRETE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261415', 'LINGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261420', 'TRADUTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261425', 'INTERPRETE DE LINGUA DE SINAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261505', 'AUTORROTEIRISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261510', 'CRITICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261515', 'ESCRITOR DE FICCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261520', 'ESCRITOR DE NAO FICCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261525', 'POETA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261530', 'REDATOR DE TEXTOS TECNICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261605', 'EDITOR DE JORNAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261610', 'EDITOR DE LIVRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261615', 'EDITOR DE MIDIA ELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261620', 'EDITOR DE REVISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261625', 'EDITOR DE REVISTA CIENTIFICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261705', 'ANCORA DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261710', 'COMENTARISTA DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261715', 'LOCUTOR DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261720', 'LOCUTOR PUBLICITARIO DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261725', 'NARRADOR EM PROGRAMAS DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261730', 'REPORTER DE RADIO E TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261805', 'FOTOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261810', 'FOTOGRAFO PUBLICITARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261815', 'FOTOGRAFO RETRATISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261820', 'REPOTER FOTOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262105', 'EMPRESARIO DE ESPETACULO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262110', 'PRODUTOR CINEMATOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262115', 'PRODUTOR DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262120', 'PRODUTOR DE TEATRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262125', 'PRODUTOR DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262130', 'TECNOLOGO EM PRODUCAO FONOGRAFICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262135', 'TECNOLOGO EM PRODUCAO AUDIOVISUAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262205', 'DIRETOR DE CINEMA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262210', 'DIRETOR DE PROGRAMAS DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262215', 'DIRETOR DE PROGRAMAS DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262220', 'DIRETOR TEATRAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262305', 'CENOGRAFO CARNAVALESCO E FESTAS POPULARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262310', 'CENOGRAFO DE CINEMA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262315', 'CENOGRAFO DE EVENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262320', 'CENOGRAFO DE TEATRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262325', 'CENOGRAFO DE TV', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262330', 'DIRETOR DE ARTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262405', 'ARTISTA (ARTES VISUAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262410', 'DESENHISTA INDUSTRIAL (DESIGNER)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262415', 'CONSERVADORRESTAURADOR DE BENS CULTURAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262420', 'DESENHISTA INDUSTRIAL DE PRODUTO (DESIGNER DE PRODUTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262425', 'DESENHISTA INDUSTRIAL DE PRODUTO DE MODA (DESIGNER DE MODA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262505', 'ATOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262605', 'COMPOSITOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262610', 'MUSICO ARRANJADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262615', 'MUSICO REGENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262620', 'MUSICOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262705', 'MUSICO INTERPRETE CANTOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262710', 'MUSICO INTERPRETE INSTRUMENTISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262805', 'ASSISTENTE DE COREOGRAFIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262810', 'BAILARINO (EXCETO DANCAS POPULARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262815', 'COREOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262820', 'DRAMATURGO DE DANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262825', 'ENSAIADOR DE DANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262830', 'PROFESSOR DE DANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('262905', 'DECORADOR DE INTERIORES DE NIVEL SUPERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('263105', 'MINISTRO DE CULTO RELIGIOSO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('263110', 'MISSIONARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('263115', 'TEOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('271105', 'CHEFE DE COZINHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('271110', 'TECNOLOGO EM GASTRONOMIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('300105', 'TECNICO EM MECATRONICA  AUTOMACAO DA MANUFATURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('300110', 'TECNICO EM MECATRONICA  ROBOTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('300305', 'TECNICO EM ELETROMECANICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('301105', 'TECNICO DE LABORATORIO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('301110', 'TECNICO DE LABORATORIO DE ANALISES FISICOQUIMICAS (MATERIAIS DE CONSTRUCAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('301115', 'TECNICO QUIMICO DE PETROLEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('301205', 'TECNICO DE APOIO A BIOENGENHARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311105', 'TECNICO QUIMICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311110', 'TECNICO DE CELULOSE E PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311115', 'TECNICO EM CURTIMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311205', 'TECNICO EM PETROQUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311305', 'TECNICO EM MATERIAIS, PRODUTOS CERAMICOS E VIDROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311405', 'TECNICO EM BORRACHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311410', 'TECNICO EM PLASTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311505', 'TECNICO DE CONTROLE DE MEIO AMBIENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311510', 'TECNICO DE METEOROLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311515', 'TECNICO DE UTILIDADE (PRODUCAO E DISTRIBUICAO DE VAPOR, GASES, OLEOS, COMBUSTIVEIS, ENERGIA)', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311520', 'TECNICO EM TRATAMENTO DE EFLUENTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311605', 'TECNICO TEXTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311610', 'TECNICO TEXTIL (TRATAMENTOS QUIMICOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311615', 'TECNICO TEXTIL DE FIACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311620', 'TECNICO TEXTIL DE MALHARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311625', 'TECNICO TEXTIL DE TECELAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311705', 'COLORISTA DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311710', 'COLORISTA TEXTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311715', 'PREPARADOR DE TINTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311720', 'PREPARADOR DE TINTAS (FABRICA DE TECIDOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('311725', 'TINGIDOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312105', 'TECNICO DE OBRAS CIVIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312205', 'TECNICO DE ESTRADAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312210', 'TECNICO DE SANEAMENTO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312305', 'TECNICO EM AGRIMENSURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312310', 'TECNICO EM GEODESIA E CARTOGRAFIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312315', 'TECNICO EM HIDROGRAFIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('312320', 'TOPOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313105', 'ELETROTECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313110', 'ELETROTECNICO (PRODUCAO DE ENERGIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313115', 'ELETROTENICO NA FABRICACAO, MONTAGEM E INSTALACAO DE MAQUINAS E EQUIPAMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313120', 'TECNICO DE MANUTENCAO ELETRICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313125', 'TECNICO DE MANUTENCAO ELETRICA DE MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313130', 'TECNICO ELETRICISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313205', 'TECNICO DE MANUTENCAO ELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313210', 'TECNICO DE MANUTENCAO ELETRONICA (CIRCUITOS DE MAQUINAS COM COMANDO NUMERICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313215', 'TECNICO ELETRONICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313220', 'TECNICO EM MANUTENCAO DE EQUIPAMENTOS DE INFORMATICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313305', 'TECNICO DE COMUNICACAO DE DADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313310', 'TECNICO DE REDE (TELECOMUNICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313315', 'TECNICO DE TELECOMUNICACOES (TELEFONIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313320', 'TECNICO DE TRANSMISSAO (TELECOMUNICACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313405', 'TECNICO EM CALIBRACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313410', 'TECNICO EM INSTRUMENTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313415', 'ENCARREGADO DE MANUTENCAO DE INSTRUMENTOS DE CONTROLE, MEDICAO E SIMILARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('3135D1', 'TECNICO EM REABILITACAO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('3135D2', 'TECNICO EM EQUIPAMENTO MEDICO HOSPITALAR', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('313505', 'TECNICO EM FOTONICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314105', 'TECNICO EM MECANICA DE PRECISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314110', 'TECNICO MECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314115', 'TECNICO MECANICO (CALEFACAO, VENTILACAO E REFRIGERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314120', 'TECNICO MECANICO (MAQUINAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314125', 'TECNICO MECANICO (MOTORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314205', 'TECNICO MECANICO NA FABRICACAO DE FERRAMENTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314210', 'TECNICO MECANICO NA MANUTENCAO DE FERRAMENTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314305', 'TECNICO EM AUTOMOBILISTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314310', 'TECNICO MECANICO (AERONAVES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314315', 'TECNICO MECANICO (EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314405', 'TECNICO DE MANUTENCAO DE SISTEMAS E INSTRUMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314410', 'TECNICO EM MANUTENCAO DE MAQUINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314605', 'INSPETOR DE SOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314610', 'TECNICO EM CALDEIRARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314615', 'TECNICO EM ESTRUTURAS METALICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314620', 'TECNICO EM SOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314705', 'TECNICO DE ACABAMENTO EM SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314710', 'TECNICO DE ACIARIA EM SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314715', 'TECNICO DE FUNDICAO EM SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314720', 'TECNICO DE LAMINACAO EM SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314725', 'TECNICO DE REDUCAO NA SIDERURGIA (PRIMEIRA FUSAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314730', 'TECNICO DE REFRATARIO EM SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316105', 'TECNICO EM GEOFISICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316110', 'TECNICO EM GEOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316115', 'TECNICO EM GEOQUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316120', 'TECNICO EM GEOTECNIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316305', 'TECNICO DE MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316310', 'TECNICO DE MINERACAO (OLEO E PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316315', 'TECNICO EM PROCESSAMENTO MINERAL (EXCETO PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316320', 'TECNICO EM PESQUISA MINERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316325', 'TECNICO DE PRODUCAO EM REFINO DE PETROLEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316330', 'TECNICO EM PLANEJAMENTO DE LAVRA DE MINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316335', 'DESINCRUSTADOR (POCOS DE PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('316340', 'CIMENTADOR (POCOS DE PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317105', 'PROGRAMADOR DE INTERNET', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317110', 'PROGRAMADOR DE SISTEMAS DE INFORMACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317115', 'PROGRAMADOR DE MAQUINAS  FERRAMENTA COM COMANDO NUMERICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317120', 'PROGRAMADOR DE MULTIMIDIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317205', 'OPERADOR DE COMPUTADOR (INCLUSIVE MICROCOMPUTADOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('317210', 'TECNICO DE APOIO AO USUARIO DE INFORMATICA (HELPDESK)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318005', 'DESENHISTA TECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318010', 'DESENHISTA COPISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318015', 'DESENHISTA DETALHISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318105', 'DESENHISTA TECNICO (ARQUITETURA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318110', 'DESENHISTA TECNICO (CARTOGRAFIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318115', 'DESENHISTA TECNICO (CONSTRUCAO CIVIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318120', 'DESENHISTA TECNICO (INSTALACOES HIDROSSANITARIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318205', 'DESENHISTA TECNICO MECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318210', 'DESENHISTA TECNICO AERONAUTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318215', 'DESENHISTA TECNICO NAVAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318305', 'DESENHISTA TECNICO (ELETRICIDADE E ELETRONICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318310', 'DESENHISTA TECNICO (CALEFACAO, VENTILACAO E REFRIGERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318405', 'DESENHISTA TECNICO (ARTES GRAFICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318410', 'DESENHISTA TECNICO (ILUSTRACOES ARTISTICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318415', 'DESENHISTA TECNICO (ILUSTRACOES TECNICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318420', 'DESENHISTA TECNICO (INDUSTRIA TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318425', 'DESENHISTA TECNICO (MOBILIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318430', 'DESENHISTA TECNICO DE EMBALAGENS, MAQUETES E LEIAUTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318505', 'DESENHISTA PROJETISTA DE ARQUITETURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318510', 'DESENHISTA PROJETISTA DE CONSTRUCAO CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318605', 'DESENHISTA PROJETISTA DE MAQUINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318610', 'DESENHISTA PROJETISTA MECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318705', 'DESENHISTA PROJETISTA DE ELETRICIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318710', 'DESENHISTA PROJETISTA ELETRONICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318805', 'PROJETISTA DE MOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318810', 'MODELISTA DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('318815', 'MODELISTA DE CALCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('319105', 'TECNICO EM CALCADOS E ARTEFATOS DE COURO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('319110', 'TECNICO EM CONFECCOES DO VESTUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('319205', 'TECNICO DO MOBILIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('320105', 'TECNICO EM BIOTERISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('320110', 'TECNICO EM HISTOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321105', 'TECNICO AGRICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321110', 'TECNICO AGROPECUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321205', 'TECNICO EM MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321210', 'TECNICO FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321305', 'TECNICO EM PISCICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321310', 'TECNICO EM CARCINICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321315', 'TECNICO EM MITILICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('321320', 'TECNICO EM RANICULTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322105', 'TECNICO EM ACUPUNTURA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322110', 'PODOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322115', 'TECNICO EM QUIROPRAXIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322120', 'MASSOTERAPEUTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322125', 'TERAPEUTA HOLISTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322130', 'ESTETICISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322135', 'DOULA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322205', 'TECNICO DE ENFERMAGEM', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322210', 'TECNICO DE ENFERMAGEM DE TERAPIA INTENSIVA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322215', 'TECNICO DE ENFERMAGEM DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322220', 'TECNICO DE ENFERMAGEM PSIQUIATRICA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322225', 'INSTRUMENTADOR CIRURGICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322230', 'AUXILIAR DE ENFERMAGEM', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322235', 'AUXILIAR DE ENFERMAGEM DO TRABALHO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322240', 'AUXILIAR DE SAUDE (NAVEGACAO MARITIMA)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322245', 'TECNICO DE ENFERMAGEM DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322250', 'AUXILIAR DE ENFERMAGEM DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322305', 'TECNICO EM OPTICA E OPTOMETRIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322405', 'TECNICO EM SAUDE BUCAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322410', 'PROTETICO DENTARIO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322415', 'AUXILIAR EM SAUDE BUCAL', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322420', 'AUXILIAR DE PROTESE DENTARIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322425', 'TECNICO EM SAUDE BUCAL DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322430', 'AUXILIAR EM SAUDE BUCAL DA ESTRATEGIA DE SAUDE DA FAMILIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('322505', 'TECNICO DE ORTOPEDIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('322605', 'TECNICO DE IMOBILIZACAO ORTOPEDICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('323105', 'TECNICO EM PECUARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324105', 'TECNICO EM METODOS ELETROGRAFICOS EM ENCEFALOGRAFIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324110', 'TECNICO EM METODOS GRAFICOS EM CARDIOLOGIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324115', 'TECNICO EM RADIOLOGIA E IMAGENOLOGIA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('324120', 'TECNOLOGO EM RADIOLOGIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324125', 'TECNOLOGO OFTALMICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324205', 'TECNICO EM PATOLOGIA CLINICA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('324210', 'AUXILIAR TECNICO EM PATOLOGIA CLINICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325005', 'ENOLOGO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325010', 'AROMISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325015', 'PERFUMISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325105', 'AUXILIAR TECNICO EM LABORATORIO DE FARMACIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325110', 'TECNICO EM LABORATORIO DE FARMACIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325115', 'TECNICO EM FARMACIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325205', 'TECNICO DE ALIMENTOS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325210', 'TECNICO EM NUTRICAO E DIETETICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325305', 'TECNICO EM BIOTECNOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('325310', 'TECNICO EM IMUNOBIOLOGICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('328105', 'EMBALSAMADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('328110', 'TAXIDERMISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('331105', 'PROFESSOR DE NIVEL MEDIO NA EDUCACAO INFANTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('331110', 'AUXILIAR DE DESENVOLVIMENTO INFANTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('331205', 'PROFESSOR DE NIVEL MEDIO NO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('331305', 'PROFESSOR DE NIVEL MEDIO NO ENSINO PROFISSIONALIZANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('332105', 'PROFESSOR LEIGO NO ENSINO FUNDAMENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('332205', 'PROFESSOR PRATICO NO ENSINO PROFISSIONALIZANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('333105', 'INSTRUTOR DE AUTOESCOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('333110', 'INSTRUTOR DE CURSOS LIVRES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('333115', 'PROFESSORES DE CURSOS LIVRES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('334105', 'INSPETOR DE ALUNOS DE ESCOLA PRIVADA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('334110', 'INSPETOR DE ALUNOS DE ESCOLA PUBLICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('334115', 'MONITOR DE TRANSPORTE ESCOLAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341105', 'PILOTO COMERCIAL (EXCETO LINHAS AEREAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341110', 'PILOTO COMERCIAL DE HELICOPTERO (EXCETO LINHAS AEREAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341115', 'MECANICO DE VOO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341120', 'PILOTO AGRICOLA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341205', 'CONTRAMESTRE DE CABOTAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341210', 'MESTRE DE CABOTAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341215', 'MESTRE FLUVIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341220', 'PATRAO DE PESCA DE ALTOMAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341225', 'PATRAO DE PESCA NA NAVEGACAO INTERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341230', 'PILOTO FLUVIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341305', 'CONDUTOR MAQUINISTA FLUVIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341310', 'CONDUTOR MAQUINISTA MARITIMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341315', 'ELETRICISTA DE BORDO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342105', 'ANALISTA DE TRANSPORTE EM COMERCIO EXTERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342110', 'OPERADOR DE TRANSPORTE MULTIMODAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374215', 'MAQUINISTA DE TEATRO E ESPETACULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374305', 'OPERADOR DE PROJETOR CINEMATOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374310', 'OPERADORMANTENEDOR DE PROJETOR CINEMATOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374405', 'EDITOR DE TV E VIDEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374410', 'FINALIZADOR DE FILMES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374415', 'FINALIZADOR DE VIDEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374420', 'MONTADOR DE FILMES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('375105', 'DESIGNER DE INTERIORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('375110', 'DESIGNER DE VITRINES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('375115', 'VISUAL MERCHANDISER', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('375120', 'DECORADOR DE EVENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376105', 'DANCARINO TRADICIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376110', 'DANCARINO POPULAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376205', 'ACROBATA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376210', 'ARTISTA AEREO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376215', 'ARTISTA DE CIRCO (OUTROS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376220', 'CONTORCIONISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376225', 'DOMADOR DE ANIMAIS (CIRCENSE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376230', 'EQUILIBRISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376235', 'MAGICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376240', 'MALABARISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376245', 'PALHACO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376250', 'TITERITEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376255', 'TRAPEZISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342115', 'CONTROLADOR DE SERVICOS DE MAQUINAS E VEICULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342120', 'AFRETADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342125', 'TECNOLOGO EM LOGISTICA DE TRANSPORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342205', 'AJUDANTE DE DESPACHANTE ADUANEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342210', 'DESPACHANTE ADUANEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342305', 'CHEFE DE SERVICO DE TRANSPORTE RODOVIARIO (PASSAGEIROS E CARGAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342310', 'INSPETOR DE SERVICOS DE TRANSPORTES RODOVIARIOS (PASSAGEIROS E CARGAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342315', 'SUPERVISOR DE CARGA E DESCARGA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342405', 'AGENTE DE ESTACAO (FERROVIA E METRO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422220', 'OPERADOR DE RADIOCHAMADA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342410', 'OPERADOR DE CENTRO DE CONTROLE (FERROVIA E METRO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342505', 'CONTROLADOR DE TRAFEGO AEREO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342510', 'DESPACHANTE OPERACIONAL DE VOO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342515', 'FISCAL DE AVIACAO CIVIL (FAC)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342520', 'GERENTE DA ADMINISTRACAO DE AEROPORTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342525', 'GERENTE DE EMPRESA AEREA EM AEROPORTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342530', 'INSPETOR DE AVIACAO CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342535', 'OPERADOR DE ATENDIMENTO AEROVIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342540', 'SUPERVISOR DA ADMINISTRACAO DE AEROPORTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342545', 'SUPERVISOR DE EMPRESA AEREA EM AEROPORTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342550', 'AGENTE DE PROTECAO DE AVIACAO CIVIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342605', 'CHEFE DE ESTACAO PORTUARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('342610', 'SUPERVISOR DE OPERACOES PORTUARIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351105', 'TECNICO DE CONTABILIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351110', 'CHEFE DE CONTABILIDADE (TECNICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351115', 'CONSULTOR CONTABIL (TECNICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351305', 'TECNICO EM ADMINISTRACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351310', 'TECNICO EM ADMINISTRACAO DE COMERCIO EXTERIOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351315', 'AGENTE DE RECRUTAMENTO E SELECAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351405', 'ESCREVENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351410', 'ESCRIVAO JUDICIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351415', 'ESCRIVAO EXTRA  JUDICIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351420', 'ESCRIVAO DE POLICIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351425', 'OFICIAL DE JUSTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351430', 'AUXILIAR DE SERVICOS JURIDICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351505', 'TECNICO EM SECRETARIADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351510', 'TAQUIGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351515', 'ESTENOTIPISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351605', 'TECNICO EM SEGURANCA NO TRABALHO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351705', 'ANALISTA DE SEGUROS (TECNICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351710', 'ANALISTA DE SINISTROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351715', 'ASSISTENTE COMERCIAL DE SEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351720', 'ASSISTENTE TECNICO DE SEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351725', 'INSPETOR DE RISCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351730', 'INSPETOR DE SINISTROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351735', 'TECNICO DE RESSEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351740', 'TECNICO DE SEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351805', 'DETETIVE PROFISSIONAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351810', 'INVESTIGADOR DE POLICIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351815', 'PAPILOSCOPISTA POLICIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351905', 'AGENTE DE INTELIGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351910', 'AGENTE TECNICO DE INTELIGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352205', 'AGENTE DE DEFESA AMBIENTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352210', 'AGENTE DE SAUDE PUBLICA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352305', 'METROLOGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352310', 'AGENTE FISCAL DE QUALIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352315', 'AGENTE FISCAL METROLOGICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352320', 'AGENTE FISCAL TEXTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352405', 'AGENTE DE DIREITOS AUTORAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352410', 'AVALIADOR DE PRODUTOS DO MEIO DE COMUNICACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('352420', 'TECNICO EM DIREITOS AUTORAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353205', 'TECNICO DE OPERACOES E SERVICOS BANCARIOS  CAMBIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353210', 'TECNICO DE OPERACOES E SERVICOS BANCARIOS  CREDITO IMOBILIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353215', 'TECNICO DE OPERACOES E SERVICOS BANCARIOS  CREDITO RURAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353220', 'TECNICO DE OPERACOES E SERVICOS BANCARIOS  LEASING', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353225', 'TECNICO DE OPERACOES E SERVICOS BANCARIOS  RENDA FIXA E VARIAVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353230', 'TESOUREIRO DE BANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('353235', 'CHEFE DE SERVICOS BANCARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354110', 'AGENCIADOR DE PROPAGANDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354120', 'AGENTE DE VENDAS DE SERVICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354125', 'ASSISTENTE DE VENDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354130', 'PROMOTOR DE VENDAS ESPECIALIZADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354135', 'TECNICO DE VENDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354140', 'TECNICO EM ATENDIMENTO E VENDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354145', 'VENDEDOR PRACISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354150', 'PROPAGANDISTA DE PRODUTOS FAMACEUTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354205', 'COMPRADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354210', 'SUPERVISOR DE COMPRAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354305', 'ANALISTA DE EXPORTACAO E IMPORTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354405', 'LEILOEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354410', 'AVALIADOR DE IMOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354415', 'AVALIADOR DE BENS MOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354505', 'CORRETOR DE SEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354605', 'CORRETOR DE IMOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354705', 'REPRESENTANTE COMERCIAL AUTONOMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354805', 'TECNICO EM TURISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354810', 'OPERADOR DE TURISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354815', 'AGENTE DE VIAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354820', 'ORGANIZADOR DE EVENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371105', 'AUXILIAR DE BIBLIOTECA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371110', 'TECNICO EM BIBLIOTECONOMIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371205', 'COLECIONADOR DE SELOS E MOEDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371210', 'TECNICO EM MUSEOLOGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371305', 'TECNICO EM PROGRAMACAO VISUAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371310', 'TECNICO GRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371405', 'RECREADOR DE ACANTONAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('371410', 'RECREADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('372105', 'DIRETOR DE FOTOGRAFIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('372110', 'ILUMINADOR (TELEVISAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('372115', 'OPERADOR DE CAMERA DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('372205', 'OPERADOR DE REDE DE TELEPROCESSAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('372210', 'RADIOTELEGRAFISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373105', 'OPERADOR DE AUDIO DE CONTINUIDADE (RADIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373110', 'OPERADOR DE CENTRAL DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373115', 'OPERADOR DE EXTERNA (RADIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373120', 'OPERADOR DE GRAVACAO DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373125', 'OPERADOR DE TRANSMISSOR DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373205', 'TECNICO EM OPERACAO DE EQUIPAMENTOS DE PRODUCAO PARA TELEVISAO E PRODUTORAS DE VIDEO', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('373210', 'TECNICO EM OPERACAO DE EQUIPAMENTO DE EXIBICAO DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373215', 'TECNICO EM OPERACAO DE EQUIPAMENTOS DE TRANSMISSAORECEPCAO DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('373220', 'SUPERVISOR TECNICO OPERACIONAL DE SISTEMAS DE TELEVISAO E PRODUTORAS DE VIDEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374105', 'TECNICO EM GRAVACAO DE AUDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374110', 'TECNICO EM INSTALACAO DE EQUIPAMENTOS DE AUDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374115', 'TECNICO EM MASTERIZACAO DE AUDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374120', 'PROJETISTA DE SOM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374125', 'TECNICO EM SONORIZACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374130', 'TECNICO EM MIXAGEM DE AUDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374135', 'PROJETISTA DE SISTEMAS DE AUDIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374140', 'MICROFONISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374145', 'DJ (DISC JOCKEY)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374205', 'CENOTECNICO (CINEMA, VIDEO, TELEVISAO, TEATRO E ESPETACULOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('374210', 'MAQUINISTA DE CINEMA E VIDEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376305', 'APRESENTADOR DE EVENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376310', 'APRESENTADOR DE FESTAS POPULARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376315', 'APRESENTADOR DE PROGRAMAS DE RADIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376320', 'APRESENTADOR DE PROGRAMAS DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376325', 'APRESENTADOR DE CIRCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376405', 'MODELO ARTISTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376410', 'MODELO DE MODAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376415', 'MODELO PUBLICITARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377105', 'ATLETA PROFISSIONAL (OUTRAS MODALIDADES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377110', 'ATLETA PROFISSIONAL DE FUTEBOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377115', 'ATLETA PROFISSIONAL DE GOLFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377120', 'ATLETA PROFISSIONAL DE LUTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377125', 'ATLETA PROFISSIONAL DE TENIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377130', 'JOQUEI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377135', 'PILOTO DE COMPETICAO AUTOMOBILISTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377140', 'PROFISSIONAL DE ATLETISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377145', 'PUGILISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377205', 'ARBITRO DESPORTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377210', 'ARBITRO DE ATLETISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377215', 'ARBITRO DE BASQUETE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377220', 'ARBITRO DE FUTEBOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377225', 'ARBITRO DE FUTEBOL DE SALAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377230', 'ARBITRO DE JUDO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377235', 'ARBITRO DE KARATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377240', 'ARBITRO DE POLO AQUATICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('377245', 'ARBITRO DE VOLEI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391105', 'CRONOANALISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391110', 'CRONOMETRISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391115', 'CONTROLADOR DE ENTRADA E SAIDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391120', 'PLANEJISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391125', 'TECNICO DE PLANEJAMENTO DE PRODUCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391130', 'TECNICO DE PLANEJAMENTO E PROGRAMACAO DA MANUTENCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391135', 'TECNICO DE MATERIAPRIMA E MATERIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391205', 'INSPETOR DE QUALIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391210', 'TECNICO DE GARANTIA DA QUALIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391215', 'OPERADOR DE INSPECAO DE QUALIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391220', 'TECNICO DE PAINEL DE CONTROLE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391225', 'ESCOLHEDOR DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('391230', 'TECNICO OPERACIONAL DE SERVICOS DE CORREIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('395105', 'TECNICO DE APOIO EM PESQUISA E DESENVOLVIMENTO (EXCETO AGROPECUARIO E FLORESTAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('395110', 'TECNICO DE APOIO EM PESQUISA E DESENVOLVIMENTO AGROPECUARIO FLORESTAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410105', 'SUPERVISOR ADMINISTRATIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410205', 'SUPERVISOR DE ALMOXARIFADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410210', 'SUPERVISOR DE CAMBIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410215', 'SUPERVISOR DE CONTAS A PAGAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410220', 'SUPERVISOR DE CONTROLE PATRIMONIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410225', 'SUPERVISOR DE CREDITO E COBRANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410230', 'SUPERVISOR DE ORCAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('410235', 'SUPERVISOR DE TESOURARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411005', 'AUXILIAR DE ESCRITORIO, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411010', 'ASSISTENTE ADMINISTRATIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411015', 'ATENDENTE DE JUDICIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411020', 'AUXILIAR DE JUDICIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411025', 'AUXILIAR DE CARTORIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411030', 'AUXILIAR DE PESSOAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411035', 'AUXILIAR DE ESTATISTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411040', 'AUXILIAR DE SEGUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411045', 'AUXILIAR DE SERVICOS DE IMPORTACAO E EXPORTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('411050', 'AGENTE DE MICROCREDITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('412105', 'DATILOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('412110', 'DIGITADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('412115', 'OPERADOR DE MENSAGENS DE TELECOMUNICACOES (CORREIOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('412120', 'SUPERVISOR DE DIGITACAO E OPERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('412205', 'CONTINUO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413105', 'ANALISTA DE FOLHA DE PAGAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413110', 'AUXILIAR DE CONTABILIDADE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413115', 'AUXILIAR DE FATURAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413205', 'ATENDENTE DE AGENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413210', 'CAIXA DE BANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413215', 'COMPENSADOR DE BANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413220', 'CONFERENTE DE SERVICOS BANCARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413225', 'ESCRITURARIO DE BANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('413230', 'OPERADOR DE COBRANCA BANCARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414105', 'ALMOXARIFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414110', 'ARMAZENISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414115', 'BALANCEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414205', 'APONTADOR DE MAODEOBRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414210', 'APONTADOR DE PRODUCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('414215', 'CONFERENTE DE CARGA E DESCARGA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415105', 'ARQUIVISTA DE DOCUMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415115', 'CODIFICADOR DE DADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415120', 'FITOTECARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415125', 'KARDEXISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415130', 'OPERADOR DE MAQUINA COPIADORA (EXCETO OPERADOR DE GRAFICA RAPIDA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415205', 'CARTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415210', 'OPERADOR DE TRIAGEM E TRANSBORDO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420105', 'SUPERVISOR DE CAIXAS E BILHETEIROS (EXCETO CAIXA DE BANCO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420110', 'SUPERVISOR DE COBRANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420115', 'SUPERVISOR DE COLETADORES DE APOSTAS E DE JOGOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420120', 'SUPERVISOR DE ENTREVISTADORES E RECENSEADORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420125', 'SUPERVISOR DE RECEPCIONISTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420130', 'SUPERVISOR DE TELEFONISTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('420135', 'SUPERVISOR DE TELEMARKETING E ATENDIMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421105', 'ATENDENTE COMERCIAL (AGENCIA POSTAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421110', 'BILHETEIRO DE TRANSPORTES COLETIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421115', 'BILHETEIRO NO SERVICO DE DIVERSOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421120', 'EMISSOR DE PASSAGENS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421125', 'OPERADOR DE CAIXA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421205', 'RECEBEDOR DE APOSTAS (LOTERIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421210', 'RECEBEDOR DE APOSTAS (TURFE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421305', 'COBRADOR EXTERNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421310', 'COBRADOR INTERNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('421315', 'LOCALIZADOR (COBRADOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422105', 'RECEPCIONISTA, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422110', 'RECEPCIONISTA DE CONSULTORIO MEDICO OU DENTARIO', '', 'N', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('422115', 'RECEPCIONISTA DE SEGURO SAUDE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422120', 'RECEPCIONISTA DE HOTEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422125', 'RECEPCIONISTA DE BANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422205', 'TELEFONISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422210', 'TELEOPERADOR', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422215', 'MONITOR DE TELEATENDIMENTO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422305', 'OPERADOR DE TELEMARKETING ATIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422310', 'OPERADOR DE TELEMARKETING ATIVO E RECEPTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422315', 'OPERADOR DE TELEMARKETING RECEPTIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422320', 'OPERADOR DE TELEMARKETING TECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('423105', 'DESPACHANTE DOCUMENTALISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('423110', 'DESPACHANTE DE TRANSITO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424105', 'ENTREVISTADOR CENSITARIO E DE PESQUISAS AMOSTRAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424110', 'ENTREVISTADOR DE PESQUISA DE OPINIAO E MIDIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424115', 'ENTREVISTADOR DE PESQUISAS DE MERCADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424120', 'ENTREVISTADOR DE PRECOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424125', 'ESCRITURARIO EM ESTATISTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510105', 'SUPERVISOR DE TRANSPORTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510110', 'ADMINISTRADOR DE EDIFICIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510115', 'SUPERVISOR DE ANDAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510120', 'CHEFE DE PORTARIA DE HOTEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510130', 'CHEFE DE BAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510135', 'MAITRE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510205', 'SUPERVISOR DE LAVANDERIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510305', 'SUPERVISOR DE BOMBEIROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('510310', 'SUPERVISOR DE VIGILANTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511105', 'COMISSARIO DE VOO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511110', 'COMISSARIO DE TREM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511115', 'TAIFEIRO (EXCETO MILITARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511205', 'FISCAL DE TRANSPORTES COLETIVOS (EXCETO TREM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511210', 'DESPACHANTE DE TRANSPORTES COLETIVOS (EXCETO TREM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511215', 'COBRADOR DE TRANSPORTES COLETIVOS (EXCETO TREM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511220', 'BILHETEIRO (ESTACOES DE METRO, FERROVIARIAS E ASSEMELHADAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511405', 'GUIA DE TURISMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('512105', 'EMPREGADO DOMESTICO NOS SERVICOS GERAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('512110', 'EMPREGADO DOMESTICO ARRUMADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('512115', 'EMPREGADO DOMESTICO FAXINEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('512120', 'EMPREGADO DOMESTICO DIARISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513105', 'MORDOMO DE RESIDENCIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513110', 'MORDOMO DE HOTELARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513115', 'GOVERNANTA DE HOTELARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513205', 'COZINHEIRO GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513210', 'COZINHEIRO DO SERVICO DOMESTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513215', 'COZINHEIRO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513220', 'COZINHEIRO DE HOSPITAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513225', 'COZINHEIRO DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513305', 'CAMAREIRA DE TEATRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513310', 'CAMAREIRA DE TELEVISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513315', 'CAMAREIRO DE HOTEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513320', 'CAMAREIRO DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513325', 'GUARDAROUPEIRA DE CINEMA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513405', 'GARCOM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513410', 'GARCOM (SERVICOS DE VINHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513415', 'CUMIM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513420', 'BARMAN', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513425', 'COPEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('513430', 'COPEIRO DE HOSPITAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842105', 'PREPARADOR DE MELADO E ESSENCIA DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842110', 'PROCESSADOR DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842115', 'CLASSIFICADOR DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842120', 'AUXILIAR DE PROCESSAMENTO DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842125', 'OPERADOR DE MAQUINA DE FABRICAR CIGARROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842135', 'OPERADOR DE MAQUINA DE PREPARACAO DE MATERIA PRIMA PARA PRODUCAO DE CIGARROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842205', 'PREPARADOR DE FUMO NA FABRICACAO DE CHARUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842210', 'OPERADOR DE MAQUINA DE FABRICAR CHARUTOS E CIGARRILHAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842215', 'CLASSIFICADOR DE CHARUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842220', 'CORTADOR DE CHARUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842225', 'CELOFANISTA NA FABRICACAO DE CHARUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842230', 'CHARUTEIRO A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('842235', 'DEGUSTADOR DE CHARUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848105', 'DEFUMADOR DE CARNES E PESCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848110', 'SALGADOR DE ALIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848115', 'SALSICHEIRO (FABRICACAO DE LINGICA, SALSICHA E PRODUTOS SIMILARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848205', 'PASTEURIZADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848210', 'QUEIJEIRO NA FABRICACAO DE LATICINIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848215', 'MANTEIGUEIRO NA FABRICACAO DE LATICINIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848305', 'PADEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848310', 'CONFEITEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848315', 'MASSEIRO (MASSAS ALIMENTICIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848325', 'TRABALHADOR DE FABRICACAO DE SORVETE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848405', 'DEGUSTADOR DE CAFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848410', 'DEGUSTADOR DE CHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848415', 'DEGUSTADOR DE DERIVADOS DE CACAU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848420', 'DEGUSTADOR DE VINHOS OU LICORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848425', 'CLASSIFICADOR DE GRAOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848505', 'ABATEDOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848510', 'ACOUGUEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848515', 'DESOSSADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848520', 'MAGAREFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848525', 'RETALHADOR DE CARNE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('848605', 'TRABALHADOR DO BENEFICIAMENTO DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('860105', 'SUPERVISOR DE MANUTENCAO ELETROMECANICA (UTILIDADES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('860110', 'SUPERVISOR DE OPERACAO DE FLUIDOS (DISTRIBUICAO, CAPTACAO, TRATAMENTO DE AGUA, GASES, VAPOR)', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('860115', 'SUPERVISOR DE OPERACAO ELETRICA (GERACAO, TRANSMISSAO E DISTRIBUICAO DE ENERGIA ELETRICA)', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('861105', 'OPERADOR DE CENTRAL HIDRELETRICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('861110', 'OPERADOR DE QUADRO DE DISTRIBUICAO DE ENERGIA ELETRICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('861115', 'OPERADOR DE CENTRAL TERMOELETRICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('861120', 'OPERADOR DE REATOR NUCLEAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('861205', 'OPERADOR DE SUBESTACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862105', 'FOGUISTA (LOCOMOTIVAS A VAPOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862110', 'MAQUINISTA DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862115', 'OPERADOR DE BATERIA DE GAS DE HULHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862120', 'OPERADOR DE CALDEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862130', 'OPERADOR DE COMPRESSOR DE AR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862140', 'OPERADOR DE ESTACAO DE BOMBEAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862150', 'OPERADOR DE MAQUINAS FIXAS, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862155', 'OPERADOR DE UTILIDADE (PRODUCAO E DISTRIBUICAO DE VAPOR, GAS, OLEO, COMBUSTIVEL, ENERGIA, OXIGENIO)',
        '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862205', 'OPERADOR DE ESTACAO DE CAPTACAO, TRATAMENTO E DISTRIBUICAO DE AGUA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862305', 'OPERADOR DE ESTACAO DE TRATAMENTO DE AGUA E EFLUENTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862310', 'OPERADOR DE FORNO DE INCINERACAO NO TRATAMENTO DE AGUA, EFLUENTES E RESIDUOS INDUSTRIAIS', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('862405', 'OPERADOR DE INSTALACAO DE EXTRACAO, PROCESSAMENTO, ENVASAMENTO E DISTRIBUICAO DE GASES', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('862505', 'OPERADOR DE INSTALACAO DE REFRIGERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862510', 'OPERADOR DE REFRIGERACAO COM AMONIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862515', 'OPERADOR DE INSTALACAO DE ARCONDICIONADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910105', 'ENCARREGADO DE MANUTENCAO MECANICA DE SISTEMAS OPERACIONAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910110', 'SUPERVISOR DE MANUTENCAO DE APARELHOS TERMICOS, DE CLIMATIZACAO E DE REFRIGERACAO', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('910115', 'SUPERVISOR DE MANUTENCAO DE BOMBAS, MOTORES, COMPRESSORES E EQUIPAMENTOS DE TRANSMISSAO', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('910120', 'SUPERVISOR DE MANUTENCAO DE MAQUINAS GRAFICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910125', 'SUPERVISOR DE MANUTENCAO DE MAQUINAS INDUSTRIAIS TEXTEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910130', 'SUPERVISOR DE MANUTENCAO DE MAQUINAS OPERATRIZES E DE USINAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910205', 'SUPERVISOR DA MANUTENCAO E REPARACAO DE VEICULOS LEVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910210', 'SUPERVISOR DA MANUTENCAO E REPARACAO DE VEICULOS PESADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910905', 'SUPERVISOR DE REPAROS LINHAS FERREAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('910910', 'SUPERVISOR DE MANUTENCAO DE VIAS FERREAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911105', 'MECANICO DE MANUTENCAO DE BOMBA INJETORA (EXCETO DE VEICULOS AUTOMOTORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911110', 'MECANICO DE MANUTENCAO DE BOMBAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911115', 'MECANICO DE MANUTENCAO DE COMPRESSORES DE AR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911120', 'MECANICO DE MANUTENCAO DE MOTORES DIESEL (EXCETO DE VEICULOS AUTOMOTORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911125', 'MECANICO DE MANUTENCAO DE REDUTORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911130', 'MECANICO DE MANUTENCAO DE TURBINAS (EXCETO DE AERONAVES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911135', 'MECANICO DE MANUTENCAO DE TURBOCOMPRESSORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911205', 'MECANICO DE MANUTENCAO E INSTALACAO DE APARELHOS DE CLIMATIZACAO E REFRIGERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911305', 'MECANICO DE MANUTENCAO DE MAQUINAS, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911310', 'MECANICO DE MANUTENCAO DE MAQUINAS GRAFICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911315', 'MECANICO DE MANUTENCAO DE MAQUINAS OPERATRIZES (LAVRA DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911320', 'MECANICO DE MANUTENCAO DE MAQUINAS TEXTEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('911325', 'MECANICO DE MANUTENCAO DE MAQUINASFERRAMENTAS (USINAGEM DE METAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('913105', 'MECANICO DE MANUTENCAO DE APARELHOS DE LEVANTAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('913110', 'MECANICO DE MANUTENCAO DE EQUIPAMENTO DE MINERACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('913115', 'MECANICO DE MANUTENCAO DE MAQUINAS AGRICOLAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('913120', 'MECANICO DE MANUTENCAO DE MAQUINAS DE CONSTRUCAO E TERRAPLENAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914105', 'MECANICO DE MANUTENCAO DE AERONAVES, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914110', 'MECANICO DE MANUTENCAO DE SISTEMA HIDRAULICO DE AERONAVES (SERVICOS DE PISTA E HANGAR)', '', 'N',
        'N', '');
INSERT INTO public.lista_cbo
VALUES ('914205', 'MECANICO DE MANUTENCAO DE MOTORES E EQUIPAMENTOS NAVAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914305', 'MECANICO DE MANUTENCAO DE VEICULOS FERROVIARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914405', 'MECANICO DE MANUTENCAO DE AUTOMOVEIS, MOTOCICLETAS E VEICULOS SIMILARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914410', 'MECANICO DE MANUTENCAO DE EMPILHADEIRAS E OUTROS VEICULOS DE CARGAS LEVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914415', 'MECANICO DE MANUTENCAO DE MOTOCICLETAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914420', 'MECANICO DE MANUTENCAO DE TRATORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('914425', 'MECANICO DE VEICULOS AUTOMOTORES A DIESEL (EXCETO TRATORES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915105', 'TECNICO EM MANUTENCAO DE INSTRUMENTOS DE MEDICAO E PRECISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915110', 'TECNICO EM MANUTENCAO DE HIDROMETROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915115', 'TECNICO EM MANUTENCAO DE BALANCAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915205', 'RESTAURADOR DE INSTRUMENTOS MUSICAIS (EXCETO CORDAS ARCADAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915210', 'REPARADOR DE INSTRUMENTOS MUSICAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915215', 'LUTHIER (RESTAURACAO DE CORDAS ARCADAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915305', 'TECNICO EM MANUTENCAO DE EQUIPAMENTOS E INSTRUMENTOS MEDICOHOSPITALARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('915405', 'REPARADOR DE EQUIPAMENTOS FOTOGRAFICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919105', 'LUBRIFICADOR INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919110', 'LUBRIFICADOR DE VEICULOS AUTOMOTORES (EXCETO EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919115', 'LUBRIFICADOR DE EMBARCACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919205', 'MECANICO DE MANUTENCAO DE MAQUINAS CORTADORAS DE GRAMA, ROCADEIRAS, MOTOSSERRAS E SIMILARES', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919305', 'MECANICO DE MANUTENCAO DE APARELHOS ESPORTIVOS E DE GINASTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919310', 'MECANICO DE MANUTENCAO DE BICICLETAS E VEICULOS SIMILARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('919315', 'MONTADOR DE BICICLETAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('950105', 'SUPERVISOR DE MANUTENCAO ELETRICA DE ALTA TENSAO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('950110', 'SUPERVISOR DE MANUTENCAO ELETROMECANICA INDUSTRIAL, COMERCIAL E PREDIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('950205', 'ENCARREGADO DE MANUTENCAO ELETRICA DE VEICULOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('950305', 'SUPERVISOR DE MANUTENCAO ELETROMECANICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('951105', 'ELETRICISTA DE MANUTENCAO ELETROELETRONICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('951305', 'INSTALADOR DE SISTEMAS ELETROELETRONICOS DE SEGURANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('951310', 'MANTENEDOR DE SISTEMAS ELETROELETRONICOS DE SEGURANCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('953105', 'ELETRICISTA DE INSTALACOES (AERONAVES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('953110', 'ELETRICISTA DE INSTALACOES (EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('953115',
        'ELETRICISTA DE INSTALACOES (VEICULOS AUTOMOTORES E MAQUINAS OPERATRIZES, EXCETO AERONAVES E EMBARCACOES)', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954105', 'ELETROMECANICO DE MANUTENCAO DE ELEVADORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954110', 'ELETROMECANICO DE MANUTENCAO DE ESCADAS ROLANTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954115', 'ELETROMECANICO DE MANUTENCAO DE PORTAS AUTOMATICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954120', 'MECANICO DE MANUTENCAO DE INSTALACOES MECANICAS DE EDIFICIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954125', 'OPERADOR ELETROMECANICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954205', 'REPARADOR DE APARELHOS ELETRODOMESTICOS (EXCETO IMAGEM E SOM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954210', 'REPARADOR DE RADIO, TV E SOM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('954305', 'REPARADOR DE EQUIPAMENTOS DE ESCRITORIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991105', 'CONSERVADOR DE VIA PERMANENTE (TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991110', 'INSPETOR DE VIA PERMANENTE (TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991115', 'OPERADOR DE MAQUINAS ESPECIAIS EM CONSERVACAO DE VIA PERMANENTE (TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991120', 'SOLDADOR ALUMINOTERMICO EM CONSERVACAO DE TRILHOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991205', 'MANTENEDOR DE EQUIPAMENTOS DE PARQUES DE DIVERSOES E SIMILARES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991305', 'FUNILEIRO DE VEICULOS (REPARACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991310', 'MONTADOR DE VEICULOS (REPARACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991315', 'PINTOR DE VEICULOS (REPARACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992105', 'ALINHADOR DE PNEUS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992110', 'BALANCEADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992115', 'BORRACHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992120', 'LAVADOR DE PECAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992205', 'ENCARREGADO GERAL DE OPERACOES DE CONSERVACAO DE VIAS PERMANENTES (EXCETO TRILHOS)', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('992210', 'ENCARREGADO DE EQUIPE DE CONSERVACAO DE VIAS PERMANENTES (EXCETO TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765015', 'BONELEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992215', 'OPERADOR DE CEIFADEIRA NA CONSERVACAO DE VIAS PERMANENTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992220', 'PEDREIRO DE CONSERVACAO DE VIAS PERMANENTES (EXCETO TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('992225', 'AUXILIAR GERAL DE CONSERVACAO DE VIAS PERMANENTES (EXCETO TRILHOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('5151F1', 'AGENTE DE COMBATE A ENDEMIAS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('131220', 'GERONTOLOGO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('214940', 'HIGIENISTA OCUPACIONAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('225154', 'MEDICO ANTROPOSOFICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('226320', 'NATUROLOGO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('252550', 'PROFISSIONAL DE RELACOES COM INVESTIDORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253130', 'DIRETOR DE CRIACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253135', 'DIRETOR DE CONTAS (PUBLICIDADE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('253140', 'AGENCIADOR DE PROPAGANDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('254505', 'FISCAL DE ATIVIDADES URBANAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('261430', 'AUDIODESCRITOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('314625', 'TECNOLOGO EM SOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341320', 'CONDUTOR DE MAQUINAS (BOMBEADOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('341325', 'CONDUTOR DE MAQUINAS (MECANICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('351610', 'TECNICO EM HIGIENE OCUPACIONAL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('354825', 'CERIMONIALISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('376330', 'MESTRE DE CERIMONIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('415215', 'ENTREGADOR DE PUBLICACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('422130', 'CONCIERGE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('424130', 'ENTREVISTADOR SOCIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511505', 'CONDUTOR DE TURISMO DE AVENTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('511510', 'CONDUTOR DE TURISMO DE PESCA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('517425', 'FISCAL DE LOJA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('519115', 'MOTOTAXISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('521140', 'ATENDENTE DE LOJAS E MERCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623025', 'CASQUEADOR DE ANIMAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('623030', 'FERRADOR DE ANIMAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765240', 'TAPECEIRO DE AUTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782320', 'CONDUTOR DE AMBULANCIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782730', 'MARINHEIRO AUXILIAR DE CONVES (MARITIMO E AQUAVIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782735', 'MARINHEIRO AUXILIAR DE MAQUINAS (MARITIMO E AQUAVIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('862160', 'OPERADOR DE ABASTECIMENTO DE COMBUSTIVEL DE AERONAVE', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('951315', 'MONITOR DE SISTEMAS ELETRONICOS DE SEGURANCA INTERNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('951320', 'MONITOR DE SISTEMAS ELETRONICOS DE SEGURANCA EXTERNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('515140', 'AGENTE DE COMBATE AS ENDEMIAS', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324215', 'CITOTECNICO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('324220', 'TECNICO EM HEMOTERAPIA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('991410', 'CONSERVADOR DE FACHADAS', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('1999A1', 'CBO NIVEL MEDIO NAO TEM CORRESPONDENCIA CBO 2002', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('1999A2', 'CBO NIVEL SUPERIOR NAO TEM CORRESPONDENCIA CBO 2002', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('214355', 'ENGENHEIRO DE CONTROLE E AUTOMACAO', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('2231A2', 'MEDICO HANSENOLOGISTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223410', 'FARMACEUTICO BIOQUIMICO', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('223915', 'MUSICOTERAPEUTA', '', 'S', '', '');
INSERT INTO public.lista_cbo
VALUES ('225190', 'MEDICO HEMOTERAPEUTA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('225245', 'MEDICO FONIATRA', '', 'S', 'S', '');
INSERT INTO public.lista_cbo
VALUES ('253105', 'RELACOES PUBLICAS', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('253120', 'ANALISTA DE NEGOCIOS', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('253125', 'ANALISTA DE PESQUISA DE MERCADO', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('352415', 'OUVIDOR (OMBUDSMAN) DO MEIO DE COMUNICACAO', '', 'N', '', '');
INSERT INTO public.lista_cbo
VALUES ('732110', 'EMENDADOR DE CABOS ELETRICOS E TELEFONICOS (AEREOS E SUBTERRANEOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732115', 'EXAMINADOR DE CABOS, LINHAS ELETRICAS E TELEFONICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732120', 'INSTALADOR DE LINHAS ELETRICAS DE ALTA E BAIXATENSAO (REDE AEREA E SUBTERRANEA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732125', 'INSTALADOR ELETRICISTA (TRACAO DE VEICULOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732130', 'INSTALADORREPARADOR DE REDES TELEFONICAS E DE COMUNICACAO DE DADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('732135', 'LIGADOR DE LINHAS TELEFONICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('740105', 'SUPERVISOR DA MECANICA DE PRECISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('740110', 'SUPERVISOR DE FABRICACAO DE INSTRUMENTOS MUSICAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('741105', 'AJUSTADOR DE INSTRUMENTOS DE PRECISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('741110', 'MONTADOR DE INSTRUMENTOS DE OPTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('741115', 'MONTADOR DE INSTRUMENTOS DE PRECISAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('741120', 'RELOJOEIRO (FABRICACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('741125', 'RELOJOEIRO (REPARACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742105', 'AFINADOR DE INSTRUMENTOS MUSICAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742110', 'CONFECCIONADOR DE ACORDEAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742115', 'CONFECCIONADOR DE INSTRUMENTOS DE CORDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742120', 'CONFECCIONADOR DE INSTRUMENTOS DE PERCUSSAO (PELE, COURO OU PLASTICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742125', 'CONFECCIONADOR DE INSTRUMENTOS DE SOPRO (MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742130', 'CONFECCIONADOR DE INSTRUMENTOS DE SOPRO (METAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742135', 'CONFECCIONADOR DE ORGAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('742140', 'CONFECCIONADOR DE PIANO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('750105', 'SUPERVISOR DE JOALHERIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('750205', 'SUPERVISOR DA INDUSTRIA DE MINERAIS NAO METALICOS (EXCETO OS DERIVADOS DE PETROLEO E CARVAO)', '',
        'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751005', 'ENGASTADOR (JOIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751010', 'JOALHEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751015', 'JOALHEIRO (REPARACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751020', 'LAPIDADOR (JOIAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751105', 'BATEFOLHA A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751110', 'FUNDIDOR (JOALHERIA E OURIVESARIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751115', 'GRAVADOR (JOALHERIA E OURIVESARIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751120', 'LAMINADOR DE METAIS PRECIOSOS A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751125', 'OURIVES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('751130', 'TREFILADOR (JOALHERIA E OURIVESARIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752105', 'ARTESAO MODELADOR (VIDROS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752110', 'MOLDADOR (VIDROS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752115', 'SOPRADOR DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752120', 'TRANSFORMADOR DE TUBOS DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752205', 'APLICADOR SERIGRAFICO EM VIDROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752210', 'CORTADOR DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752215', 'GRAVADOR DE VIDRO A AGUAFORTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752220', 'GRAVADOR DE VIDRO A ESMERIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752225', 'GRAVADOR DE VIDRO A JATO DE AREIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752230', 'LAPIDADOR DE VIDROS E CRISTAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752235', 'SURFASSAGISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752305', 'CERAMISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752310', 'CERAMISTA (TORNO DE PEDAL E MOTOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752315', 'CERAMISTA (TORNO SEMIAUTOMATICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752320', 'CERAMISTA MODELADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752325', 'CERAMISTA MOLDADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752330', 'CERAMISTA PRENSADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752405', 'DECORADOR DE CERAMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752410', 'DECORADOR DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752415', 'DECORADOR DE VIDRO A PINCEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752420', 'OPERADOR DE ESMALTADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752425', 'OPERADOR DE ESPELHAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('752430', 'PINTOR DE CERAMICA, A PINCEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760105', 'CONTRAMESTRE DE ACABAMENTO (INDUSTRIA TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760110', 'CONTRAMESTRE DE FIACAO (INDUSTRIA TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760115', 'CONTRAMESTRE DE MALHARIA (INDUSTRIA TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760120', 'CONTRAMESTRE DE TECELAGEM (INDUSTRIA TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760125', 'MESTRE (INDUSTRIA TEXTIL E DE CONFECCOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760205', 'SUPERVISOR DE CURTIMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760305', 'ENCARREGADO DE CORTE NA CONFECCAO DO VESTUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760310', 'ENCARREGADO DE COSTURA NA CONFECCAO DO VESTUARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760405', 'SUPERVISOR (INDUSTRIA DE CALCADOS E ARTEFATOS DE COURO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760505', 'SUPERVISOR DA CONFECCAO DE ARTEFATOS DE TECIDOS, COUROS E AFINS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('760605', 'SUPERVISOR DAS ARTES GRAFICAS (INDUSTRIA EDITORIAL E GRAFICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761005', 'OPERADOR POLIVALENTE DA INDUSTRIA TEXTIL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761105', 'CLASSIFICADOR DE FIBRAS TEXTEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761110', 'LAVADOR DE LA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761205', 'OPERADOR DE ABERTURA (FIACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761210', 'OPERADOR DE BINADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761215', 'OPERADOR DE BOBINADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761220', 'OPERADOR DE CARDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761225', 'OPERADOR DE CONICALEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761230', 'OPERADOR DE FILATORIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761235', 'OPERADOR DE LAMINADEIRA E REUNIDEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761240', 'OPERADOR DE MACAROQUEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761245', 'OPERADOR DE OPENEND', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761250', 'OPERADOR DE PASSADOR (FIACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761255', 'OPERADOR DE PENTEADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761260', 'OPERADOR DE RETORCEDEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761303', 'TECELAO (REDES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761306', 'TECELAO (RENDAS E BORDADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761309', 'TECELAO (TEAR AUTOMATICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761312', 'TECELAO (TEAR JACQUARD)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761315', 'TECELAO (TEAR MECANICO DE MAQUINETA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761318', 'TECELAO (TEAR MECANICO DE XADREZ)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761321', 'TECELAO (TEAR MECANICO LISO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761324', 'TECELAO (TEAR MECANICO, EXCETO JACQUARD)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761327', 'TECELAO DE MALHAS, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761330', 'TECELAO DE MALHAS (MAQUINA CIRCULAR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761333', 'TECELAO DE MALHAS (MAQUINA RETILINEA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761336', 'TECELAO DE MEIAS, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761339', 'TECELAO DE MEIAS (MAQUINA CIRCULAR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761342', 'TECELAO DE MEIAS (MAQUINA RETILINEA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761345', 'TECELAO DE TAPETES, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761348', 'OPERADOR DE ENGOMADEIRA DE URDUME', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761351', 'OPERADOR DE ESPULADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761354', 'OPERADOR DE MAQUINA DE CORDOALHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761357', 'OPERADOR DE URDIDEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761360', 'PASSAMANEIRO A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761363', 'REMETEDOR DE FIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761366', 'PICOTADOR DE CARTOES JACQUARD', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761405', 'ALVEJADOR (TECIDOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761410', 'ESTAMPADOR DE TECIDO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761415', 'OPERADOR DE CALANDRAS (TECIDOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761420', 'OPERADOR DE CHAMUSCADEIRA DE TECIDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761425', 'OPERADOR DE IMPERMEABILIZADOR DE TECIDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761430', 'OPERADOR DE MAQUINA DE LAVAR FIOS E TECIDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761435', 'OPERADOR DE RAMEUSE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761805', 'INSPETOR DE ESTAMPARIA (PRODUCAO TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761810', 'REVISOR DE FIOS (PRODUCAO TEXTIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761815', 'REVISOR DE TECIDOS ACABADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('761820', 'REVISOR DE TECIDOS CRUS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762005', 'TRABALHADOR POLIVALENTE DO CURTIMENTO DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762105', 'CLASSIFICADOR DE PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762110', 'DESCARNADOR DE COUROS E PELES, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762115', 'ESTIRADOR DE COUROS E PELES (PREPARACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762120', 'FULONEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762125', 'RACHADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762205', 'CURTIDOR (COUROS E PELES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762210', 'CLASSIFICADOR DE COUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762215', 'ENXUGADOR DE COUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762220', 'REBAIXADOR DE COUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762305', 'ESTIRADOR DE COUROS E PELES (ACABAMENTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762310', 'FULONEIRO NO ACABAMENTO DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762315', 'LIXADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762320', 'MATIZADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762325', 'OPERADOR DE MAQUINAS DO ACABAMENTO DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762330', 'PRENSADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762335', 'PALECIONADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762340', 'PREPARADOR DE COUROS CURTIDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('762345', 'VAQUEADOR DE COUROS E PELES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763005', 'ALFAIATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763010', 'COSTUREIRA DE PECAS SOB ENCOMENDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763015', 'COSTUREIRA DE REPARACAO DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763020', 'COSTUREIRO DE ROUPA DE COURO E PELE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763105', 'AUXILIAR DE CORTE (PREPARACAO DA CONFECCAO DE ROUPAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763110', 'CORTADOR DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763115', 'ENFESTADOR DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763120', 'RISCADOR DE ROUPAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763205', 'COSTUREIRO DE ROUPAS DE COURO E PELE, A MAQUINA NA CONFECCAO EM SERIE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763210', 'COSTUREIRO NA CONFECCAO EM SERIE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763215', 'COSTUREIRO, A MAQUINA NA CONFECCAO EM SERIE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763305', 'ARREMATADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763310', 'BORDADOR, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763315', 'MARCADOR DE PECAS CONFECCIONADAS PARA BORDAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763320', 'OPERADOR DE MAQUINA DE COSTURA DE ACABAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763325', 'PASSADEIRA DE PECAS CONFECCIONADAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764005', 'TRABALHADOR POLIVALENTE DA CONFECCAO DE CALCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764105', 'CORTADOR DE CALCADOS, A MAQUINA (EXCETO SOLAS E PALMILHAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764110', 'CORTADOR DE SOLAS E PALMILHAS, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764115', 'PREPARADOR DE CALCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764120', 'PREPARADOR DE SOLAS E PALMILHAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764205', 'COSTURADOR DE CALCADOS, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764210', 'MONTADOR DE CALCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('764305', 'ACABADOR DE CALCADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765005', 'CONFECCIONADOR DE ARTEFATOS DE COURO (EXCETO SAPATOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765010', 'CHAPELEIRO DE SENHORAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765105', 'CORTADOR DE ARTEFATOS DE COURO (EXCETO ROUPAS E CALCADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765110', 'CORTADOR DE TAPECARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765205', 'COLCHOEIRO (CONFECCAO DE COLCHOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765215', 'CONFECCIONADOR DE BRINQUEDOS DE PANO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765225', 'CONFECCIONADOR DE VELAS NAUTICAS, BARRACAS E TOLDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765230', 'ESTOFADOR DE AVIOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765235', 'ESTOFADOR DE MOVEIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765310', 'COSTURADOR DE ARTEFATOS DE COURO, A MAQUINA (EXCETO ROUPAS E CALCADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765315', 'MONTADOR DE ARTEFATOS DE COURO (EXCETO ROUPAS E CALCADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('765405', 'TRABALHADOR DO ACABAMENTO DE ARTEFATOS DE TECIDOS E COUROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766105', 'COPIADOR DE CHAPA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766115', 'GRAVADOR DE MATRIZ PARA FLEXOGRAFIA (CLICHERISTA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766120', 'EDITOR DE TEXTO E IMAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766125', 'MONTADOR DE FOTOLITO (ANALOGICO E DIGITAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766130', 'GRAVADOR DE MATRIZ PARA ROTOGRAVURA (ELETROMECANICO E QUIMICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766135', 'GRAVADOR DE MATRIZ CALCOGRAFICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766140', 'GRAVADOR DE MATRIZ SERIGRAFICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766145', 'OPERADOR DE SISTEMAS DE PROVA (ANALOGICO E DIGITAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766150', 'OPERADOR DE PROCESSO DE TRATAMENTO DE IMAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766155', 'PROGRAMADOR VISUAL GRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766205', 'IMPRESSOR (SERIGRAFIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766210', 'IMPRESSOR CALCOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766215', 'IMPRESSOR DE OFSETE (PLANO E ROTATIVO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766220', 'IMPRESSOR DE ROTATIVA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766225', 'IMPRESSOR DE ROTOGRAVURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766230', 'IMPRESSOR DIGITAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766235', 'IMPRESSOR FLEXOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766240', 'IMPRESSOR LETTERSET', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766245', 'IMPRESSOR TAMPOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766250', 'IMPRESSOR TIPOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766305', 'ACABADOR DE EMBALAGENS (FLEXIVEIS E CARTOTECNICAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766310', 'IMPRESSOR DE CORTE E VINCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766315', 'OPERADOR DE ACABAMENTO (INDUSTRIA GRAFICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766320', 'OPERADOR DE GUILHOTINA (CORTE DE PAPEL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766325', 'PREPARADOR DE MATRIZES DE CORTE E VINCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766405', 'LABORATORISTA FOTOGRAFICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766410', 'REVELADOR DE FILMES FOTOGRAFICOS, EM PRETO E BRANCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766415', 'REVELADOR DE FILMES FOTOGRAFICOS, EM CORES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('766420', 'AUXILIAR DE RADIOLOGIA (REVELACAO FOTOGRAFICA)', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768105', 'TECELAO (TEAR MANUAL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768110', 'TECELAO DE TAPETES, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768115', 'TRICOTEIRO, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768120', 'REDEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768125', 'CHAPELEIRO (CHAPEUS DE PALHA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768130', 'CROCHETEIRO, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768205', 'BORDADOR, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768210', 'CERZIDOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768305', 'ARTIFICE DO COURO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768310', 'CORTADOR DE CALCADOS, A MAO (EXCETO SOLAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768315', 'COSTURADOR DE ARTEFATOS DE COURO, A MAO (EXCETO ROUPAS E CALCADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768320', 'SAPATEIRO (CALCADOS SOB MEDIDA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768325', 'SELEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768605', 'TIPOGRAFO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768610', 'LINOTIPISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768615', 'MONOTIPISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768620', 'PAGINADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768625', 'PINTOR DE LETREIROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768630', 'CONFECCIONADOR DE CARIMBOS DE BORRACHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768705', 'GRAVADOR, A MAO (ENCADERNACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('768710', 'RESTAURADOR DE LIVROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('770105', 'MESTRE (INDUSTRIA DE MADEIRA E MOBILIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('770110', 'MESTRE CARPINTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('771105', 'MARCENEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('771110', 'MODELADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('771115', 'MAQUETISTA NA MARCENARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('771120', 'TANOEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('772105', 'CLASSIFICADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('772110', 'IMPREGNADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('772115', 'SECADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773105', 'CORTADOR DE LAMINADOS DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773110', 'OPERADOR DE SERRAS NO DESDOBRAMENTO DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773115', 'SERRADOR DE BORDAS NO DESDOBRAMENTO DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773120', 'SERRADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773125', 'SERRADOR DE MADEIRA (SERRA CIRCULAR MULTIPLA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773130', 'SERRADOR DE MADEIRA (SERRA DE FITA MULTIPLA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773205', 'OPERADOR DE MAQUINA INTERCALADORA E PLACAS (COMPENSADOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773210', 'PRENSISTA DE AGLOMERADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773215', 'PRENSISTA DE COMPENSADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773220', 'PREPARADOR DE AGLOMERANTES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773305', 'OPERADOR DE DESEMPENADEIRA NA USINAGEM CONVENCIONAL DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773310', 'OPERADOR DE ENTALHADEIRA (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773315', 'OPERADOR DE FRESADORA (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773320', 'OPERADOR DE LIXADEIRA (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773325', 'OPERADOR DE MAQUINA DE USINAGEM MADEIRA, EM GERAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773330', 'OPERADOR DE MOLDURADORA (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773335', 'OPERADOR DE PLAINA DESENGROSSADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773340', 'OPERADOR DE SERRAS (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773345', 'OPERADOR DE TORNO AUTOMATICO (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773350', 'OPERADOR DE TUPIA (USINAGEM DE MADEIRA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773355', 'TORNEIRO NA USINAGEM CONVENCIONAL DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773405', 'OPERADOR DE MAQUINA BORDATRIZ', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773410', 'OPERADOR DE MAQUINA DE CORTINA DAGUA (PRODUCAO DE MOVEIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773415', 'OPERADOR DE MAQUINA DE USINAGEM DE MADEIRA (PRODUCAO EM SERIE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773420', 'OPERADOR DE PRENSA DE ALTA FREQENCIA NA USINAGEM DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773505', 'OPERADOR DE CENTRO DE USINAGEM DE MADEIRA (CNC)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('773510', 'OPERADOR DE MAQUINAS DE USINAR MADEIRA (CNC)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('774105', 'MONTADOR DE MOVEIS E ARTEFATOS DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('775105', 'ENTALHADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('775110', 'FOLHEADOR DE MOVEIS DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('775115', 'LUSTRADOR DE PECAS DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('775120', 'MARCHETEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776405', 'CESTEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776410', 'CONFECCIONADOR DE ESCOVAS, PINCEIS E PRODUTOS SIMILARES (A MAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776415', 'CONFECCIONADOR DE ESCOVAS, PINCEIS E PRODUTOS SIMILARES (A MAQUINA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776420', 'CONFECCIONADOR DE MOVEIS DE VIME, JUNCO E BAMBU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776425', 'ESTEIREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('776430', 'VASSOUREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('777105', 'CARPINTEIRO NAVAL (CONSTRUCAO DE PEQUENAS EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('777110', 'CARPINTEIRO NAVAL (EMBARCACOES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('777115', 'CARPINTEIRO NAVAL (ESTALEIROS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('777205', 'CARPINTEIRO DE CARRETAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('777210', 'CARPINTEIRO DE CARROCERIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('780105', 'SUPERVISOR DE EMBALAGEM E ETIQUETAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('781105', 'CONDUTOR DE PROCESSOS ROBOTIZADOS DE PINTURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('781110', 'CONDUTOR DE PROCESSOS ROBOTIZADOS DE SOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('763125', 'AJUDANTE DE CONFECCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('781305', 'OPERADOR DE VEICULOS SUBAQUATICOS CONTROLADOS REMOTAMENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('781705', 'MERGULHADOR PROFISSIONAL (RASO E PROFUNDO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782105', 'OPERADOR DE DRAGA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782110', 'OPERADOR DE GUINDASTE (FIXO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782115', 'OPERADOR DE GUINDASTE MOVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782120', 'OPERADOR DE MAQUINA RODOFERROVIARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782125', 'OPERADOR DE MONTACARGAS (CONSTRUCAO CIVIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782130', 'OPERADOR DE PONTE ROLANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782135', 'OPERADOR DE PORTICO ROLANTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782140', 'OPERADOR DE TALHA ELETRICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782145', 'SINALEIRO (PONTEROLANTE)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782205', 'GUINCHEIRO (CONSTRUCAO CIVIL)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782210', 'OPERADOR DE DOCAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782220', 'OPERADOR DE EMPILHADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782305', 'MOTORISTA DE CARRO DE PASSEIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782310', 'MOTORISTA DE FURGAO OU VEICULO SIMILAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782315', 'MOTORISTA DE TAXI', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782405', 'MOTORISTA DE ONIBUS RODOVIARIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782410', 'MOTORISTA DE ONIBUS URBANO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782415', 'MOTORISTA DE TROLEBUS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782505', 'CAMINHONEIRO AUTONOMO (ROTAS REGIONAIS E INTERNACIONAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782510', 'MOTORISTA DE CAMINHAO (ROTAS REGIONAIS E INTERNACIONAIS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782515', 'MOTORISTA OPERACIONAL DE GUINCHO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782605', 'OPERADOR DE TREM DE METRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782610', 'MAQUINISTA DE TREM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782615', 'MAQUINISTA DE TREM METROPOLITANO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782620', 'MOTORNEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782625', 'AUXILIAR DE MAQUINISTA DE TREM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782630', 'OPERADOR DE TELEFERICO (PASSAGEIROS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782705', 'MARINHEIRO DE CONVES (MARITIMO E FLUVIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782710', 'MARINHEIRO DE MAQUINAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782715', 'MOCO DE CONVES (MARITIMO E FLUVIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782720', 'MOCO DE MAQUINAS (MARITIMO E FLUVIARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782725', 'MARINHEIRO DE ESPORTE E RECREIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782805', 'CONDUTOR DE VEICULOS DE TRACAO ANIMAL (RUAS E ESTRADAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782810', 'TROPEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782815', 'BOIADEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('782820', 'CONDUTOR DE VEICULOS A PEDAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783105', 'AGENTE DE PATIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783110', 'MANOBRADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783205', 'CARREGADOR (AERONAVES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783210', 'CARREGADOR (ARMAZEM)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783215', 'CARREGADOR (VEICULOS DE TRANSPORTES TERRESTRES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783220', 'ESTIVADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783225', 'AJUDANTE DE MOTORISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('783230', 'BLOQUEIRO (TRABALHADOR PORTUARIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784105', 'EMBALADOR, A MAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784110', 'EMBALADOR, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784115', 'OPERADOR DE MAQUINA DE ETIQUETAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784120', 'OPERADOR DE MAQUINA DE ENVASAR LIQUIDOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784125', 'OPERADOR DE PRENSA DE ENFARDAMENTO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('784205', 'ALIMENTADOR DE LINHA DE PRODUCAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791105', 'ARTESAO BORDADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791110', 'ARTESAO CERAMISTA', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791115', 'ARTESAO COM MATERIAL RECICLAVEL', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791120', 'ARTESAO CONFECCIONADOR DE BIOJOIAS E ECOJOIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791125', 'ARTESAO DO COURO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791130', 'ARTESAO ESCULTOR', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791135', 'ARTESAO MOVELEIRO (EXCETO RECICLADO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791140', 'ARTESAO TECELAO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791145', 'ARTESAO TRANCADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791150', 'ARTESAO CROCHETEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791155', 'ARTESAO TRICOTEIRO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('791160', 'ARTESAO RENDEIRO', '', 'S', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('810105', 'MESTRE (INDUSTRIA PETROQUIMICA E CARBOQUIMICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('810110', 'MESTRE DE PRODUCAO QUIMICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('810205', 'MESTRE (INDUSTRIA DE BORRACHA E PLASTICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('810305', 'MESTRE DE PRODUCAO FARMACEUTICA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811005', 'OPERADOR DE PROCESSOS QUIMICOS E PETROQUIMICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811010', 'OPERADOR DE SALA DE CONTROLE DE INSTALACOES QUIMICAS, PETROQUIMICAS E AFINS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811105', 'MOLEIRO (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811110', 'OPERADOR DE MAQUINA MISTURADEIRA (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811115', 'OPERADOR DE BRITADEIRA (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811120', 'OPERADOR DE CONCENTRACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811125', 'TRABALHADOR DA FABRICACAO DE RESINAS E VERNIZES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811130', 'TRABALHADOR DE FABRICACAO DE TINTAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811205', 'OPERADOR DE CALCINACAO (TRATAMENTO QUIMICO E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811215', 'OPERADOR DE TRATAMENTO QUIMICO DE MATERIAIS RADIOATIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811305', 'OPERADOR DE CENTRIFUGADORA (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811310', 'OPERADOR DE EXPLORACAO DE PETROLEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811315', 'OPERADOR DE FILTRO DE SECAGEM (MINERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811320', 'OPERADOR DE FILTRO DE TAMBOR ROTATIVO (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811325', 'OPERADOR DE FILTROESTEIRA (MINERACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811330', 'OPERADOR DE FILTROPRENSA (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811335', 'OPERADOR DE FILTROS DE PARAFINA (TRATAMENTOS QUIMICOS E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811405', 'DESTILADOR DE MADEIRA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811410', 'DESTILADOR DE PRODUTOS QUIMICOS (EXCETO PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811415', 'OPERADOR DE ALAMBIQUE DE FUNCIONAMENTO CONTINUO (PRODUTOS QUIMICOS, EXCETO PETROLEO)', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('811420', 'OPERADOR DE APARELHO DE REACAO E CONVERSAO (PRODUTOS QUIMICOS, EXCETO PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811425', 'OPERADOR DE EQUIPAMENTO DE DESTILACAO DE ALCOOL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811430', 'OPERADOR DE EVAPORADOR NA DESTILACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811505', 'OPERADOR DE PAINEL DE CONTROLE (REFINACAO DE PETROLEO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811510', 'OPERADOR DE TRANSFERENCIA E ESTOCAGEM  NA REFINACAO DO PETROLEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811605', 'OPERADOR DE BRITADOR DE COQUE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811610', 'OPERADOR DE CARRO DE APAGAMENTO E COQUE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811615', 'OPERADOR DE DESTILACAO E SUBPRODUTOS DE COQUE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811620', 'OPERADOR DE ENFORNAMENTO E DESENFORNAMENTO DE COQUE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811625', 'OPERADOR DE EXAUSTOR (COQUERIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811630', 'OPERADOR DE PAINEL DE CONTROLE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811635', 'OPERADOR DE PRESERVACAO E CONTROLE TERMICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811640', 'OPERADOR DE REATOR DE COQUE DE PETROLEO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811645', 'OPERADOR DE REFRIGERACAO (COQUERIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811650', 'OPERADOR DE SISTEMA DE REVERSAO (COQUERIA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811705', 'BAMBURISTA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811710', 'CALANDRISTA DE BORRACHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811715', 'CONFECCIONADOR DE PNEUMATICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811725', 'CONFECCIONADOR DE VELAS POR IMERSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811735', 'CONFECCIONADOR DE VELAS POR MOLDAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811745', 'LAMINADOR DE PLASTICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811750', 'MOLDADOR DE BORRACHA POR COMPRESSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811760', 'MOLDADOR DE PLASTICO POR COMPRESSAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811770', 'MOLDADOR DE PLASTICO POR INJECAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811775', 'TREFILADOR DE BORRACHA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811805', 'OPERADOR DE MAQUINA DE PRODUTOS FARMACEUTICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811810', 'DRAGEADOR (MEDICAMENTOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811815', 'OPERADOR DE MAQUINA DE FABRICACAO DE COSMETICOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('811820',
        'OPERADOR DE MAQUINA DE FABRICACAO DE PRODUTOS DE HIGIENE E LIMPEZA (SABAO, SABONETE, DETERGENTE, ABSORVENTE, FRALDAS COTONETES E OUTROS)',
        '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('812105', 'PIROTECNICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('812110', 'TRABALHADOR DA FABRICACAO DE MUNICAO E EXPLOSIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813105', 'CILINDRISTA (PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813110', 'OPERADOR DE CALANDRA (QUIMICA, PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813115', 'OPERADOR DE EXTRUSORA (QUIMICA, PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813120', 'OPERADOR DE PROCESSO (QUIMICA, PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813125', 'OPERADOR DE PRODUCAO (QUIMICA, PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('813130', 'TECNICO DE OPERACAO (QUIMICA, PETROQUIMICA E AFINS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('818105', 'ASSISTENTE DE LABORATORIO INDUSTRIAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('818110', 'AUXILIAR DE LABORATORIO DE ANALISES FISICOQUIMICAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820105', 'MESTRE DE SIDERURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820110', 'MESTRE DE ACIARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820115', 'MESTRE DE ALTOFORNO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820120', 'MESTRE DE FORNO ELETRICO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820205', 'SUPERVISOR DE FABRICACAO DE PRODUTOS CERAMICOS, PORCELANATOS E AFINS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820210', 'SUPERVISOR DE FABRICACAO DE PRODUTOS DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821105', 'OPERADOR DE CENTRO DE CONTROLE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821110', 'OPERADOR DE MAQUINA DE SINTERIZAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821205', 'FORNEIRO E OPERADOR (ALTOFORNO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821210', 'FORNEIRO E OPERADOR (CONVERSOR A OXIGENIO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821215', 'FORNEIRO E OPERADOR (FORNO ELETRICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821220', 'FORNEIRO E OPERADOR (REFINO DE METAIS NAOFERROSOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821225', 'FORNEIRO E OPERADOR DE FORNO DE REDUCAO DIRETA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821230', 'OPERADOR DE ACIARIA (BASCULAMENTO DE CONVERTEDOR)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821235', 'OPERADOR DE ACIARIA (DESSULFURACAO DE GUSA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821240', 'OPERADOR DE ACIARIA (RECEBIMENTO DE GUSA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821245', 'OPERADOR DE AREA DE CORRIDA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821250', 'OPERADOR DE DESGASEIFICACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821255', 'SOPRADOR DE CONVERTEDOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821305', 'OPERADOR DE LAMINADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821310', 'OPERADOR DE LAMINADOR DE BARRAS A FRIO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821315', 'OPERADOR DE LAMINADOR DE BARRAS A QUENTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821320', 'OPERADOR DE LAMINADOR DE METAIS NAOFERROSOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821325', 'OPERADOR DE LAMINADOR DE TUBOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821330', 'OPERADOR DE MONTAGEM DE CILINDROS E MANCAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821335', 'RECUPERADOR DE GUIAS E CILINDROS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821405', 'ENCARREGADO DE ACABAMENTO DE CHAPAS E METAIS (TEMPERA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821410', 'ESCARFADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821415', 'MARCADOR DE PRODUTOS (SIDERURGICO E METALURGICO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821420', 'OPERADOR DE BOBINADEIRA DE TIRAS A QUENTE, NO ACABAMENTO DE CHAPAS E METAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821425', 'OPERADOR DE CABINE DE LAMINACAO (FIOMAQUINA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821430', 'OPERADOR DE ESCORIA E SUCATA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821435', 'OPERADOR DE JATO ABRASIVO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821440', 'OPERADOR DE TESOURA MECANICA E MAQUINA DE CORTE, NO ACABAMENTO DE CHAPAS E METAIS', '', 'N', 'N',
        '');
INSERT INTO public.lista_cbo
VALUES ('821445', 'PREPARADOR DE SUCATA E APARAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('821450', 'REBARBADOR DE METAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('822105', 'FORNEIRO DE CUBILO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('822110', 'FORNEIRO DE FORNOPOCO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('822115', 'FORNEIRO DE FUNDICAO (FORNO DE REDUCAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('822120', 'FORNEIRO DE REAQUECIMENTO E TRATAMENTO TERMICO NA METALURGIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('822125', 'FORNEIRO DE REVERBERO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823105', 'PREPARADOR DE MASSA (FABRICACAO DE ABRASIVOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823110', 'PREPARADOR DE MASSA (FABRICACAO DE VIDRO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823115', 'PREPARADOR DE MASSA DE ARGILA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823120', 'PREPARADOR DE BARBOTINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823125', 'PREPARADOR DE ESMALTES (CERAMICA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823130', 'PREPARADOR DE ADITIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823135', 'OPERADOR DE ATOMIZADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823210', 'EXTRUSOR DE FIOS OU FIBRAS DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823215', 'FORNEIRO NA FUNDICAO DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823220', 'FORNEIRO NO RECOZIMENTO DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823230', 'MOLDADOR DE ABRASIVOS NA FABRICACAO DE CERAMICA, VIDRO E PORCELANA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823235', 'OPERADOR DE BANHO METALICO DE VIDRO POR FLUTUACAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823240', 'OPERADOR DE MAQUINA DE SOPRAR VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823245', 'OPERADOR DE MAQUINA EXTRUSORA DE VARETAS E TUBOS DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823250', 'OPERADOR DE PRENSA DE MOLDAR VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823255', 'TEMPERADOR DE VIDRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823265', 'TRABALHADOR NA FABRICACAO DE PRODUTOS ABRASIVOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823305', 'CLASSIFICADOR E EMPILHADOR DE TIJOLOS REFRATARIOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823315', 'FORNEIRO (MATERIAIS DE CONSTRUCAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823320', 'TRABALHADOR DA ELABORACAO DE PREFABRICADOS (CIMENTO AMIANTO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823325', 'TRABALHADOR DA ELABORACAO DE PREFABRICADOS (CONCRETO ARMADO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('823330', 'TRABALHADOR DA FABRICACAO DE PEDRAS ARTIFICIAIS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('828105', 'OLEIRO (FABRICACAO DE TELHAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('828110', 'OLEIRO (FABRICACAO DE TIJOLOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('830105', 'MESTRE (INDUSTRIA DE CELULOSE, PAPEL E PAPELAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('831105', 'CILINDREIRO NA PREPARACAO DE PASTA PARA FABRICACAO DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('831110', 'OPERADOR DE BRANQUEADOR DE PASTA PARA FABRICACAO DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('831115', 'OPERADOR DE DIGESTOR DE PASTA PARA FABRICACAO DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('831120', 'OPERADOR DE LAVAGEM E DEPURACAO DE PASTA PARA FABRICACAO DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('831125', 'OPERADOR DE MAQUINA DE SECAR CELULOSE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832105', 'CALANDRISTA DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832110', 'OPERADOR DE CORTADEIRA DE PAPEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832115', 'OPERADOR DE MAQUINA DE FABRICAR PAPEL (FASE UMIDA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832120', 'OPERADOR DE MAQUINA DE FABRICAR PAPEL (FASE SECA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832125', 'OPERADOR DE MAQUINA DE FABRICAR PAPEL E PAPELAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('832135', 'OPERADOR DE REBOBINADEIRA NA FABRICACAO DE PAPEL E PAPELAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833105', 'CARTONAGEIRO, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833110', 'CONFECCIONADOR DE BOLSAS, SACOS E SACOLAS E PAPEL, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833115', 'CONFECCIONADOR DE SACOS DE CELOFANE, A MAQUINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833120', 'OPERADOR DE MAQUINA DE CORTAR E DOBRAR PAPELAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833125', 'OPERADOR DE PRENSA DE EMBUTIR PAPELAO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('833205', 'CARTONAGEIRO, A MAO (CAIXAS DE PAPELAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('840105', 'SUPERVISOR DE PRODUCAO DA INDUSTRIA ALIMENTICIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('840110', 'SUPERVISOR DA INDUSTRIA DE BEBIDAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('840115', 'SUPERVISOR DA INDUSTRIA DE FUMO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('840120', 'CHEFE DE CONFEITARIA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841105', 'MOLEIRO DE CEREAIS (EXCETO ARROZ)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841110', 'MOLEIRO DE ESPECIARIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841115', 'OPERADOR DE PROCESSO DE MOAGEM', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841205', 'MOEDOR DE SAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841210', 'REFINADOR DE SAL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841305', 'OPERADOR DE CRISTALIZACAO NA REFINACAO DE ACUCAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841310', 'OPERADOR DE EQUIPAMENTOS DE REFINACAO DE ACUCAR (PROCESSO CONTINUO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841315', 'OPERADOR DE MOENDA NA FABRICACAO DE ACUCAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841320', 'OPERADOR DE TRATAMENTO DE CALDA NA REFINACAO DE ACUCAR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841408', 'COZINHADOR (CONSERVACAO DE ALIMENTOS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841416', 'COZINHADOR DE CARNES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841420', 'COZINHADOR DE FRUTAS E LEGUMES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841428', 'COZINHADOR DE PESCADO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841432', 'DESIDRATADOR DE ALIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841440', 'ESTERILIZADOR DE ALIMENTOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841444', 'HIDROGENADOR DE OLEOS E GORDURAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841448', 'LAGAREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841456', 'OPERADOR DE CAMARAS FRIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841460', 'OPERADOR DE PREPARACAO DE GRAOS VEGETAIS (OLEOS E GORDURAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841464', 'PRENSADOR DE FRUTAS (EXCETO OLEAGINOSAS)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841468', 'PREPARADOR DE RACOES', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841472', 'REFINADOR DE OLEO E GORDURA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841476', 'TRABALHADOR DE FABRICACAO DE MARGARINA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841484', 'TRABALHADOR DE PREPARACAO DE PESCADOS (LIMPEZA)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841505', 'TRABALHADOR DE TRATAMENTO DO LEITE E FABRICACAO DE LATICINIOS E AFINS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841605', 'MISTURADOR DE CAFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841610', 'TORRADOR DE CAFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841615', 'MOEDOR DE CAFE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841620', 'OPERADOR DE EXTRACAO DE CAFE SOLUVEL', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841625', 'TORRADOR DE CACAU', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841630', 'MISTURADOR DE CHA OU MATE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841705', 'ALAMBIQUEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841710', 'FILTRADOR DE CERVEJA', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841715', 'FERMENTADOR', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841720', 'TRABALHADOR DE FABRICACAO DE VINHOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841725', 'MALTEIRO (GERMINACAO)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841730', 'COZINHADOR DE MALTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841735', 'DESSECADOR DE MALTE', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841740', 'VINAGREIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841745', 'XAROPEIRO', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841805', 'OPERADOR DE FORNO (FABRICACAO DE PAES, BISCOITOS E SIMILARES)', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841810', 'OPERADOR DE MAQUINAS DE FABRICACAO DE DOCES, SALGADOS E MASSAS ALIMENTICIAS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('841815', 'OPERADOR DE MAQUINAS DE FABRICACAO DE CHOCOLATES E ACHOCOLATADOS', '', 'N', 'N', '');
INSERT INTO public.lista_cbo
VALUES ('820125', 'MESTRE DE LAMINACAO', '', 'N', 'N', '');


--
-- Data for Name: municipio; Type: TABLE DATA; Schema: public; Owner: usuario
--

INSERT INTO public.municipio
VALUES (4395, 4205191, 'Ermo', 'SC', 420519);
INSERT INTO public.municipio
VALUES (4539, 4215455, 'Sangão', 'SC', 421545);
INSERT INTO public.municipio
VALUES (5318, 5108501, 'Vera', 'MT', 510850);
INSERT INTO public.municipio
VALUES (1, 1100015, 'Alta Floresta D''Oeste', 'RO', 110001);
INSERT INTO public.municipio
VALUES (2, 1100023, 'Ariquemes', 'RO', 110002);
INSERT INTO public.municipio
VALUES (3, 1100031, 'Cabixi', 'RO', 110003);
INSERT INTO public.municipio
VALUES (4, 1100049, 'Cacoal', 'RO', 110004);
INSERT INTO public.municipio
VALUES (5, 1100056, 'Cerejeiras', 'RO', 110005);
INSERT INTO public.municipio
VALUES (6, 1100064, 'Colorado do Oeste', 'RO', 110006);
INSERT INTO public.municipio
VALUES (7, 1100072, 'Corumbiara', 'RO', 110007);
INSERT INTO public.municipio
VALUES (8, 1100080, 'Costa Marques', 'RO', 110008);
INSERT INTO public.municipio
VALUES (9, 1100098, 'Espigão D''Oeste', 'RO', 110009);
INSERT INTO public.municipio
VALUES (10, 1100106, 'Guajará-Mirim', 'RO', 110010);
INSERT INTO public.municipio
VALUES (11, 1100114, 'Jaru', 'RO', 110011);
INSERT INTO public.municipio
VALUES (12, 1100122, 'Ji-Paraná', 'RO', 110012);
INSERT INTO public.municipio
VALUES (13, 1100130, 'Machadinho D''Oeste', 'RO', 110013);
INSERT INTO public.municipio
VALUES (14, 1100148, 'Nova Brasilândia D''Oeste', 'RO', 110014);
INSERT INTO public.municipio
VALUES (15, 1100155, 'Ouro Preto do Oeste', 'RO', 110015);
INSERT INTO public.municipio
VALUES (16, 1100189, 'Pimenta Bueno', 'RO', 110018);
INSERT INTO public.municipio
VALUES (17, 1100205, 'Porto Velho', 'RO', 110020);
INSERT INTO public.municipio
VALUES (18, 1100254, 'Presidente Médici', 'RO', 110025);
INSERT INTO public.municipio
VALUES (19, 1100262, 'Rio Crespo', 'RO', 110026);
INSERT INTO public.municipio
VALUES (20, 1100288, 'Rolim de Moura', 'RO', 110028);
INSERT INTO public.municipio
VALUES (21, 1100296, 'Santa Luzia D''Oeste', 'RO', 110029);
INSERT INTO public.municipio
VALUES (22, 1100304, 'Vilhena', 'RO', 110030);
INSERT INTO public.municipio
VALUES (23, 1100320, 'São Miguel do Guaporé', 'RO', 110032);
INSERT INTO public.municipio
VALUES (24, 1100338, 'Nova Mamoré', 'RO', 110033);
INSERT INTO public.municipio
VALUES (25, 1100346, 'Alvorada D''Oeste', 'RO', 110034);
INSERT INTO public.municipio
VALUES (26, 1100379, 'Alto Alegre dos Parecis', 'RO', 110037);
INSERT INTO public.municipio
VALUES (27, 1100403, 'Alto Paraíso', 'RO', 110040);
INSERT INTO public.municipio
VALUES (28, 1100452, 'Buritis', 'RO', 110045);
INSERT INTO public.municipio
VALUES (29, 1100502, 'Novo Horizonte do Oeste', 'RO', 110050);
INSERT INTO public.municipio
VALUES (30, 1100601, 'Cacaulândia', 'RO', 110060);
INSERT INTO public.municipio
VALUES (31, 1100700, 'Campo Novo de Rondônia', 'RO', 110070);
INSERT INTO public.municipio
VALUES (32, 1100809, 'Candeias do Jamari', 'RO', 110080);
INSERT INTO public.municipio
VALUES (33, 1100908, 'Castanheiras', 'RO', 110090);
INSERT INTO public.municipio
VALUES (34, 1100924, 'Chupinguaia', 'RO', 110092);
INSERT INTO public.municipio
VALUES (35, 1100940, 'Cujubim', 'RO', 110094);
INSERT INTO public.municipio
VALUES (36, 1101005, 'Governador Jorge Teixeira', 'RO', 110100);
INSERT INTO public.municipio
VALUES (37, 1101104, 'Itapuã do Oeste', 'RO', 110110);
INSERT INTO public.municipio
VALUES (38, 1101203, 'Ministro Andreazza', 'RO', 110120);
INSERT INTO public.municipio
VALUES (39, 1101302, 'Mirante da Serra', 'RO', 110130);
INSERT INTO public.municipio
VALUES (40, 1101401, 'Monte Negro', 'RO', 110140);
INSERT INTO public.municipio
VALUES (41, 1101435, 'Nova União', 'RO', 110143);
INSERT INTO public.municipio
VALUES (42, 1101450, 'Parecis', 'RO', 110145);
INSERT INTO public.municipio
VALUES (43, 1101468, 'Pimenteiras do Oeste', 'RO', 110146);
INSERT INTO public.municipio
VALUES (44, 1101476, 'Primavera de Rondônia', 'RO', 110147);
INSERT INTO public.municipio
VALUES (45, 1101484, 'São Felipe D''Oeste', 'RO', 110148);
INSERT INTO public.municipio
VALUES (46, 1101492, 'São Francisco do Guaporé', 'RO', 110149);
INSERT INTO public.municipio
VALUES (47, 1101500, 'Seringueiras', 'RO', 110150);
INSERT INTO public.municipio
VALUES (48, 1101559, 'Teixeirópolis', 'RO', 110155);
INSERT INTO public.municipio
VALUES (49, 1101609, 'Theobroma', 'RO', 110160);
INSERT INTO public.municipio
VALUES (50, 1101708, 'Urupá', 'RO', 110170);
INSERT INTO public.municipio
VALUES (51, 1101757, 'Vale do Anari', 'RO', 110175);
INSERT INTO public.municipio
VALUES (5494, 5215504, 'Ouvidor', 'GO', 521550);
INSERT INTO public.municipio
VALUES (52, 1101807, 'Vale do Paraíso', 'RO', 110180);
INSERT INTO public.municipio
VALUES (53, 1200013, 'Acrelândia', 'AC', 120001);
INSERT INTO public.municipio
VALUES (54, 1200054, 'Assis Brasil', 'AC', 120005);
INSERT INTO public.municipio
VALUES (55, 1200104, 'Brasiléia', 'AC', 120010);
INSERT INTO public.municipio
VALUES (56, 1200138, 'Bujari', 'AC', 120013);
INSERT INTO public.municipio
VALUES (57, 1200179, 'Capixaba', 'AC', 120017);
INSERT INTO public.municipio
VALUES (58, 1200203, 'Cruzeiro do Sul', 'AC', 120020);
INSERT INTO public.municipio
VALUES (59, 1200252, 'Epitaciolândia', 'AC', 120025);
INSERT INTO public.municipio
VALUES (60, 1200302, 'Feijó', 'AC', 120030);
INSERT INTO public.municipio
VALUES (61, 1200328, 'Jordão', 'AC', 120032);
INSERT INTO public.municipio
VALUES (62, 1200336, 'Mâncio Lima', 'AC', 120033);
INSERT INTO public.municipio
VALUES (63, 1200344, 'Manoel Urbano', 'AC', 120034);
INSERT INTO public.municipio
VALUES (64, 1200351, 'Marechal Thaumaturgo', 'AC', 120035);
INSERT INTO public.municipio
VALUES (65, 1200385, 'Plácido de Castro', 'AC', 120038);
INSERT INTO public.municipio
VALUES (66, 1200393, 'Porto Walter', 'AC', 120039);
INSERT INTO public.municipio
VALUES (67, 1200401, 'Rio Branco', 'AC', 120040);
INSERT INTO public.municipio
VALUES (68, 1200427, 'Rodrigues Alves', 'AC', 120042);
INSERT INTO public.municipio
VALUES (69, 1200435, 'Santa Rosa do Purus', 'AC', 120043);
INSERT INTO public.municipio
VALUES (70, 1200450, 'Senador Guiomard', 'AC', 120045);
INSERT INTO public.municipio
VALUES (71, 1200500, 'Sena Madureira', 'AC', 120050);
INSERT INTO public.municipio
VALUES (72, 1200609, 'Tarauacá', 'AC', 120060);
INSERT INTO public.municipio
VALUES (73, 1200708, 'Xapuri', 'AC', 120070);
INSERT INTO public.municipio
VALUES (74, 1200807, 'Porto Acre', 'AC', 120080);
INSERT INTO public.municipio
VALUES (75, 1300029, 'Alvarães', 'AM', 130002);
INSERT INTO public.municipio
VALUES (76, 1300060, 'Amaturá', 'AM', 130006);
INSERT INTO public.municipio
VALUES (77, 1300086, 'Anamã', 'AM', 130008);
INSERT INTO public.municipio
VALUES (78, 1300102, 'Anori', 'AM', 130010);
INSERT INTO public.municipio
VALUES (79, 1300144, 'Apuí', 'AM', 130014);
INSERT INTO public.municipio
VALUES (80, 1300201, 'Atalaia do Norte', 'AM', 130020);
INSERT INTO public.municipio
VALUES (81, 1300300, 'Autazes', 'AM', 130030);
INSERT INTO public.municipio
VALUES (82, 1300409, 'Barcelos', 'AM', 130040);
INSERT INTO public.municipio
VALUES (83, 1300508, 'Barreirinha', 'AM', 130050);
INSERT INTO public.municipio
VALUES (84, 1300607, 'Benjamin Constant', 'AM', 130060);
INSERT INTO public.municipio
VALUES (85, 1300631, 'Beruri', 'AM', 130063);
INSERT INTO public.municipio
VALUES (86, 1300680, 'Boa Vista do Ramos', 'AM', 130068);
INSERT INTO public.municipio
VALUES (87, 1300706, 'Boca do Acre', 'AM', 130070);
INSERT INTO public.municipio
VALUES (88, 1300805, 'Borba', 'AM', 130080);
INSERT INTO public.municipio
VALUES (89, 1300839, 'Caapiranga', 'AM', 130083);
INSERT INTO public.municipio
VALUES (90, 1300904, 'Canutama', 'AM', 130090);
INSERT INTO public.municipio
VALUES (91, 1301001, 'Carauari', 'AM', 130100);
INSERT INTO public.municipio
VALUES (92, 1301100, 'Careiro', 'AM', 130110);
INSERT INTO public.municipio
VALUES (93, 1301159, 'Careiro da Várzea', 'AM', 130115);
INSERT INTO public.municipio
VALUES (94, 1301209, 'Coari', 'AM', 130120);
INSERT INTO public.municipio
VALUES (95, 1301308, 'Codajás', 'AM', 130130);
INSERT INTO public.municipio
VALUES (96, 1301407, 'Eirunepé', 'AM', 130140);
INSERT INTO public.municipio
VALUES (97, 1301506, 'Envira', 'AM', 130150);
INSERT INTO public.municipio
VALUES (98, 1301605, 'Fonte Boa', 'AM', 130160);
INSERT INTO public.municipio
VALUES (99, 1301654, 'Guajará', 'AM', 130165);
INSERT INTO public.municipio
VALUES (100, 1301704, 'Humaitá', 'AM', 130170);
INSERT INTO public.municipio
VALUES (101, 1301803, 'Ipixuna', 'AM', 130180);
INSERT INTO public.municipio
VALUES (102, 1301852, 'Iranduba', 'AM', 130185);
INSERT INTO public.municipio
VALUES (103, 1301902, 'Itacoatiara', 'AM', 130190);
INSERT INTO public.municipio
VALUES (104, 1301951, 'Itamarati', 'AM', 130195);
INSERT INTO public.municipio
VALUES (105, 1302009, 'Itapiranga', 'AM', 130200);
INSERT INTO public.municipio
VALUES (106, 1302108, 'Japurá', 'AM', 130210);
INSERT INTO public.municipio
VALUES (107, 1302207, 'Juruá', 'AM', 130220);
INSERT INTO public.municipio
VALUES (108, 1302306, 'Jutaí', 'AM', 130230);
INSERT INTO public.municipio
VALUES (109, 1302405, 'Lábrea', 'AM', 130240);
INSERT INTO public.municipio
VALUES (110, 1302504, 'Manacapuru', 'AM', 130250);
INSERT INTO public.municipio
VALUES (111, 1302553, 'Manaquiri', 'AM', 130255);
INSERT INTO public.municipio
VALUES (112, 1302603, 'Manaus', 'AM', 130260);
INSERT INTO public.municipio
VALUES (113, 1302702, 'Manicoré', 'AM', 130270);
INSERT INTO public.municipio
VALUES (114, 1302801, 'Maraã', 'AM', 130280);
INSERT INTO public.municipio
VALUES (115, 1302900, 'Maués', 'AM', 130290);
INSERT INTO public.municipio
VALUES (116, 1303007, 'Nhamundá', 'AM', 130300);
INSERT INTO public.municipio
VALUES (117, 1303106, 'Nova Olinda do Norte', 'AM', 130310);
INSERT INTO public.municipio
VALUES (118, 1303205, 'Novo Airão', 'AM', 130320);
INSERT INTO public.municipio
VALUES (119, 1303304, 'Novo Aripuanã', 'AM', 130330);
INSERT INTO public.municipio
VALUES (120, 1303403, 'Parintins', 'AM', 130340);
INSERT INTO public.municipio
VALUES (121, 1303502, 'Pauini', 'AM', 130350);
INSERT INTO public.municipio
VALUES (122, 1303536, 'Presidente Figueiredo', 'AM', 130353);
INSERT INTO public.municipio
VALUES (123, 1303569, 'Rio Preto da Eva', 'AM', 130356);
INSERT INTO public.municipio
VALUES (124, 1303601, 'Santa Isabel do Rio Negro', 'AM', 130360);
INSERT INTO public.municipio
VALUES (125, 1303700, 'Santo Antônio do Içá', 'AM', 130370);
INSERT INTO public.municipio
VALUES (126, 1303809, 'São Gabriel da Cachoeira', 'AM', 130380);
INSERT INTO public.municipio
VALUES (127, 1303908, 'São Paulo de Olivença', 'AM', 130390);
INSERT INTO public.municipio
VALUES (128, 1303957, 'São Sebastião do Uatumã', 'AM', 130395);
INSERT INTO public.municipio
VALUES (129, 1304005, 'Silves', 'AM', 130400);
INSERT INTO public.municipio
VALUES (130, 1304062, 'Tabatinga', 'AM', 130406);
INSERT INTO public.municipio
VALUES (131, 1304104, 'Tapauá', 'AM', 130410);
INSERT INTO public.municipio
VALUES (132, 1304203, 'Tefé', 'AM', 130420);
INSERT INTO public.municipio
VALUES (133, 1304237, 'Tonantins', 'AM', 130423);
INSERT INTO public.municipio
VALUES (134, 1304260, 'Uarini', 'AM', 130426);
INSERT INTO public.municipio
VALUES (135, 1304302, 'Urucará', 'AM', 130430);
INSERT INTO public.municipio
VALUES (136, 1304401, 'Urucurituba', 'AM', 130440);
INSERT INTO public.municipio
VALUES (137, 1400027, 'Amajari', 'RR', 140002);
INSERT INTO public.municipio
VALUES (138, 1400050, 'Alto Alegre', 'RR', 140005);
INSERT INTO public.municipio
VALUES (139, 1400100, 'Boa Vista', 'RR', 140010);
INSERT INTO public.municipio
VALUES (140, 1400159, 'Bonfim', 'RR', 140015);
INSERT INTO public.municipio
VALUES (141, 1400175, 'Cantá', 'RR', 140017);
INSERT INTO public.municipio
VALUES (142, 1400209, 'Caracaraí', 'RR', 140020);
INSERT INTO public.municipio
VALUES (143, 1400233, 'Caroebe', 'RR', 140023);
INSERT INTO public.municipio
VALUES (144, 1400282, 'Iracema', 'RR', 140028);
INSERT INTO public.municipio
VALUES (145, 1400308, 'Mucajaí', 'RR', 140030);
INSERT INTO public.municipio
VALUES (146, 1400407, 'Normandia', 'RR', 140040);
INSERT INTO public.municipio
VALUES (147, 1400456, 'Pacaraima', 'RR', 140045);
INSERT INTO public.municipio
VALUES (148, 1400472, 'Rorainópolis', 'RR', 140047);
INSERT INTO public.municipio
VALUES (149, 1400506, 'São João da Baliza', 'RR', 140050);
INSERT INTO public.municipio
VALUES (150, 1400605, 'São Luiz', 'RR', 140060);
INSERT INTO public.municipio
VALUES (151, 1400704, 'Uiramutã', 'RR', 140070);
INSERT INTO public.municipio
VALUES (152, 1500107, 'Abaetetuba', 'PA', 150010);
INSERT INTO public.municipio
VALUES (153, 1500131, 'Abel Figueiredo', 'PA', 150013);
INSERT INTO public.municipio
VALUES (154, 1500206, 'Acará', 'PA', 150020);
INSERT INTO public.municipio
VALUES (155, 1500305, 'Afuá', 'PA', 150030);
INSERT INTO public.municipio
VALUES (156, 1500347, 'Água Azul do Norte', 'PA', 150034);
INSERT INTO public.municipio
VALUES (157, 1500404, 'Alenquer', 'PA', 150040);
INSERT INTO public.municipio
VALUES (158, 1500503, 'Almeirim', 'PA', 150050);
INSERT INTO public.municipio
VALUES (159, 1500602, 'Altamira', 'PA', 150060);
INSERT INTO public.municipio
VALUES (160, 1500701, 'Anajás', 'PA', 150070);
INSERT INTO public.municipio
VALUES (161, 1500800, 'Ananindeua', 'PA', 150080);
INSERT INTO public.municipio
VALUES (162, 1500859, 'Anapu', 'PA', 150085);
INSERT INTO public.municipio
VALUES (163, 1500909, 'Augusto Corrêa', 'PA', 150090);
INSERT INTO public.municipio
VALUES (164, 1500958, 'Aurora do Pará', 'PA', 150095);
INSERT INTO public.municipio
VALUES (165, 1501006, 'Aveiro', 'PA', 150100);
INSERT INTO public.municipio
VALUES (166, 1501105, 'Bagre', 'PA', 150110);
INSERT INTO public.municipio
VALUES (167, 1501204, 'Baião', 'PA', 150120);
INSERT INTO public.municipio
VALUES (168, 1501253, 'Bannach', 'PA', 150125);
INSERT INTO public.municipio
VALUES (169, 1501303, 'Barcarena', 'PA', 150130);
INSERT INTO public.municipio
VALUES (170, 1501402, 'Belém', 'PA', 150140);
INSERT INTO public.municipio
VALUES (171, 1501451, 'Belterra', 'PA', 150145);
INSERT INTO public.municipio
VALUES (172, 1501501, 'Benevides', 'PA', 150150);
INSERT INTO public.municipio
VALUES (173, 1501576, 'Bom Jesus do Tocantins', 'PA', 150157);
INSERT INTO public.municipio
VALUES (174, 1501600, 'Bonito', 'PA', 150160);
INSERT INTO public.municipio
VALUES (175, 1501709, 'Bragança', 'PA', 150170);
INSERT INTO public.municipio
VALUES (176, 1501725, 'Brasil Novo', 'PA', 150172);
INSERT INTO public.municipio
VALUES (177, 1501758, 'Brejo Grande do Araguaia', 'PA', 150175);
INSERT INTO public.municipio
VALUES (178, 1501782, 'Breu Branco', 'PA', 150178);
INSERT INTO public.municipio
VALUES (179, 1501808, 'Breves', 'PA', 150180);
INSERT INTO public.municipio
VALUES (180, 1501907, 'Bujaru', 'PA', 150190);
INSERT INTO public.municipio
VALUES (181, 1501956, 'Cachoeira do Piriá', 'PA', 150195);
INSERT INTO public.municipio
VALUES (182, 1502004, 'Cachoeira do Arari', 'PA', 150200);
INSERT INTO public.municipio
VALUES (183, 1502103, 'Cametá', 'PA', 150210);
INSERT INTO public.municipio
VALUES (184, 1502152, 'Canaã dos Carajás', 'PA', 150215);
INSERT INTO public.municipio
VALUES (185, 1502202, 'Capanema', 'PA', 150220);
INSERT INTO public.municipio
VALUES (186, 1502301, 'Capitão Poço', 'PA', 150230);
INSERT INTO public.municipio
VALUES (187, 1502400, 'Castanhal', 'PA', 150240);
INSERT INTO public.municipio
VALUES (188, 1502509, 'Chaves', 'PA', 150250);
INSERT INTO public.municipio
VALUES (189, 1502608, 'Colares', 'PA', 150260);
INSERT INTO public.municipio
VALUES (190, 1502707, 'Conceição do Araguaia', 'PA', 150270);
INSERT INTO public.municipio
VALUES (191, 1502756, 'Concórdia do Pará', 'PA', 150275);
INSERT INTO public.municipio
VALUES (192, 1502764, 'Cumaru do Norte', 'PA', 150276);
INSERT INTO public.municipio
VALUES (193, 1502772, 'Curionópolis', 'PA', 150277);
INSERT INTO public.municipio
VALUES (194, 1502806, 'Curralinho', 'PA', 150280);
INSERT INTO public.municipio
VALUES (195, 1502855, 'Curuá', 'PA', 150285);
INSERT INTO public.municipio
VALUES (196, 1502905, 'Curuçá', 'PA', 150290);
INSERT INTO public.municipio
VALUES (197, 1502939, 'Dom Eliseu', 'PA', 150293);
INSERT INTO public.municipio
VALUES (198, 1502954, 'Eldorado dos Carajás', 'PA', 150295);
INSERT INTO public.municipio
VALUES (199, 1503002, 'Faro', 'PA', 150300);
INSERT INTO public.municipio
VALUES (200, 1503044, 'Floresta do Araguaia', 'PA', 150304);
INSERT INTO public.municipio
VALUES (201, 1503077, 'Garrafão do Norte', 'PA', 150307);
INSERT INTO public.municipio
VALUES (202, 1503093, 'Goianésia do Pará', 'PA', 150309);
INSERT INTO public.municipio
VALUES (203, 1503101, 'Gurupá', 'PA', 150310);
INSERT INTO public.municipio
VALUES (204, 1503200, 'Igarapé-Açu', 'PA', 150320);
INSERT INTO public.municipio
VALUES (205, 1503309, 'Igarapé-Miri', 'PA', 150330);
INSERT INTO public.municipio
VALUES (206, 1503408, 'Inhangapi', 'PA', 150340);
INSERT INTO public.municipio
VALUES (207, 1503457, 'Ipixuna do Pará', 'PA', 150345);
INSERT INTO public.municipio
VALUES (208, 1503507, 'Irituia', 'PA', 150350);
INSERT INTO public.municipio
VALUES (209, 1503606, 'Itaituba', 'PA', 150360);
INSERT INTO public.municipio
VALUES (210, 1503705, 'Itupiranga', 'PA', 150370);
INSERT INTO public.municipio
VALUES (211, 1503754, 'Jacareacanga', 'PA', 150375);
INSERT INTO public.municipio
VALUES (212, 1503804, 'Jacundá', 'PA', 150380);
INSERT INTO public.municipio
VALUES (213, 1503903, 'Juruti', 'PA', 150390);
INSERT INTO public.municipio
VALUES (214, 1504000, 'Limoeiro do Ajuru', 'PA', 150400);
INSERT INTO public.municipio
VALUES (215, 1504059, 'Mãe do Rio', 'PA', 150405);
INSERT INTO public.municipio
VALUES (216, 1504109, 'Magalhães Barata', 'PA', 150410);
INSERT INTO public.municipio
VALUES (217, 1504208, 'Marabá', 'PA', 150420);
INSERT INTO public.municipio
VALUES (218, 1504307, 'Maracanã', 'PA', 150430);
INSERT INTO public.municipio
VALUES (219, 1504406, 'Marapanim', 'PA', 150440);
INSERT INTO public.municipio
VALUES (220, 1504422, 'Marituba', 'PA', 150442);
INSERT INTO public.municipio
VALUES (221, 1504455, 'Medicilândia', 'PA', 150445);
INSERT INTO public.municipio
VALUES (222, 1504505, 'Melgaço', 'PA', 150450);
INSERT INTO public.municipio
VALUES (223, 1504604, 'Mocajuba', 'PA', 150460);
INSERT INTO public.municipio
VALUES (224, 1504703, 'Moju', 'PA', 150470);
INSERT INTO public.municipio
VALUES (225, 1504752, 'Mojuí dos Campos', 'PA', 150475);
INSERT INTO public.municipio
VALUES (226, 1504802, 'Monte Alegre', 'PA', 150480);
INSERT INTO public.municipio
VALUES (227, 1504901, 'Muaná', 'PA', 150490);
INSERT INTO public.municipio
VALUES (228, 1504950, 'Nova Esperança do Piriá', 'PA', 150495);
INSERT INTO public.municipio
VALUES (229, 1504976, 'Nova Ipixuna', 'PA', 150497);
INSERT INTO public.municipio
VALUES (230, 1505007, 'Nova Timboteua', 'PA', 150500);
INSERT INTO public.municipio
VALUES (231, 1505031, 'Novo Progresso', 'PA', 150503);
INSERT INTO public.municipio
VALUES (232, 1505064, 'Novo Repartimento', 'PA', 150506);
INSERT INTO public.municipio
VALUES (233, 1505106, 'Óbidos', 'PA', 150510);
INSERT INTO public.municipio
VALUES (234, 1505205, 'Oeiras do Pará', 'PA', 150520);
INSERT INTO public.municipio
VALUES (235, 1505304, 'Oriximiná', 'PA', 150530);
INSERT INTO public.municipio
VALUES (236, 1505403, 'Ourém', 'PA', 150540);
INSERT INTO public.municipio
VALUES (237, 1505437, 'Ourilândia do Norte', 'PA', 150543);
INSERT INTO public.municipio
VALUES (238, 1505486, 'Pacajá', 'PA', 150548);
INSERT INTO public.municipio
VALUES (239, 1505494, 'Palestina do Pará', 'PA', 150549);
INSERT INTO public.municipio
VALUES (240, 1505502, 'Paragominas', 'PA', 150550);
INSERT INTO public.municipio
VALUES (241, 1505536, 'Parauapebas', 'PA', 150553);
INSERT INTO public.municipio
VALUES (242, 1505551, 'Pau D''Arco', 'PA', 150555);
INSERT INTO public.municipio
VALUES (243, 1505601, 'Peixe-Boi', 'PA', 150560);
INSERT INTO public.municipio
VALUES (244, 1505635, 'Piçarra', 'PA', 150563);
INSERT INTO public.municipio
VALUES (245, 1505650, 'Placas', 'PA', 150565);
INSERT INTO public.municipio
VALUES (246, 1505700, 'Ponta de Pedras', 'PA', 150570);
INSERT INTO public.municipio
VALUES (247, 1505809, 'Portel', 'PA', 150580);
INSERT INTO public.municipio
VALUES (248, 1505908, 'Porto de Moz', 'PA', 150590);
INSERT INTO public.municipio
VALUES (249, 1506005, 'Prainha', 'PA', 150600);
INSERT INTO public.municipio
VALUES (250, 1506104, 'Primavera', 'PA', 150610);
INSERT INTO public.municipio
VALUES (251, 1506112, 'Quatipuru', 'PA', 150611);
INSERT INTO public.municipio
VALUES (252, 1506138, 'Redenção', 'PA', 150613);
INSERT INTO public.municipio
VALUES (253, 1506161, 'Rio Maria', 'PA', 150616);
INSERT INTO public.municipio
VALUES (254, 1506187, 'Rondon do Pará', 'PA', 150618);
INSERT INTO public.municipio
VALUES (255, 1506195, 'Rurópolis', 'PA', 150619);
INSERT INTO public.municipio
VALUES (256, 1506203, 'Salinópolis', 'PA', 150620);
INSERT INTO public.municipio
VALUES (257, 1506302, 'Salvaterra', 'PA', 150630);
INSERT INTO public.municipio
VALUES (258, 1506351, 'Santa Bárbara do Pará', 'PA', 150635);
INSERT INTO public.municipio
VALUES (259, 1506401, 'Santa Cruz do Arari', 'PA', 150640);
INSERT INTO public.municipio
VALUES (260, 1506500, 'Santa Isabel do Pará', 'PA', 150650);
INSERT INTO public.municipio
VALUES (261, 1506559, 'Santa Luzia do Pará', 'PA', 150655);
INSERT INTO public.municipio
VALUES (262, 1506583, 'Santa Maria das Barreiras', 'PA', 150658);
INSERT INTO public.municipio
VALUES (263, 1506609, 'Santa Maria do Pará', 'PA', 150660);
INSERT INTO public.municipio
VALUES (264, 1506708, 'Santana do Araguaia', 'PA', 150670);
INSERT INTO public.municipio
VALUES (265, 1506807, 'Santarém', 'PA', 150680);
INSERT INTO public.municipio
VALUES (266, 1506906, 'Santarém Novo', 'PA', 150690);
INSERT INTO public.municipio
VALUES (267, 1507003, 'Santo Antônio do Tauá', 'PA', 150700);
INSERT INTO public.municipio
VALUES (268, 1507102, 'São Caetano de Odivelas', 'PA', 150710);
INSERT INTO public.municipio
VALUES (269, 1507151, 'São Domingos do Araguaia', 'PA', 150715);
INSERT INTO public.municipio
VALUES (270, 1507201, 'São Domingos do Capim', 'PA', 150720);
INSERT INTO public.municipio
VALUES (271, 1507300, 'São Félix do Xingu', 'PA', 150730);
INSERT INTO public.municipio
VALUES (272, 1507409, 'São Francisco do Pará', 'PA', 150740);
INSERT INTO public.municipio
VALUES (273, 1507458, 'São Geraldo do Araguaia', 'PA', 150745);
INSERT INTO public.municipio
VALUES (274, 1507466, 'São João da Ponta', 'PA', 150746);
INSERT INTO public.municipio
VALUES (275, 1507474, 'São João de Pirabas', 'PA', 150747);
INSERT INTO public.municipio
VALUES (276, 1507508, 'São João do Araguaia', 'PA', 150750);
INSERT INTO public.municipio
VALUES (277, 1507607, 'São Miguel do Guamá', 'PA', 150760);
INSERT INTO public.municipio
VALUES (278, 1507706, 'São Sebastião da Boa Vista', 'PA', 150770);
INSERT INTO public.municipio
VALUES (279, 1507755, 'Sapucaia', 'PA', 150775);
INSERT INTO public.municipio
VALUES (280, 1507805, 'Senador José Porfírio', 'PA', 150780);
INSERT INTO public.municipio
VALUES (281, 1507904, 'Soure', 'PA', 150790);
INSERT INTO public.municipio
VALUES (282, 1507953, 'Tailândia', 'PA', 150795);
INSERT INTO public.municipio
VALUES (283, 1507961, 'Terra Alta', 'PA', 150796);
INSERT INTO public.municipio
VALUES (284, 1507979, 'Terra Santa', 'PA', 150797);
INSERT INTO public.municipio
VALUES (285, 1508001, 'Tomé-Açu', 'PA', 150800);
INSERT INTO public.municipio
VALUES (286, 1508035, 'Tracuateua', 'PA', 150803);
INSERT INTO public.municipio
VALUES (287, 1508050, 'Trairão', 'PA', 150805);
INSERT INTO public.municipio
VALUES (288, 1508084, 'Tucumã', 'PA', 150808);
INSERT INTO public.municipio
VALUES (289, 1508100, 'Tucuruí', 'PA', 150810);
INSERT INTO public.municipio
VALUES (290, 1508126, 'Ulianópolis', 'PA', 150812);
INSERT INTO public.municipio
VALUES (291, 1508159, 'Uruará', 'PA', 150815);
INSERT INTO public.municipio
VALUES (292, 1508209, 'Vigia', 'PA', 150820);
INSERT INTO public.municipio
VALUES (293, 1508308, 'Viseu', 'PA', 150830);
INSERT INTO public.municipio
VALUES (294, 1508357, 'Vitória do Xingu', 'PA', 150835);
INSERT INTO public.municipio
VALUES (295, 1508407, 'Xinguara', 'PA', 150840);
INSERT INTO public.municipio
VALUES (296, 1600055, 'Serra do Navio', 'AP', 160005);
INSERT INTO public.municipio
VALUES (297, 1600105, 'Amapá', 'AP', 160010);
INSERT INTO public.municipio
VALUES (298, 1600154, 'Pedra Branca do Amapari', 'AP', 160015);
INSERT INTO public.municipio
VALUES (299, 1600204, 'Calçoene', 'AP', 160020);
INSERT INTO public.municipio
VALUES (300, 1600212, 'Cutias', 'AP', 160021);
INSERT INTO public.municipio
VALUES (301, 1600238, 'Ferreira Gomes', 'AP', 160023);
INSERT INTO public.municipio
VALUES (302, 1600253, 'Itaubal', 'AP', 160025);
INSERT INTO public.municipio
VALUES (303, 1600279, 'Laranjal do Jari', 'AP', 160027);
INSERT INTO public.municipio
VALUES (304, 1600303, 'Macapá', 'AP', 160030);
INSERT INTO public.municipio
VALUES (305, 1600402, 'Mazagão', 'AP', 160040);
INSERT INTO public.municipio
VALUES (306, 1600501, 'Oiapoque', 'AP', 160050);
INSERT INTO public.municipio
VALUES (307, 1600535, 'Porto Grande', 'AP', 160053);
INSERT INTO public.municipio
VALUES (308, 1600550, 'Pracuúba', 'AP', 160055);
INSERT INTO public.municipio
VALUES (309, 1600600, 'Santana', 'AP', 160060);
INSERT INTO public.municipio
VALUES (310, 1600709, 'Tartarugalzinho', 'AP', 160070);
INSERT INTO public.municipio
VALUES (311, 1600808, 'Vitória do Jari', 'AP', 160080);
INSERT INTO public.municipio
VALUES (312, 1700251, 'Abreulândia', 'TO', 170025);
INSERT INTO public.municipio
VALUES (313, 1700301, 'Aguiarnópolis', 'TO', 170030);
INSERT INTO public.municipio
VALUES (314, 1700350, 'Aliança do Tocantins', 'TO', 170035);
INSERT INTO public.municipio
VALUES (315, 1700400, 'Almas', 'TO', 170040);
INSERT INTO public.municipio
VALUES (316, 1700707, 'Alvorada', 'TO', 170070);
INSERT INTO public.municipio
VALUES (317, 1701002, 'Ananás', 'TO', 170100);
INSERT INTO public.municipio
VALUES (318, 1701051, 'Angico', 'TO', 170105);
INSERT INTO public.municipio
VALUES (319, 1701101, 'Aparecida do Rio Negro', 'TO', 170110);
INSERT INTO public.municipio
VALUES (320, 1701309, 'Aragominas', 'TO', 170130);
INSERT INTO public.municipio
VALUES (321, 1701903, 'Araguacema', 'TO', 170190);
INSERT INTO public.municipio
VALUES (322, 1702000, 'Araguaçu', 'TO', 170200);
INSERT INTO public.municipio
VALUES (323, 1702109, 'Araguaína', 'TO', 170210);
INSERT INTO public.municipio
VALUES (324, 1702158, 'Araguanã', 'TO', 170215);
INSERT INTO public.municipio
VALUES (325, 1702208, 'Araguatins', 'TO', 170220);
INSERT INTO public.municipio
VALUES (326, 1702307, 'Arapoema', 'TO', 170230);
INSERT INTO public.municipio
VALUES (327, 1702406, 'Arraias', 'TO', 170240);
INSERT INTO public.municipio
VALUES (328, 1702554, 'Augustinópolis', 'TO', 170255);
INSERT INTO public.municipio
VALUES (329, 1702703, 'Aurora do Tocantins', 'TO', 170270);
INSERT INTO public.municipio
VALUES (330, 1702901, 'Axixá do Tocantins', 'TO', 170290);
INSERT INTO public.municipio
VALUES (331, 1703008, 'Babaçulândia', 'TO', 170300);
INSERT INTO public.municipio
VALUES (332, 1703057, 'Bandeirantes do Tocantins', 'TO', 170305);
INSERT INTO public.municipio
VALUES (333, 1703073, 'Barra do Ouro', 'TO', 170307);
INSERT INTO public.municipio
VALUES (334, 1703107, 'Barrolândia', 'TO', 170310);
INSERT INTO public.municipio
VALUES (335, 1703206, 'Bernardo Sayão', 'TO', 170320);
INSERT INTO public.municipio
VALUES (336, 1703305, 'Bom Jesus do Tocantins', 'TO', 170330);
INSERT INTO public.municipio
VALUES (337, 1703602, 'Brasilândia do Tocantins', 'TO', 170360);
INSERT INTO public.municipio
VALUES (338, 1703701, 'Brejinho de Nazaré', 'TO', 170370);
INSERT INTO public.municipio
VALUES (339, 1703800, 'Buriti do Tocantins', 'TO', 170380);
INSERT INTO public.municipio
VALUES (340, 1703826, 'Cachoeirinha', 'TO', 170382);
INSERT INTO public.municipio
VALUES (341, 1703842, 'Campos Lindos', 'TO', 170384);
INSERT INTO public.municipio
VALUES (342, 1703867, 'Cariri do Tocantins', 'TO', 170386);
INSERT INTO public.municipio
VALUES (343, 1703883, 'Carmolândia', 'TO', 170388);
INSERT INTO public.municipio
VALUES (344, 1703891, 'Carrasco Bonito', 'TO', 170389);
INSERT INTO public.municipio
VALUES (345, 1703909, 'Caseara', 'TO', 170390);
INSERT INTO public.municipio
VALUES (346, 1704105, 'Centenário', 'TO', 170410);
INSERT INTO public.municipio
VALUES (347, 1704600, 'Chapada de Areia', 'TO', 170460);
INSERT INTO public.municipio
VALUES (348, 1705102, 'Chapada da Natividade', 'TO', 170510);
INSERT INTO public.municipio
VALUES (349, 1705508, 'Colinas do Tocantins', 'TO', 170550);
INSERT INTO public.municipio
VALUES (350, 1705557, 'Combinado', 'TO', 170555);
INSERT INTO public.municipio
VALUES (351, 1705607, 'Conceição do Tocantins', 'TO', 170560);
INSERT INTO public.municipio
VALUES (352, 1706001, 'Couto Magalhães', 'TO', 170600);
INSERT INTO public.municipio
VALUES (353, 1706100, 'Cristalândia', 'TO', 170610);
INSERT INTO public.municipio
VALUES (354, 1706258, 'Crixás do Tocantins', 'TO', 170625);
INSERT INTO public.municipio
VALUES (355, 1706506, 'Darcinópolis', 'TO', 170650);
INSERT INTO public.municipio
VALUES (356, 1707009, 'Dianópolis', 'TO', 170700);
INSERT INTO public.municipio
VALUES (357, 1707108, 'Divinópolis do Tocantins', 'TO', 170710);
INSERT INTO public.municipio
VALUES (358, 1707207, 'Dois Irmãos do Tocantins', 'TO', 170720);
INSERT INTO public.municipio
VALUES (359, 1707306, 'Dueré', 'TO', 170730);
INSERT INTO public.municipio
VALUES (360, 1707405, 'Esperantina', 'TO', 170740);
INSERT INTO public.municipio
VALUES (361, 1707553, 'Fátima', 'TO', 170755);
INSERT INTO public.municipio
VALUES (362, 1707652, 'Figueirópolis', 'TO', 170765);
INSERT INTO public.municipio
VALUES (363, 1707702, 'Filadélfia', 'TO', 170770);
INSERT INTO public.municipio
VALUES (364, 1708205, 'Formoso do Araguaia', 'TO', 170820);
INSERT INTO public.municipio
VALUES (365, 1708254, 'Fortaleza do Tabocão', 'TO', 170825);
INSERT INTO public.municipio
VALUES (366, 1708304, 'Goianorte', 'TO', 170830);
INSERT INTO public.municipio
VALUES (367, 1709005, 'Goiatins', 'TO', 170900);
INSERT INTO public.municipio
VALUES (368, 1709302, 'Guaraí', 'TO', 170930);
INSERT INTO public.municipio
VALUES (369, 1709500, 'Gurupi', 'TO', 170950);
INSERT INTO public.municipio
VALUES (370, 1709807, 'Ipueiras', 'TO', 170980);
INSERT INTO public.municipio
VALUES (371, 1710508, 'Itacajá', 'TO', 171050);
INSERT INTO public.municipio
VALUES (372, 1710706, 'Itaguatins', 'TO', 171070);
INSERT INTO public.municipio
VALUES (373, 1710904, 'Itapiratins', 'TO', 171090);
INSERT INTO public.municipio
VALUES (374, 1711100, 'Itaporã do Tocantins', 'TO', 171110);
INSERT INTO public.municipio
VALUES (375, 1711506, 'Jaú do Tocantins', 'TO', 171150);
INSERT INTO public.municipio
VALUES (376, 1711803, 'Juarina', 'TO', 171180);
INSERT INTO public.municipio
VALUES (377, 1711902, 'Lagoa da Confusão', 'TO', 171190);
INSERT INTO public.municipio
VALUES (378, 1711951, 'Lagoa do Tocantins', 'TO', 171195);
INSERT INTO public.municipio
VALUES (379, 1712009, 'Lajeado', 'TO', 171200);
INSERT INTO public.municipio
VALUES (380, 1712157, 'Lavandeira', 'TO', 171215);
INSERT INTO public.municipio
VALUES (381, 1712405, 'Lizarda', 'TO', 171240);
INSERT INTO public.municipio
VALUES (382, 1712454, 'Luzinópolis', 'TO', 171245);
INSERT INTO public.municipio
VALUES (383, 1712504, 'Marianópolis do Tocantins', 'TO', 171250);
INSERT INTO public.municipio
VALUES (384, 1712702, 'Mateiros', 'TO', 171270);
INSERT INTO public.municipio
VALUES (385, 1712801, 'Maurilândia do Tocantins', 'TO', 171280);
INSERT INTO public.municipio
VALUES (386, 1713205, 'Miracema do Tocantins', 'TO', 171320);
INSERT INTO public.municipio
VALUES (387, 1713304, 'Miranorte', 'TO', 171330);
INSERT INTO public.municipio
VALUES (388, 1713601, 'Monte do Carmo', 'TO', 171360);
INSERT INTO public.municipio
VALUES (389, 1713700, 'Monte Santo do Tocantins', 'TO', 171370);
INSERT INTO public.municipio
VALUES (390, 1713809, 'Palmeiras do Tocantins', 'TO', 171380);
INSERT INTO public.municipio
VALUES (391, 1713957, 'Muricilândia', 'TO', 171395);
INSERT INTO public.municipio
VALUES (392, 1714203, 'Natividade', 'TO', 171420);
INSERT INTO public.municipio
VALUES (393, 1714302, 'Nazaré', 'TO', 171430);
INSERT INTO public.municipio
VALUES (394, 1714880, 'Nova Olinda', 'TO', 171488);
INSERT INTO public.municipio
VALUES (395, 1715002, 'Nova Rosalândia', 'TO', 171500);
INSERT INTO public.municipio
VALUES (396, 1715101, 'Novo Acordo', 'TO', 171510);
INSERT INTO public.municipio
VALUES (397, 1715150, 'Novo Alegre', 'TO', 171515);
INSERT INTO public.municipio
VALUES (398, 1715259, 'Novo Jardim', 'TO', 171525);
INSERT INTO public.municipio
VALUES (399, 1715507, 'Oliveira de Fátima', 'TO', 171550);
INSERT INTO public.municipio
VALUES (400, 1715705, 'Palmeirante', 'TO', 171570);
INSERT INTO public.municipio
VALUES (401, 1715754, 'Palmeirópolis', 'TO', 171575);
INSERT INTO public.municipio
VALUES (402, 1716109, 'Paraíso do Tocantins', 'TO', 171610);
INSERT INTO public.municipio
VALUES (403, 1716208, 'Paranã', 'TO', 171620);
INSERT INTO public.municipio
VALUES (404, 1716307, 'Pau D''Arco', 'TO', 171630);
INSERT INTO public.municipio
VALUES (405, 1716505, 'Pedro Afonso', 'TO', 171650);
INSERT INTO public.municipio
VALUES (406, 1716604, 'Peixe', 'TO', 171660);
INSERT INTO public.municipio
VALUES (407, 1716653, 'Pequizeiro', 'TO', 171665);
INSERT INTO public.municipio
VALUES (408, 1716703, 'Colméia', 'TO', 171670);
INSERT INTO public.municipio
VALUES (409, 1717008, 'Pindorama do Tocantins', 'TO', 171700);
INSERT INTO public.municipio
VALUES (410, 1717206, 'Piraquê', 'TO', 171720);
INSERT INTO public.municipio
VALUES (411, 1717503, 'Pium', 'TO', 171750);
INSERT INTO public.municipio
VALUES (412, 1717800, 'Ponte Alta do Bom Jesus', 'TO', 171780);
INSERT INTO public.municipio
VALUES (413, 1717909, 'Ponte Alta do Tocantins', 'TO', 171790);
INSERT INTO public.municipio
VALUES (414, 1718006, 'Porto Alegre do Tocantins', 'TO', 171800);
INSERT INTO public.municipio
VALUES (415, 1718204, 'Porto Nacional', 'TO', 171820);
INSERT INTO public.municipio
VALUES (416, 1718303, 'Praia Norte', 'TO', 171830);
INSERT INTO public.municipio
VALUES (417, 1718402, 'Presidente Kennedy', 'TO', 171840);
INSERT INTO public.municipio
VALUES (418, 1718451, 'Pugmil', 'TO', 171845);
INSERT INTO public.municipio
VALUES (419, 1718501, 'Recursolândia', 'TO', 171850);
INSERT INTO public.municipio
VALUES (420, 1718550, 'Riachinho', 'TO', 171855);
INSERT INTO public.municipio
VALUES (421, 1718659, 'Rio da Conceição', 'TO', 171865);
INSERT INTO public.municipio
VALUES (422, 1718709, 'Rio dos Bois', 'TO', 171870);
INSERT INTO public.municipio
VALUES (423, 1718758, 'Rio Sono', 'TO', 171875);
INSERT INTO public.municipio
VALUES (424, 1718808, 'Sampaio', 'TO', 171880);
INSERT INTO public.municipio
VALUES (425, 1718840, 'Sandolândia', 'TO', 171884);
INSERT INTO public.municipio
VALUES (426, 1718865, 'Santa Fé do Araguaia', 'TO', 171886);
INSERT INTO public.municipio
VALUES (427, 1718881, 'Santa Maria do Tocantins', 'TO', 171888);
INSERT INTO public.municipio
VALUES (428, 1718899, 'Santa Rita do Tocantins', 'TO', 171889);
INSERT INTO public.municipio
VALUES (429, 1718907, 'Santa Rosa do Tocantins', 'TO', 171890);
INSERT INTO public.municipio
VALUES (430, 1719004, 'Santa Tereza do Tocantins', 'TO', 171900);
INSERT INTO public.municipio
VALUES (431, 1720002, 'Santa Terezinha do Tocantins', 'TO', 172000);
INSERT INTO public.municipio
VALUES (432, 1720101, 'São Bento do Tocantins', 'TO', 172010);
INSERT INTO public.municipio
VALUES (433, 1720150, 'São Félix do Tocantins', 'TO', 172015);
INSERT INTO public.municipio
VALUES (434, 1720200, 'São Miguel do Tocantins', 'TO', 172020);
INSERT INTO public.municipio
VALUES (435, 1720259, 'São Salvador do Tocantins', 'TO', 172025);
INSERT INTO public.municipio
VALUES (436, 1720309, 'São Sebastião do Tocantins', 'TO', 172030);
INSERT INTO public.municipio
VALUES (437, 1720499, 'São Valério', 'TO', 172049);
INSERT INTO public.municipio
VALUES (438, 1720655, 'Silvanópolis', 'TO', 172065);
INSERT INTO public.municipio
VALUES (439, 1720804, 'Sítio Novo do Tocantins', 'TO', 172080);
INSERT INTO public.municipio
VALUES (440, 1720853, 'Sucupira', 'TO', 172085);
INSERT INTO public.municipio
VALUES (441, 1720903, 'Taguatinga', 'TO', 172090);
INSERT INTO public.municipio
VALUES (442, 1720937, 'Taipas do Tocantins', 'TO', 172093);
INSERT INTO public.municipio
VALUES (443, 1720978, 'Talismã', 'TO', 172097);
INSERT INTO public.municipio
VALUES (444, 1721000, 'Palmas', 'TO', 172100);
INSERT INTO public.municipio
VALUES (445, 1721109, 'Tocantínia', 'TO', 172110);
INSERT INTO public.municipio
VALUES (446, 1721208, 'Tocantinópolis', 'TO', 172120);
INSERT INTO public.municipio
VALUES (447, 1721257, 'Tupirama', 'TO', 172125);
INSERT INTO public.municipio
VALUES (448, 1721307, 'Tupiratins', 'TO', 172130);
INSERT INTO public.municipio
VALUES (449, 1722081, 'Wanderlândia', 'TO', 172208);
INSERT INTO public.municipio
VALUES (450, 1722107, 'Xambioá', 'TO', 172210);
INSERT INTO public.municipio
VALUES (451, 2100055, 'Açailândia', 'MA', 210005);
INSERT INTO public.municipio
VALUES (452, 2100105, 'Afonso Cunha', 'MA', 210010);
INSERT INTO public.municipio
VALUES (453, 2100154, 'Água Doce do Maranhão', 'MA', 210015);
INSERT INTO public.municipio
VALUES (454, 2100204, 'Alcântara', 'MA', 210020);
INSERT INTO public.municipio
VALUES (455, 2100303, 'Aldeias Altas', 'MA', 210030);
INSERT INTO public.municipio
VALUES (456, 2100402, 'Altamira do Maranhão', 'MA', 210040);
INSERT INTO public.municipio
VALUES (457, 2100436, 'Alto Alegre do Maranhão', 'MA', 210043);
INSERT INTO public.municipio
VALUES (458, 2100477, 'Alto Alegre do Pindaré', 'MA', 210047);
INSERT INTO public.municipio
VALUES (459, 2100501, 'Alto Parnaíba', 'MA', 210050);
INSERT INTO public.municipio
VALUES (460, 2100550, 'Amapá do Maranhão', 'MA', 210055);
INSERT INTO public.municipio
VALUES (461, 2100600, 'Amarante do Maranhão', 'MA', 210060);
INSERT INTO public.municipio
VALUES (462, 2100709, 'Anajatuba', 'MA', 210070);
INSERT INTO public.municipio
VALUES (463, 2100808, 'Anapurus', 'MA', 210080);
INSERT INTO public.municipio
VALUES (464, 2100832, 'Apicum-Açu', 'MA', 210083);
INSERT INTO public.municipio
VALUES (465, 2100873, 'Araguanã', 'MA', 210087);
INSERT INTO public.municipio
VALUES (466, 2100907, 'Araioses', 'MA', 210090);
INSERT INTO public.municipio
VALUES (467, 2100956, 'Arame', 'MA', 210095);
INSERT INTO public.municipio
VALUES (468, 2101004, 'Arari', 'MA', 210100);
INSERT INTO public.municipio
VALUES (469, 2101103, 'Axixá', 'MA', 210110);
INSERT INTO public.municipio
VALUES (470, 2101202, 'Bacabal', 'MA', 210120);
INSERT INTO public.municipio
VALUES (471, 2101251, 'Bacabeira', 'MA', 210125);
INSERT INTO public.municipio
VALUES (472, 2101301, 'Bacuri', 'MA', 210130);
INSERT INTO public.municipio
VALUES (473, 2101350, 'Bacurituba', 'MA', 210135);
INSERT INTO public.municipio
VALUES (474, 2101400, 'Balsas', 'MA', 210140);
INSERT INTO public.municipio
VALUES (475, 2101509, 'Barão de Grajaú', 'MA', 210150);
INSERT INTO public.municipio
VALUES (476, 2101608, 'Barra do Corda', 'MA', 210160);
INSERT INTO public.municipio
VALUES (477, 2101707, 'Barreirinhas', 'MA', 210170);
INSERT INTO public.municipio
VALUES (478, 2101731, 'Belágua', 'MA', 210173);
INSERT INTO public.municipio
VALUES (479, 2101772, 'Bela Vista do Maranhão', 'MA', 210177);
INSERT INTO public.municipio
VALUES (480, 2101806, 'Benedito Leite', 'MA', 210180);
INSERT INTO public.municipio
VALUES (481, 2101905, 'Bequimão', 'MA', 210190);
INSERT INTO public.municipio
VALUES (482, 2101939, 'Bernardo do Mearim', 'MA', 210193);
INSERT INTO public.municipio
VALUES (483, 2101970, 'Boa Vista do Gurupi', 'MA', 210197);
INSERT INTO public.municipio
VALUES (484, 2102002, 'Bom Jardim', 'MA', 210200);
INSERT INTO public.municipio
VALUES (485, 2102036, 'Bom Jesus das Selvas', 'MA', 210203);
INSERT INTO public.municipio
VALUES (486, 2102077, 'Bom Lugar', 'MA', 210207);
INSERT INTO public.municipio
VALUES (487, 2102101, 'Brejo', 'MA', 210210);
INSERT INTO public.municipio
VALUES (488, 2102150, 'Brejo de Areia', 'MA', 210215);
INSERT INTO public.municipio
VALUES (489, 2102200, 'Buriti', 'MA', 210220);
INSERT INTO public.municipio
VALUES (490, 2102309, 'Buriti Bravo', 'MA', 210230);
INSERT INTO public.municipio
VALUES (491, 2102325, 'Buriticupu', 'MA', 210232);
INSERT INTO public.municipio
VALUES (492, 2102358, 'Buritirana', 'MA', 210235);
INSERT INTO public.municipio
VALUES (493, 2102374, 'Cachoeira Grande', 'MA', 210237);
INSERT INTO public.municipio
VALUES (494, 2102408, 'Cajapió', 'MA', 210240);
INSERT INTO public.municipio
VALUES (495, 2102507, 'Cajari', 'MA', 210250);
INSERT INTO public.municipio
VALUES (496, 2102556, 'Campestre do Maranhão', 'MA', 210255);
INSERT INTO public.municipio
VALUES (497, 2102606, 'Cândido Mendes', 'MA', 210260);
INSERT INTO public.municipio
VALUES (498, 2102705, 'Cantanhede', 'MA', 210270);
INSERT INTO public.municipio
VALUES (499, 2102754, 'Capinzal do Norte', 'MA', 210275);
INSERT INTO public.municipio
VALUES (500, 2102804, 'Carolina', 'MA', 210280);
INSERT INTO public.municipio
VALUES (501, 2102903, 'Carutapera', 'MA', 210290);
INSERT INTO public.municipio
VALUES (502, 2103000, 'Caxias', 'MA', 210300);
INSERT INTO public.municipio
VALUES (503, 2103109, 'Cedral', 'MA', 210310);
INSERT INTO public.municipio
VALUES (504, 2103125, 'Central do Maranhão', 'MA', 210312);
INSERT INTO public.municipio
VALUES (505, 2103158, 'Centro do Guilherme', 'MA', 210315);
INSERT INTO public.municipio
VALUES (506, 2103174, 'Centro Novo do Maranhão', 'MA', 210317);
INSERT INTO public.municipio
VALUES (507, 2103208, 'Chapadinha', 'MA', 210320);
INSERT INTO public.municipio
VALUES (508, 2103257, 'Cidelândia', 'MA', 210325);
INSERT INTO public.municipio
VALUES (509, 2103307, 'Codó', 'MA', 210330);
INSERT INTO public.municipio
VALUES (510, 2103406, 'Coelho Neto', 'MA', 210340);
INSERT INTO public.municipio
VALUES (511, 2103505, 'Colinas', 'MA', 210350);
INSERT INTO public.municipio
VALUES (512, 2103554, 'Conceição do Lago-Açu', 'MA', 210355);
INSERT INTO public.municipio
VALUES (513, 2103604, 'Coroatá', 'MA', 210360);
INSERT INTO public.municipio
VALUES (514, 2103703, 'Cururupu', 'MA', 210370);
INSERT INTO public.municipio
VALUES (515, 2103752, 'Davinópolis', 'MA', 210375);
INSERT INTO public.municipio
VALUES (516, 2103802, 'Dom Pedro', 'MA', 210380);
INSERT INTO public.municipio
VALUES (517, 2103901, 'Duque Bacelar', 'MA', 210390);
INSERT INTO public.municipio
VALUES (518, 2104008, 'Esperantinópolis', 'MA', 210400);
INSERT INTO public.municipio
VALUES (519, 2104057, 'Estreito', 'MA', 210405);
INSERT INTO public.municipio
VALUES (520, 2104073, 'Feira Nova do Maranhão', 'MA', 210407);
INSERT INTO public.municipio
VALUES (521, 2104081, 'Fernando Falcão', 'MA', 210408);
INSERT INTO public.municipio
VALUES (522, 2104099, 'Formosa da Serra Negra', 'MA', 210409);
INSERT INTO public.municipio
VALUES (523, 2104107, 'Fortaleza dos Nogueiras', 'MA', 210410);
INSERT INTO public.municipio
VALUES (524, 2104206, 'Fortuna', 'MA', 210420);
INSERT INTO public.municipio
VALUES (525, 2104305, 'Godofredo Viana', 'MA', 210430);
INSERT INTO public.municipio
VALUES (526, 2104404, 'Gonçalves Dias', 'MA', 210440);
INSERT INTO public.municipio
VALUES (527, 2104503, 'Governador Archer', 'MA', 210450);
INSERT INTO public.municipio
VALUES (528, 2104552, 'Governador Edison Lobão', 'MA', 210455);
INSERT INTO public.municipio
VALUES (529, 2104602, 'Governador Eugênio Barros', 'MA', 210460);
INSERT INTO public.municipio
VALUES (530, 2104628, 'Governador Luiz Rocha', 'MA', 210462);
INSERT INTO public.municipio
VALUES (531, 2104651, 'Governador Newton Bello', 'MA', 210465);
INSERT INTO public.municipio
VALUES (532, 2104677, 'Governador Nunes Freire', 'MA', 210467);
INSERT INTO public.municipio
VALUES (533, 2104701, 'Graça Aranha', 'MA', 210470);
INSERT INTO public.municipio
VALUES (534, 2104800, 'Grajaú', 'MA', 210480);
INSERT INTO public.municipio
VALUES (535, 2104909, 'Guimarães', 'MA', 210490);
INSERT INTO public.municipio
VALUES (536, 2105005, 'Humberto de Campos', 'MA', 210500);
INSERT INTO public.municipio
VALUES (537, 2105104, 'Icatu', 'MA', 210510);
INSERT INTO public.municipio
VALUES (538, 2105153, 'Igarapé do Meio', 'MA', 210515);
INSERT INTO public.municipio
VALUES (539, 2105203, 'Igarapé Grande', 'MA', 210520);
INSERT INTO public.municipio
VALUES (540, 2105302, 'Imperatriz', 'MA', 210530);
INSERT INTO public.municipio
VALUES (541, 2105351, 'Itaipava do Grajaú', 'MA', 210535);
INSERT INTO public.municipio
VALUES (542, 2105401, 'Itapecuru Mirim', 'MA', 210540);
INSERT INTO public.municipio
VALUES (543, 2105427, 'Itinga do Maranhão', 'MA', 210542);
INSERT INTO public.municipio
VALUES (544, 2105450, 'Jatobá', 'MA', 210545);
INSERT INTO public.municipio
VALUES (545, 2105476, 'Jenipapo dos Vieiras', 'MA', 210547);
INSERT INTO public.municipio
VALUES (546, 2105500, 'João Lisboa', 'MA', 210550);
INSERT INTO public.municipio
VALUES (547, 2105609, 'Joselândia', 'MA', 210560);
INSERT INTO public.municipio
VALUES (548, 2105658, 'Junco do Maranhão', 'MA', 210565);
INSERT INTO public.municipio
VALUES (549, 2105708, 'Lago da Pedra', 'MA', 210570);
INSERT INTO public.municipio
VALUES (550, 2105807, 'Lago do Junco', 'MA', 210580);
INSERT INTO public.municipio
VALUES (551, 2105906, 'Lago Verde', 'MA', 210590);
INSERT INTO public.municipio
VALUES (552, 2105922, 'Lagoa do Mato', 'MA', 210592);
INSERT INTO public.municipio
VALUES (553, 2105948, 'Lago dos Rodrigues', 'MA', 210594);
INSERT INTO public.municipio
VALUES (554, 2105963, 'Lagoa Grande do Maranhão', 'MA', 210596);
INSERT INTO public.municipio
VALUES (555, 2105989, 'Lajeado Novo', 'MA', 210598);
INSERT INTO public.municipio
VALUES (556, 2106003, 'Lima Campos', 'MA', 210600);
INSERT INTO public.municipio
VALUES (557, 2106102, 'Loreto', 'MA', 210610);
INSERT INTO public.municipio
VALUES (558, 2106201, 'Luís Domingues', 'MA', 210620);
INSERT INTO public.municipio
VALUES (559, 2106300, 'Magalhães de Almeida', 'MA', 210630);
INSERT INTO public.municipio
VALUES (560, 2106326, 'Maracaçumé', 'MA', 210632);
INSERT INTO public.municipio
VALUES (561, 2106359, 'Marajá do Sena', 'MA', 210635);
INSERT INTO public.municipio
VALUES (562, 2106375, 'Maranhãozinho', 'MA', 210637);
INSERT INTO public.municipio
VALUES (563, 2106409, 'Mata Roma', 'MA', 210640);
INSERT INTO public.municipio
VALUES (564, 2106508, 'Matinha', 'MA', 210650);
INSERT INTO public.municipio
VALUES (565, 2106607, 'Matões', 'MA', 210660);
INSERT INTO public.municipio
VALUES (566, 2106631, 'Matões do Norte', 'MA', 210663);
INSERT INTO public.municipio
VALUES (567, 2106672, 'Milagres do Maranhão', 'MA', 210667);
INSERT INTO public.municipio
VALUES (568, 2106706, 'Mirador', 'MA', 210670);
INSERT INTO public.municipio
VALUES (569, 2106755, 'Miranda do Norte', 'MA', 210675);
INSERT INTO public.municipio
VALUES (570, 2106805, 'Mirinzal', 'MA', 210680);
INSERT INTO public.municipio
VALUES (571, 2106904, 'Monção', 'MA', 210690);
INSERT INTO public.municipio
VALUES (572, 2107001, 'Montes Altos', 'MA', 210700);
INSERT INTO public.municipio
VALUES (573, 2107100, 'Morros', 'MA', 210710);
INSERT INTO public.municipio
VALUES (574, 2107209, 'Nina Rodrigues', 'MA', 210720);
INSERT INTO public.municipio
VALUES (575, 2107258, 'Nova Colinas', 'MA', 210725);
INSERT INTO public.municipio
VALUES (576, 2107308, 'Nova Iorque', 'MA', 210730);
INSERT INTO public.municipio
VALUES (577, 2107357, 'Nova Olinda do Maranhão', 'MA', 210735);
INSERT INTO public.municipio
VALUES (578, 2107407, 'Olho D''Água das Cunhãs', 'MA', 210740);
INSERT INTO public.municipio
VALUES (579, 2107456, 'Olinda Nova do Maranhão', 'MA', 210745);
INSERT INTO public.municipio
VALUES (580, 2107506, 'Paço do Lumiar', 'MA', 210750);
INSERT INTO public.municipio
VALUES (581, 2107605, 'Palmeirândia', 'MA', 210760);
INSERT INTO public.municipio
VALUES (582, 2107704, 'Paraibano', 'MA', 210770);
INSERT INTO public.municipio
VALUES (583, 2107803, 'Parnarama', 'MA', 210780);
INSERT INTO public.municipio
VALUES (584, 2107902, 'Passagem Franca', 'MA', 210790);
INSERT INTO public.municipio
VALUES (585, 2108009, 'Pastos Bons', 'MA', 210800);
INSERT INTO public.municipio
VALUES (586, 2108058, 'Paulino Neves', 'MA', 210805);
INSERT INTO public.municipio
VALUES (587, 2108108, 'Paulo Ramos', 'MA', 210810);
INSERT INTO public.municipio
VALUES (588, 2108207, 'Pedreiras', 'MA', 210820);
INSERT INTO public.municipio
VALUES (589, 2108256, 'Pedro do Rosário', 'MA', 210825);
INSERT INTO public.municipio
VALUES (590, 2108306, 'Penalva', 'MA', 210830);
INSERT INTO public.municipio
VALUES (591, 2108405, 'Peri Mirim', 'MA', 210840);
INSERT INTO public.municipio
VALUES (592, 2108454, 'Peritoró', 'MA', 210845);
INSERT INTO public.municipio
VALUES (593, 2108504, 'Pindaré-Mirim', 'MA', 210850);
INSERT INTO public.municipio
VALUES (594, 2108603, 'Pinheiro', 'MA', 210860);
INSERT INTO public.municipio
VALUES (595, 2108702, 'Pio XII', 'MA', 210870);
INSERT INTO public.municipio
VALUES (596, 2108801, 'Pirapemas', 'MA', 210880);
INSERT INTO public.municipio
VALUES (597, 2108900, 'Poção de Pedras', 'MA', 210890);
INSERT INTO public.municipio
VALUES (598, 2109007, 'Porto Franco', 'MA', 210900);
INSERT INTO public.municipio
VALUES (599, 2109056, 'Porto Rico do Maranhão', 'MA', 210905);
INSERT INTO public.municipio
VALUES (600, 2109106, 'Presidente Dutra', 'MA', 210910);
INSERT INTO public.municipio
VALUES (601, 2109205, 'Presidente Juscelino', 'MA', 210920);
INSERT INTO public.municipio
VALUES (602, 2109239, 'Presidente Médici', 'MA', 210923);
INSERT INTO public.municipio
VALUES (603, 2109270, 'Presidente Sarney', 'MA', 210927);
INSERT INTO public.municipio
VALUES (604, 2109304, 'Presidente Vargas', 'MA', 210930);
INSERT INTO public.municipio
VALUES (605, 2109403, 'Primeira Cruz', 'MA', 210940);
INSERT INTO public.municipio
VALUES (606, 2109452, 'Raposa', 'MA', 210945);
INSERT INTO public.municipio
VALUES (607, 2109502, 'Riachão', 'MA', 210950);
INSERT INTO public.municipio
VALUES (608, 2109551, 'Ribamar Fiquene', 'MA', 210955);
INSERT INTO public.municipio
VALUES (609, 2109601, 'Rosário', 'MA', 210960);
INSERT INTO public.municipio
VALUES (610, 2109700, 'Sambaíba', 'MA', 210970);
INSERT INTO public.municipio
VALUES (611, 2109759, 'Santa Filomena do Maranhão', 'MA', 210975);
INSERT INTO public.municipio
VALUES (612, 2109809, 'Santa Helena', 'MA', 210980);
INSERT INTO public.municipio
VALUES (613, 2109908, 'Santa Inês', 'MA', 210990);
INSERT INTO public.municipio
VALUES (614, 2110005, 'Santa Luzia', 'MA', 211000);
INSERT INTO public.municipio
VALUES (615, 2110039, 'Santa Luzia do Paruá', 'MA', 211003);
INSERT INTO public.municipio
VALUES (616, 2110104, 'Santa Quitéria do Maranhão', 'MA', 211010);
INSERT INTO public.municipio
VALUES (617, 2110203, 'Santa Rita', 'MA', 211020);
INSERT INTO public.municipio
VALUES (618, 2110237, 'Santana do Maranhão', 'MA', 211023);
INSERT INTO public.municipio
VALUES (619, 2110278, 'Santo Amaro do Maranhão', 'MA', 211027);
INSERT INTO public.municipio
VALUES (620, 2110302, 'Santo Antônio dos Lopes', 'MA', 211030);
INSERT INTO public.municipio
VALUES (621, 2110401, 'São Benedito do Rio Preto', 'MA', 211040);
INSERT INTO public.municipio
VALUES (622, 2110500, 'São Bento', 'MA', 211050);
INSERT INTO public.municipio
VALUES (623, 2110609, 'São Bernardo', 'MA', 211060);
INSERT INTO public.municipio
VALUES (624, 2110658, 'São Domingos do Azeitão', 'MA', 211065);
INSERT INTO public.municipio
VALUES (625, 2110708, 'São Domingos do Maranhão', 'MA', 211070);
INSERT INTO public.municipio
VALUES (626, 2110807, 'São Félix de Balsas', 'MA', 211080);
INSERT INTO public.municipio
VALUES (627, 2110856, 'São Francisco do Brejão', 'MA', 211085);
INSERT INTO public.municipio
VALUES (628, 2110906, 'São Francisco do Maranhão', 'MA', 211090);
INSERT INTO public.municipio
VALUES (629, 2111003, 'São João Batista', 'MA', 211100);
INSERT INTO public.municipio
VALUES (630, 2111029, 'São João do Carú', 'MA', 211102);
INSERT INTO public.municipio
VALUES (631, 2111052, 'São João do Paraíso', 'MA', 211105);
INSERT INTO public.municipio
VALUES (632, 2111078, 'São João do Soter', 'MA', 211107);
INSERT INTO public.municipio
VALUES (633, 2111102, 'São João dos Patos', 'MA', 211110);
INSERT INTO public.municipio
VALUES (634, 2111201, 'São José de Ribamar', 'MA', 211120);
INSERT INTO public.municipio
VALUES (635, 2111250, 'São José dos Basílios', 'MA', 211125);
INSERT INTO public.municipio
VALUES (636, 2111300, 'São Luís', 'MA', 211130);
INSERT INTO public.municipio
VALUES (637, 2111409, 'São Luís Gonzaga do Maranhão', 'MA', 211140);
INSERT INTO public.municipio
VALUES (638, 2111508, 'São Mateus do Maranhão', 'MA', 211150);
INSERT INTO public.municipio
VALUES (639, 2111532, 'São Pedro da Água Branca', 'MA', 211153);
INSERT INTO public.municipio
VALUES (640, 2111573, 'São Pedro dos Crentes', 'MA', 211157);
INSERT INTO public.municipio
VALUES (641, 2111607, 'São Raimundo das Mangabeiras', 'MA', 211160);
INSERT INTO public.municipio
VALUES (642, 2111631, 'São Raimundo do Doca Bezerra', 'MA', 211163);
INSERT INTO public.municipio
VALUES (643, 2111672, 'São Roberto', 'MA', 211167);
INSERT INTO public.municipio
VALUES (644, 2111706, 'São Vicente Ferrer', 'MA', 211170);
INSERT INTO public.municipio
VALUES (645, 2111722, 'Satubinha', 'MA', 211172);
INSERT INTO public.municipio
VALUES (646, 2111748, 'Senador Alexandre Costa', 'MA', 211174);
INSERT INTO public.municipio
VALUES (647, 2111763, 'Senador La Rocque', 'MA', 211176);
INSERT INTO public.municipio
VALUES (648, 2111789, 'Serrano do Maranhão', 'MA', 211178);
INSERT INTO public.municipio
VALUES (649, 2111805, 'Sítio Novo', 'MA', 211180);
INSERT INTO public.municipio
VALUES (650, 2111904, 'Sucupira do Norte', 'MA', 211190);
INSERT INTO public.municipio
VALUES (651, 2111953, 'Sucupira do Riachão', 'MA', 211195);
INSERT INTO public.municipio
VALUES (652, 2112001, 'Tasso Fragoso', 'MA', 211200);
INSERT INTO public.municipio
VALUES (653, 2112100, 'Timbiras', 'MA', 211210);
INSERT INTO public.municipio
VALUES (654, 2112209, 'Timon', 'MA', 211220);
INSERT INTO public.municipio
VALUES (655, 2112233, 'Trizidela do Vale', 'MA', 211223);
INSERT INTO public.municipio
VALUES (656, 2112274, 'Tufilândia', 'MA', 211227);
INSERT INTO public.municipio
VALUES (657, 2112308, 'Tuntum', 'MA', 211230);
INSERT INTO public.municipio
VALUES (658, 2112407, 'Turiaçu', 'MA', 211240);
INSERT INTO public.municipio
VALUES (659, 2112456, 'Turilândia', 'MA', 211245);
INSERT INTO public.municipio
VALUES (660, 2112506, 'Tutóia', 'MA', 211250);
INSERT INTO public.municipio
VALUES (661, 2112605, 'Urbano Santos', 'MA', 211260);
INSERT INTO public.municipio
VALUES (662, 2112704, 'Vargem Grande', 'MA', 211270);
INSERT INTO public.municipio
VALUES (663, 2112803, 'Viana', 'MA', 211280);
INSERT INTO public.municipio
VALUES (664, 2112852, 'Vila Nova dos Martírios', 'MA', 211285);
INSERT INTO public.municipio
VALUES (665, 2112902, 'Vitória do Mearim', 'MA', 211290);
INSERT INTO public.municipio
VALUES (666, 2113009, 'Vitorino Freire', 'MA', 211300);
INSERT INTO public.municipio
VALUES (667, 2114007, 'Zé Doca', 'MA', 211400);
INSERT INTO public.municipio
VALUES (668, 2200053, 'Acauã', 'PI', 220005);
INSERT INTO public.municipio
VALUES (669, 2200103, 'Agricolândia', 'PI', 220010);
INSERT INTO public.municipio
VALUES (670, 2200202, 'Água Branca', 'PI', 220020);
INSERT INTO public.municipio
VALUES (671, 2200251, 'Alagoinha do Piauí', 'PI', 220025);
INSERT INTO public.municipio
VALUES (672, 2200277, 'Alegrete do Piauí', 'PI', 220027);
INSERT INTO public.municipio
VALUES (673, 2200301, 'Alto Longá', 'PI', 220030);
INSERT INTO public.municipio
VALUES (674, 2200400, 'Altos', 'PI', 220040);
INSERT INTO public.municipio
VALUES (675, 2200459, 'Alvorada do Gurguéia', 'PI', 220045);
INSERT INTO public.municipio
VALUES (676, 2200509, 'Amarante', 'PI', 220050);
INSERT INTO public.municipio
VALUES (677, 2200608, 'Angical do Piauí', 'PI', 220060);
INSERT INTO public.municipio
VALUES (678, 2200707, 'Anísio de Abreu', 'PI', 220070);
INSERT INTO public.municipio
VALUES (679, 2200806, 'Antônio Almeida', 'PI', 220080);
INSERT INTO public.municipio
VALUES (680, 2200905, 'Aroazes', 'PI', 220090);
INSERT INTO public.municipio
VALUES (681, 2200954, 'Aroeiras do Itaim', 'PI', 220095);
INSERT INTO public.municipio
VALUES (682, 2201002, 'Arraial', 'PI', 220100);
INSERT INTO public.municipio
VALUES (683, 2201051, 'Assunção do Piauí', 'PI', 220105);
INSERT INTO public.municipio
VALUES (684, 2201101, 'Avelino Lopes', 'PI', 220110);
INSERT INTO public.municipio
VALUES (685, 2201150, 'Baixa Grande do Ribeiro', 'PI', 220115);
INSERT INTO public.municipio
VALUES (686, 2201176, 'Barra D''Alcântara', 'PI', 220117);
INSERT INTO public.municipio
VALUES (687, 2201200, 'Barras', 'PI', 220120);
INSERT INTO public.municipio
VALUES (688, 2201309, 'Barreiras do Piauí', 'PI', 220130);
INSERT INTO public.municipio
VALUES (689, 2201408, 'Barro Duro', 'PI', 220140);
INSERT INTO public.municipio
VALUES (690, 2201507, 'Batalha', 'PI', 220150);
INSERT INTO public.municipio
VALUES (691, 2201556, 'Bela Vista do Piauí', 'PI', 220155);
INSERT INTO public.municipio
VALUES (692, 2201572, 'Belém do Piauí', 'PI', 220157);
INSERT INTO public.municipio
VALUES (693, 2201606, 'Beneditinos', 'PI', 220160);
INSERT INTO public.municipio
VALUES (694, 2201705, 'Bertolínia', 'PI', 220170);
INSERT INTO public.municipio
VALUES (695, 2201739, 'Betânia do Piauí', 'PI', 220173);
INSERT INTO public.municipio
VALUES (696, 2201770, 'Boa Hora', 'PI', 220177);
INSERT INTO public.municipio
VALUES (697, 2201804, 'Bocaina', 'PI', 220180);
INSERT INTO public.municipio
VALUES (698, 2201903, 'Bom Jesus', 'PI', 220190);
INSERT INTO public.municipio
VALUES (699, 2201919, 'Bom Princípio do Piauí', 'PI', 220191);
INSERT INTO public.municipio
VALUES (700, 2201929, 'Bonfim do Piauí', 'PI', 220192);
INSERT INTO public.municipio
VALUES (701, 2201945, 'Boqueirão do Piauí', 'PI', 220194);
INSERT INTO public.municipio
VALUES (702, 2201960, 'Brasileira', 'PI', 220196);
INSERT INTO public.municipio
VALUES (703, 2201988, 'Brejo do Piauí', 'PI', 220198);
INSERT INTO public.municipio
VALUES (704, 2202000, 'Buriti dos Lopes', 'PI', 220200);
INSERT INTO public.municipio
VALUES (705, 2202026, 'Buriti dos Montes', 'PI', 220202);
INSERT INTO public.municipio
VALUES (706, 2202059, 'Cabeceiras do Piauí', 'PI', 220205);
INSERT INTO public.municipio
VALUES (707, 2202075, 'Cajazeiras do Piauí', 'PI', 220207);
INSERT INTO public.municipio
VALUES (708, 2202083, 'Cajueiro da Praia', 'PI', 220208);
INSERT INTO public.municipio
VALUES (709, 2202091, 'Caldeirão Grande do Piauí', 'PI', 220209);
INSERT INTO public.municipio
VALUES (710, 2202109, 'Campinas do Piauí', 'PI', 220210);
INSERT INTO public.municipio
VALUES (711, 2202117, 'Campo Alegre do Fidalgo', 'PI', 220211);
INSERT INTO public.municipio
VALUES (712, 2202133, 'Campo Grande do Piauí', 'PI', 220213);
INSERT INTO public.municipio
VALUES (713, 2202174, 'Campo Largo do Piauí', 'PI', 220217);
INSERT INTO public.municipio
VALUES (714, 2202208, 'Campo Maior', 'PI', 220220);
INSERT INTO public.municipio
VALUES (715, 2202251, 'Canavieira', 'PI', 220225);
INSERT INTO public.municipio
VALUES (716, 2202307, 'Canto do Buriti', 'PI', 220230);
INSERT INTO public.municipio
VALUES (717, 2202406, 'Capitão de Campos', 'PI', 220240);
INSERT INTO public.municipio
VALUES (718, 2202455, 'Capitão Gervásio Oliveira', 'PI', 220245);
INSERT INTO public.municipio
VALUES (719, 2202505, 'Caracol', 'PI', 220250);
INSERT INTO public.municipio
VALUES (720, 2202539, 'Caraúbas do Piauí', 'PI', 220253);
INSERT INTO public.municipio
VALUES (721, 2202554, 'Caridade do Piauí', 'PI', 220255);
INSERT INTO public.municipio
VALUES (722, 2202604, 'Castelo do Piauí', 'PI', 220260);
INSERT INTO public.municipio
VALUES (723, 2202653, 'Caxingó', 'PI', 220265);
INSERT INTO public.municipio
VALUES (724, 2202703, 'Cocal', 'PI', 220270);
INSERT INTO public.municipio
VALUES (725, 2202711, 'Cocal de Telha', 'PI', 220271);
INSERT INTO public.municipio
VALUES (726, 2202729, 'Cocal dos Alves', 'PI', 220272);
INSERT INTO public.municipio
VALUES (727, 2202737, 'Coivaras', 'PI', 220273);
INSERT INTO public.municipio
VALUES (728, 2202752, 'Colônia do Gurguéia', 'PI', 220275);
INSERT INTO public.municipio
VALUES (729, 2202778, 'Colônia do Piauí', 'PI', 220277);
INSERT INTO public.municipio
VALUES (730, 2202802, 'Conceição do Canindé', 'PI', 220280);
INSERT INTO public.municipio
VALUES (731, 2202851, 'Coronel José Dias', 'PI', 220285);
INSERT INTO public.municipio
VALUES (732, 2202901, 'Corrente', 'PI', 220290);
INSERT INTO public.municipio
VALUES (733, 2203008, 'Cristalândia do Piauí', 'PI', 220300);
INSERT INTO public.municipio
VALUES (734, 2203107, 'Cristino Castro', 'PI', 220310);
INSERT INTO public.municipio
VALUES (735, 2203206, 'Curimatá', 'PI', 220320);
INSERT INTO public.municipio
VALUES (736, 2203230, 'Currais', 'PI', 220323);
INSERT INTO public.municipio
VALUES (737, 2203255, 'Curralinhos', 'PI', 220325);
INSERT INTO public.municipio
VALUES (738, 2203271, 'Curral Novo do Piauí', 'PI', 220327);
INSERT INTO public.municipio
VALUES (739, 2203305, 'Demerval Lobão', 'PI', 220330);
INSERT INTO public.municipio
VALUES (740, 2203354, 'Dirceu Arcoverde', 'PI', 220335);
INSERT INTO public.municipio
VALUES (741, 2203404, 'Dom Expedito Lopes', 'PI', 220340);
INSERT INTO public.municipio
VALUES (742, 2203420, 'Domingos Mourão', 'PI', 220342);
INSERT INTO public.municipio
VALUES (743, 2203453, 'Dom Inocêncio', 'PI', 220345);
INSERT INTO public.municipio
VALUES (744, 2203503, 'Elesbão Veloso', 'PI', 220350);
INSERT INTO public.municipio
VALUES (745, 2203602, 'Eliseu Martins', 'PI', 220360);
INSERT INTO public.municipio
VALUES (746, 2203701, 'Esperantina', 'PI', 220370);
INSERT INTO public.municipio
VALUES (747, 2203750, 'Fartura do Piauí', 'PI', 220375);
INSERT INTO public.municipio
VALUES (748, 2203800, 'Flores do Piauí', 'PI', 220380);
INSERT INTO public.municipio
VALUES (749, 2203859, 'Floresta do Piauí', 'PI', 220385);
INSERT INTO public.municipio
VALUES (750, 2203909, 'Floriano', 'PI', 220390);
INSERT INTO public.municipio
VALUES (751, 2204006, 'Francinópolis', 'PI', 220400);
INSERT INTO public.municipio
VALUES (752, 2204105, 'Francisco Ayres', 'PI', 220410);
INSERT INTO public.municipio
VALUES (753, 2204154, 'Francisco Macedo', 'PI', 220415);
INSERT INTO public.municipio
VALUES (754, 2204204, 'Francisco Santos', 'PI', 220420);
INSERT INTO public.municipio
VALUES (755, 2204303, 'Fronteiras', 'PI', 220430);
INSERT INTO public.municipio
VALUES (756, 2204352, 'Geminiano', 'PI', 220435);
INSERT INTO public.municipio
VALUES (757, 2204402, 'Gilbués', 'PI', 220440);
INSERT INTO public.municipio
VALUES (758, 2204501, 'Guadalupe', 'PI', 220450);
INSERT INTO public.municipio
VALUES (759, 2204550, 'Guaribas', 'PI', 220455);
INSERT INTO public.municipio
VALUES (760, 2204600, 'Hugo Napoleão', 'PI', 220460);
INSERT INTO public.municipio
VALUES (761, 2204659, 'Ilha Grande', 'PI', 220465);
INSERT INTO public.municipio
VALUES (762, 2204709, 'Inhuma', 'PI', 220470);
INSERT INTO public.municipio
VALUES (763, 2204808, 'Ipiranga do Piauí', 'PI', 220480);
INSERT INTO public.municipio
VALUES (764, 2204907, 'Isaías Coelho', 'PI', 220490);
INSERT INTO public.municipio
VALUES (765, 2205003, 'Itainópolis', 'PI', 220500);
INSERT INTO public.municipio
VALUES (766, 2205102, 'Itaueira', 'PI', 220510);
INSERT INTO public.municipio
VALUES (767, 2205151, 'Jacobina do Piauí', 'PI', 220515);
INSERT INTO public.municipio
VALUES (768, 2205201, 'Jaicós', 'PI', 220520);
INSERT INTO public.municipio
VALUES (769, 2205250, 'Jardim do Mulato', 'PI', 220525);
INSERT INTO public.municipio
VALUES (770, 2205276, 'Jatobá do Piauí', 'PI', 220527);
INSERT INTO public.municipio
VALUES (771, 2205300, 'Jerumenha', 'PI', 220530);
INSERT INTO public.municipio
VALUES (772, 2205359, 'João Costa', 'PI', 220535);
INSERT INTO public.municipio
VALUES (773, 2205409, 'Joaquim Pires', 'PI', 220540);
INSERT INTO public.municipio
VALUES (774, 2205458, 'Joca Marques', 'PI', 220545);
INSERT INTO public.municipio
VALUES (775, 2205508, 'José de Freitas', 'PI', 220550);
INSERT INTO public.municipio
VALUES (776, 2205516, 'Juazeiro do Piauí', 'PI', 220551);
INSERT INTO public.municipio
VALUES (777, 2205524, 'Júlio Borges', 'PI', 220552);
INSERT INTO public.municipio
VALUES (778, 2205532, 'Jurema', 'PI', 220553);
INSERT INTO public.municipio
VALUES (779, 2205540, 'Lagoinha do Piauí', 'PI', 220554);
INSERT INTO public.municipio
VALUES (780, 2205557, 'Lagoa Alegre', 'PI', 220555);
INSERT INTO public.municipio
VALUES (781, 2205565, 'Lagoa do Barro do Piauí', 'PI', 220556);
INSERT INTO public.municipio
VALUES (782, 2205573, 'Lagoa de São Francisco', 'PI', 220557);
INSERT INTO public.municipio
VALUES (783, 2205581, 'Lagoa do Piauí', 'PI', 220558);
INSERT INTO public.municipio
VALUES (784, 2205599, 'Lagoa do Sítio', 'PI', 220559);
INSERT INTO public.municipio
VALUES (785, 2205607, 'Landri Sales', 'PI', 220560);
INSERT INTO public.municipio
VALUES (786, 2205706, 'Luís Correia', 'PI', 220570);
INSERT INTO public.municipio
VALUES (787, 2205805, 'Luzilândia', 'PI', 220580);
INSERT INTO public.municipio
VALUES (788, 2205854, 'Madeiro', 'PI', 220585);
INSERT INTO public.municipio
VALUES (789, 2205904, 'Manoel Emídio', 'PI', 220590);
INSERT INTO public.municipio
VALUES (790, 2205953, 'Marcolândia', 'PI', 220595);
INSERT INTO public.municipio
VALUES (791, 2206001, 'Marcos Parente', 'PI', 220600);
INSERT INTO public.municipio
VALUES (792, 2206050, 'Massapê do Piauí', 'PI', 220605);
INSERT INTO public.municipio
VALUES (793, 2206100, 'Matias Olímpio', 'PI', 220610);
INSERT INTO public.municipio
VALUES (794, 2206209, 'Miguel Alves', 'PI', 220620);
INSERT INTO public.municipio
VALUES (795, 2206308, 'Miguel Leão', 'PI', 220630);
INSERT INTO public.municipio
VALUES (796, 2206357, 'Milton Brandão', 'PI', 220635);
INSERT INTO public.municipio
VALUES (797, 2206407, 'Monsenhor Gil', 'PI', 220640);
INSERT INTO public.municipio
VALUES (798, 2206506, 'Monsenhor Hipólito', 'PI', 220650);
INSERT INTO public.municipio
VALUES (799, 2206605, 'Monte Alegre do Piauí', 'PI', 220660);
INSERT INTO public.municipio
VALUES (800, 2206654, 'Morro Cabeça no Tempo', 'PI', 220665);
INSERT INTO public.municipio
VALUES (801, 2206670, 'Morro do Chapéu do Piauí', 'PI', 220667);
INSERT INTO public.municipio
VALUES (802, 2206696, 'Murici dos Portelas', 'PI', 220669);
INSERT INTO public.municipio
VALUES (803, 2206704, 'Nazaré do Piauí', 'PI', 220670);
INSERT INTO public.municipio
VALUES (804, 2206720, 'Nazária', 'PI', 220672);
INSERT INTO public.municipio
VALUES (805, 2206753, 'Nossa Senhora de Nazaré', 'PI', 220675);
INSERT INTO public.municipio
VALUES (806, 2206803, 'Nossa Senhora dos Remédios', 'PI', 220680);
INSERT INTO public.municipio
VALUES (807, 2206902, 'Novo Oriente do Piauí', 'PI', 220690);
INSERT INTO public.municipio
VALUES (808, 2206951, 'Novo Santo Antônio', 'PI', 220695);
INSERT INTO public.municipio
VALUES (809, 2207009, 'Oeiras', 'PI', 220700);
INSERT INTO public.municipio
VALUES (810, 2207108, 'Olho D''Água do Piauí', 'PI', 220710);
INSERT INTO public.municipio
VALUES (811, 2207207, 'Padre Marcos', 'PI', 220720);
INSERT INTO public.municipio
VALUES (812, 2207306, 'Paes Landim', 'PI', 220730);
INSERT INTO public.municipio
VALUES (813, 2207355, 'Pajeú do Piauí', 'PI', 220735);
INSERT INTO public.municipio
VALUES (814, 2207405, 'Palmeira do Piauí', 'PI', 220740);
INSERT INTO public.municipio
VALUES (815, 2207504, 'Palmeirais', 'PI', 220750);
INSERT INTO public.municipio
VALUES (816, 2207553, 'Paquetá', 'PI', 220755);
INSERT INTO public.municipio
VALUES (817, 2207603, 'Parnaguá', 'PI', 220760);
INSERT INTO public.municipio
VALUES (818, 2207702, 'Parnaíba', 'PI', 220770);
INSERT INTO public.municipio
VALUES (819, 2207751, 'Passagem Franca do Piauí', 'PI', 220775);
INSERT INTO public.municipio
VALUES (820, 2207777, 'Patos do Piauí', 'PI', 220777);
INSERT INTO public.municipio
VALUES (821, 2207793, 'Pau D''Arco do Piauí', 'PI', 220779);
INSERT INTO public.municipio
VALUES (822, 2207801, 'Paulistana', 'PI', 220780);
INSERT INTO public.municipio
VALUES (823, 2207850, 'Pavussu', 'PI', 220785);
INSERT INTO public.municipio
VALUES (824, 2207900, 'Pedro II', 'PI', 220790);
INSERT INTO public.municipio
VALUES (825, 2207934, 'Pedro Laurentino', 'PI', 220793);
INSERT INTO public.municipio
VALUES (826, 2207959, 'Nova Santa Rita', 'PI', 220795);
INSERT INTO public.municipio
VALUES (827, 2208007, 'Picos', 'PI', 220800);
INSERT INTO public.municipio
VALUES (828, 2208106, 'Pimenteiras', 'PI', 220810);
INSERT INTO public.municipio
VALUES (829, 2208205, 'Pio IX', 'PI', 220820);
INSERT INTO public.municipio
VALUES (830, 2208304, 'Piracuruca', 'PI', 220830);
INSERT INTO public.municipio
VALUES (831, 2208403, 'Piripiri', 'PI', 220840);
INSERT INTO public.municipio
VALUES (832, 2208502, 'Porto', 'PI', 220850);
INSERT INTO public.municipio
VALUES (833, 2208551, 'Porto Alegre do Piauí', 'PI', 220855);
INSERT INTO public.municipio
VALUES (834, 2208601, 'Prata do Piauí', 'PI', 220860);
INSERT INTO public.municipio
VALUES (835, 2208650, 'Queimada Nova', 'PI', 220865);
INSERT INTO public.municipio
VALUES (836, 2208700, 'Redenção do Gurguéia', 'PI', 220870);
INSERT INTO public.municipio
VALUES (837, 2208809, 'Regeneração', 'PI', 220880);
INSERT INTO public.municipio
VALUES (838, 2208858, 'Riacho Frio', 'PI', 220885);
INSERT INTO public.municipio
VALUES (839, 2208874, 'Ribeira do Piauí', 'PI', 220887);
INSERT INTO public.municipio
VALUES (840, 2208908, 'Ribeiro Gonçalves', 'PI', 220890);
INSERT INTO public.municipio
VALUES (841, 2209005, 'Rio Grande do Piauí', 'PI', 220900);
INSERT INTO public.municipio
VALUES (842, 2209104, 'Santa Cruz do Piauí', 'PI', 220910);
INSERT INTO public.municipio
VALUES (843, 2209153, 'Santa Cruz dos Milagres', 'PI', 220915);
INSERT INTO public.municipio
VALUES (844, 2209203, 'Santa Filomena', 'PI', 220920);
INSERT INTO public.municipio
VALUES (845, 2209302, 'Santa Luz', 'PI', 220930);
INSERT INTO public.municipio
VALUES (846, 2209351, 'Santana do Piauí', 'PI', 220935);
INSERT INTO public.municipio
VALUES (847, 2209377, 'Santa Rosa do Piauí', 'PI', 220937);
INSERT INTO public.municipio
VALUES (848, 2209401, 'Santo Antônio de Lisboa', 'PI', 220940);
INSERT INTO public.municipio
VALUES (849, 2209450, 'Santo Antônio dos Milagres', 'PI', 220945);
INSERT INTO public.municipio
VALUES (850, 2209500, 'Santo Inácio do Piauí', 'PI', 220950);
INSERT INTO public.municipio
VALUES (851, 2209559, 'São Braz do Piauí', 'PI', 220955);
INSERT INTO public.municipio
VALUES (852, 2209609, 'São Félix do Piauí', 'PI', 220960);
INSERT INTO public.municipio
VALUES (853, 2209658, 'São Francisco de Assis do Piauí', 'PI', 220965);
INSERT INTO public.municipio
VALUES (854, 2209708, 'São Francisco do Piauí', 'PI', 220970);
INSERT INTO public.municipio
VALUES (855, 2209757, 'São Gonçalo do Gurguéia', 'PI', 220975);
INSERT INTO public.municipio
VALUES (856, 2209807, 'São Gonçalo do Piauí', 'PI', 220980);
INSERT INTO public.municipio
VALUES (857, 2209856, 'São João da Canabrava', 'PI', 220985);
INSERT INTO public.municipio
VALUES (858, 2209872, 'São João da Fronteira', 'PI', 220987);
INSERT INTO public.municipio
VALUES (859, 2209906, 'São João da Serra', 'PI', 220990);
INSERT INTO public.municipio
VALUES (860, 2209955, 'São João da Varjota', 'PI', 220995);
INSERT INTO public.municipio
VALUES (861, 2209971, 'São João do Arraial', 'PI', 220997);
INSERT INTO public.municipio
VALUES (862, 2210003, 'São João do Piauí', 'PI', 221000);
INSERT INTO public.municipio
VALUES (863, 2210052, 'São José do Divino', 'PI', 221005);
INSERT INTO public.municipio
VALUES (864, 2210102, 'São José do Peixe', 'PI', 221010);
INSERT INTO public.municipio
VALUES (865, 2210201, 'São José do Piauí', 'PI', 221020);
INSERT INTO public.municipio
VALUES (866, 2210300, 'São Julião', 'PI', 221030);
INSERT INTO public.municipio
VALUES (867, 2210359, 'São Lourenço do Piauí', 'PI', 221035);
INSERT INTO public.municipio
VALUES (868, 2210375, 'São Luis do Piauí', 'PI', 221037);
INSERT INTO public.municipio
VALUES (869, 2210383, 'São Miguel da Baixa Grande', 'PI', 221038);
INSERT INTO public.municipio
VALUES (870, 2210391, 'São Miguel do Fidalgo', 'PI', 221039);
INSERT INTO public.municipio
VALUES (871, 2210409, 'São Miguel do Tapuio', 'PI', 221040);
INSERT INTO public.municipio
VALUES (872, 2210508, 'São Pedro do Piauí', 'PI', 221050);
INSERT INTO public.municipio
VALUES (873, 2210607, 'São Raimundo Nonato', 'PI', 221060);
INSERT INTO public.municipio
VALUES (874, 2210623, 'Sebastião Barros', 'PI', 221062);
INSERT INTO public.municipio
VALUES (875, 2210631, 'Sebastião Leal', 'PI', 221063);
INSERT INTO public.municipio
VALUES (876, 2210656, 'Sigefredo Pacheco', 'PI', 221065);
INSERT INTO public.municipio
VALUES (877, 2210706, 'Simões', 'PI', 221070);
INSERT INTO public.municipio
VALUES (878, 2210805, 'Simplício Mendes', 'PI', 221080);
INSERT INTO public.municipio
VALUES (879, 2210904, 'Socorro do Piauí', 'PI', 221090);
INSERT INTO public.municipio
VALUES (880, 2210938, 'Sussuapara', 'PI', 221093);
INSERT INTO public.municipio
VALUES (881, 2210953, 'Tamboril do Piauí', 'PI', 221095);
INSERT INTO public.municipio
VALUES (882, 2210979, 'Tanque do Piauí', 'PI', 221097);
INSERT INTO public.municipio
VALUES (883, 2211001, 'Teresina', 'PI', 221100);
INSERT INTO public.municipio
VALUES (884, 2211100, 'União', 'PI', 221110);
INSERT INTO public.municipio
VALUES (885, 2211209, 'Uruçuí', 'PI', 221120);
INSERT INTO public.municipio
VALUES (886, 2211308, 'Valença do Piauí', 'PI', 221130);
INSERT INTO public.municipio
VALUES (887, 2211357, 'Várzea Branca', 'PI', 221135);
INSERT INTO public.municipio
VALUES (888, 2211407, 'Várzea Grande', 'PI', 221140);
INSERT INTO public.municipio
VALUES (889, 2211506, 'Vera Mendes', 'PI', 221150);
INSERT INTO public.municipio
VALUES (890, 2211605, 'Vila Nova do Piauí', 'PI', 221160);
INSERT INTO public.municipio
VALUES (891, 2211704, 'Wall Ferraz', 'PI', 221170);
INSERT INTO public.municipio
VALUES (892, 2300101, 'Abaiara', 'CE', 230010);
INSERT INTO public.municipio
VALUES (893, 2300150, 'Acarape', 'CE', 230015);
INSERT INTO public.municipio
VALUES (894, 2300200, 'Acaraú', 'CE', 230020);
INSERT INTO public.municipio
VALUES (895, 2300309, 'Acopiara', 'CE', 230030);
INSERT INTO public.municipio
VALUES (896, 2300408, 'Aiuaba', 'CE', 230040);
INSERT INTO public.municipio
VALUES (897, 2300507, 'Alcântaras', 'CE', 230050);
INSERT INTO public.municipio
VALUES (898, 2300606, 'Altaneira', 'CE', 230060);
INSERT INTO public.municipio
VALUES (899, 2300705, 'Alto Santo', 'CE', 230070);
INSERT INTO public.municipio
VALUES (900, 2300754, 'Amontada', 'CE', 230075);
INSERT INTO public.municipio
VALUES (901, 2300804, 'Antonina do Norte', 'CE', 230080);
INSERT INTO public.municipio
VALUES (902, 2300903, 'Apuiarés', 'CE', 230090);
INSERT INTO public.municipio
VALUES (903, 2301000, 'Aquiraz', 'CE', 230100);
INSERT INTO public.municipio
VALUES (904, 2301109, 'Aracati', 'CE', 230110);
INSERT INTO public.municipio
VALUES (905, 2301208, 'Aracoiaba', 'CE', 230120);
INSERT INTO public.municipio
VALUES (906, 2301257, 'Ararendá', 'CE', 230125);
INSERT INTO public.municipio
VALUES (907, 2301307, 'Araripe', 'CE', 230130);
INSERT INTO public.municipio
VALUES (908, 2301406, 'Aratuba', 'CE', 230140);
INSERT INTO public.municipio
VALUES (909, 2301505, 'Arneiroz', 'CE', 230150);
INSERT INTO public.municipio
VALUES (910, 2301604, 'Assaré', 'CE', 230160);
INSERT INTO public.municipio
VALUES (911, 2301703, 'Aurora', 'CE', 230170);
INSERT INTO public.municipio
VALUES (912, 2301802, 'Baixio', 'CE', 230180);
INSERT INTO public.municipio
VALUES (913, 2301851, 'Banabuiú', 'CE', 230185);
INSERT INTO public.municipio
VALUES (914, 2301901, 'Barbalha', 'CE', 230190);
INSERT INTO public.municipio
VALUES (915, 2301950, 'Barreira', 'CE', 230195);
INSERT INTO public.municipio
VALUES (916, 2302008, 'Barro', 'CE', 230200);
INSERT INTO public.municipio
VALUES (917, 2302057, 'Barroquinha', 'CE', 230205);
INSERT INTO public.municipio
VALUES (918, 2302107, 'Baturité', 'CE', 230210);
INSERT INTO public.municipio
VALUES (919, 2302206, 'Beberibe', 'CE', 230220);
INSERT INTO public.municipio
VALUES (920, 2302305, 'Bela Cruz', 'CE', 230230);
INSERT INTO public.municipio
VALUES (921, 2302404, 'Boa Viagem', 'CE', 230240);
INSERT INTO public.municipio
VALUES (922, 2302503, 'Brejo Santo', 'CE', 230250);
INSERT INTO public.municipio
VALUES (923, 2302602, 'Camocim', 'CE', 230260);
INSERT INTO public.municipio
VALUES (924, 2302701, 'Campos Sales', 'CE', 230270);
INSERT INTO public.municipio
VALUES (925, 2302800, 'Canindé', 'CE', 230280);
INSERT INTO public.municipio
VALUES (926, 2302909, 'Capistrano', 'CE', 230290);
INSERT INTO public.municipio
VALUES (927, 2303006, 'Caridade', 'CE', 230300);
INSERT INTO public.municipio
VALUES (928, 2303105, 'Cariré', 'CE', 230310);
INSERT INTO public.municipio
VALUES (929, 2303204, 'Caririaçu', 'CE', 230320);
INSERT INTO public.municipio
VALUES (930, 2303303, 'Cariús', 'CE', 230330);
INSERT INTO public.municipio
VALUES (931, 2303402, 'Carnaubal', 'CE', 230340);
INSERT INTO public.municipio
VALUES (932, 2303501, 'Cascavel', 'CE', 230350);
INSERT INTO public.municipio
VALUES (933, 2303600, 'Catarina', 'CE', 230360);
INSERT INTO public.municipio
VALUES (934, 2303659, 'Catunda', 'CE', 230365);
INSERT INTO public.municipio
VALUES (935, 2303709, 'Caucaia', 'CE', 230370);
INSERT INTO public.municipio
VALUES (936, 2303808, 'Cedro', 'CE', 230380);
INSERT INTO public.municipio
VALUES (937, 2303907, 'Chaval', 'CE', 230390);
INSERT INTO public.municipio
VALUES (938, 2303931, 'Choró', 'CE', 230393);
INSERT INTO public.municipio
VALUES (939, 2303956, 'Chorozinho', 'CE', 230395);
INSERT INTO public.municipio
VALUES (940, 2304004, 'Coreaú', 'CE', 230400);
INSERT INTO public.municipio
VALUES (941, 2304103, 'Crateús', 'CE', 230410);
INSERT INTO public.municipio
VALUES (942, 2304202, 'Crato', 'CE', 230420);
INSERT INTO public.municipio
VALUES (943, 2304236, 'Croatá', 'CE', 230423);
INSERT INTO public.municipio
VALUES (944, 2304251, 'Cruz', 'CE', 230425);
INSERT INTO public.municipio
VALUES (945, 2304269, 'Deputado Irapuan Pinheiro', 'CE', 230426);
INSERT INTO public.municipio
VALUES (946, 2304277, 'Ererê', 'CE', 230427);
INSERT INTO public.municipio
VALUES (947, 2304285, 'Eusébio', 'CE', 230428);
INSERT INTO public.municipio
VALUES (948, 2304301, 'Farias Brito', 'CE', 230430);
INSERT INTO public.municipio
VALUES (949, 2304350, 'Forquilha', 'CE', 230435);
INSERT INTO public.municipio
VALUES (950, 2304400, 'Fortaleza', 'CE', 230440);
INSERT INTO public.municipio
VALUES (951, 2304459, 'Fortim', 'CE', 230445);
INSERT INTO public.municipio
VALUES (952, 2304509, 'Frecheirinha', 'CE', 230450);
INSERT INTO public.municipio
VALUES (953, 2304608, 'General Sampaio', 'CE', 230460);
INSERT INTO public.municipio
VALUES (954, 2304657, 'Graça', 'CE', 230465);
INSERT INTO public.municipio
VALUES (955, 2304707, 'Granja', 'CE', 230470);
INSERT INTO public.municipio
VALUES (956, 2304806, 'Granjeiro', 'CE', 230480);
INSERT INTO public.municipio
VALUES (957, 2304905, 'Groaíras', 'CE', 230490);
INSERT INTO public.municipio
VALUES (958, 2304954, 'Guaiúba', 'CE', 230495);
INSERT INTO public.municipio
VALUES (959, 2305001, 'Guaraciaba do Norte', 'CE', 230500);
INSERT INTO public.municipio
VALUES (960, 2305100, 'Guaramiranga', 'CE', 230510);
INSERT INTO public.municipio
VALUES (961, 2305209, 'Hidrolândia', 'CE', 230520);
INSERT INTO public.municipio
VALUES (962, 2305233, 'Horizonte', 'CE', 230523);
INSERT INTO public.municipio
VALUES (963, 2305266, 'Ibaretama', 'CE', 230526);
INSERT INTO public.municipio
VALUES (964, 2305308, 'Ibiapina', 'CE', 230530);
INSERT INTO public.municipio
VALUES (965, 2305332, 'Ibicuitinga', 'CE', 230533);
INSERT INTO public.municipio
VALUES (966, 2305357, 'Icapuí', 'CE', 230535);
INSERT INTO public.municipio
VALUES (967, 2305407, 'Icó', 'CE', 230540);
INSERT INTO public.municipio
VALUES (968, 2305506, 'Iguatu', 'CE', 230550);
INSERT INTO public.municipio
VALUES (969, 2305605, 'Independência', 'CE', 230560);
INSERT INTO public.municipio
VALUES (970, 2305654, 'Ipaporanga', 'CE', 230565);
INSERT INTO public.municipio
VALUES (971, 2305704, 'Ipaumirim', 'CE', 230570);
INSERT INTO public.municipio
VALUES (972, 2305803, 'Ipu', 'CE', 230580);
INSERT INTO public.municipio
VALUES (973, 2305902, 'Ipueiras', 'CE', 230590);
INSERT INTO public.municipio
VALUES (974, 2306009, 'Iracema', 'CE', 230600);
INSERT INTO public.municipio
VALUES (975, 2306108, 'Irauçuba', 'CE', 230610);
INSERT INTO public.municipio
VALUES (976, 2306207, 'Itaiçaba', 'CE', 230620);
INSERT INTO public.municipio
VALUES (977, 2306256, 'Itaitinga', 'CE', 230625);
INSERT INTO public.municipio
VALUES (978, 2306306, 'Itapagé', 'CE', 230630);
INSERT INTO public.municipio
VALUES (979, 2306405, 'Itapipoca', 'CE', 230640);
INSERT INTO public.municipio
VALUES (980, 2306504, 'Itapiúna', 'CE', 230650);
INSERT INTO public.municipio
VALUES (981, 2306553, 'Itarema', 'CE', 230655);
INSERT INTO public.municipio
VALUES (982, 2306603, 'Itatira', 'CE', 230660);
INSERT INTO public.municipio
VALUES (983, 2306702, 'Jaguaretama', 'CE', 230670);
INSERT INTO public.municipio
VALUES (984, 2306801, 'Jaguaribara', 'CE', 230680);
INSERT INTO public.municipio
VALUES (985, 2306900, 'Jaguaribe', 'CE', 230690);
INSERT INTO public.municipio
VALUES (986, 2307007, 'Jaguaruana', 'CE', 230700);
INSERT INTO public.municipio
VALUES (987, 2307106, 'Jardim', 'CE', 230710);
INSERT INTO public.municipio
VALUES (988, 2307205, 'Jati', 'CE', 230720);
INSERT INTO public.municipio
VALUES (989, 2307254, 'Jijoca de Jericoacoara', 'CE', 230725);
INSERT INTO public.municipio
VALUES (990, 2307304, 'Juazeiro do Norte', 'CE', 230730);
INSERT INTO public.municipio
VALUES (991, 2307403, 'Jucás', 'CE', 230740);
INSERT INTO public.municipio
VALUES (992, 2307502, 'Lavras da Mangabeira', 'CE', 230750);
INSERT INTO public.municipio
VALUES (993, 2307601, 'Limoeiro do Norte', 'CE', 230760);
INSERT INTO public.municipio
VALUES (994, 2307635, 'Madalena', 'CE', 230763);
INSERT INTO public.municipio
VALUES (995, 2307650, 'Maracanaú', 'CE', 230765);
INSERT INTO public.municipio
VALUES (996, 2307700, 'Maranguape', 'CE', 230770);
INSERT INTO public.municipio
VALUES (997, 2307809, 'Marco', 'CE', 230780);
INSERT INTO public.municipio
VALUES (998, 2307908, 'Martinópole', 'CE', 230790);
INSERT INTO public.municipio
VALUES (999, 2308005, 'Massapê', 'CE', 230800);
INSERT INTO public.municipio
VALUES (1000, 2308104, 'Mauriti', 'CE', 230810);
INSERT INTO public.municipio
VALUES (1001, 2308203, 'Meruoca', 'CE', 230820);
INSERT INTO public.municipio
VALUES (1002, 2308302, 'Milagres', 'CE', 230830);
INSERT INTO public.municipio
VALUES (1003, 2308351, 'Milhã', 'CE', 230835);
INSERT INTO public.municipio
VALUES (1004, 2308377, 'Miraíma', 'CE', 230837);
INSERT INTO public.municipio
VALUES (1005, 2308401, 'Missão Velha', 'CE', 230840);
INSERT INTO public.municipio
VALUES (1006, 2308500, 'Mombaça', 'CE', 230850);
INSERT INTO public.municipio
VALUES (1007, 2308609, 'Monsenhor Tabosa', 'CE', 230860);
INSERT INTO public.municipio
VALUES (1008, 2308708, 'Morada Nova', 'CE', 230870);
INSERT INTO public.municipio
VALUES (1009, 2308807, 'Moraújo', 'CE', 230880);
INSERT INTO public.municipio
VALUES (1010, 2308906, 'Morrinhos', 'CE', 230890);
INSERT INTO public.municipio
VALUES (1011, 2309003, 'Mucambo', 'CE', 230900);
INSERT INTO public.municipio
VALUES (1012, 2309102, 'Mulungu', 'CE', 230910);
INSERT INTO public.municipio
VALUES (1013, 2309201, 'Nova Olinda', 'CE', 230920);
INSERT INTO public.municipio
VALUES (1014, 2309300, 'Nova Russas', 'CE', 230930);
INSERT INTO public.municipio
VALUES (1015, 2309409, 'Novo Oriente', 'CE', 230940);
INSERT INTO public.municipio
VALUES (1016, 2309458, 'Ocara', 'CE', 230945);
INSERT INTO public.municipio
VALUES (1017, 2309508, 'Orós', 'CE', 230950);
INSERT INTO public.municipio
VALUES (1018, 2309607, 'Pacajus', 'CE', 230960);
INSERT INTO public.municipio
VALUES (1019, 2309706, 'Pacatuba', 'CE', 230970);
INSERT INTO public.municipio
VALUES (1020, 2309805, 'Pacoti', 'CE', 230980);
INSERT INTO public.municipio
VALUES (1021, 2309904, 'Pacujá', 'CE', 230990);
INSERT INTO public.municipio
VALUES (1022, 2310001, 'Palhano', 'CE', 231000);
INSERT INTO public.municipio
VALUES (1023, 2310100, 'Palmácia', 'CE', 231010);
INSERT INTO public.municipio
VALUES (1024, 2310209, 'Paracuru', 'CE', 231020);
INSERT INTO public.municipio
VALUES (1025, 2310258, 'Paraipaba', 'CE', 231025);
INSERT INTO public.municipio
VALUES (1026, 2310308, 'Parambu', 'CE', 231030);
INSERT INTO public.municipio
VALUES (1027, 2310407, 'Paramoti', 'CE', 231040);
INSERT INTO public.municipio
VALUES (1028, 2310506, 'Pedra Branca', 'CE', 231050);
INSERT INTO public.municipio
VALUES (1029, 2310605, 'Penaforte', 'CE', 231060);
INSERT INTO public.municipio
VALUES (1030, 2310704, 'Pentecoste', 'CE', 231070);
INSERT INTO public.municipio
VALUES (1031, 2310803, 'Pereiro', 'CE', 231080);
INSERT INTO public.municipio
VALUES (1032, 2310852, 'Pindoretama', 'CE', 231085);
INSERT INTO public.municipio
VALUES (1033, 2310902, 'Piquet Carneiro', 'CE', 231090);
INSERT INTO public.municipio
VALUES (1034, 2310951, 'Pires Ferreira', 'CE', 231095);
INSERT INTO public.municipio
VALUES (1035, 2311009, 'Poranga', 'CE', 231100);
INSERT INTO public.municipio
VALUES (1036, 2311108, 'Porteiras', 'CE', 231110);
INSERT INTO public.municipio
VALUES (1037, 2311207, 'Potengi', 'CE', 231120);
INSERT INTO public.municipio
VALUES (1038, 2311231, 'Potiretama', 'CE', 231123);
INSERT INTO public.municipio
VALUES (1039, 2311264, 'Quiterianópolis', 'CE', 231126);
INSERT INTO public.municipio
VALUES (1040, 2311306, 'Quixadá', 'CE', 231130);
INSERT INTO public.municipio
VALUES (1041, 2311355, 'Quixelô', 'CE', 231135);
INSERT INTO public.municipio
VALUES (1042, 2311405, 'Quixeramobim', 'CE', 231140);
INSERT INTO public.municipio
VALUES (1043, 2311504, 'Quixeré', 'CE', 231150);
INSERT INTO public.municipio
VALUES (1044, 2311603, 'Redenção', 'CE', 231160);
INSERT INTO public.municipio
VALUES (1045, 2311702, 'Reriutaba', 'CE', 231170);
INSERT INTO public.municipio
VALUES (1046, 2311801, 'Russas', 'CE', 231180);
INSERT INTO public.municipio
VALUES (1047, 2311900, 'Saboeiro', 'CE', 231190);
INSERT INTO public.municipio
VALUES (1048, 2311959, 'Salitre', 'CE', 231195);
INSERT INTO public.municipio
VALUES (1049, 2312007, 'Santana do Acaraú', 'CE', 231200);
INSERT INTO public.municipio
VALUES (1050, 2312106, 'Santana do Cariri', 'CE', 231210);
INSERT INTO public.municipio
VALUES (1051, 2312205, 'Santa Quitéria', 'CE', 231220);
INSERT INTO public.municipio
VALUES (1052, 2312304, 'São Benedito', 'CE', 231230);
INSERT INTO public.municipio
VALUES (1053, 2312403, 'São Gonçalo do Amarante', 'CE', 231240);
INSERT INTO public.municipio
VALUES (1054, 2312502, 'São João do Jaguaribe', 'CE', 231250);
INSERT INTO public.municipio
VALUES (1055, 2312601, 'São Luís do Curu', 'CE', 231260);
INSERT INTO public.municipio
VALUES (1056, 2312700, 'Senador Pompeu', 'CE', 231270);
INSERT INTO public.municipio
VALUES (1057, 2312809, 'Senador Sá', 'CE', 231280);
INSERT INTO public.municipio
VALUES (1058, 2312908, 'Sobral', 'CE', 231290);
INSERT INTO public.municipio
VALUES (1059, 2313005, 'Solonópole', 'CE', 231300);
INSERT INTO public.municipio
VALUES (1060, 2313104, 'Tabuleiro do Norte', 'CE', 231310);
INSERT INTO public.municipio
VALUES (1061, 2313203, 'Tamboril', 'CE', 231320);
INSERT INTO public.municipio
VALUES (1062, 2313252, 'Tarrafas', 'CE', 231325);
INSERT INTO public.municipio
VALUES (1063, 2313302, 'Tauá', 'CE', 231330);
INSERT INTO public.municipio
VALUES (1064, 2313351, 'Tejuçuoca', 'CE', 231335);
INSERT INTO public.municipio
VALUES (1065, 2313401, 'Tianguá', 'CE', 231340);
INSERT INTO public.municipio
VALUES (1066, 2313500, 'Trairi', 'CE', 231350);
INSERT INTO public.municipio
VALUES (1067, 2313559, 'Tururu', 'CE', 231355);
INSERT INTO public.municipio
VALUES (1068, 2313609, 'Ubajara', 'CE', 231360);
INSERT INTO public.municipio
VALUES (1069, 2313708, 'Umari', 'CE', 231370);
INSERT INTO public.municipio
VALUES (1070, 2313757, 'Umirim', 'CE', 231375);
INSERT INTO public.municipio
VALUES (1071, 2313807, 'Uruburetama', 'CE', 231380);
INSERT INTO public.municipio
VALUES (1072, 2313906, 'Uruoca', 'CE', 231390);
INSERT INTO public.municipio
VALUES (1073, 2313955, 'Varjota', 'CE', 231395);
INSERT INTO public.municipio
VALUES (1074, 2314003, 'Várzea Alegre', 'CE', 231400);
INSERT INTO public.municipio
VALUES (1075, 2314102, 'Viçosa do Ceará', 'CE', 231410);
INSERT INTO public.municipio
VALUES (1076, 2400109, 'Acari', 'RN', 240010);
INSERT INTO public.municipio
VALUES (1077, 2400208, 'Açu', 'RN', 240020);
INSERT INTO public.municipio
VALUES (1078, 2400307, 'Afonso Bezerra', 'RN', 240030);
INSERT INTO public.municipio
VALUES (1079, 2400406, 'Água Nova', 'RN', 240040);
INSERT INTO public.municipio
VALUES (1080, 2400505, 'Alexandria', 'RN', 240050);
INSERT INTO public.municipio
VALUES (1081, 2400604, 'Almino Afonso', 'RN', 240060);
INSERT INTO public.municipio
VALUES (1082, 2400703, 'Alto do Rodrigues', 'RN', 240070);
INSERT INTO public.municipio
VALUES (1083, 2400802, 'Angicos', 'RN', 240080);
INSERT INTO public.municipio
VALUES (1084, 2400901, 'Antônio Martins', 'RN', 240090);
INSERT INTO public.municipio
VALUES (1085, 2401008, 'Apodi', 'RN', 240100);
INSERT INTO public.municipio
VALUES (1086, 2401107, 'Areia Branca', 'RN', 240110);
INSERT INTO public.municipio
VALUES (1087, 2401206, 'Arês', 'RN', 240120);
INSERT INTO public.municipio
VALUES (1088, 2401305, 'Augusto Severo', 'RN', 240130);
INSERT INTO public.municipio
VALUES (1089, 2401404, 'Baía Formosa', 'RN', 240140);
INSERT INTO public.municipio
VALUES (1090, 2401453, 'Baraúna', 'RN', 240145);
INSERT INTO public.municipio
VALUES (1091, 2401503, 'Barcelona', 'RN', 240150);
INSERT INTO public.municipio
VALUES (1092, 2401602, 'Bento Fernandes', 'RN', 240160);
INSERT INTO public.municipio
VALUES (1093, 2401651, 'Bodó', 'RN', 240165);
INSERT INTO public.municipio
VALUES (1094, 2401701, 'Bom Jesus', 'RN', 240170);
INSERT INTO public.municipio
VALUES (1095, 2401800, 'Brejinho', 'RN', 240180);
INSERT INTO public.municipio
VALUES (1096, 2401859, 'Caiçara do Norte', 'RN', 240185);
INSERT INTO public.municipio
VALUES (1097, 2401909, 'Caiçara do Rio do Vento', 'RN', 240190);
INSERT INTO public.municipio
VALUES (1098, 2402006, 'Caicó', 'RN', 240200);
INSERT INTO public.municipio
VALUES (1099, 2402105, 'Campo Redondo', 'RN', 240210);
INSERT INTO public.municipio
VALUES (1100, 2402204, 'Canguaretama', 'RN', 240220);
INSERT INTO public.municipio
VALUES (1101, 2402303, 'Caraúbas', 'RN', 240230);
INSERT INTO public.municipio
VALUES (1102, 2402402, 'Carnaúba dos Dantas', 'RN', 240240);
INSERT INTO public.municipio
VALUES (1103, 2402501, 'Carnaubais', 'RN', 240250);
INSERT INTO public.municipio
VALUES (1104, 2402600, 'Ceará-Mirim', 'RN', 240260);
INSERT INTO public.municipio
VALUES (1105, 2402709, 'Cerro Corá', 'RN', 240270);
INSERT INTO public.municipio
VALUES (1106, 2402808, 'Coronel Ezequiel', 'RN', 240280);
INSERT INTO public.municipio
VALUES (1107, 2402907, 'Coronel João Pessoa', 'RN', 240290);
INSERT INTO public.municipio
VALUES (1108, 2403004, 'Cruzeta', 'RN', 240300);
INSERT INTO public.municipio
VALUES (1109, 2403103, 'Currais Novos', 'RN', 240310);
INSERT INTO public.municipio
VALUES (1110, 2403202, 'Doutor Severiano', 'RN', 240320);
INSERT INTO public.municipio
VALUES (1111, 2403251, 'Parnamirim', 'RN', 240325);
INSERT INTO public.municipio
VALUES (1112, 2403301, 'Encanto', 'RN', 240330);
INSERT INTO public.municipio
VALUES (1113, 2403400, 'Equador', 'RN', 240340);
INSERT INTO public.municipio
VALUES (1114, 2403509, 'Espírito Santo', 'RN', 240350);
INSERT INTO public.municipio
VALUES (1115, 2403608, 'Extremoz', 'RN', 240360);
INSERT INTO public.municipio
VALUES (1116, 2403707, 'Felipe Guerra', 'RN', 240370);
INSERT INTO public.municipio
VALUES (1117, 2403756, 'Fernando Pedroza', 'RN', 240375);
INSERT INTO public.municipio
VALUES (1118, 2403806, 'Florânia', 'RN', 240380);
INSERT INTO public.municipio
VALUES (1119, 2403905, 'Francisco Dantas', 'RN', 240390);
INSERT INTO public.municipio
VALUES (1120, 2404002, 'Frutuoso Gomes', 'RN', 240400);
INSERT INTO public.municipio
VALUES (1121, 2404101, 'Galinhos', 'RN', 240410);
INSERT INTO public.municipio
VALUES (1122, 2404200, 'Goianinha', 'RN', 240420);
INSERT INTO public.municipio
VALUES (1123, 2404309, 'Governador Dix-Sept Rosado', 'RN', 240430);
INSERT INTO public.municipio
VALUES (1124, 2404408, 'Grossos', 'RN', 240440);
INSERT INTO public.municipio
VALUES (1125, 2404507, 'Guamaré', 'RN', 240450);
INSERT INTO public.municipio
VALUES (1126, 2404606, 'Ielmo Marinho', 'RN', 240460);
INSERT INTO public.municipio
VALUES (1127, 2404705, 'Ipanguaçu', 'RN', 240470);
INSERT INTO public.municipio
VALUES (1128, 2404804, 'Ipueira', 'RN', 240480);
INSERT INTO public.municipio
VALUES (1129, 2404853, 'Itajá', 'RN', 240485);
INSERT INTO public.municipio
VALUES (1130, 2404903, 'Itaú', 'RN', 240490);
INSERT INTO public.municipio
VALUES (1131, 2405009, 'Jaçanã', 'RN', 240500);
INSERT INTO public.municipio
VALUES (1132, 2405108, 'Jandaíra', 'RN', 240510);
INSERT INTO public.municipio
VALUES (1133, 2405207, 'Janduís', 'RN', 240520);
INSERT INTO public.municipio
VALUES (1134, 2405306, 'Januário Cicco', 'RN', 240530);
INSERT INTO public.municipio
VALUES (1135, 2405405, 'Japi', 'RN', 240540);
INSERT INTO public.municipio
VALUES (1136, 2405504, 'Jardim de Angicos', 'RN', 240550);
INSERT INTO public.municipio
VALUES (1137, 2405603, 'Jardim de Piranhas', 'RN', 240560);
INSERT INTO public.municipio
VALUES (1138, 2405702, 'Jardim do Seridó', 'RN', 240570);
INSERT INTO public.municipio
VALUES (1139, 2405801, 'João Câmara', 'RN', 240580);
INSERT INTO public.municipio
VALUES (1140, 2405900, 'João Dias', 'RN', 240590);
INSERT INTO public.municipio
VALUES (1141, 2406007, 'José da Penha', 'RN', 240600);
INSERT INTO public.municipio
VALUES (1142, 2406106, 'Jucurutu', 'RN', 240610);
INSERT INTO public.municipio
VALUES (1143, 2406155, 'Jundiá', 'RN', 240615);
INSERT INTO public.municipio
VALUES (1144, 2406205, 'Lagoa D''Anta', 'RN', 240620);
INSERT INTO public.municipio
VALUES (1145, 2406304, 'Lagoa de Pedras', 'RN', 240630);
INSERT INTO public.municipio
VALUES (1146, 2406403, 'Lagoa de Velhos', 'RN', 240640);
INSERT INTO public.municipio
VALUES (1147, 2406502, 'Lagoa Nova', 'RN', 240650);
INSERT INTO public.municipio
VALUES (1148, 2406601, 'Lagoa Salgada', 'RN', 240660);
INSERT INTO public.municipio
VALUES (1149, 2406700, 'Lajes', 'RN', 240670);
INSERT INTO public.municipio
VALUES (1150, 2406809, 'Lajes Pintadas', 'RN', 240680);
INSERT INTO public.municipio
VALUES (1151, 2406908, 'Lucrécia', 'RN', 240690);
INSERT INTO public.municipio
VALUES (1152, 2407005, 'Luís Gomes', 'RN', 240700);
INSERT INTO public.municipio
VALUES (1153, 2407104, 'Macaíba', 'RN', 240710);
INSERT INTO public.municipio
VALUES (1154, 2407203, 'Macau', 'RN', 240720);
INSERT INTO public.municipio
VALUES (1155, 2407252, 'Major Sales', 'RN', 240725);
INSERT INTO public.municipio
VALUES (1156, 2407302, 'Marcelino Vieira', 'RN', 240730);
INSERT INTO public.municipio
VALUES (1157, 2407401, 'Martins', 'RN', 240740);
INSERT INTO public.municipio
VALUES (1158, 2407500, 'Maxaranguape', 'RN', 240750);
INSERT INTO public.municipio
VALUES (1159, 2407609, 'Messias Targino', 'RN', 240760);
INSERT INTO public.municipio
VALUES (1160, 2407708, 'Montanhas', 'RN', 240770);
INSERT INTO public.municipio
VALUES (1161, 2407807, 'Monte Alegre', 'RN', 240780);
INSERT INTO public.municipio
VALUES (1162, 2407906, 'Monte das Gameleiras', 'RN', 240790);
INSERT INTO public.municipio
VALUES (1163, 2408003, 'Mossoró', 'RN', 240800);
INSERT INTO public.municipio
VALUES (1164, 2408102, 'Natal', 'RN', 240810);
INSERT INTO public.municipio
VALUES (1165, 2408201, 'Nísia Floresta', 'RN', 240820);
INSERT INTO public.municipio
VALUES (1166, 2408300, 'Nova Cruz', 'RN', 240830);
INSERT INTO public.municipio
VALUES (1167, 2408409, 'Olho-D''Água do Borges', 'RN', 240840);
INSERT INTO public.municipio
VALUES (1168, 2408508, 'Ouro Branco', 'RN', 240850);
INSERT INTO public.municipio
VALUES (1169, 2408607, 'Paraná', 'RN', 240860);
INSERT INTO public.municipio
VALUES (1170, 2408706, 'Paraú', 'RN', 240870);
INSERT INTO public.municipio
VALUES (1171, 2408805, 'Parazinho', 'RN', 240880);
INSERT INTO public.municipio
VALUES (1172, 2408904, 'Parelhas', 'RN', 240890);
INSERT INTO public.municipio
VALUES (1173, 2408953, 'Rio do Fogo', 'RN', 240895);
INSERT INTO public.municipio
VALUES (1174, 2409100, 'Passa e Fica', 'RN', 240910);
INSERT INTO public.municipio
VALUES (1175, 2409209, 'Passagem', 'RN', 240920);
INSERT INTO public.municipio
VALUES (1176, 2409308, 'Patu', 'RN', 240930);
INSERT INTO public.municipio
VALUES (1177, 2409332, 'Santa Maria', 'RN', 240933);
INSERT INTO public.municipio
VALUES (1178, 2409407, 'Pau dos Ferros', 'RN', 240940);
INSERT INTO public.municipio
VALUES (1179, 2409506, 'Pedra Grande', 'RN', 240950);
INSERT INTO public.municipio
VALUES (1180, 2409605, 'Pedra Preta', 'RN', 240960);
INSERT INTO public.municipio
VALUES (1181, 2409704, 'Pedro Avelino', 'RN', 240970);
INSERT INTO public.municipio
VALUES (1182, 2409803, 'Pedro Velho', 'RN', 240980);
INSERT INTO public.municipio
VALUES (1183, 2409902, 'Pendências', 'RN', 240990);
INSERT INTO public.municipio
VALUES (1184, 2410009, 'Pilões', 'RN', 241000);
INSERT INTO public.municipio
VALUES (1185, 2410108, 'Poço Branco', 'RN', 241010);
INSERT INTO public.municipio
VALUES (1186, 2410207, 'Portalegre', 'RN', 241020);
INSERT INTO public.municipio
VALUES (1187, 2410256, 'Porto do Mangue', 'RN', 241025);
INSERT INTO public.municipio
VALUES (1188, 2410306, 'Presidente Juscelino', 'RN', 241030);
INSERT INTO public.municipio
VALUES (1189, 2410405, 'Pureza', 'RN', 241040);
INSERT INTO public.municipio
VALUES (1190, 2410504, 'Rafael Fernandes', 'RN', 241050);
INSERT INTO public.municipio
VALUES (1191, 2410603, 'Rafael Godeiro', 'RN', 241060);
INSERT INTO public.municipio
VALUES (1192, 2410702, 'Riacho da Cruz', 'RN', 241070);
INSERT INTO public.municipio
VALUES (1193, 2410801, 'Riacho de Santana', 'RN', 241080);
INSERT INTO public.municipio
VALUES (1194, 2410900, 'Riachuelo', 'RN', 241090);
INSERT INTO public.municipio
VALUES (1195, 2411007, 'Rodolfo Fernandes', 'RN', 241100);
INSERT INTO public.municipio
VALUES (1196, 2411056, 'Tibau', 'RN', 241105);
INSERT INTO public.municipio
VALUES (1197, 2411106, 'Ruy Barbosa', 'RN', 241110);
INSERT INTO public.municipio
VALUES (1198, 2411205, 'Santa Cruz', 'RN', 241120);
INSERT INTO public.municipio
VALUES (1199, 2411403, 'Santana do Matos', 'RN', 241140);
INSERT INTO public.municipio
VALUES (1200, 2411429, 'Santana do Seridó', 'RN', 241142);
INSERT INTO public.municipio
VALUES (1201, 2411502, 'Santo Antônio', 'RN', 241150);
INSERT INTO public.municipio
VALUES (1202, 2411601, 'São Bento do Norte', 'RN', 241160);
INSERT INTO public.municipio
VALUES (1203, 2411700, 'São Bento do Trairí', 'RN', 241170);
INSERT INTO public.municipio
VALUES (1204, 2411809, 'São Fernando', 'RN', 241180);
INSERT INTO public.municipio
VALUES (1205, 2411908, 'São Francisco do Oeste', 'RN', 241190);
INSERT INTO public.municipio
VALUES (1206, 2412005, 'São Gonçalo do Amarante', 'RN', 241200);
INSERT INTO public.municipio
VALUES (1207, 2412104, 'São João do Sabugi', 'RN', 241210);
INSERT INTO public.municipio
VALUES (1208, 2412203, 'São José de Mipibu', 'RN', 241220);
INSERT INTO public.municipio
VALUES (1209, 2412302, 'São José do Campestre', 'RN', 241230);
INSERT INTO public.municipio
VALUES (1210, 2412401, 'São José do Seridó', 'RN', 241240);
INSERT INTO public.municipio
VALUES (1211, 2412500, 'São Miguel', 'RN', 241250);
INSERT INTO public.municipio
VALUES (1212, 2412559, 'São Miguel do Gostoso', 'RN', 241255);
INSERT INTO public.municipio
VALUES (1213, 2412609, 'São Paulo do Potengi', 'RN', 241260);
INSERT INTO public.municipio
VALUES (1214, 2412708, 'São Pedro', 'RN', 241270);
INSERT INTO public.municipio
VALUES (1215, 2412807, 'São Rafael', 'RN', 241280);
INSERT INTO public.municipio
VALUES (1216, 2412906, 'São Tomé', 'RN', 241290);
INSERT INTO public.municipio
VALUES (1217, 2413003, 'São Vicente', 'RN', 241300);
INSERT INTO public.municipio
VALUES (1218, 2413102, 'Senador Elói de Souza', 'RN', 241310);
INSERT INTO public.municipio
VALUES (1219, 2413201, 'Senador Georgino Avelino', 'RN', 241320);
INSERT INTO public.municipio
VALUES (1220, 2413300, 'Serra de São Bento', 'RN', 241330);
INSERT INTO public.municipio
VALUES (1221, 2413359, 'Serra do Mel', 'RN', 241335);
INSERT INTO public.municipio
VALUES (1222, 2413409, 'Serra Negra do Norte', 'RN', 241340);
INSERT INTO public.municipio
VALUES (1223, 2413508, 'Serrinha', 'RN', 241350);
INSERT INTO public.municipio
VALUES (1224, 2413557, 'Serrinha dos Pintos', 'RN', 241355);
INSERT INTO public.municipio
VALUES (1225, 2413607, 'Severiano Melo', 'RN', 241360);
INSERT INTO public.municipio
VALUES (1226, 2413706, 'Sítio Novo', 'RN', 241370);
INSERT INTO public.municipio
VALUES (1227, 2413805, 'Taboleiro Grande', 'RN', 241380);
INSERT INTO public.municipio
VALUES (1228, 2413904, 'Taipu', 'RN', 241390);
INSERT INTO public.municipio
VALUES (1229, 2414001, 'Tangará', 'RN', 241400);
INSERT INTO public.municipio
VALUES (1230, 2414100, 'Tenente Ananias', 'RN', 241410);
INSERT INTO public.municipio
VALUES (1231, 2414159, 'Tenente Laurentino Cruz', 'RN', 241415);
INSERT INTO public.municipio
VALUES (1232, 2414209, 'Tibau do Sul', 'RN', 241420);
INSERT INTO public.municipio
VALUES (1233, 2414308, 'Timbaúba dos Batistas', 'RN', 241430);
INSERT INTO public.municipio
VALUES (1234, 2414407, 'Touros', 'RN', 241440);
INSERT INTO public.municipio
VALUES (1235, 2414456, 'Triunfo Potiguar', 'RN', 241445);
INSERT INTO public.municipio
VALUES (1236, 2414506, 'Umarizal', 'RN', 241450);
INSERT INTO public.municipio
VALUES (1237, 2414605, 'Upanema', 'RN', 241460);
INSERT INTO public.municipio
VALUES (1238, 2414704, 'Várzea', 'RN', 241470);
INSERT INTO public.municipio
VALUES (1239, 2414753, 'Venha-Ver', 'RN', 241475);
INSERT INTO public.municipio
VALUES (1240, 2414803, 'Vera Cruz', 'RN', 241480);
INSERT INTO public.municipio
VALUES (1241, 2414902, 'Viçosa', 'RN', 241490);
INSERT INTO public.municipio
VALUES (1242, 2415008, 'Vila Flor', 'RN', 241500);
INSERT INTO public.municipio
VALUES (1243, 2500106, 'Água Branca', 'PB', 250010);
INSERT INTO public.municipio
VALUES (1244, 2500205, 'Aguiar', 'PB', 250020);
INSERT INTO public.municipio
VALUES (1245, 2500304, 'Alagoa Grande', 'PB', 250030);
INSERT INTO public.municipio
VALUES (1246, 2500403, 'Alagoa Nova', 'PB', 250040);
INSERT INTO public.municipio
VALUES (1247, 2500502, 'Alagoinha', 'PB', 250050);
INSERT INTO public.municipio
VALUES (1248, 2500536, 'Alcantil', 'PB', 250053);
INSERT INTO public.municipio
VALUES (1249, 2500577, 'Algodão de Jandaíra', 'PB', 250057);
INSERT INTO public.municipio
VALUES (1250, 2500601, 'Alhandra', 'PB', 250060);
INSERT INTO public.municipio
VALUES (1251, 2500700, 'São João do Rio do Peixe', 'PB', 250070);
INSERT INTO public.municipio
VALUES (1252, 2500734, 'Amparo', 'PB', 250073);
INSERT INTO public.municipio
VALUES (1253, 2500775, 'Aparecida', 'PB', 250077);
INSERT INTO public.municipio
VALUES (1254, 2500809, 'Araçagi', 'PB', 250080);
INSERT INTO public.municipio
VALUES (1255, 2500908, 'Arara', 'PB', 250090);
INSERT INTO public.municipio
VALUES (1256, 2501005, 'Araruna', 'PB', 250100);
INSERT INTO public.municipio
VALUES (1257, 2501104, 'Areia', 'PB', 250110);
INSERT INTO public.municipio
VALUES (1258, 2501153, 'Areia de Baraúnas', 'PB', 250115);
INSERT INTO public.municipio
VALUES (1259, 2501203, 'Areial', 'PB', 250120);
INSERT INTO public.municipio
VALUES (1260, 2501302, 'Aroeiras', 'PB', 250130);
INSERT INTO public.municipio
VALUES (1261, 2501351, 'Assunção', 'PB', 250135);
INSERT INTO public.municipio
VALUES (1262, 2501401, 'Baía da Traição', 'PB', 250140);
INSERT INTO public.municipio
VALUES (1263, 2501500, 'Bananeiras', 'PB', 250150);
INSERT INTO public.municipio
VALUES (1264, 2501534, 'Baraúna', 'PB', 250153);
INSERT INTO public.municipio
VALUES (1265, 2501575, 'Barra de Santana', 'PB', 250157);
INSERT INTO public.municipio
VALUES (1266, 2501609, 'Barra de Santa Rosa', 'PB', 250160);
INSERT INTO public.municipio
VALUES (1267, 2501708, 'Barra de São Miguel', 'PB', 250170);
INSERT INTO public.municipio
VALUES (1268, 2501807, 'Bayeux', 'PB', 250180);
INSERT INTO public.municipio
VALUES (1269, 2501906, 'Belém', 'PB', 250190);
INSERT INTO public.municipio
VALUES (1270, 2502003, 'Belém do Brejo do Cruz', 'PB', 250200);
INSERT INTO public.municipio
VALUES (1271, 2502052, 'Bernardino Batista', 'PB', 250205);
INSERT INTO public.municipio
VALUES (1272, 2502102, 'Boa Ventura', 'PB', 250210);
INSERT INTO public.municipio
VALUES (1273, 2502151, 'Boa Vista', 'PB', 250215);
INSERT INTO public.municipio
VALUES (1274, 2502201, 'Bom Jesus', 'PB', 250220);
INSERT INTO public.municipio
VALUES (1275, 2502300, 'Bom Sucesso', 'PB', 250230);
INSERT INTO public.municipio
VALUES (1276, 2502409, 'Bonito de Santa Fé', 'PB', 250240);
INSERT INTO public.municipio
VALUES (1277, 2502508, 'Boqueirão', 'PB', 250250);
INSERT INTO public.municipio
VALUES (1278, 2502607, 'Igaracy', 'PB', 250260);
INSERT INTO public.municipio
VALUES (1279, 2502706, 'Borborema', 'PB', 250270);
INSERT INTO public.municipio
VALUES (1280, 2502805, 'Brejo do Cruz', 'PB', 250280);
INSERT INTO public.municipio
VALUES (1281, 2502904, 'Brejo dos Santos', 'PB', 250290);
INSERT INTO public.municipio
VALUES (1282, 2503001, 'Caaporã', 'PB', 250300);
INSERT INTO public.municipio
VALUES (1283, 2503100, 'Cabaceiras', 'PB', 250310);
INSERT INTO public.municipio
VALUES (1284, 2503209, 'Cabedelo', 'PB', 250320);
INSERT INTO public.municipio
VALUES (1285, 2503308, 'Cachoeira dos Índios', 'PB', 250330);
INSERT INTO public.municipio
VALUES (1286, 2503407, 'Cacimba de Areia', 'PB', 250340);
INSERT INTO public.municipio
VALUES (1287, 2503506, 'Cacimba de Dentro', 'PB', 250350);
INSERT INTO public.municipio
VALUES (1288, 2503555, 'Cacimbas', 'PB', 250355);
INSERT INTO public.municipio
VALUES (1289, 2503605, 'Caiçara', 'PB', 250360);
INSERT INTO public.municipio
VALUES (1290, 2503704, 'Cajazeiras', 'PB', 250370);
INSERT INTO public.municipio
VALUES (1291, 2503753, 'Cajazeirinhas', 'PB', 250375);
INSERT INTO public.municipio
VALUES (1292, 2503803, 'Caldas Brandão', 'PB', 250380);
INSERT INTO public.municipio
VALUES (1293, 2503902, 'Camalaú', 'PB', 250390);
INSERT INTO public.municipio
VALUES (1294, 2504009, 'Campina Grande', 'PB', 250400);
INSERT INTO public.municipio
VALUES (1295, 2504033, 'Capim', 'PB', 250403);
INSERT INTO public.municipio
VALUES (1296, 2504074, 'Caraúbas', 'PB', 250407);
INSERT INTO public.municipio
VALUES (1297, 2504108, 'Carrapateira', 'PB', 250410);
INSERT INTO public.municipio
VALUES (1298, 2504157, 'Casserengue', 'PB', 250415);
INSERT INTO public.municipio
VALUES (1299, 2504207, 'Catingueira', 'PB', 250420);
INSERT INTO public.municipio
VALUES (1300, 2504306, 'Catolé do Rocha', 'PB', 250430);
INSERT INTO public.municipio
VALUES (1301, 2504355, 'Caturité', 'PB', 250435);
INSERT INTO public.municipio
VALUES (1302, 2504405, 'Conceição', 'PB', 250440);
INSERT INTO public.municipio
VALUES (1303, 2504504, 'Condado', 'PB', 250450);
INSERT INTO public.municipio
VALUES (1304, 2504603, 'Conde', 'PB', 250460);
INSERT INTO public.municipio
VALUES (1305, 2504702, 'Congo', 'PB', 250470);
INSERT INTO public.municipio
VALUES (1306, 2504801, 'Coremas', 'PB', 250480);
INSERT INTO public.municipio
VALUES (1307, 2504850, 'Coxixola', 'PB', 250485);
INSERT INTO public.municipio
VALUES (1308, 2504900, 'Cruz do Espírito Santo', 'PB', 250490);
INSERT INTO public.municipio
VALUES (1309, 2505006, 'Cubati', 'PB', 250500);
INSERT INTO public.municipio
VALUES (1310, 2505105, 'Cuité', 'PB', 250510);
INSERT INTO public.municipio
VALUES (1311, 2505204, 'Cuitegi', 'PB', 250520);
INSERT INTO public.municipio
VALUES (1312, 2505238, 'Cuité de Mamanguape', 'PB', 250523);
INSERT INTO public.municipio
VALUES (1313, 2505279, 'Curral de Cima', 'PB', 250527);
INSERT INTO public.municipio
VALUES (1314, 2505303, 'Curral Velho', 'PB', 250530);
INSERT INTO public.municipio
VALUES (1315, 2505352, 'Damião', 'PB', 250535);
INSERT INTO public.municipio
VALUES (1316, 2505402, 'Desterro', 'PB', 250540);
INSERT INTO public.municipio
VALUES (1317, 2505501, 'Vista Serrana', 'PB', 250550);
INSERT INTO public.municipio
VALUES (1318, 2505600, 'Diamante', 'PB', 250560);
INSERT INTO public.municipio
VALUES (1319, 2505709, 'Dona Inês', 'PB', 250570);
INSERT INTO public.municipio
VALUES (1320, 2505808, 'Duas Estradas', 'PB', 250580);
INSERT INTO public.municipio
VALUES (1321, 2505907, 'Emas', 'PB', 250590);
INSERT INTO public.municipio
VALUES (1322, 2506004, 'Esperança', 'PB', 250600);
INSERT INTO public.municipio
VALUES (1323, 2506103, 'Fagundes', 'PB', 250610);
INSERT INTO public.municipio
VALUES (1324, 2506202, 'Frei Martinho', 'PB', 250620);
INSERT INTO public.municipio
VALUES (1325, 2506251, 'Gado Bravo', 'PB', 250625);
INSERT INTO public.municipio
VALUES (1326, 2506301, 'Guarabira', 'PB', 250630);
INSERT INTO public.municipio
VALUES (1327, 2506400, 'Gurinhém', 'PB', 250640);
INSERT INTO public.municipio
VALUES (1328, 2506509, 'Gurjão', 'PB', 250650);
INSERT INTO public.municipio
VALUES (1329, 2506608, 'Ibiara', 'PB', 250660);
INSERT INTO public.municipio
VALUES (1330, 2506707, 'Imaculada', 'PB', 250670);
INSERT INTO public.municipio
VALUES (1331, 2506806, 'Ingá', 'PB', 250680);
INSERT INTO public.municipio
VALUES (1332, 2506905, 'Itabaiana', 'PB', 250690);
INSERT INTO public.municipio
VALUES (1333, 2507002, 'Itaporanga', 'PB', 250700);
INSERT INTO public.municipio
VALUES (1334, 2507101, 'Itapororoca', 'PB', 250710);
INSERT INTO public.municipio
VALUES (1335, 2507200, 'Itatuba', 'PB', 250720);
INSERT INTO public.municipio
VALUES (1336, 2507309, 'Jacaraú', 'PB', 250730);
INSERT INTO public.municipio
VALUES (1337, 2507408, 'Jericó', 'PB', 250740);
INSERT INTO public.municipio
VALUES (1338, 2507507, 'João Pessoa', 'PB', 250750);
INSERT INTO public.municipio
VALUES (1339, 2507606, 'Juarez Távora', 'PB', 250760);
INSERT INTO public.municipio
VALUES (1340, 2507705, 'Juazeirinho', 'PB', 250770);
INSERT INTO public.municipio
VALUES (1341, 2507804, 'Junco do Seridó', 'PB', 250780);
INSERT INTO public.municipio
VALUES (1342, 2507903, 'Juripiranga', 'PB', 250790);
INSERT INTO public.municipio
VALUES (1343, 2508000, 'Juru', 'PB', 250800);
INSERT INTO public.municipio
VALUES (1344, 2508109, 'Lagoa', 'PB', 250810);
INSERT INTO public.municipio
VALUES (1345, 2508208, 'Lagoa de Dentro', 'PB', 250820);
INSERT INTO public.municipio
VALUES (1346, 2508307, 'Lagoa Seca', 'PB', 250830);
INSERT INTO public.municipio
VALUES (1347, 2508406, 'Lastro', 'PB', 250840);
INSERT INTO public.municipio
VALUES (1348, 2508505, 'Livramento', 'PB', 250850);
INSERT INTO public.municipio
VALUES (1349, 2508554, 'Logradouro', 'PB', 250855);
INSERT INTO public.municipio
VALUES (1350, 2508604, 'Lucena', 'PB', 250860);
INSERT INTO public.municipio
VALUES (1351, 2508703, 'Mãe D''Água', 'PB', 250870);
INSERT INTO public.municipio
VALUES (1352, 2508802, 'Malta', 'PB', 250880);
INSERT INTO public.municipio
VALUES (1353, 2508901, 'Mamanguape', 'PB', 250890);
INSERT INTO public.municipio
VALUES (1354, 2509008, 'Manaíra', 'PB', 250900);
INSERT INTO public.municipio
VALUES (1355, 2509057, 'Marcação', 'PB', 250905);
INSERT INTO public.municipio
VALUES (1356, 2509107, 'Mari', 'PB', 250910);
INSERT INTO public.municipio
VALUES (1357, 2509156, 'Marizópolis', 'PB', 250915);
INSERT INTO public.municipio
VALUES (1358, 2509206, 'Massaranduba', 'PB', 250920);
INSERT INTO public.municipio
VALUES (1359, 2509305, 'Mataraca', 'PB', 250930);
INSERT INTO public.municipio
VALUES (1360, 2509339, 'Matinhas', 'PB', 250933);
INSERT INTO public.municipio
VALUES (1361, 2509370, 'Mato Grosso', 'PB', 250937);
INSERT INTO public.municipio
VALUES (1362, 2509396, 'Maturéia', 'PB', 250939);
INSERT INTO public.municipio
VALUES (1363, 2509404, 'Mogeiro', 'PB', 250940);
INSERT INTO public.municipio
VALUES (1364, 2509503, 'Montadas', 'PB', 250950);
INSERT INTO public.municipio
VALUES (1365, 2509602, 'Monte Horebe', 'PB', 250960);
INSERT INTO public.municipio
VALUES (1366, 2509701, 'Monteiro', 'PB', 250970);
INSERT INTO public.municipio
VALUES (1367, 2509800, 'Mulungu', 'PB', 250980);
INSERT INTO public.municipio
VALUES (1368, 2509909, 'Natuba', 'PB', 250990);
INSERT INTO public.municipio
VALUES (1369, 2510006, 'Nazarezinho', 'PB', 251000);
INSERT INTO public.municipio
VALUES (1370, 2510105, 'Nova Floresta', 'PB', 251010);
INSERT INTO public.municipio
VALUES (1371, 2510204, 'Nova Olinda', 'PB', 251020);
INSERT INTO public.municipio
VALUES (1372, 2510303, 'Nova Palmeira', 'PB', 251030);
INSERT INTO public.municipio
VALUES (1373, 2510402, 'Olho D''Água', 'PB', 251040);
INSERT INTO public.municipio
VALUES (1374, 2510501, 'Olivedos', 'PB', 251050);
INSERT INTO public.municipio
VALUES (1375, 2510600, 'Ouro Velho', 'PB', 251060);
INSERT INTO public.municipio
VALUES (1376, 2510659, 'Parari', 'PB', 251065);
INSERT INTO public.municipio
VALUES (1377, 2510709, 'Passagem', 'PB', 251070);
INSERT INTO public.municipio
VALUES (1378, 2510808, 'Patos', 'PB', 251080);
INSERT INTO public.municipio
VALUES (1379, 2510907, 'Paulista', 'PB', 251090);
INSERT INTO public.municipio
VALUES (1380, 2511004, 'Pedra Branca', 'PB', 251100);
INSERT INTO public.municipio
VALUES (1381, 2511103, 'Pedra Lavrada', 'PB', 251110);
INSERT INTO public.municipio
VALUES (1382, 2511202, 'Pedras de Fogo', 'PB', 251120);
INSERT INTO public.municipio
VALUES (1383, 2511301, 'Piancó', 'PB', 251130);
INSERT INTO public.municipio
VALUES (1384, 2511400, 'Picuí', 'PB', 251140);
INSERT INTO public.municipio
VALUES (1385, 2511509, 'Pilar', 'PB', 251150);
INSERT INTO public.municipio
VALUES (1386, 2511608, 'Pilões', 'PB', 251160);
INSERT INTO public.municipio
VALUES (1387, 2511707, 'Pilõezinhos', 'PB', 251170);
INSERT INTO public.municipio
VALUES (1388, 2511806, 'Pirpirituba', 'PB', 251180);
INSERT INTO public.municipio
VALUES (1389, 2511905, 'Pitimbu', 'PB', 251190);
INSERT INTO public.municipio
VALUES (1390, 2512002, 'Pocinhos', 'PB', 251200);
INSERT INTO public.municipio
VALUES (1391, 2512036, 'Poço Dantas', 'PB', 251203);
INSERT INTO public.municipio
VALUES (1392, 2512077, 'Poço de José de Moura', 'PB', 251207);
INSERT INTO public.municipio
VALUES (1393, 2512101, 'Pombal', 'PB', 251210);
INSERT INTO public.municipio
VALUES (1394, 2512200, 'Prata', 'PB', 251220);
INSERT INTO public.municipio
VALUES (1395, 2512309, 'Princesa Isabel', 'PB', 251230);
INSERT INTO public.municipio
VALUES (1396, 2512408, 'Puxinanã', 'PB', 251240);
INSERT INTO public.municipio
VALUES (1397, 2512507, 'Queimadas', 'PB', 251250);
INSERT INTO public.municipio
VALUES (1398, 2512606, 'Quixabá', 'PB', 251260);
INSERT INTO public.municipio
VALUES (1399, 2512705, 'Remígio', 'PB', 251270);
INSERT INTO public.municipio
VALUES (1400, 2512721, 'Pedro Régis', 'PB', 251272);
INSERT INTO public.municipio
VALUES (1401, 2512747, 'Riachão', 'PB', 251274);
INSERT INTO public.municipio
VALUES (1402, 2512754, 'Riachão do Bacamarte', 'PB', 251275);
INSERT INTO public.municipio
VALUES (1403, 2512762, 'Riachão do Poço', 'PB', 251276);
INSERT INTO public.municipio
VALUES (1404, 2512788, 'Riacho de Santo Antônio', 'PB', 251278);
INSERT INTO public.municipio
VALUES (1405, 2512804, 'Riacho dos Cavalos', 'PB', 251280);
INSERT INTO public.municipio
VALUES (1406, 2512903, 'Rio Tinto', 'PB', 251290);
INSERT INTO public.municipio
VALUES (1407, 2513000, 'Salgadinho', 'PB', 251300);
INSERT INTO public.municipio
VALUES (1408, 2513109, 'Salgado de São Félix', 'PB', 251310);
INSERT INTO public.municipio
VALUES (1409, 2513158, 'Santa Cecília', 'PB', 251315);
INSERT INTO public.municipio
VALUES (1410, 2513208, 'Santa Cruz', 'PB', 251320);
INSERT INTO public.municipio
VALUES (1411, 2513307, 'Santa Helena', 'PB', 251330);
INSERT INTO public.municipio
VALUES (1412, 2513356, 'Santa Inês', 'PB', 251335);
INSERT INTO public.municipio
VALUES (1413, 2513406, 'Santa Luzia', 'PB', 251340);
INSERT INTO public.municipio
VALUES (1414, 2513505, 'Santana de Mangueira', 'PB', 251350);
INSERT INTO public.municipio
VALUES (1415, 2513604, 'Santana dos Garrotes', 'PB', 251360);
INSERT INTO public.municipio
VALUES (1416, 2513653, 'Joca Claudino', 'PB', 251365);
INSERT INTO public.municipio
VALUES (1417, 2513703, 'Santa Rita', 'PB', 251370);
INSERT INTO public.municipio
VALUES (1418, 2513802, 'Santa Teresinha', 'PB', 251380);
INSERT INTO public.municipio
VALUES (1419, 2513851, 'Santo André', 'PB', 251385);
INSERT INTO public.municipio
VALUES (1420, 2513901, 'São Bento', 'PB', 251390);
INSERT INTO public.municipio
VALUES (1421, 2513927, 'São Bentinho', 'PB', 251392);
INSERT INTO public.municipio
VALUES (1422, 2513943, 'São Domingos do Cariri', 'PB', 251394);
INSERT INTO public.municipio
VALUES (1423, 2513968, 'São Domingos', 'PB', 251396);
INSERT INTO public.municipio
VALUES (1424, 2513984, 'São Francisco', 'PB', 251398);
INSERT INTO public.municipio
VALUES (1425, 2514008, 'São João do Cariri', 'PB', 251400);
INSERT INTO public.municipio
VALUES (1426, 2514107, 'São João do Tigre', 'PB', 251410);
INSERT INTO public.municipio
VALUES (1427, 2514206, 'São José da Lagoa Tapada', 'PB', 251420);
INSERT INTO public.municipio
VALUES (1428, 2514305, 'São José de Caiana', 'PB', 251430);
INSERT INTO public.municipio
VALUES (1429, 2514404, 'São José de Espinharas', 'PB', 251440);
INSERT INTO public.municipio
VALUES (1430, 2514453, 'São José dos Ramos', 'PB', 251445);
INSERT INTO public.municipio
VALUES (1431, 2514503, 'São José de Piranhas', 'PB', 251450);
INSERT INTO public.municipio
VALUES (1432, 2514552, 'São José de Princesa', 'PB', 251455);
INSERT INTO public.municipio
VALUES (1433, 2514602, 'São José do Bonfim', 'PB', 251460);
INSERT INTO public.municipio
VALUES (1434, 2514651, 'São José do Brejo do Cruz', 'PB', 251465);
INSERT INTO public.municipio
VALUES (1435, 2514701, 'São José do Sabugi', 'PB', 251470);
INSERT INTO public.municipio
VALUES (1436, 2514800, 'São José dos Cordeiros', 'PB', 251480);
INSERT INTO public.municipio
VALUES (1437, 2514909, 'São Mamede', 'PB', 251490);
INSERT INTO public.municipio
VALUES (1438, 2515005, 'São Miguel de Taipu', 'PB', 251500);
INSERT INTO public.municipio
VALUES (1439, 2515104, 'São Sebastião de Lagoa de Roça', 'PB', 251510);
INSERT INTO public.municipio
VALUES (1440, 2515203, 'São Sebastião do Umbuzeiro', 'PB', 251520);
INSERT INTO public.municipio
VALUES (1441, 2515302, 'Sapé', 'PB', 251530);
INSERT INTO public.municipio
VALUES (1574, 2609402, 'Moreno', 'PE', 260940);
INSERT INTO public.municipio
VALUES (1442, 2515401, 'São Vicente do Seridó', 'PB', 251540);
INSERT INTO public.municipio
VALUES (1443, 2515500, 'Serra Branca', 'PB', 251550);
INSERT INTO public.municipio
VALUES (1444, 2515609, 'Serra da Raiz', 'PB', 251560);
INSERT INTO public.municipio
VALUES (1445, 2515708, 'Serra Grande', 'PB', 251570);
INSERT INTO public.municipio
VALUES (1446, 2515807, 'Serra Redonda', 'PB', 251580);
INSERT INTO public.municipio
VALUES (1447, 2515906, 'Serraria', 'PB', 251590);
INSERT INTO public.municipio
VALUES (1448, 2515930, 'Sertãozinho', 'PB', 251593);
INSERT INTO public.municipio
VALUES (1449, 2515971, 'Sobrado', 'PB', 251597);
INSERT INTO public.municipio
VALUES (1450, 2516003, 'Solânea', 'PB', 251600);
INSERT INTO public.municipio
VALUES (1451, 2516102, 'Soledade', 'PB', 251610);
INSERT INTO public.municipio
VALUES (1452, 2516151, 'Sossêgo', 'PB', 251615);
INSERT INTO public.municipio
VALUES (1453, 2516201, 'Sousa', 'PB', 251620);
INSERT INTO public.municipio
VALUES (1454, 2516300, 'Sumé', 'PB', 251630);
INSERT INTO public.municipio
VALUES (1455, 2516409, 'Tacima', 'PB', 251640);
INSERT INTO public.municipio
VALUES (1456, 2516508, 'Taperoá', 'PB', 251650);
INSERT INTO public.municipio
VALUES (1457, 2516607, 'Tavares', 'PB', 251660);
INSERT INTO public.municipio
VALUES (1458, 2516706, 'Teixeira', 'PB', 251670);
INSERT INTO public.municipio
VALUES (1459, 2516755, 'Tenório', 'PB', 251675);
INSERT INTO public.municipio
VALUES (1460, 2516805, 'Triunfo', 'PB', 251680);
INSERT INTO public.municipio
VALUES (1461, 2516904, 'Uiraúna', 'PB', 251690);
INSERT INTO public.municipio
VALUES (1462, 2517001, 'Umbuzeiro', 'PB', 251700);
INSERT INTO public.municipio
VALUES (1463, 2517100, 'Várzea', 'PB', 251710);
INSERT INTO public.municipio
VALUES (1464, 2517209, 'Vieirópolis', 'PB', 251720);
INSERT INTO public.municipio
VALUES (1465, 2517407, 'Zabelê', 'PB', 251740);
INSERT INTO public.municipio
VALUES (1466, 2600054, 'Abreu e Lima', 'PE', 260005);
INSERT INTO public.municipio
VALUES (1467, 2600104, 'Afogados da Ingazeira', 'PE', 260010);
INSERT INTO public.municipio
VALUES (1468, 2600203, 'Afrânio', 'PE', 260020);
INSERT INTO public.municipio
VALUES (1469, 2600302, 'Agrestina', 'PE', 260030);
INSERT INTO public.municipio
VALUES (1470, 2600401, 'Água Preta', 'PE', 260040);
INSERT INTO public.municipio
VALUES (1471, 2600500, 'Águas Belas', 'PE', 260050);
INSERT INTO public.municipio
VALUES (1472, 2600609, 'Alagoinha', 'PE', 260060);
INSERT INTO public.municipio
VALUES (1473, 2600708, 'Aliança', 'PE', 260070);
INSERT INTO public.municipio
VALUES (1474, 2600807, 'Altinho', 'PE', 260080);
INSERT INTO public.municipio
VALUES (1475, 2600906, 'Amaraji', 'PE', 260090);
INSERT INTO public.municipio
VALUES (1476, 2601003, 'Angelim', 'PE', 260100);
INSERT INTO public.municipio
VALUES (1477, 2601052, 'Araçoiaba', 'PE', 260105);
INSERT INTO public.municipio
VALUES (1478, 2601102, 'Araripina', 'PE', 260110);
INSERT INTO public.municipio
VALUES (1479, 2601201, 'Arcoverde', 'PE', 260120);
INSERT INTO public.municipio
VALUES (1480, 2601300, 'Barra de Guabiraba', 'PE', 260130);
INSERT INTO public.municipio
VALUES (1481, 2601409, 'Barreiros', 'PE', 260140);
INSERT INTO public.municipio
VALUES (1482, 2601508, 'Belém de Maria', 'PE', 260150);
INSERT INTO public.municipio
VALUES (1483, 2601607, 'Belém do São Francisco', 'PE', 260160);
INSERT INTO public.municipio
VALUES (1484, 2601706, 'Belo Jardim', 'PE', 260170);
INSERT INTO public.municipio
VALUES (1485, 2601805, 'Betânia', 'PE', 260180);
INSERT INTO public.municipio
VALUES (1486, 2601904, 'Bezerros', 'PE', 260190);
INSERT INTO public.municipio
VALUES (1487, 2602001, 'Bodocó', 'PE', 260200);
INSERT INTO public.municipio
VALUES (1488, 2602100, 'Bom Conselho', 'PE', 260210);
INSERT INTO public.municipio
VALUES (1489, 2602209, 'Bom Jardim', 'PE', 260220);
INSERT INTO public.municipio
VALUES (1490, 2602308, 'Bonito', 'PE', 260230);
INSERT INTO public.municipio
VALUES (1491, 2602407, 'Brejão', 'PE', 260240);
INSERT INTO public.municipio
VALUES (1492, 2602506, 'Brejinho', 'PE', 260250);
INSERT INTO public.municipio
VALUES (1493, 2602605, 'Brejo da Madre de Deus', 'PE', 260260);
INSERT INTO public.municipio
VALUES (1494, 2602704, 'Buenos Aires', 'PE', 260270);
INSERT INTO public.municipio
VALUES (1495, 2602803, 'Buíque', 'PE', 260280);
INSERT INTO public.municipio
VALUES (1496, 2602902, 'Cabo de Santo Agostinho', 'PE', 260290);
INSERT INTO public.municipio
VALUES (1497, 2603009, 'Cabrobó', 'PE', 260300);
INSERT INTO public.municipio
VALUES (1498, 2603108, 'Cachoeirinha', 'PE', 260310);
INSERT INTO public.municipio
VALUES (1499, 2603207, 'Caetés', 'PE', 260320);
INSERT INTO public.municipio
VALUES (1500, 2603306, 'Calçado', 'PE', 260330);
INSERT INTO public.municipio
VALUES (1501, 2603405, 'Calumbi', 'PE', 260340);
INSERT INTO public.municipio
VALUES (1502, 2603454, 'Camaragibe', 'PE', 260345);
INSERT INTO public.municipio
VALUES (1503, 2603504, 'Camocim de São Félix', 'PE', 260350);
INSERT INTO public.municipio
VALUES (1504, 2603603, 'Camutanga', 'PE', 260360);
INSERT INTO public.municipio
VALUES (1505, 2603702, 'Canhotinho', 'PE', 260370);
INSERT INTO public.municipio
VALUES (1506, 2603801, 'Capoeiras', 'PE', 260380);
INSERT INTO public.municipio
VALUES (1507, 2603900, 'Carnaíba', 'PE', 260390);
INSERT INTO public.municipio
VALUES (1508, 2603926, 'Carnaubeira da Penha', 'PE', 260392);
INSERT INTO public.municipio
VALUES (1509, 2604007, 'Carpina', 'PE', 260400);
INSERT INTO public.municipio
VALUES (1510, 2604106, 'Caruaru', 'PE', 260410);
INSERT INTO public.municipio
VALUES (1511, 2604155, 'Casinhas', 'PE', 260415);
INSERT INTO public.municipio
VALUES (1512, 2604205, 'Catende', 'PE', 260420);
INSERT INTO public.municipio
VALUES (1513, 2604304, 'Cedro', 'PE', 260430);
INSERT INTO public.municipio
VALUES (1514, 2604403, 'Chã de Alegria', 'PE', 260440);
INSERT INTO public.municipio
VALUES (1515, 2604502, 'Chã Grande', 'PE', 260450);
INSERT INTO public.municipio
VALUES (1516, 2604601, 'Condado', 'PE', 260460);
INSERT INTO public.municipio
VALUES (1517, 2604700, 'Correntes', 'PE', 260470);
INSERT INTO public.municipio
VALUES (1518, 2604809, 'Cortês', 'PE', 260480);
INSERT INTO public.municipio
VALUES (1519, 2604908, 'Cumaru', 'PE', 260490);
INSERT INTO public.municipio
VALUES (1520, 2605004, 'Cupira', 'PE', 260500);
INSERT INTO public.municipio
VALUES (1521, 2605103, 'Custódia', 'PE', 260510);
INSERT INTO public.municipio
VALUES (1522, 2605152, 'Dormentes', 'PE', 260515);
INSERT INTO public.municipio
VALUES (1523, 2605202, 'Escada', 'PE', 260520);
INSERT INTO public.municipio
VALUES (1524, 2605301, 'Exu', 'PE', 260530);
INSERT INTO public.municipio
VALUES (1525, 2605400, 'Feira Nova', 'PE', 260540);
INSERT INTO public.municipio
VALUES (1526, 2605459, 'Fernando de Noronha', 'PE', 260545);
INSERT INTO public.municipio
VALUES (1527, 2605509, 'Ferreiros', 'PE', 260550);
INSERT INTO public.municipio
VALUES (1528, 2605608, 'Flores', 'PE', 260560);
INSERT INTO public.municipio
VALUES (1529, 2605707, 'Floresta', 'PE', 260570);
INSERT INTO public.municipio
VALUES (1530, 2605806, 'Frei Miguelinho', 'PE', 260580);
INSERT INTO public.municipio
VALUES (1531, 2605905, 'Gameleira', 'PE', 260590);
INSERT INTO public.municipio
VALUES (1532, 2606002, 'Garanhuns', 'PE', 260600);
INSERT INTO public.municipio
VALUES (1533, 2606101, 'Glória do Goitá', 'PE', 260610);
INSERT INTO public.municipio
VALUES (1534, 2606200, 'Goiana', 'PE', 260620);
INSERT INTO public.municipio
VALUES (1535, 2606309, 'Granito', 'PE', 260630);
INSERT INTO public.municipio
VALUES (1536, 2606408, 'Gravatá', 'PE', 260640);
INSERT INTO public.municipio
VALUES (1537, 2606507, 'Iati', 'PE', 260650);
INSERT INTO public.municipio
VALUES (1538, 2606606, 'Ibimirim', 'PE', 260660);
INSERT INTO public.municipio
VALUES (1539, 2606705, 'Ibirajuba', 'PE', 260670);
INSERT INTO public.municipio
VALUES (1540, 2606804, 'Igarassu', 'PE', 260680);
INSERT INTO public.municipio
VALUES (1541, 2606903, 'Iguaraci', 'PE', 260690);
INSERT INTO public.municipio
VALUES (1542, 2607000, 'Inajá', 'PE', 260700);
INSERT INTO public.municipio
VALUES (1543, 2607109, 'Ingazeira', 'PE', 260710);
INSERT INTO public.municipio
VALUES (1544, 2607208, 'Ipojuca', 'PE', 260720);
INSERT INTO public.municipio
VALUES (1545, 2607307, 'Ipubi', 'PE', 260730);
INSERT INTO public.municipio
VALUES (1546, 2607406, 'Itacuruba', 'PE', 260740);
INSERT INTO public.municipio
VALUES (1547, 2607505, 'Itaíba', 'PE', 260750);
INSERT INTO public.municipio
VALUES (1548, 2607604, 'Ilha de Itamaracá', 'PE', 260760);
INSERT INTO public.municipio
VALUES (1549, 2607653, 'Itambé', 'PE', 260765);
INSERT INTO public.municipio
VALUES (1550, 2607703, 'Itapetim', 'PE', 260770);
INSERT INTO public.municipio
VALUES (1551, 2607752, 'Itapissuma', 'PE', 260775);
INSERT INTO public.municipio
VALUES (1552, 2607802, 'Itaquitinga', 'PE', 260780);
INSERT INTO public.municipio
VALUES (1553, 2607901, 'Jaboatão dos Guararapes', 'PE', 260790);
INSERT INTO public.municipio
VALUES (1554, 2607950, 'Jaqueira', 'PE', 260795);
INSERT INTO public.municipio
VALUES (1555, 2608008, 'Jataúba', 'PE', 260800);
INSERT INTO public.municipio
VALUES (1556, 2608057, 'Jatobá', 'PE', 260805);
INSERT INTO public.municipio
VALUES (1557, 2608107, 'João Alfredo', 'PE', 260810);
INSERT INTO public.municipio
VALUES (1558, 2608206, 'Joaquim Nabuco', 'PE', 260820);
INSERT INTO public.municipio
VALUES (1559, 2608255, 'Jucati', 'PE', 260825);
INSERT INTO public.municipio
VALUES (1560, 2608305, 'Jupi', 'PE', 260830);
INSERT INTO public.municipio
VALUES (1561, 2608404, 'Jurema', 'PE', 260840);
INSERT INTO public.municipio
VALUES (1562, 2608453, 'Lagoa do Carro', 'PE', 260845);
INSERT INTO public.municipio
VALUES (1563, 2608503, 'Lagoa de Itaenga', 'PE', 260850);
INSERT INTO public.municipio
VALUES (1564, 2608602, 'Lagoa do Ouro', 'PE', 260860);
INSERT INTO public.municipio
VALUES (1565, 2608701, 'Lagoa dos Gatos', 'PE', 260870);
INSERT INTO public.municipio
VALUES (1566, 2608750, 'Lagoa Grande', 'PE', 260875);
INSERT INTO public.municipio
VALUES (1567, 2608800, 'Lajedo', 'PE', 260880);
INSERT INTO public.municipio
VALUES (1568, 2608909, 'Limoeiro', 'PE', 260890);
INSERT INTO public.municipio
VALUES (1569, 2609006, 'Macaparana', 'PE', 260900);
INSERT INTO public.municipio
VALUES (1570, 2609105, 'Machados', 'PE', 260910);
INSERT INTO public.municipio
VALUES (1571, 2609154, 'Manari', 'PE', 260915);
INSERT INTO public.municipio
VALUES (1572, 2609204, 'Maraial', 'PE', 260920);
INSERT INTO public.municipio
VALUES (1573, 2609303, 'Mirandiba', 'PE', 260930);
INSERT INTO public.municipio
VALUES (1575, 2609501, 'Nazaré da Mata', 'PE', 260950);
INSERT INTO public.municipio
VALUES (1576, 2609600, 'Olinda', 'PE', 260960);
INSERT INTO public.municipio
VALUES (1577, 2609709, 'Orobó', 'PE', 260970);
INSERT INTO public.municipio
VALUES (1578, 2609808, 'Orocó', 'PE', 260980);
INSERT INTO public.municipio
VALUES (1579, 2609907, 'Ouricuri', 'PE', 260990);
INSERT INTO public.municipio
VALUES (1580, 2610004, 'Palmares', 'PE', 261000);
INSERT INTO public.municipio
VALUES (1581, 2610103, 'Palmeirina', 'PE', 261010);
INSERT INTO public.municipio
VALUES (1582, 2610202, 'Panelas', 'PE', 261020);
INSERT INTO public.municipio
VALUES (1583, 2610301, 'Paranatama', 'PE', 261030);
INSERT INTO public.municipio
VALUES (1584, 2610400, 'Parnamirim', 'PE', 261040);
INSERT INTO public.municipio
VALUES (1585, 2610509, 'Passira', 'PE', 261050);
INSERT INTO public.municipio
VALUES (1586, 2610608, 'Paudalho', 'PE', 261060);
INSERT INTO public.municipio
VALUES (1587, 2610707, 'Paulista', 'PE', 261070);
INSERT INTO public.municipio
VALUES (1588, 2610806, 'Pedra', 'PE', 261080);
INSERT INTO public.municipio
VALUES (1589, 2610905, 'Pesqueira', 'PE', 261090);
INSERT INTO public.municipio
VALUES (1590, 2611002, 'Petrolândia', 'PE', 261100);
INSERT INTO public.municipio
VALUES (1591, 2611101, 'Petrolina', 'PE', 261110);
INSERT INTO public.municipio
VALUES (1592, 2611200, 'Poção', 'PE', 261120);
INSERT INTO public.municipio
VALUES (1593, 2611309, 'Pombos', 'PE', 261130);
INSERT INTO public.municipio
VALUES (1594, 2611408, 'Primavera', 'PE', 261140);
INSERT INTO public.municipio
VALUES (1595, 2611507, 'Quipapá', 'PE', 261150);
INSERT INTO public.municipio
VALUES (1596, 2611533, 'Quixaba', 'PE', 261153);
INSERT INTO public.municipio
VALUES (1597, 2611606, 'Recife', 'PE', 261160);
INSERT INTO public.municipio
VALUES (1598, 2611705, 'Riacho das Almas', 'PE', 261170);
INSERT INTO public.municipio
VALUES (1599, 2611804, 'Ribeirão', 'PE', 261180);
INSERT INTO public.municipio
VALUES (1600, 2611903, 'Rio Formoso', 'PE', 261190);
INSERT INTO public.municipio
VALUES (1601, 2612000, 'Sairé', 'PE', 261200);
INSERT INTO public.municipio
VALUES (1602, 2612109, 'Salgadinho', 'PE', 261210);
INSERT INTO public.municipio
VALUES (1603, 2612208, 'Salgueiro', 'PE', 261220);
INSERT INTO public.municipio
VALUES (1604, 2612307, 'Saloá', 'PE', 261230);
INSERT INTO public.municipio
VALUES (1605, 2612406, 'Sanharó', 'PE', 261240);
INSERT INTO public.municipio
VALUES (1606, 2612455, 'Santa Cruz', 'PE', 261245);
INSERT INTO public.municipio
VALUES (1607, 2612471, 'Santa Cruz da Baixa Verde', 'PE', 261247);
INSERT INTO public.municipio
VALUES (1608, 2612505, 'Santa Cruz do Capibaribe', 'PE', 261250);
INSERT INTO public.municipio
VALUES (1609, 2612554, 'Santa Filomena', 'PE', 261255);
INSERT INTO public.municipio
VALUES (1610, 2612604, 'Santa Maria da Boa Vista', 'PE', 261260);
INSERT INTO public.municipio
VALUES (1611, 2612703, 'Santa Maria do Cambucá', 'PE', 261270);
INSERT INTO public.municipio
VALUES (1612, 2612802, 'Santa Terezinha', 'PE', 261280);
INSERT INTO public.municipio
VALUES (1613, 2612901, 'São Benedito do Sul', 'PE', 261290);
INSERT INTO public.municipio
VALUES (1614, 2613008, 'São Bento do Una', 'PE', 261300);
INSERT INTO public.municipio
VALUES (1615, 2613107, 'São Caitano', 'PE', 261310);
INSERT INTO public.municipio
VALUES (1616, 2613206, 'São João', 'PE', 261320);
INSERT INTO public.municipio
VALUES (1617, 2613305, 'São Joaquim do Monte', 'PE', 261330);
INSERT INTO public.municipio
VALUES (1618, 2613404, 'São José da Coroa Grande', 'PE', 261340);
INSERT INTO public.municipio
VALUES (1619, 2613503, 'São José do Belmonte', 'PE', 261350);
INSERT INTO public.municipio
VALUES (1620, 2613602, 'São José do Egito', 'PE', 261360);
INSERT INTO public.municipio
VALUES (1621, 2613701, 'São Lourenço da Mata', 'PE', 261370);
INSERT INTO public.municipio
VALUES (1622, 2613800, 'São Vicente Ferrer', 'PE', 261380);
INSERT INTO public.municipio
VALUES (1623, 2613909, 'Serra Talhada', 'PE', 261390);
INSERT INTO public.municipio
VALUES (1624, 2614006, 'Serrita', 'PE', 261400);
INSERT INTO public.municipio
VALUES (1625, 2614105, 'Sertânia', 'PE', 261410);
INSERT INTO public.municipio
VALUES (1626, 2614204, 'Sirinhaém', 'PE', 261420);
INSERT INTO public.municipio
VALUES (1627, 2614303, 'Moreilândia', 'PE', 261430);
INSERT INTO public.municipio
VALUES (1628, 2614402, 'Solidão', 'PE', 261440);
INSERT INTO public.municipio
VALUES (1629, 2614501, 'Surubim', 'PE', 261450);
INSERT INTO public.municipio
VALUES (1630, 2614600, 'Tabira', 'PE', 261460);
INSERT INTO public.municipio
VALUES (1631, 2614709, 'Tacaimbó', 'PE', 261470);
INSERT INTO public.municipio
VALUES (1632, 2614808, 'Tacaratu', 'PE', 261480);
INSERT INTO public.municipio
VALUES (1633, 2614857, 'Tamandaré', 'PE', 261485);
INSERT INTO public.municipio
VALUES (1634, 2615003, 'Taquaritinga do Norte', 'PE', 261500);
INSERT INTO public.municipio
VALUES (1635, 2615102, 'Terezinha', 'PE', 261510);
INSERT INTO public.municipio
VALUES (1636, 2615201, 'Terra Nova', 'PE', 261520);
INSERT INTO public.municipio
VALUES (1637, 2615300, 'Timbaúba', 'PE', 261530);
INSERT INTO public.municipio
VALUES (1638, 2615409, 'Toritama', 'PE', 261540);
INSERT INTO public.municipio
VALUES (1639, 2615508, 'Tracunhaém', 'PE', 261550);
INSERT INTO public.municipio
VALUES (1640, 2615607, 'Trindade', 'PE', 261560);
INSERT INTO public.municipio
VALUES (1641, 2615706, 'Triunfo', 'PE', 261570);
INSERT INTO public.municipio
VALUES (1642, 2615805, 'Tupanatinga', 'PE', 261580);
INSERT INTO public.municipio
VALUES (1643, 2615904, 'Tuparetama', 'PE', 261590);
INSERT INTO public.municipio
VALUES (1644, 2616001, 'Venturosa', 'PE', 261600);
INSERT INTO public.municipio
VALUES (1645, 2616100, 'Verdejante', 'PE', 261610);
INSERT INTO public.municipio
VALUES (1646, 2616183, 'Vertente do Lério', 'PE', 261618);
INSERT INTO public.municipio
VALUES (1647, 2616209, 'Vertentes', 'PE', 261620);
INSERT INTO public.municipio
VALUES (1648, 2616308, 'Vicência', 'PE', 261630);
INSERT INTO public.municipio
VALUES (1649, 2616407, 'Vitória de Santo Antão', 'PE', 261640);
INSERT INTO public.municipio
VALUES (1650, 2616506, 'Xexéu', 'PE', 261650);
INSERT INTO public.municipio
VALUES (1651, 2700102, 'Água Branca', 'AL', 270010);
INSERT INTO public.municipio
VALUES (1652, 2700201, 'Anadia', 'AL', 270020);
INSERT INTO public.municipio
VALUES (1653, 2700300, 'Arapiraca', 'AL', 270030);
INSERT INTO public.municipio
VALUES (1654, 2700409, 'Atalaia', 'AL', 270040);
INSERT INTO public.municipio
VALUES (1655, 2700508, 'Barra de Santo Antônio', 'AL', 270050);
INSERT INTO public.municipio
VALUES (1656, 2700607, 'Barra de São Miguel', 'AL', 270060);
INSERT INTO public.municipio
VALUES (1657, 2700706, 'Batalha', 'AL', 270070);
INSERT INTO public.municipio
VALUES (1658, 2700805, 'Belém', 'AL', 270080);
INSERT INTO public.municipio
VALUES (1659, 2700904, 'Belo Monte', 'AL', 270090);
INSERT INTO public.municipio
VALUES (1660, 2701001, 'Boca da Mata', 'AL', 270100);
INSERT INTO public.municipio
VALUES (1661, 2701100, 'Branquinha', 'AL', 270110);
INSERT INTO public.municipio
VALUES (1662, 2701209, 'Cacimbinhas', 'AL', 270120);
INSERT INTO public.municipio
VALUES (1663, 2701308, 'Cajueiro', 'AL', 270130);
INSERT INTO public.municipio
VALUES (1664, 2701357, 'Campestre', 'AL', 270135);
INSERT INTO public.municipio
VALUES (1665, 2701407, 'Campo Alegre', 'AL', 270140);
INSERT INTO public.municipio
VALUES (1666, 2701506, 'Campo Grande', 'AL', 270150);
INSERT INTO public.municipio
VALUES (1667, 2701605, 'Canapi', 'AL', 270160);
INSERT INTO public.municipio
VALUES (1668, 2701704, 'Capela', 'AL', 270170);
INSERT INTO public.municipio
VALUES (1669, 2701803, 'Carneiros', 'AL', 270180);
INSERT INTO public.municipio
VALUES (1670, 2701902, 'Chã Preta', 'AL', 270190);
INSERT INTO public.municipio
VALUES (1671, 2702009, 'Coité do Nóia', 'AL', 270200);
INSERT INTO public.municipio
VALUES (1672, 2702108, 'Colônia Leopoldina', 'AL', 270210);
INSERT INTO public.municipio
VALUES (1673, 2702207, 'Coqueiro Seco', 'AL', 270220);
INSERT INTO public.municipio
VALUES (1674, 2702306, 'Coruripe', 'AL', 270230);
INSERT INTO public.municipio
VALUES (1675, 2702355, 'Craíbas', 'AL', 270235);
INSERT INTO public.municipio
VALUES (1676, 2702405, 'Delmiro Gouveia', 'AL', 270240);
INSERT INTO public.municipio
VALUES (1677, 2702504, 'Dois Riachos', 'AL', 270250);
INSERT INTO public.municipio
VALUES (1678, 2702553, 'Estrela de Alagoas', 'AL', 270255);
INSERT INTO public.municipio
VALUES (1679, 2702603, 'Feira Grande', 'AL', 270260);
INSERT INTO public.municipio
VALUES (1680, 2702702, 'Feliz Deserto', 'AL', 270270);
INSERT INTO public.municipio
VALUES (1681, 2702801, 'Flexeiras', 'AL', 270280);
INSERT INTO public.municipio
VALUES (1682, 2702900, 'Girau do Ponciano', 'AL', 270290);
INSERT INTO public.municipio
VALUES (1683, 2703007, 'Ibateguara', 'AL', 270300);
INSERT INTO public.municipio
VALUES (1684, 2703106, 'Igaci', 'AL', 270310);
INSERT INTO public.municipio
VALUES (1685, 2703205, 'Igreja Nova', 'AL', 270320);
INSERT INTO public.municipio
VALUES (1686, 2703304, 'Inhapi', 'AL', 270330);
INSERT INTO public.municipio
VALUES (1687, 2703403, 'Jacaré dos Homens', 'AL', 270340);
INSERT INTO public.municipio
VALUES (1688, 2703502, 'Jacuípe', 'AL', 270350);
INSERT INTO public.municipio
VALUES (1689, 2703601, 'Japaratinga', 'AL', 270360);
INSERT INTO public.municipio
VALUES (1690, 2703700, 'Jaramataia', 'AL', 270370);
INSERT INTO public.municipio
VALUES (1691, 2703759, 'Jequiá da Praia', 'AL', 270375);
INSERT INTO public.municipio
VALUES (1692, 2703809, 'Joaquim Gomes', 'AL', 270380);
INSERT INTO public.municipio
VALUES (1693, 2703908, 'Jundiá', 'AL', 270390);
INSERT INTO public.municipio
VALUES (1694, 2704005, 'Junqueiro', 'AL', 270400);
INSERT INTO public.municipio
VALUES (1695, 2704104, 'Lagoa da Canoa', 'AL', 270410);
INSERT INTO public.municipio
VALUES (1696, 2704203, 'Limoeiro de Anadia', 'AL', 270420);
INSERT INTO public.municipio
VALUES (1697, 2704302, 'Maceió', 'AL', 270430);
INSERT INTO public.municipio
VALUES (1698, 2704401, 'Major Isidoro', 'AL', 270440);
INSERT INTO public.municipio
VALUES (1699, 2704500, 'Maragogi', 'AL', 270450);
INSERT INTO public.municipio
VALUES (1700, 2704609, 'Maravilha', 'AL', 270460);
INSERT INTO public.municipio
VALUES (1701, 2704708, 'Marechal Deodoro', 'AL', 270470);
INSERT INTO public.municipio
VALUES (1702, 2704807, 'Maribondo', 'AL', 270480);
INSERT INTO public.municipio
VALUES (1703, 2704906, 'Mar Vermelho', 'AL', 270490);
INSERT INTO public.municipio
VALUES (1704, 2705002, 'Mata Grande', 'AL', 270500);
INSERT INTO public.municipio
VALUES (1705, 2705101, 'Matriz de Camaragibe', 'AL', 270510);
INSERT INTO public.municipio
VALUES (1706, 2705200, 'Messias', 'AL', 270520);
INSERT INTO public.municipio
VALUES (1707, 2705309, 'Minador do Negrão', 'AL', 270530);
INSERT INTO public.municipio
VALUES (1708, 2705408, 'Monteirópolis', 'AL', 270540);
INSERT INTO public.municipio
VALUES (1709, 2705507, 'Murici', 'AL', 270550);
INSERT INTO public.municipio
VALUES (1710, 2705606, 'Novo Lino', 'AL', 270560);
INSERT INTO public.municipio
VALUES (1711, 2705705, 'Olho D''Água das Flores', 'AL', 270570);
INSERT INTO public.municipio
VALUES (1712, 2705804, 'Olho D''Água do Casado', 'AL', 270580);
INSERT INTO public.municipio
VALUES (1713, 2705903, 'Olho D''Água Grande', 'AL', 270590);
INSERT INTO public.municipio
VALUES (1714, 2706000, 'Olivença', 'AL', 270600);
INSERT INTO public.municipio
VALUES (1715, 2706109, 'Ouro Branco', 'AL', 270610);
INSERT INTO public.municipio
VALUES (1716, 2706208, 'Palestina', 'AL', 270620);
INSERT INTO public.municipio
VALUES (1717, 2706307, 'Palmeira dos Índios', 'AL', 270630);
INSERT INTO public.municipio
VALUES (1718, 2706406, 'Pão de Açúcar', 'AL', 270640);
INSERT INTO public.municipio
VALUES (1719, 2706422, 'Pariconha', 'AL', 270642);
INSERT INTO public.municipio
VALUES (1720, 2706448, 'Paripueira', 'AL', 270644);
INSERT INTO public.municipio
VALUES (1721, 2706505, 'Passo de Camaragibe', 'AL', 270650);
INSERT INTO public.municipio
VALUES (1722, 2706604, 'Paulo Jacinto', 'AL', 270660);
INSERT INTO public.municipio
VALUES (1723, 2706703, 'Penedo', 'AL', 270670);
INSERT INTO public.municipio
VALUES (1724, 2706802, 'Piaçabuçu', 'AL', 270680);
INSERT INTO public.municipio
VALUES (1725, 2706901, 'Pilar', 'AL', 270690);
INSERT INTO public.municipio
VALUES (1726, 2707008, 'Pindoba', 'AL', 270700);
INSERT INTO public.municipio
VALUES (1727, 2707107, 'Piranhas', 'AL', 270710);
INSERT INTO public.municipio
VALUES (1728, 2707206, 'Poço das Trincheiras', 'AL', 270720);
INSERT INTO public.municipio
VALUES (1729, 2707305, 'Porto Calvo', 'AL', 270730);
INSERT INTO public.municipio
VALUES (1730, 2707404, 'Porto de Pedras', 'AL', 270740);
INSERT INTO public.municipio
VALUES (1731, 2707503, 'Porto Real do Colégio', 'AL', 270750);
INSERT INTO public.municipio
VALUES (1732, 2707602, 'Quebrangulo', 'AL', 270760);
INSERT INTO public.municipio
VALUES (1733, 2707701, 'Rio Largo', 'AL', 270770);
INSERT INTO public.municipio
VALUES (1734, 2707800, 'Roteiro', 'AL', 270780);
INSERT INTO public.municipio
VALUES (1735, 2707909, 'Santa Luzia do Norte', 'AL', 270790);
INSERT INTO public.municipio
VALUES (1736, 2708006, 'Santana do Ipanema', 'AL', 270800);
INSERT INTO public.municipio
VALUES (1737, 2708105, 'Santana do Mundaú', 'AL', 270810);
INSERT INTO public.municipio
VALUES (1738, 2708204, 'São Brás', 'AL', 270820);
INSERT INTO public.municipio
VALUES (1739, 2708303, 'São José da Laje', 'AL', 270830);
INSERT INTO public.municipio
VALUES (1740, 2708402, 'São José da Tapera', 'AL', 270840);
INSERT INTO public.municipio
VALUES (1741, 2708501, 'São Luís do Quitunde', 'AL', 270850);
INSERT INTO public.municipio
VALUES (1742, 2708600, 'São Miguel dos Campos', 'AL', 270860);
INSERT INTO public.municipio
VALUES (1743, 2708709, 'São Miguel dos Milagres', 'AL', 270870);
INSERT INTO public.municipio
VALUES (1744, 2708808, 'São Sebastião', 'AL', 270880);
INSERT INTO public.municipio
VALUES (1745, 2708907, 'Satuba', 'AL', 270890);
INSERT INTO public.municipio
VALUES (1746, 2708956, 'Senador Rui Palmeira', 'AL', 270895);
INSERT INTO public.municipio
VALUES (1747, 2709004, 'Tanque D''Arca', 'AL', 270900);
INSERT INTO public.municipio
VALUES (1748, 2709103, 'Taquarana', 'AL', 270910);
INSERT INTO public.municipio
VALUES (1749, 2709152, 'Teotônio Vilela', 'AL', 270915);
INSERT INTO public.municipio
VALUES (1750, 2709202, 'Traipu', 'AL', 270920);
INSERT INTO public.municipio
VALUES (1751, 2709301, 'União dos Palmares', 'AL', 270930);
INSERT INTO public.municipio
VALUES (1752, 2709400, 'Viçosa', 'AL', 270940);
INSERT INTO public.municipio
VALUES (1753, 2800100, 'Amparo de São Francisco', 'SE', 280010);
INSERT INTO public.municipio
VALUES (1754, 2800209, 'Aquidabã', 'SE', 280020);
INSERT INTO public.municipio
VALUES (1755, 2800308, 'Aracaju', 'SE', 280030);
INSERT INTO public.municipio
VALUES (1756, 2800407, 'Arauá', 'SE', 280040);
INSERT INTO public.municipio
VALUES (1757, 2800506, 'Areia Branca', 'SE', 280050);
INSERT INTO public.municipio
VALUES (1758, 2800605, 'Barra dos Coqueiros', 'SE', 280060);
INSERT INTO public.municipio
VALUES (1759, 2800670, 'Boquim', 'SE', 280067);
INSERT INTO public.municipio
VALUES (1760, 2800704, 'Brejo Grande', 'SE', 280070);
INSERT INTO public.municipio
VALUES (1761, 2801009, 'Campo do Brito', 'SE', 280100);
INSERT INTO public.municipio
VALUES (1762, 2801108, 'Canhoba', 'SE', 280110);
INSERT INTO public.municipio
VALUES (1763, 2801207, 'Canindé de São Francisco', 'SE', 280120);
INSERT INTO public.municipio
VALUES (1764, 2801306, 'Capela', 'SE', 280130);
INSERT INTO public.municipio
VALUES (1765, 2801405, 'Carira', 'SE', 280140);
INSERT INTO public.municipio
VALUES (1766, 2801504, 'Carmópolis', 'SE', 280150);
INSERT INTO public.municipio
VALUES (1767, 2801603, 'Cedro de São João', 'SE', 280160);
INSERT INTO public.municipio
VALUES (1768, 2801702, 'Cristinápolis', 'SE', 280170);
INSERT INTO public.municipio
VALUES (1769, 2801900, 'Cumbe', 'SE', 280190);
INSERT INTO public.municipio
VALUES (1770, 2802007, 'Divina Pastora', 'SE', 280200);
INSERT INTO public.municipio
VALUES (1771, 2802106, 'Estância', 'SE', 280210);
INSERT INTO public.municipio
VALUES (1772, 2802205, 'Feira Nova', 'SE', 280220);
INSERT INTO public.municipio
VALUES (1773, 2802304, 'Frei Paulo', 'SE', 280230);
INSERT INTO public.municipio
VALUES (1774, 2802403, 'Gararu', 'SE', 280240);
INSERT INTO public.municipio
VALUES (1775, 2802502, 'General Maynard', 'SE', 280250);
INSERT INTO public.municipio
VALUES (1776, 2802601, 'Gracho Cardoso', 'SE', 280260);
INSERT INTO public.municipio
VALUES (1777, 2802700, 'Ilha das Flores', 'SE', 280270);
INSERT INTO public.municipio
VALUES (1778, 2802809, 'Indiaroba', 'SE', 280280);
INSERT INTO public.municipio
VALUES (1779, 2802908, 'Itabaiana', 'SE', 280290);
INSERT INTO public.municipio
VALUES (1780, 2803005, 'Itabaianinha', 'SE', 280300);
INSERT INTO public.municipio
VALUES (1781, 2803104, 'Itabi', 'SE', 280310);
INSERT INTO public.municipio
VALUES (1782, 2803203, 'Itaporanga D''Ajuda', 'SE', 280320);
INSERT INTO public.municipio
VALUES (1783, 2803302, 'Japaratuba', 'SE', 280330);
INSERT INTO public.municipio
VALUES (1784, 2803401, 'Japoatã', 'SE', 280340);
INSERT INTO public.municipio
VALUES (1785, 2803500, 'Lagarto', 'SE', 280350);
INSERT INTO public.municipio
VALUES (1786, 2803609, 'Laranjeiras', 'SE', 280360);
INSERT INTO public.municipio
VALUES (1787, 2803708, 'Macambira', 'SE', 280370);
INSERT INTO public.municipio
VALUES (1788, 2803807, 'Malhada dos Bois', 'SE', 280380);
INSERT INTO public.municipio
VALUES (1789, 2803906, 'Malhador', 'SE', 280390);
INSERT INTO public.municipio
VALUES (1790, 2804003, 'Maruim', 'SE', 280400);
INSERT INTO public.municipio
VALUES (1791, 2804102, 'Moita Bonita', 'SE', 280410);
INSERT INTO public.municipio
VALUES (1792, 2804201, 'Monte Alegre de Sergipe', 'SE', 280420);
INSERT INTO public.municipio
VALUES (1793, 2804300, 'Muribeca', 'SE', 280430);
INSERT INTO public.municipio
VALUES (1794, 2804409, 'Neópolis', 'SE', 280440);
INSERT INTO public.municipio
VALUES (1795, 2804458, 'Nossa Senhora Aparecida', 'SE', 280445);
INSERT INTO public.municipio
VALUES (1796, 2804508, 'Nossa Senhora da Glória', 'SE', 280450);
INSERT INTO public.municipio
VALUES (1797, 2804607, 'Nossa Senhora das Dores', 'SE', 280460);
INSERT INTO public.municipio
VALUES (1798, 2804706, 'Nossa Senhora de Lourdes', 'SE', 280470);
INSERT INTO public.municipio
VALUES (1799, 2804805, 'Nossa Senhora do Socorro', 'SE', 280480);
INSERT INTO public.municipio
VALUES (1800, 2804904, 'Pacatuba', 'SE', 280490);
INSERT INTO public.municipio
VALUES (1801, 2805000, 'Pedra Mole', 'SE', 280500);
INSERT INTO public.municipio
VALUES (1802, 2805109, 'Pedrinhas', 'SE', 280510);
INSERT INTO public.municipio
VALUES (1803, 2805208, 'Pinhão', 'SE', 280520);
INSERT INTO public.municipio
VALUES (1804, 2805307, 'Pirambu', 'SE', 280530);
INSERT INTO public.municipio
VALUES (1805, 2805406, 'Poço Redondo', 'SE', 280540);
INSERT INTO public.municipio
VALUES (1806, 2805505, 'Poço Verde', 'SE', 280550);
INSERT INTO public.municipio
VALUES (1807, 2805604, 'Porto da Folha', 'SE', 280560);
INSERT INTO public.municipio
VALUES (1808, 2805703, 'Propriá', 'SE', 280570);
INSERT INTO public.municipio
VALUES (1809, 2805802, 'Riachão do Dantas', 'SE', 280580);
INSERT INTO public.municipio
VALUES (1810, 2805901, 'Riachuelo', 'SE', 280590);
INSERT INTO public.municipio
VALUES (1811, 2806008, 'Ribeirópolis', 'SE', 280600);
INSERT INTO public.municipio
VALUES (1812, 2806107, 'Rosário do Catete', 'SE', 280610);
INSERT INTO public.municipio
VALUES (1813, 2806206, 'Salgado', 'SE', 280620);
INSERT INTO public.municipio
VALUES (1814, 2806305, 'Santa Luzia do Itanhy', 'SE', 280630);
INSERT INTO public.municipio
VALUES (1815, 2806404, 'Santana do São Francisco', 'SE', 280640);
INSERT INTO public.municipio
VALUES (1816, 2806503, 'Santa Rosa de Lima', 'SE', 280650);
INSERT INTO public.municipio
VALUES (1817, 2806602, 'Santo Amaro das Brotas', 'SE', 280660);
INSERT INTO public.municipio
VALUES (1818, 2806701, 'São Cristóvão', 'SE', 280670);
INSERT INTO public.municipio
VALUES (1819, 2806800, 'São Domingos', 'SE', 280680);
INSERT INTO public.municipio
VALUES (1820, 2806909, 'São Francisco', 'SE', 280690);
INSERT INTO public.municipio
VALUES (1821, 2807006, 'São Miguel do Aleixo', 'SE', 280700);
INSERT INTO public.municipio
VALUES (1822, 2807105, 'Simão Dias', 'SE', 280710);
INSERT INTO public.municipio
VALUES (1823, 2807204, 'Siriri', 'SE', 280720);
INSERT INTO public.municipio
VALUES (1824, 2807303, 'Telha', 'SE', 280730);
INSERT INTO public.municipio
VALUES (1825, 2807402, 'Tobias Barreto', 'SE', 280740);
INSERT INTO public.municipio
VALUES (1826, 2807501, 'Tomar do Geru', 'SE', 280750);
INSERT INTO public.municipio
VALUES (1827, 2807600, 'Umbaúba', 'SE', 280760);
INSERT INTO public.municipio
VALUES (1828, 2900108, 'Abaíra', 'BA', 290010);
INSERT INTO public.municipio
VALUES (1829, 2900207, 'Abaré', 'BA', 290020);
INSERT INTO public.municipio
VALUES (1830, 2900306, 'Acajutiba', 'BA', 290030);
INSERT INTO public.municipio
VALUES (1831, 2900355, 'Adustina', 'BA', 290035);
INSERT INTO public.municipio
VALUES (1832, 2900405, 'Água Fria', 'BA', 290040);
INSERT INTO public.municipio
VALUES (1833, 2900504, 'Érico Cardoso', 'BA', 290050);
INSERT INTO public.municipio
VALUES (1834, 2900603, 'Aiquara', 'BA', 290060);
INSERT INTO public.municipio
VALUES (1835, 2900702, 'Alagoinhas', 'BA', 290070);
INSERT INTO public.municipio
VALUES (1836, 2900801, 'Alcobaça', 'BA', 290080);
INSERT INTO public.municipio
VALUES (1837, 2900900, 'Almadina', 'BA', 290090);
INSERT INTO public.municipio
VALUES (1838, 2901007, 'Amargosa', 'BA', 290100);
INSERT INTO public.municipio
VALUES (1839, 2901106, 'Amélia Rodrigues', 'BA', 290110);
INSERT INTO public.municipio
VALUES (1840, 2901155, 'América Dourada', 'BA', 290115);
INSERT INTO public.municipio
VALUES (1841, 2901205, 'Anagé', 'BA', 290120);
INSERT INTO public.municipio
VALUES (1842, 2901304, 'Andaraí', 'BA', 290130);
INSERT INTO public.municipio
VALUES (1843, 2901353, 'Andorinha', 'BA', 290135);
INSERT INTO public.municipio
VALUES (1844, 2901403, 'Angical', 'BA', 290140);
INSERT INTO public.municipio
VALUES (1845, 2901502, 'Anguera', 'BA', 290150);
INSERT INTO public.municipio
VALUES (1846, 2901601, 'Antas', 'BA', 290160);
INSERT INTO public.municipio
VALUES (1847, 2901700, 'Antônio Cardoso', 'BA', 290170);
INSERT INTO public.municipio
VALUES (1848, 2901809, 'Antônio Gonçalves', 'BA', 290180);
INSERT INTO public.municipio
VALUES (1849, 2901908, 'Aporá', 'BA', 290190);
INSERT INTO public.municipio
VALUES (1850, 2901957, 'Apuarema', 'BA', 290195);
INSERT INTO public.municipio
VALUES (1851, 2902005, 'Aracatu', 'BA', 290200);
INSERT INTO public.municipio
VALUES (1852, 2902054, 'Araças', 'BA', 290205);
INSERT INTO public.municipio
VALUES (1853, 2902104, 'Araci', 'BA', 290210);
INSERT INTO public.municipio
VALUES (1854, 2902203, 'Aramari', 'BA', 290220);
INSERT INTO public.municipio
VALUES (1855, 2902252, 'Arataca', 'BA', 290225);
INSERT INTO public.municipio
VALUES (1856, 2902302, 'Aratuípe', 'BA', 290230);
INSERT INTO public.municipio
VALUES (1857, 2902401, 'Aurelino Leal', 'BA', 290240);
INSERT INTO public.municipio
VALUES (1858, 2902500, 'Baianópolis', 'BA', 290250);
INSERT INTO public.municipio
VALUES (1859, 2902609, 'Baixa Grande', 'BA', 290260);
INSERT INTO public.municipio
VALUES (1860, 2902658, 'Banzaê', 'BA', 290265);
INSERT INTO public.municipio
VALUES (1861, 2902708, 'Barra', 'BA', 290270);
INSERT INTO public.municipio
VALUES (1862, 2902807, 'Barra da Estiva', 'BA', 290280);
INSERT INTO public.municipio
VALUES (1863, 2902906, 'Barra do Choça', 'BA', 290290);
INSERT INTO public.municipio
VALUES (1864, 2903003, 'Barra do Mendes', 'BA', 290300);
INSERT INTO public.municipio
VALUES (1865, 2903102, 'Barra do Rocha', 'BA', 290310);
INSERT INTO public.municipio
VALUES (1866, 2903201, 'Barreiras', 'BA', 290320);
INSERT INTO public.municipio
VALUES (1867, 2903235, 'Barro Alto', 'BA', 290323);
INSERT INTO public.municipio
VALUES (1868, 2903276, 'Barrocas', 'BA', 290327);
INSERT INTO public.municipio
VALUES (1869, 2903300, 'Barro Preto', 'BA', 290330);
INSERT INTO public.municipio
VALUES (1870, 2903409, 'Belmonte', 'BA', 290340);
INSERT INTO public.municipio
VALUES (1871, 2903508, 'Belo Campo', 'BA', 290350);
INSERT INTO public.municipio
VALUES (1872, 2903607, 'Biritinga', 'BA', 290360);
INSERT INTO public.municipio
VALUES (1873, 2903706, 'Boa Nova', 'BA', 290370);
INSERT INTO public.municipio
VALUES (1874, 2903805, 'Boa Vista do Tupim', 'BA', 290380);
INSERT INTO public.municipio
VALUES (1875, 2903904, 'Bom Jesus da Lapa', 'BA', 290390);
INSERT INTO public.municipio
VALUES (1876, 2903953, 'Bom Jesus da Serra', 'BA', 290395);
INSERT INTO public.municipio
VALUES (1877, 2904001, 'Boninal', 'BA', 290400);
INSERT INTO public.municipio
VALUES (1878, 2904050, 'Bonito', 'BA', 290405);
INSERT INTO public.municipio
VALUES (1879, 2904100, 'Boquira', 'BA', 290410);
INSERT INTO public.municipio
VALUES (1880, 2904209, 'Botuporã', 'BA', 290420);
INSERT INTO public.municipio
VALUES (1881, 2904308, 'Brejões', 'BA', 290430);
INSERT INTO public.municipio
VALUES (1882, 2904407, 'Brejolândia', 'BA', 290440);
INSERT INTO public.municipio
VALUES (1883, 2904506, 'Brotas de Macaúbas', 'BA', 290450);
INSERT INTO public.municipio
VALUES (1884, 2904605, 'Brumado', 'BA', 290460);
INSERT INTO public.municipio
VALUES (1885, 2904704, 'Buerarema', 'BA', 290470);
INSERT INTO public.municipio
VALUES (1886, 2904753, 'Buritirama', 'BA', 290475);
INSERT INTO public.municipio
VALUES (1887, 2904803, 'Caatiba', 'BA', 290480);
INSERT INTO public.municipio
VALUES (1888, 2904852, 'Cabaceiras do Paraguaçu', 'BA', 290485);
INSERT INTO public.municipio
VALUES (1889, 2904902, 'Cachoeira', 'BA', 290490);
INSERT INTO public.municipio
VALUES (1890, 2905008, 'Caculé', 'BA', 290500);
INSERT INTO public.municipio
VALUES (1891, 2905107, 'Caém', 'BA', 290510);
INSERT INTO public.municipio
VALUES (1892, 2905156, 'Caetanos', 'BA', 290515);
INSERT INTO public.municipio
VALUES (1893, 2905206, 'Caetité', 'BA', 290520);
INSERT INTO public.municipio
VALUES (1894, 2905305, 'Cafarnaum', 'BA', 290530);
INSERT INTO public.municipio
VALUES (1895, 2905404, 'Cairu', 'BA', 290540);
INSERT INTO public.municipio
VALUES (1896, 2905503, 'Caldeirão Grande', 'BA', 290550);
INSERT INTO public.municipio
VALUES (1897, 2905602, 'Camacan', 'BA', 290560);
INSERT INTO public.municipio
VALUES (1898, 2905701, 'Camaçari', 'BA', 290570);
INSERT INTO public.municipio
VALUES (1899, 2905800, 'Camamu', 'BA', 290580);
INSERT INTO public.municipio
VALUES (1900, 2905909, 'Campo Alegre de Lourdes', 'BA', 290590);
INSERT INTO public.municipio
VALUES (1901, 2906006, 'Campo Formoso', 'BA', 290600);
INSERT INTO public.municipio
VALUES (1902, 2906105, 'Canápolis', 'BA', 290610);
INSERT INTO public.municipio
VALUES (1903, 2906204, 'Canarana', 'BA', 290620);
INSERT INTO public.municipio
VALUES (1904, 2906303, 'Canavieiras', 'BA', 290630);
INSERT INTO public.municipio
VALUES (1905, 2906402, 'Candeal', 'BA', 290640);
INSERT INTO public.municipio
VALUES (1906, 2906501, 'Candeias', 'BA', 290650);
INSERT INTO public.municipio
VALUES (1907, 2906600, 'Candiba', 'BA', 290660);
INSERT INTO public.municipio
VALUES (1908, 2906709, 'Cândido Sales', 'BA', 290670);
INSERT INTO public.municipio
VALUES (1909, 2906808, 'Cansanção', 'BA', 290680);
INSERT INTO public.municipio
VALUES (1910, 2906824, 'Canudos', 'BA', 290682);
INSERT INTO public.municipio
VALUES (1911, 2906857, 'Capela do Alto Alegre', 'BA', 290685);
INSERT INTO public.municipio
VALUES (1912, 2906873, 'Capim Grosso', 'BA', 290687);
INSERT INTO public.municipio
VALUES (1913, 2906899, 'Caraíbas', 'BA', 290689);
INSERT INTO public.municipio
VALUES (1914, 2906907, 'Caravelas', 'BA', 290690);
INSERT INTO public.municipio
VALUES (1915, 2907004, 'Cardeal da Silva', 'BA', 290700);
INSERT INTO public.municipio
VALUES (1916, 2907103, 'Carinhanha', 'BA', 290710);
INSERT INTO public.municipio
VALUES (1917, 2907202, 'Casa Nova', 'BA', 290720);
INSERT INTO public.municipio
VALUES (1918, 2907301, 'Castro Alves', 'BA', 290730);
INSERT INTO public.municipio
VALUES (1919, 2907400, 'Catolândia', 'BA', 290740);
INSERT INTO public.municipio
VALUES (1920, 2907509, 'Catu', 'BA', 290750);
INSERT INTO public.municipio
VALUES (1921, 2907558, 'Caturama', 'BA', 290755);
INSERT INTO public.municipio
VALUES (1922, 2907608, 'Central', 'BA', 290760);
INSERT INTO public.municipio
VALUES (1923, 2907707, 'Chorrochó', 'BA', 290770);
INSERT INTO public.municipio
VALUES (1924, 2907806, 'Cícero Dantas', 'BA', 290780);
INSERT INTO public.municipio
VALUES (1925, 2907905, 'Cipó', 'BA', 290790);
INSERT INTO public.municipio
VALUES (1926, 2908002, 'Coaraci', 'BA', 290800);
INSERT INTO public.municipio
VALUES (1927, 2908101, 'Cocos', 'BA', 290810);
INSERT INTO public.municipio
VALUES (1928, 2908200, 'Conceição da Feira', 'BA', 290820);
INSERT INTO public.municipio
VALUES (1929, 2908309, 'Conceição do Almeida', 'BA', 290830);
INSERT INTO public.municipio
VALUES (1930, 2908408, 'Conceição do Coité', 'BA', 290840);
INSERT INTO public.municipio
VALUES (1931, 2908507, 'Conceição do Jacuípe', 'BA', 290850);
INSERT INTO public.municipio
VALUES (1932, 2908606, 'Conde', 'BA', 290860);
INSERT INTO public.municipio
VALUES (1933, 2908705, 'Condeúba', 'BA', 290870);
INSERT INTO public.municipio
VALUES (1934, 2908804, 'Contendas do Sincorá', 'BA', 290880);
INSERT INTO public.municipio
VALUES (1935, 2908903, 'Coração de Maria', 'BA', 290890);
INSERT INTO public.municipio
VALUES (1936, 2909000, 'Cordeiros', 'BA', 290900);
INSERT INTO public.municipio
VALUES (1937, 2909109, 'Coribe', 'BA', 290910);
INSERT INTO public.municipio
VALUES (1938, 2909208, 'Coronel João Sá', 'BA', 290920);
INSERT INTO public.municipio
VALUES (1939, 2909307, 'Correntina', 'BA', 290930);
INSERT INTO public.municipio
VALUES (1940, 2909406, 'Cotegipe', 'BA', 290940);
INSERT INTO public.municipio
VALUES (1941, 2909505, 'Cravolândia', 'BA', 290950);
INSERT INTO public.municipio
VALUES (1942, 2909604, 'Crisópolis', 'BA', 290960);
INSERT INTO public.municipio
VALUES (1943, 2909703, 'Cristópolis', 'BA', 290970);
INSERT INTO public.municipio
VALUES (1944, 2909802, 'Cruz das Almas', 'BA', 290980);
INSERT INTO public.municipio
VALUES (1945, 2909901, 'Curaçá', 'BA', 290990);
INSERT INTO public.municipio
VALUES (1946, 2910008, 'Dário Meira', 'BA', 291000);
INSERT INTO public.municipio
VALUES (1947, 2910057, 'Dias D''Ávila', 'BA', 291005);
INSERT INTO public.municipio
VALUES (1948, 2910107, 'Dom Basílio', 'BA', 291010);
INSERT INTO public.municipio
VALUES (1949, 2910206, 'Dom Macedo Costa', 'BA', 291020);
INSERT INTO public.municipio
VALUES (1950, 2910305, 'Elísio Medrado', 'BA', 291030);
INSERT INTO public.municipio
VALUES (1951, 2910404, 'Encruzilhada', 'BA', 291040);
INSERT INTO public.municipio
VALUES (1952, 2910503, 'Entre Rios', 'BA', 291050);
INSERT INTO public.municipio
VALUES (1953, 2910602, 'Esplanada', 'BA', 291060);
INSERT INTO public.municipio
VALUES (1954, 2910701, 'Euclides da Cunha', 'BA', 291070);
INSERT INTO public.municipio
VALUES (1955, 2910727, 'Eunápolis', 'BA', 291072);
INSERT INTO public.municipio
VALUES (1956, 2910750, 'Fátima', 'BA', 291075);
INSERT INTO public.municipio
VALUES (1957, 2910776, 'Feira da Mata', 'BA', 291077);
INSERT INTO public.municipio
VALUES (1958, 2910800, 'Feira de Santana', 'BA', 291080);
INSERT INTO public.municipio
VALUES (1959, 2910859, 'Filadélfia', 'BA', 291085);
INSERT INTO public.municipio
VALUES (1960, 2910909, 'Firmino Alves', 'BA', 291090);
INSERT INTO public.municipio
VALUES (1961, 2911006, 'Floresta Azul', 'BA', 291100);
INSERT INTO public.municipio
VALUES (1962, 2911105, 'Formosa do Rio Preto', 'BA', 291110);
INSERT INTO public.municipio
VALUES (1963, 2911204, 'Gandu', 'BA', 291120);
INSERT INTO public.municipio
VALUES (1964, 2911253, 'Gavião', 'BA', 291125);
INSERT INTO public.municipio
VALUES (1965, 2911303, 'Gentio do Ouro', 'BA', 291130);
INSERT INTO public.municipio
VALUES (1966, 2911402, 'Glória', 'BA', 291140);
INSERT INTO public.municipio
VALUES (1967, 2911501, 'Gongogi', 'BA', 291150);
INSERT INTO public.municipio
VALUES (1968, 2911600, 'Governador Mangabeira', 'BA', 291160);
INSERT INTO public.municipio
VALUES (1969, 2911659, 'Guajeru', 'BA', 291165);
INSERT INTO public.municipio
VALUES (1970, 2911709, 'Guanambi', 'BA', 291170);
INSERT INTO public.municipio
VALUES (1971, 2911808, 'Guaratinga', 'BA', 291180);
INSERT INTO public.municipio
VALUES (1972, 2911857, 'Heliópolis', 'BA', 291185);
INSERT INTO public.municipio
VALUES (1973, 2911907, 'Iaçu', 'BA', 291190);
INSERT INTO public.municipio
VALUES (1974, 2912004, 'Ibiassucê', 'BA', 291200);
INSERT INTO public.municipio
VALUES (1975, 2912103, 'Ibicaraí', 'BA', 291210);
INSERT INTO public.municipio
VALUES (1976, 2912202, 'Ibicoara', 'BA', 291220);
INSERT INTO public.municipio
VALUES (1977, 2912301, 'Ibicuí', 'BA', 291230);
INSERT INTO public.municipio
VALUES (1978, 2912400, 'Ibipeba', 'BA', 291240);
INSERT INTO public.municipio
VALUES (1979, 2912509, 'Ibipitanga', 'BA', 291250);
INSERT INTO public.municipio
VALUES (1980, 2912608, 'Ibiquera', 'BA', 291260);
INSERT INTO public.municipio
VALUES (1981, 2912707, 'Ibirapitanga', 'BA', 291270);
INSERT INTO public.municipio
VALUES (1982, 2912806, 'Ibirapuã', 'BA', 291280);
INSERT INTO public.municipio
VALUES (1983, 2912905, 'Ibirataia', 'BA', 291290);
INSERT INTO public.municipio
VALUES (1984, 2913002, 'Ibitiara', 'BA', 291300);
INSERT INTO public.municipio
VALUES (1985, 2913101, 'Ibititá', 'BA', 291310);
INSERT INTO public.municipio
VALUES (1986, 2913200, 'Ibotirama', 'BA', 291320);
INSERT INTO public.municipio
VALUES (1987, 2913309, 'Ichu', 'BA', 291330);
INSERT INTO public.municipio
VALUES (1988, 2913408, 'Igaporã', 'BA', 291340);
INSERT INTO public.municipio
VALUES (1989, 2913457, 'Igrapiúna', 'BA', 291345);
INSERT INTO public.municipio
VALUES (1990, 2913507, 'Iguaí', 'BA', 291350);
INSERT INTO public.municipio
VALUES (1991, 2913606, 'Ilhéus', 'BA', 291360);
INSERT INTO public.municipio
VALUES (1992, 2913705, 'Inhambupe', 'BA', 291370);
INSERT INTO public.municipio
VALUES (1993, 2913804, 'Ipecaetá', 'BA', 291380);
INSERT INTO public.municipio
VALUES (1994, 2913903, 'Ipiaú', 'BA', 291390);
INSERT INTO public.municipio
VALUES (1995, 2914000, 'Ipirá', 'BA', 291400);
INSERT INTO public.municipio
VALUES (1996, 2914109, 'Ipupiara', 'BA', 291410);
INSERT INTO public.municipio
VALUES (1997, 2914208, 'Irajuba', 'BA', 291420);
INSERT INTO public.municipio
VALUES (1998, 2914307, 'Iramaia', 'BA', 291430);
INSERT INTO public.municipio
VALUES (1999, 2914406, 'Iraquara', 'BA', 291440);
INSERT INTO public.municipio
VALUES (2000, 2914505, 'Irará', 'BA', 291450);
INSERT INTO public.municipio
VALUES (2001, 2914604, 'Irecê', 'BA', 291460);
INSERT INTO public.municipio
VALUES (2002, 2914653, 'Itabela', 'BA', 291465);
INSERT INTO public.municipio
VALUES (2003, 2914703, 'Itaberaba', 'BA', 291470);
INSERT INTO public.municipio
VALUES (2004, 2914802, 'Itabuna', 'BA', 291480);
INSERT INTO public.municipio
VALUES (2005, 2914901, 'Itacaré', 'BA', 291490);
INSERT INTO public.municipio
VALUES (2006, 2915007, 'Itaeté', 'BA', 291500);
INSERT INTO public.municipio
VALUES (2007, 2915106, 'Itagi', 'BA', 291510);
INSERT INTO public.municipio
VALUES (2008, 2915205, 'Itagibá', 'BA', 291520);
INSERT INTO public.municipio
VALUES (2009, 2915304, 'Itagimirim', 'BA', 291530);
INSERT INTO public.municipio
VALUES (2010, 2915353, 'Itaguaçu da Bahia', 'BA', 291535);
INSERT INTO public.municipio
VALUES (2011, 2915403, 'Itaju do Colônia', 'BA', 291540);
INSERT INTO public.municipio
VALUES (2012, 2915502, 'Itajuípe', 'BA', 291550);
INSERT INTO public.municipio
VALUES (2013, 2915601, 'Itamaraju', 'BA', 291560);
INSERT INTO public.municipio
VALUES (2014, 2915700, 'Itamari', 'BA', 291570);
INSERT INTO public.municipio
VALUES (2015, 2915809, 'Itambé', 'BA', 291580);
INSERT INTO public.municipio
VALUES (2016, 2915908, 'Itanagra', 'BA', 291590);
INSERT INTO public.municipio
VALUES (2017, 2916005, 'Itanhém', 'BA', 291600);
INSERT INTO public.municipio
VALUES (2018, 2916104, 'Itaparica', 'BA', 291610);
INSERT INTO public.municipio
VALUES (2019, 2916203, 'Itapé', 'BA', 291620);
INSERT INTO public.municipio
VALUES (2020, 2916302, 'Itapebi', 'BA', 291630);
INSERT INTO public.municipio
VALUES (2021, 2916401, 'Itapetinga', 'BA', 291640);
INSERT INTO public.municipio
VALUES (2022, 2916500, 'Itapicuru', 'BA', 291650);
INSERT INTO public.municipio
VALUES (2023, 2916609, 'Itapitanga', 'BA', 291660);
INSERT INTO public.municipio
VALUES (2024, 2916708, 'Itaquara', 'BA', 291670);
INSERT INTO public.municipio
VALUES (2025, 2916807, 'Itarantim', 'BA', 291680);
INSERT INTO public.municipio
VALUES (2026, 2916856, 'Itatim', 'BA', 291685);
INSERT INTO public.municipio
VALUES (2027, 2916906, 'Itiruçu', 'BA', 291690);
INSERT INTO public.municipio
VALUES (2028, 2917003, 'Itiúba', 'BA', 291700);
INSERT INTO public.municipio
VALUES (2029, 2917102, 'Itororó', 'BA', 291710);
INSERT INTO public.municipio
VALUES (2030, 2917201, 'Ituaçu', 'BA', 291720);
INSERT INTO public.municipio
VALUES (2031, 2917300, 'Ituberá', 'BA', 291730);
INSERT INTO public.municipio
VALUES (2032, 2917334, 'Iuiú', 'BA', 291733);
INSERT INTO public.municipio
VALUES (2033, 2917359, 'Jaborandi', 'BA', 291735);
INSERT INTO public.municipio
VALUES (2034, 2917409, 'Jacaraci', 'BA', 291740);
INSERT INTO public.municipio
VALUES (2035, 2917508, 'Jacobina', 'BA', 291750);
INSERT INTO public.municipio
VALUES (2036, 2917607, 'Jaguaquara', 'BA', 291760);
INSERT INTO public.municipio
VALUES (2037, 2917706, 'Jaguarari', 'BA', 291770);
INSERT INTO public.municipio
VALUES (2038, 2917805, 'Jaguaripe', 'BA', 291780);
INSERT INTO public.municipio
VALUES (2039, 2917904, 'Jandaíra', 'BA', 291790);
INSERT INTO public.municipio
VALUES (2040, 2918001, 'Jequié', 'BA', 291800);
INSERT INTO public.municipio
VALUES (2041, 2918100, 'Jeremoabo', 'BA', 291810);
INSERT INTO public.municipio
VALUES (2042, 2918209, 'Jiquiriçá', 'BA', 291820);
INSERT INTO public.municipio
VALUES (2043, 2918308, 'Jitaúna', 'BA', 291830);
INSERT INTO public.municipio
VALUES (2044, 2918357, 'João Dourado', 'BA', 291835);
INSERT INTO public.municipio
VALUES (2045, 2918407, 'Juazeiro', 'BA', 291840);
INSERT INTO public.municipio
VALUES (2046, 2918456, 'Jucuruçu', 'BA', 291845);
INSERT INTO public.municipio
VALUES (2047, 2918506, 'Jussara', 'BA', 291850);
INSERT INTO public.municipio
VALUES (2048, 2918555, 'Jussari', 'BA', 291855);
INSERT INTO public.municipio
VALUES (2049, 2918605, 'Jussiape', 'BA', 291860);
INSERT INTO public.municipio
VALUES (2050, 2918704, 'Lafaiete Coutinho', 'BA', 291870);
INSERT INTO public.municipio
VALUES (2051, 2918753, 'Lagoa Real', 'BA', 291875);
INSERT INTO public.municipio
VALUES (2052, 2918803, 'Laje', 'BA', 291880);
INSERT INTO public.municipio
VALUES (2053, 2918902, 'Lajedão', 'BA', 291890);
INSERT INTO public.municipio
VALUES (2054, 2919009, 'Lajedinho', 'BA', 291900);
INSERT INTO public.municipio
VALUES (2055, 2919058, 'Lajedo do Tabocal', 'BA', 291905);
INSERT INTO public.municipio
VALUES (2056, 2919108, 'Lamarão', 'BA', 291910);
INSERT INTO public.municipio
VALUES (2057, 2919157, 'Lapão', 'BA', 291915);
INSERT INTO public.municipio
VALUES (2058, 2919207, 'Lauro de Freitas', 'BA', 291920);
INSERT INTO public.municipio
VALUES (2059, 2919306, 'Lençóis', 'BA', 291930);
INSERT INTO public.municipio
VALUES (2060, 2919405, 'Licínio de Almeida', 'BA', 291940);
INSERT INTO public.municipio
VALUES (2061, 2919504, 'Livramento de Nossa Senhora', 'BA', 291950);
INSERT INTO public.municipio
VALUES (2062, 2919553, 'Luís Eduardo Magalhães', 'BA', 291955);
INSERT INTO public.municipio
VALUES (2063, 2919603, 'Macajuba', 'BA', 291960);
INSERT INTO public.municipio
VALUES (2064, 2919702, 'Macarani', 'BA', 291970);
INSERT INTO public.municipio
VALUES (2065, 2919801, 'Macaúbas', 'BA', 291980);
INSERT INTO public.municipio
VALUES (2066, 2919900, 'Macururé', 'BA', 291990);
INSERT INTO public.municipio
VALUES (2067, 2919926, 'Madre de Deus', 'BA', 291992);
INSERT INTO public.municipio
VALUES (2068, 2919959, 'Maetinga', 'BA', 291995);
INSERT INTO public.municipio
VALUES (2069, 2920007, 'Maiquinique', 'BA', 292000);
INSERT INTO public.municipio
VALUES (2070, 2920106, 'Mairi', 'BA', 292010);
INSERT INTO public.municipio
VALUES (2071, 2920205, 'Malhada', 'BA', 292020);
INSERT INTO public.municipio
VALUES (2072, 2920304, 'Malhada de Pedras', 'BA', 292030);
INSERT INTO public.municipio
VALUES (2073, 2920403, 'Manoel Vitorino', 'BA', 292040);
INSERT INTO public.municipio
VALUES (2074, 2920452, 'Mansidão', 'BA', 292045);
INSERT INTO public.municipio
VALUES (2075, 2920502, 'Maracás', 'BA', 292050);
INSERT INTO public.municipio
VALUES (2076, 2920601, 'Maragogipe', 'BA', 292060);
INSERT INTO public.municipio
VALUES (2077, 2920700, 'Maraú', 'BA', 292070);
INSERT INTO public.municipio
VALUES (2078, 2920809, 'Marcionílio Souza', 'BA', 292080);
INSERT INTO public.municipio
VALUES (2079, 2920908, 'Mascote', 'BA', 292090);
INSERT INTO public.municipio
VALUES (2080, 2921005, 'Mata de São João', 'BA', 292100);
INSERT INTO public.municipio
VALUES (2081, 2921054, 'Matina', 'BA', 292105);
INSERT INTO public.municipio
VALUES (2082, 2921104, 'Medeiros Neto', 'BA', 292110);
INSERT INTO public.municipio
VALUES (2083, 2921203, 'Miguel Calmon', 'BA', 292120);
INSERT INTO public.municipio
VALUES (2084, 2921302, 'Milagres', 'BA', 292130);
INSERT INTO public.municipio
VALUES (2085, 2921401, 'Mirangaba', 'BA', 292140);
INSERT INTO public.municipio
VALUES (2086, 2921450, 'Mirante', 'BA', 292145);
INSERT INTO public.municipio
VALUES (2087, 2921500, 'Monte Santo', 'BA', 292150);
INSERT INTO public.municipio
VALUES (2088, 2921609, 'Morpará', 'BA', 292160);
INSERT INTO public.municipio
VALUES (2089, 2921708, 'Morro do Chapéu', 'BA', 292170);
INSERT INTO public.municipio
VALUES (2090, 2921807, 'Mortugaba', 'BA', 292180);
INSERT INTO public.municipio
VALUES (2091, 2921906, 'Mucugê', 'BA', 292190);
INSERT INTO public.municipio
VALUES (2092, 2922003, 'Mucuri', 'BA', 292200);
INSERT INTO public.municipio
VALUES (2093, 2922052, 'Mulungu do Morro', 'BA', 292205);
INSERT INTO public.municipio
VALUES (2094, 2922102, 'Mundo Novo', 'BA', 292210);
INSERT INTO public.municipio
VALUES (2095, 2922201, 'Muniz Ferreira', 'BA', 292220);
INSERT INTO public.municipio
VALUES (2096, 2922250, 'Muquém de São Francisco', 'BA', 292225);
INSERT INTO public.municipio
VALUES (2097, 2922300, 'Muritiba', 'BA', 292230);
INSERT INTO public.municipio
VALUES (2098, 2922409, 'Mutuípe', 'BA', 292240);
INSERT INTO public.municipio
VALUES (2099, 2922508, 'Nazaré', 'BA', 292250);
INSERT INTO public.municipio
VALUES (2100, 2922607, 'Nilo Peçanha', 'BA', 292260);
INSERT INTO public.municipio
VALUES (2101, 2922656, 'Nordestina', 'BA', 292265);
INSERT INTO public.municipio
VALUES (2102, 2922706, 'Nova Canaã', 'BA', 292270);
INSERT INTO public.municipio
VALUES (2103, 2922730, 'Nova Fátima', 'BA', 292273);
INSERT INTO public.municipio
VALUES (2104, 2922755, 'Nova Ibiá', 'BA', 292275);
INSERT INTO public.municipio
VALUES (2105, 2922805, 'Nova Itarana', 'BA', 292280);
INSERT INTO public.municipio
VALUES (2106, 2922854, 'Nova Redenção', 'BA', 292285);
INSERT INTO public.municipio
VALUES (2107, 2922904, 'Nova Soure', 'BA', 292290);
INSERT INTO public.municipio
VALUES (2108, 2923001, 'Nova Viçosa', 'BA', 292300);
INSERT INTO public.municipio
VALUES (2109, 2923035, 'Novo Horizonte', 'BA', 292303);
INSERT INTO public.municipio
VALUES (2110, 2923050, 'Novo Triunfo', 'BA', 292305);
INSERT INTO public.municipio
VALUES (2111, 2923100, 'Olindina', 'BA', 292310);
INSERT INTO public.municipio
VALUES (2112, 2923209, 'Oliveira dos Brejinhos', 'BA', 292320);
INSERT INTO public.municipio
VALUES (2113, 2923308, 'Ouriçangas', 'BA', 292330);
INSERT INTO public.municipio
VALUES (2114, 2923357, 'Ourolândia', 'BA', 292335);
INSERT INTO public.municipio
VALUES (2115, 2923407, 'Palmas de Monte Alto', 'BA', 292340);
INSERT INTO public.municipio
VALUES (2116, 2923506, 'Palmeiras', 'BA', 292350);
INSERT INTO public.municipio
VALUES (2117, 2923605, 'Paramirim', 'BA', 292360);
INSERT INTO public.municipio
VALUES (2118, 2923704, 'Paratinga', 'BA', 292370);
INSERT INTO public.municipio
VALUES (2119, 2923803, 'Paripiranga', 'BA', 292380);
INSERT INTO public.municipio
VALUES (2120, 2923902, 'Pau Brasil', 'BA', 292390);
INSERT INTO public.municipio
VALUES (2121, 2924009, 'Paulo Afonso', 'BA', 292400);
INSERT INTO public.municipio
VALUES (2122, 2924058, 'Pé de Serra', 'BA', 292405);
INSERT INTO public.municipio
VALUES (2123, 2924108, 'Pedrão', 'BA', 292410);
INSERT INTO public.municipio
VALUES (2124, 2924207, 'Pedro Alexandre', 'BA', 292420);
INSERT INTO public.municipio
VALUES (2125, 2924306, 'Piatã', 'BA', 292430);
INSERT INTO public.municipio
VALUES (2126, 2924405, 'Pilão Arcado', 'BA', 292440);
INSERT INTO public.municipio
VALUES (2127, 2924504, 'Pindaí', 'BA', 292450);
INSERT INTO public.municipio
VALUES (2128, 2924603, 'Pindobaçu', 'BA', 292460);
INSERT INTO public.municipio
VALUES (2129, 2924652, 'Pintadas', 'BA', 292465);
INSERT INTO public.municipio
VALUES (2130, 2924678, 'Piraí do Norte', 'BA', 292467);
INSERT INTO public.municipio
VALUES (2131, 2924702, 'Piripá', 'BA', 292470);
INSERT INTO public.municipio
VALUES (2132, 2924801, 'Piritiba', 'BA', 292480);
INSERT INTO public.municipio
VALUES (2133, 2924900, 'Planaltino', 'BA', 292490);
INSERT INTO public.municipio
VALUES (2134, 2925006, 'Planalto', 'BA', 292500);
INSERT INTO public.municipio
VALUES (2135, 2925105, 'Poções', 'BA', 292510);
INSERT INTO public.municipio
VALUES (2136, 2925204, 'Pojuca', 'BA', 292520);
INSERT INTO public.municipio
VALUES (2137, 2925253, 'Ponto Novo', 'BA', 292525);
INSERT INTO public.municipio
VALUES (2138, 2925303, 'Porto Seguro', 'BA', 292530);
INSERT INTO public.municipio
VALUES (2139, 2925402, 'Potiraguá', 'BA', 292540);
INSERT INTO public.municipio
VALUES (2140, 2925501, 'Prado', 'BA', 292550);
INSERT INTO public.municipio
VALUES (2141, 2925600, 'Presidente Dutra', 'BA', 292560);
INSERT INTO public.municipio
VALUES (2142, 2925709, 'Presidente Jânio Quadros', 'BA', 292570);
INSERT INTO public.municipio
VALUES (2143, 2925758, 'Presidente Tancredo Neves', 'BA', 292575);
INSERT INTO public.municipio
VALUES (2144, 2925808, 'Queimadas', 'BA', 292580);
INSERT INTO public.municipio
VALUES (2145, 2925907, 'Quijingue', 'BA', 292590);
INSERT INTO public.municipio
VALUES (2146, 2925931, 'Quixabeira', 'BA', 292593);
INSERT INTO public.municipio
VALUES (2147, 2925956, 'Rafael Jambeiro', 'BA', 292595);
INSERT INTO public.municipio
VALUES (2148, 2926004, 'Remanso', 'BA', 292600);
INSERT INTO public.municipio
VALUES (2149, 2926103, 'Retirolândia', 'BA', 292610);
INSERT INTO public.municipio
VALUES (2150, 2926202, 'Riachão das Neves', 'BA', 292620);
INSERT INTO public.municipio
VALUES (2151, 2926301, 'Riachão do Jacuípe', 'BA', 292630);
INSERT INTO public.municipio
VALUES (2152, 2926400, 'Riacho de Santana', 'BA', 292640);
INSERT INTO public.municipio
VALUES (2153, 2926509, 'Ribeira do Amparo', 'BA', 292650);
INSERT INTO public.municipio
VALUES (2154, 2926608, 'Ribeira do Pombal', 'BA', 292660);
INSERT INTO public.municipio
VALUES (2155, 2926657, 'Ribeirão do Largo', 'BA', 292665);
INSERT INTO public.municipio
VALUES (2156, 2926707, 'Rio de Contas', 'BA', 292670);
INSERT INTO public.municipio
VALUES (2157, 2926806, 'Rio do Antônio', 'BA', 292680);
INSERT INTO public.municipio
VALUES (2158, 2926905, 'Rio do Pires', 'BA', 292690);
INSERT INTO public.municipio
VALUES (2159, 2927002, 'Rio Real', 'BA', 292700);
INSERT INTO public.municipio
VALUES (2160, 2927101, 'Rodelas', 'BA', 292710);
INSERT INTO public.municipio
VALUES (2161, 2927200, 'Ruy Barbosa', 'BA', 292720);
INSERT INTO public.municipio
VALUES (2162, 2927309, 'Salinas da Margarida', 'BA', 292730);
INSERT INTO public.municipio
VALUES (2163, 2927408, 'Salvador', 'BA', 292740);
INSERT INTO public.municipio
VALUES (2164, 2927507, 'Santa Bárbara', 'BA', 292750);
INSERT INTO public.municipio
VALUES (2165, 2927606, 'Santa Brígida', 'BA', 292760);
INSERT INTO public.municipio
VALUES (2166, 2927705, 'Santa Cruz Cabrália', 'BA', 292770);
INSERT INTO public.municipio
VALUES (2167, 2927804, 'Santa Cruz da Vitória', 'BA', 292780);
INSERT INTO public.municipio
VALUES (2168, 2927903, 'Santa Inês', 'BA', 292790);
INSERT INTO public.municipio
VALUES (2169, 2928000, 'Santaluz', 'BA', 292800);
INSERT INTO public.municipio
VALUES (2170, 2928059, 'Santa Luzia', 'BA', 292805);
INSERT INTO public.municipio
VALUES (2171, 2928109, 'Santa Maria da Vitória', 'BA', 292810);
INSERT INTO public.municipio
VALUES (2172, 2928208, 'Santana', 'BA', 292820);
INSERT INTO public.municipio
VALUES (2173, 2928307, 'Santanópolis', 'BA', 292830);
INSERT INTO public.municipio
VALUES (2174, 2928406, 'Santa Rita de Cássia', 'BA', 292840);
INSERT INTO public.municipio
VALUES (2175, 2928505, 'Santa Teresinha', 'BA', 292850);
INSERT INTO public.municipio
VALUES (2176, 2928604, 'Santo Amaro', 'BA', 292860);
INSERT INTO public.municipio
VALUES (2177, 2928703, 'Santo Antônio de Jesus', 'BA', 292870);
INSERT INTO public.municipio
VALUES (2178, 2928802, 'Santo Estêvão', 'BA', 292880);
INSERT INTO public.municipio
VALUES (2179, 2928901, 'São Desidério', 'BA', 292890);
INSERT INTO public.municipio
VALUES (2180, 2928950, 'São Domingos', 'BA', 292895);
INSERT INTO public.municipio
VALUES (2181, 2929008, 'São Félix', 'BA', 292900);
INSERT INTO public.municipio
VALUES (2182, 2929057, 'São Félix do Coribe', 'BA', 292905);
INSERT INTO public.municipio
VALUES (2183, 2929107, 'São Felipe', 'BA', 292910);
INSERT INTO public.municipio
VALUES (2184, 2929206, 'São Francisco do Conde', 'BA', 292920);
INSERT INTO public.municipio
VALUES (2185, 2929255, 'São Gabriel', 'BA', 292925);
INSERT INTO public.municipio
VALUES (2186, 2929305, 'São Gonçalo dos Campos', 'BA', 292930);
INSERT INTO public.municipio
VALUES (2187, 2929354, 'São José da Vitória', 'BA', 292935);
INSERT INTO public.municipio
VALUES (2188, 2929370, 'São José do Jacuípe', 'BA', 292937);
INSERT INTO public.municipio
VALUES (2189, 2929404, 'São Miguel das Matas', 'BA', 292940);
INSERT INTO public.municipio
VALUES (2190, 2929503, 'São Sebastião do Passé', 'BA', 292950);
INSERT INTO public.municipio
VALUES (2191, 2929602, 'Sapeaçu', 'BA', 292960);
INSERT INTO public.municipio
VALUES (2192, 2929701, 'Sátiro Dias', 'BA', 292970);
INSERT INTO public.municipio
VALUES (2193, 2929750, 'Saubara', 'BA', 292975);
INSERT INTO public.municipio
VALUES (2194, 2929800, 'Saúde', 'BA', 292980);
INSERT INTO public.municipio
VALUES (2195, 2929909, 'Seabra', 'BA', 292990);
INSERT INTO public.municipio
VALUES (2196, 2930006, 'Sebastião Laranjeiras', 'BA', 293000);
INSERT INTO public.municipio
VALUES (2197, 2930105, 'Senhor do Bonfim', 'BA', 293010);
INSERT INTO public.municipio
VALUES (2198, 2930154, 'Serra do Ramalho', 'BA', 293015);
INSERT INTO public.municipio
VALUES (2199, 2930204, 'Sento Sé', 'BA', 293020);
INSERT INTO public.municipio
VALUES (2200, 2930303, 'Serra Dourada', 'BA', 293030);
INSERT INTO public.municipio
VALUES (2201, 2930402, 'Serra Preta', 'BA', 293040);
INSERT INTO public.municipio
VALUES (2202, 2930501, 'Serrinha', 'BA', 293050);
INSERT INTO public.municipio
VALUES (2203, 2930600, 'Serrolândia', 'BA', 293060);
INSERT INTO public.municipio
VALUES (2204, 2930709, 'Simões Filho', 'BA', 293070);
INSERT INTO public.municipio
VALUES (2205, 2930758, 'Sítio do Mato', 'BA', 293075);
INSERT INTO public.municipio
VALUES (2206, 2930766, 'Sítio do Quinto', 'BA', 293076);
INSERT INTO public.municipio
VALUES (2207, 2930774, 'Sobradinho', 'BA', 293077);
INSERT INTO public.municipio
VALUES (2208, 2930808, 'Souto Soares', 'BA', 293080);
INSERT INTO public.municipio
VALUES (2209, 2930907, 'Tabocas do Brejo Velho', 'BA', 293090);
INSERT INTO public.municipio
VALUES (2210, 2931004, 'Tanhaçu', 'BA', 293100);
INSERT INTO public.municipio
VALUES (2211, 2931053, 'Tanque Novo', 'BA', 293105);
INSERT INTO public.municipio
VALUES (2212, 2931103, 'Tanquinho', 'BA', 293110);
INSERT INTO public.municipio
VALUES (2213, 2931202, 'Taperoá', 'BA', 293120);
INSERT INTO public.municipio
VALUES (2214, 2931301, 'Tapiramutá', 'BA', 293130);
INSERT INTO public.municipio
VALUES (2215, 2931350, 'Teixeira de Freitas', 'BA', 293135);
INSERT INTO public.municipio
VALUES (2216, 2931400, 'Teodoro Sampaio', 'BA', 293140);
INSERT INTO public.municipio
VALUES (2217, 2931509, 'Teofilândia', 'BA', 293150);
INSERT INTO public.municipio
VALUES (2218, 2931608, 'Teolândia', 'BA', 293160);
INSERT INTO public.municipio
VALUES (2219, 2931707, 'Terra Nova', 'BA', 293170);
INSERT INTO public.municipio
VALUES (2220, 2931806, 'Tremedal', 'BA', 293180);
INSERT INTO public.municipio
VALUES (2221, 2931905, 'Tucano', 'BA', 293190);
INSERT INTO public.municipio
VALUES (2222, 2932002, 'Uauá', 'BA', 293200);
INSERT INTO public.municipio
VALUES (2223, 2932101, 'Ubaíra', 'BA', 293210);
INSERT INTO public.municipio
VALUES (2224, 2932200, 'Ubaitaba', 'BA', 293220);
INSERT INTO public.municipio
VALUES (2225, 2932309, 'Ubatã', 'BA', 293230);
INSERT INTO public.municipio
VALUES (2226, 2932408, 'Uibaí', 'BA', 293240);
INSERT INTO public.municipio
VALUES (2227, 2932457, 'Umburanas', 'BA', 293245);
INSERT INTO public.municipio
VALUES (2228, 2932507, 'Una', 'BA', 293250);
INSERT INTO public.municipio
VALUES (2229, 2932606, 'Urandi', 'BA', 293260);
INSERT INTO public.municipio
VALUES (2230, 2932705, 'Uruçuca', 'BA', 293270);
INSERT INTO public.municipio
VALUES (2231, 2932804, 'Utinga', 'BA', 293280);
INSERT INTO public.municipio
VALUES (2232, 2932903, 'Valença', 'BA', 293290);
INSERT INTO public.municipio
VALUES (2233, 2933000, 'Valente', 'BA', 293300);
INSERT INTO public.municipio
VALUES (2234, 2933059, 'Várzea da Roça', 'BA', 293305);
INSERT INTO public.municipio
VALUES (2235, 2933109, 'Várzea do Poço', 'BA', 293310);
INSERT INTO public.municipio
VALUES (2236, 2933158, 'Várzea Nova', 'BA', 293315);
INSERT INTO public.municipio
VALUES (2237, 2933174, 'Varzedo', 'BA', 293317);
INSERT INTO public.municipio
VALUES (2238, 2933208, 'Vera Cruz', 'BA', 293320);
INSERT INTO public.municipio
VALUES (2239, 2933257, 'Vereda', 'BA', 293325);
INSERT INTO public.municipio
VALUES (2240, 2933307, 'Vitória da Conquista', 'BA', 293330);
INSERT INTO public.municipio
VALUES (2241, 2933406, 'Wagner', 'BA', 293340);
INSERT INTO public.municipio
VALUES (2242, 2933455, 'Wanderley', 'BA', 293345);
INSERT INTO public.municipio
VALUES (2243, 2933505, 'Wenceslau Guimarães', 'BA', 293350);
INSERT INTO public.municipio
VALUES (2244, 2933604, 'Xique-Xique', 'BA', 293360);
INSERT INTO public.municipio
VALUES (2245, 3100104, 'Abadia dos Dourados', 'MG', 310010);
INSERT INTO public.municipio
VALUES (2246, 3100203, 'Abaeté', 'MG', 310020);
INSERT INTO public.municipio
VALUES (2247, 3100302, 'Abre Campo', 'MG', 310030);
INSERT INTO public.municipio
VALUES (2248, 3100401, 'Acaiaca', 'MG', 310040);
INSERT INTO public.municipio
VALUES (2249, 3100500, 'Açucena', 'MG', 310050);
INSERT INTO public.municipio
VALUES (2250, 3100609, 'Água Boa', 'MG', 310060);
INSERT INTO public.municipio
VALUES (2251, 3100708, 'Água Comprida', 'MG', 310070);
INSERT INTO public.municipio
VALUES (2252, 3100807, 'Aguanil', 'MG', 310080);
INSERT INTO public.municipio
VALUES (2253, 3100906, 'Águas Formosas', 'MG', 310090);
INSERT INTO public.municipio
VALUES (2254, 3101003, 'Águas Vermelhas', 'MG', 310100);
INSERT INTO public.municipio
VALUES (2255, 3101102, 'Aimorés', 'MG', 310110);
INSERT INTO public.municipio
VALUES (2256, 3101201, 'Aiuruoca', 'MG', 310120);
INSERT INTO public.municipio
VALUES (2257, 3101300, 'Alagoa', 'MG', 310130);
INSERT INTO public.municipio
VALUES (2258, 3101409, 'Albertina', 'MG', 310140);
INSERT INTO public.municipio
VALUES (2259, 3101508, 'Além Paraíba', 'MG', 310150);
INSERT INTO public.municipio
VALUES (2260, 3101607, 'Alfenas', 'MG', 310160);
INSERT INTO public.municipio
VALUES (2261, 3101631, 'Alfredo Vasconcelos', 'MG', 310163);
INSERT INTO public.municipio
VALUES (2262, 3101706, 'Almenara', 'MG', 310170);
INSERT INTO public.municipio
VALUES (2263, 3101805, 'Alpercata', 'MG', 310180);
INSERT INTO public.municipio
VALUES (2264, 3101904, 'Alpinópolis', 'MG', 310190);
INSERT INTO public.municipio
VALUES (2265, 3102001, 'Alterosa', 'MG', 310200);
INSERT INTO public.municipio
VALUES (2266, 3102050, 'Alto Caparaó', 'MG', 310205);
INSERT INTO public.municipio
VALUES (2267, 3102100, 'Alto Rio Doce', 'MG', 310210);
INSERT INTO public.municipio
VALUES (2268, 3102209, 'Alvarenga', 'MG', 310220);
INSERT INTO public.municipio
VALUES (2269, 3102308, 'Alvinópolis', 'MG', 310230);
INSERT INTO public.municipio
VALUES (2270, 3102407, 'Alvorada de Minas', 'MG', 310240);
INSERT INTO public.municipio
VALUES (2271, 3102506, 'Amparo do Serra', 'MG', 310250);
INSERT INTO public.municipio
VALUES (2272, 3102605, 'Andradas', 'MG', 310260);
INSERT INTO public.municipio
VALUES (2273, 3102704, 'Cachoeira de Pajeú', 'MG', 310270);
INSERT INTO public.municipio
VALUES (2274, 3102803, 'Andrelândia', 'MG', 310280);
INSERT INTO public.municipio
VALUES (2275, 3102852, 'Angelândia', 'MG', 310285);
INSERT INTO public.municipio
VALUES (2276, 3102902, 'Antônio Carlos', 'MG', 310290);
INSERT INTO public.municipio
VALUES (2277, 3103009, 'Antônio Dias', 'MG', 310300);
INSERT INTO public.municipio
VALUES (2278, 3103108, 'Antônio Prado de Minas', 'MG', 310310);
INSERT INTO public.municipio
VALUES (2279, 3103207, 'Araçaí', 'MG', 310320);
INSERT INTO public.municipio
VALUES (2280, 3103306, 'Aracitaba', 'MG', 310330);
INSERT INTO public.municipio
VALUES (2281, 3103405, 'Araçuaí', 'MG', 310340);
INSERT INTO public.municipio
VALUES (2282, 3103504, 'Araguari', 'MG', 310350);
INSERT INTO public.municipio
VALUES (2283, 3103603, 'Arantina', 'MG', 310360);
INSERT INTO public.municipio
VALUES (2284, 3103702, 'Araponga', 'MG', 310370);
INSERT INTO public.municipio
VALUES (2285, 3103751, 'Araporã', 'MG', 310375);
INSERT INTO public.municipio
VALUES (2286, 3103801, 'Arapuá', 'MG', 310380);
INSERT INTO public.municipio
VALUES (2287, 3103900, 'Araújos', 'MG', 310390);
INSERT INTO public.municipio
VALUES (2288, 3104007, 'Araxá', 'MG', 310400);
INSERT INTO public.municipio
VALUES (2289, 3104106, 'Arceburgo', 'MG', 310410);
INSERT INTO public.municipio
VALUES (2290, 3104205, 'Arcos', 'MG', 310420);
INSERT INTO public.municipio
VALUES (2291, 3104304, 'Areado', 'MG', 310430);
INSERT INTO public.municipio
VALUES (2292, 3104403, 'Argirita', 'MG', 310440);
INSERT INTO public.municipio
VALUES (2293, 3104452, 'Aricanduva', 'MG', 310445);
INSERT INTO public.municipio
VALUES (2294, 3104502, 'Arinos', 'MG', 310450);
INSERT INTO public.municipio
VALUES (2295, 3104601, 'Astolfo Dutra', 'MG', 310460);
INSERT INTO public.municipio
VALUES (2296, 3104700, 'Ataléia', 'MG', 310470);
INSERT INTO public.municipio
VALUES (2297, 3104809, 'Augusto de Lima', 'MG', 310480);
INSERT INTO public.municipio
VALUES (2298, 3104908, 'Baependi', 'MG', 310490);
INSERT INTO public.municipio
VALUES (2299, 3105004, 'Baldim', 'MG', 310500);
INSERT INTO public.municipio
VALUES (2300, 3105103, 'Bambuí', 'MG', 310510);
INSERT INTO public.municipio
VALUES (2301, 3105202, 'Bandeira', 'MG', 310520);
INSERT INTO public.municipio
VALUES (2302, 3105301, 'Bandeira do Sul', 'MG', 310530);
INSERT INTO public.municipio
VALUES (2303, 3105400, 'Barão de Cocais', 'MG', 310540);
INSERT INTO public.municipio
VALUES (2304, 3105509, 'Barão de Monte Alto', 'MG', 310550);
INSERT INTO public.municipio
VALUES (2305, 3105608, 'Barbacena', 'MG', 310560);
INSERT INTO public.municipio
VALUES (2306, 3105707, 'Barra Longa', 'MG', 310570);
INSERT INTO public.municipio
VALUES (2307, 3105905, 'Barroso', 'MG', 310590);
INSERT INTO public.municipio
VALUES (2308, 3106002, 'Bela Vista de Minas', 'MG', 310600);
INSERT INTO public.municipio
VALUES (2309, 3106101, 'Belmiro Braga', 'MG', 310610);
INSERT INTO public.municipio
VALUES (2310, 3106200, 'Belo Horizonte', 'MG', 310620);
INSERT INTO public.municipio
VALUES (2311, 3106309, 'Belo Oriente', 'MG', 310630);
INSERT INTO public.municipio
VALUES (2312, 3106408, 'Belo Vale', 'MG', 310640);
INSERT INTO public.municipio
VALUES (2313, 3106507, 'Berilo', 'MG', 310650);
INSERT INTO public.municipio
VALUES (2314, 3106606, 'Bertópolis', 'MG', 310660);
INSERT INTO public.municipio
VALUES (2315, 3106655, 'Berizal', 'MG', 310665);
INSERT INTO public.municipio
VALUES (2316, 3106705, 'Betim', 'MG', 310670);
INSERT INTO public.municipio
VALUES (2317, 3106804, 'Bias Fortes', 'MG', 310680);
INSERT INTO public.municipio
VALUES (2318, 3106903, 'Bicas', 'MG', 310690);
INSERT INTO public.municipio
VALUES (2319, 3107000, 'Biquinhas', 'MG', 310700);
INSERT INTO public.municipio
VALUES (2320, 3107109, 'Boa Esperança', 'MG', 310710);
INSERT INTO public.municipio
VALUES (2321, 3107208, 'Bocaina de Minas', 'MG', 310720);
INSERT INTO public.municipio
VALUES (2322, 3107307, 'Bocaiúva', 'MG', 310730);
INSERT INTO public.municipio
VALUES (2323, 3107406, 'Bom Despacho', 'MG', 310740);
INSERT INTO public.municipio
VALUES (2324, 3107505, 'Bom Jardim de Minas', 'MG', 310750);
INSERT INTO public.municipio
VALUES (2325, 3107604, 'Bom Jesus da Penha', 'MG', 310760);
INSERT INTO public.municipio
VALUES (2326, 3107703, 'Bom Jesus do Amparo', 'MG', 310770);
INSERT INTO public.municipio
VALUES (2327, 3107802, 'Bom Jesus do Galho', 'MG', 310780);
INSERT INTO public.municipio
VALUES (2328, 3107901, 'Bom Repouso', 'MG', 310790);
INSERT INTO public.municipio
VALUES (2329, 3108008, 'Bom Sucesso', 'MG', 310800);
INSERT INTO public.municipio
VALUES (2330, 3108107, 'Bonfim', 'MG', 310810);
INSERT INTO public.municipio
VALUES (2331, 3108206, 'Bonfinópolis de Minas', 'MG', 310820);
INSERT INTO public.municipio
VALUES (2332, 3108255, 'Bonito de Minas', 'MG', 310825);
INSERT INTO public.municipio
VALUES (2333, 3108305, 'Borda da Mata', 'MG', 310830);
INSERT INTO public.municipio
VALUES (2334, 3108404, 'Botelhos', 'MG', 310840);
INSERT INTO public.municipio
VALUES (2335, 3108503, 'Botumirim', 'MG', 310850);
INSERT INTO public.municipio
VALUES (2336, 3108552, 'Brasilândia de Minas', 'MG', 310855);
INSERT INTO public.municipio
VALUES (2337, 3108602, 'Brasília de Minas', 'MG', 310860);
INSERT INTO public.municipio
VALUES (2338, 3108701, 'Brás Pires', 'MG', 310870);
INSERT INTO public.municipio
VALUES (2339, 3108800, 'Braúnas', 'MG', 310880);
INSERT INTO public.municipio
VALUES (2340, 3108909, 'Brazópolis', 'MG', 310890);
INSERT INTO public.municipio
VALUES (2341, 3109006, 'Brumadinho', 'MG', 310900);
INSERT INTO public.municipio
VALUES (2342, 3109105, 'Bueno Brandão', 'MG', 310910);
INSERT INTO public.municipio
VALUES (2343, 3109204, 'Buenópolis', 'MG', 310920);
INSERT INTO public.municipio
VALUES (2344, 3109253, 'Bugre', 'MG', 310925);
INSERT INTO public.municipio
VALUES (2345, 3109303, 'Buritis', 'MG', 310930);
INSERT INTO public.municipio
VALUES (2346, 3109402, 'Buritizeiro', 'MG', 310940);
INSERT INTO public.municipio
VALUES (2347, 3109451, 'Cabeceira Grande', 'MG', 310945);
INSERT INTO public.municipio
VALUES (2348, 3109501, 'Cabo Verde', 'MG', 310950);
INSERT INTO public.municipio
VALUES (2349, 3109600, 'Cachoeira da Prata', 'MG', 310960);
INSERT INTO public.municipio
VALUES (2350, 3109709, 'Cachoeira de Minas', 'MG', 310970);
INSERT INTO public.municipio
VALUES (2351, 3109808, 'Cachoeira Dourada', 'MG', 310980);
INSERT INTO public.municipio
VALUES (2352, 3109907, 'Caetanópolis', 'MG', 310990);
INSERT INTO public.municipio
VALUES (2353, 3110004, 'Caeté', 'MG', 311000);
INSERT INTO public.municipio
VALUES (2354, 3110103, 'Caiana', 'MG', 311010);
INSERT INTO public.municipio
VALUES (2355, 3110202, 'Cajuri', 'MG', 311020);
INSERT INTO public.municipio
VALUES (2356, 3110301, 'Caldas', 'MG', 311030);
INSERT INTO public.municipio
VALUES (2357, 3110400, 'Camacho', 'MG', 311040);
INSERT INTO public.municipio
VALUES (2358, 3110509, 'Camanducaia', 'MG', 311050);
INSERT INTO public.municipio
VALUES (2359, 3110608, 'Cambuí', 'MG', 311060);
INSERT INTO public.municipio
VALUES (2360, 3110707, 'Cambuquira', 'MG', 311070);
INSERT INTO public.municipio
VALUES (2361, 3110806, 'Campanário', 'MG', 311080);
INSERT INTO public.municipio
VALUES (2362, 3110905, 'Campanha', 'MG', 311090);
INSERT INTO public.municipio
VALUES (2363, 3111002, 'Campestre', 'MG', 311100);
INSERT INTO public.municipio
VALUES (2364, 3111101, 'Campina Verde', 'MG', 311110);
INSERT INTO public.municipio
VALUES (2365, 3111150, 'Campo Azul', 'MG', 311115);
INSERT INTO public.municipio
VALUES (2366, 3111200, 'Campo Belo', 'MG', 311120);
INSERT INTO public.municipio
VALUES (2367, 3111309, 'Campo do Meio', 'MG', 311130);
INSERT INTO public.municipio
VALUES (2368, 3111408, 'Campo Florido', 'MG', 311140);
INSERT INTO public.municipio
VALUES (2369, 3111507, 'Campos Altos', 'MG', 311150);
INSERT INTO public.municipio
VALUES (2370, 3111606, 'Campos Gerais', 'MG', 311160);
INSERT INTO public.municipio
VALUES (2371, 3111705, 'Canaã', 'MG', 311170);
INSERT INTO public.municipio
VALUES (2372, 3111804, 'Canápolis', 'MG', 311180);
INSERT INTO public.municipio
VALUES (2373, 3111903, 'Cana Verde', 'MG', 311190);
INSERT INTO public.municipio
VALUES (2374, 3112000, 'Candeias', 'MG', 311200);
INSERT INTO public.municipio
VALUES (2375, 3112059, 'Cantagalo', 'MG', 311205);
INSERT INTO public.municipio
VALUES (2376, 3112109, 'Caparaó', 'MG', 311210);
INSERT INTO public.municipio
VALUES (2377, 3112208, 'Capela Nova', 'MG', 311220);
INSERT INTO public.municipio
VALUES (2378, 3112307, 'Capelinha', 'MG', 311230);
INSERT INTO public.municipio
VALUES (2379, 3112406, 'Capetinga', 'MG', 311240);
INSERT INTO public.municipio
VALUES (2380, 3112505, 'Capim Branco', 'MG', 311250);
INSERT INTO public.municipio
VALUES (2381, 3112604, 'Capinópolis', 'MG', 311260);
INSERT INTO public.municipio
VALUES (2382, 3112653, 'Capitão Andrade', 'MG', 311265);
INSERT INTO public.municipio
VALUES (2383, 3112703, 'Capitão Enéas', 'MG', 311270);
INSERT INTO public.municipio
VALUES (2384, 3112802, 'Capitólio', 'MG', 311280);
INSERT INTO public.municipio
VALUES (2385, 3112901, 'Caputira', 'MG', 311290);
INSERT INTO public.municipio
VALUES (2386, 3113008, 'Caraí', 'MG', 311300);
INSERT INTO public.municipio
VALUES (2387, 3113107, 'Caranaíba', 'MG', 311310);
INSERT INTO public.municipio
VALUES (2388, 3113206, 'Carandaí', 'MG', 311320);
INSERT INTO public.municipio
VALUES (2389, 3113305, 'Carangola', 'MG', 311330);
INSERT INTO public.municipio
VALUES (2390, 3113404, 'Caratinga', 'MG', 311340);
INSERT INTO public.municipio
VALUES (2391, 3113503, 'Carbonita', 'MG', 311350);
INSERT INTO public.municipio
VALUES (2392, 3113602, 'Careaçu', 'MG', 311360);
INSERT INTO public.municipio
VALUES (2393, 3113701, 'Carlos Chagas', 'MG', 311370);
INSERT INTO public.municipio
VALUES (2394, 3113800, 'Carmésia', 'MG', 311380);
INSERT INTO public.municipio
VALUES (2395, 3113909, 'Carmo da Cachoeira', 'MG', 311390);
INSERT INTO public.municipio
VALUES (2396, 3114006, 'Carmo da Mata', 'MG', 311400);
INSERT INTO public.municipio
VALUES (2397, 3114105, 'Carmo de Minas', 'MG', 311410);
INSERT INTO public.municipio
VALUES (2398, 3114204, 'Carmo do Cajuru', 'MG', 311420);
INSERT INTO public.municipio
VALUES (2399, 3114303, 'Carmo do Paranaíba', 'MG', 311430);
INSERT INTO public.municipio
VALUES (2400, 3114402, 'Carmo do Rio Claro', 'MG', 311440);
INSERT INTO public.municipio
VALUES (2401, 3114501, 'Carmópolis de Minas', 'MG', 311450);
INSERT INTO public.municipio
VALUES (2402, 3114550, 'Carneirinho', 'MG', 311455);
INSERT INTO public.municipio
VALUES (2403, 3114600, 'Carrancas', 'MG', 311460);
INSERT INTO public.municipio
VALUES (2404, 3114709, 'Carvalhópolis', 'MG', 311470);
INSERT INTO public.municipio
VALUES (2405, 3114808, 'Carvalhos', 'MG', 311480);
INSERT INTO public.municipio
VALUES (2406, 3114907, 'Casa Grande', 'MG', 311490);
INSERT INTO public.municipio
VALUES (2407, 3115003, 'Cascalho Rico', 'MG', 311500);
INSERT INTO public.municipio
VALUES (2408, 3115102, 'Cássia', 'MG', 311510);
INSERT INTO public.municipio
VALUES (2409, 3115201, 'Conceição da Barra de Minas', 'MG', 311520);
INSERT INTO public.municipio
VALUES (2410, 3115300, 'Cataguases', 'MG', 311530);
INSERT INTO public.municipio
VALUES (2411, 3115359, 'Catas Altas', 'MG', 311535);
INSERT INTO public.municipio
VALUES (2412, 3115409, 'Catas Altas da Noruega', 'MG', 311540);
INSERT INTO public.municipio
VALUES (2413, 3115458, 'Catuji', 'MG', 311545);
INSERT INTO public.municipio
VALUES (2414, 3115474, 'Catuti', 'MG', 311547);
INSERT INTO public.municipio
VALUES (2415, 3115508, 'Caxambu', 'MG', 311550);
INSERT INTO public.municipio
VALUES (2416, 3115607, 'Cedro do Abaeté', 'MG', 311560);
INSERT INTO public.municipio
VALUES (2417, 3115706, 'Central de Minas', 'MG', 311570);
INSERT INTO public.municipio
VALUES (2418, 3115805, 'Centralina', 'MG', 311580);
INSERT INTO public.municipio
VALUES (2419, 3115904, 'Chácara', 'MG', 311590);
INSERT INTO public.municipio
VALUES (2420, 3116001, 'Chalé', 'MG', 311600);
INSERT INTO public.municipio
VALUES (2421, 3116100, 'Chapada do Norte', 'MG', 311610);
INSERT INTO public.municipio
VALUES (2422, 3116159, 'Chapada Gaúcha', 'MG', 311615);
INSERT INTO public.municipio
VALUES (2423, 3116209, 'Chiador', 'MG', 311620);
INSERT INTO public.municipio
VALUES (2424, 3116308, 'Cipotânea', 'MG', 311630);
INSERT INTO public.municipio
VALUES (2425, 3116407, 'Claraval', 'MG', 311640);
INSERT INTO public.municipio
VALUES (2426, 3116506, 'Claro dos Poções', 'MG', 311650);
INSERT INTO public.municipio
VALUES (2427, 3116605, 'Cláudio', 'MG', 311660);
INSERT INTO public.municipio
VALUES (2428, 3116704, 'Coimbra', 'MG', 311670);
INSERT INTO public.municipio
VALUES (2429, 3116803, 'Coluna', 'MG', 311680);
INSERT INTO public.municipio
VALUES (2430, 3116902, 'Comendador Gomes', 'MG', 311690);
INSERT INTO public.municipio
VALUES (2431, 3117009, 'Comercinho', 'MG', 311700);
INSERT INTO public.municipio
VALUES (2432, 3117108, 'Conceição da Aparecida', 'MG', 311710);
INSERT INTO public.municipio
VALUES (2433, 3117207, 'Conceição das Pedras', 'MG', 311720);
INSERT INTO public.municipio
VALUES (2434, 3117306, 'Conceição das Alagoas', 'MG', 311730);
INSERT INTO public.municipio
VALUES (2435, 3117405, 'Conceição de Ipanema', 'MG', 311740);
INSERT INTO public.municipio
VALUES (2436, 3117504, 'Conceição do Mato Dentro', 'MG', 311750);
INSERT INTO public.municipio
VALUES (2437, 3117603, 'Conceição do Pará', 'MG', 311760);
INSERT INTO public.municipio
VALUES (2438, 3117702, 'Conceição do Rio Verde', 'MG', 311770);
INSERT INTO public.municipio
VALUES (2439, 3117801, 'Conceição dos Ouros', 'MG', 311780);
INSERT INTO public.municipio
VALUES (2440, 3117836, 'Cônego Marinho', 'MG', 311783);
INSERT INTO public.municipio
VALUES (2441, 3117876, 'Confins', 'MG', 311787);
INSERT INTO public.municipio
VALUES (2442, 3117900, 'Congonhal', 'MG', 311790);
INSERT INTO public.municipio
VALUES (2443, 3118007, 'Congonhas', 'MG', 311800);
INSERT INTO public.municipio
VALUES (2444, 3118106, 'Congonhas do Norte', 'MG', 311810);
INSERT INTO public.municipio
VALUES (2445, 3118205, 'Conquista', 'MG', 311820);
INSERT INTO public.municipio
VALUES (2446, 3118304, 'Conselheiro Lafaiete', 'MG', 311830);
INSERT INTO public.municipio
VALUES (2447, 3118403, 'Conselheiro Pena', 'MG', 311840);
INSERT INTO public.municipio
VALUES (2448, 3118502, 'Consolação', 'MG', 311850);
INSERT INTO public.municipio
VALUES (2449, 3118601, 'Contagem', 'MG', 311860);
INSERT INTO public.municipio
VALUES (2450, 3118700, 'Coqueiral', 'MG', 311870);
INSERT INTO public.municipio
VALUES (2451, 3118809, 'Coração de Jesus', 'MG', 311880);
INSERT INTO public.municipio
VALUES (2452, 3118908, 'Cordisburgo', 'MG', 311890);
INSERT INTO public.municipio
VALUES (2453, 3119005, 'Cordislândia', 'MG', 311900);
INSERT INTO public.municipio
VALUES (2454, 3119104, 'Corinto', 'MG', 311910);
INSERT INTO public.municipio
VALUES (2455, 3119203, 'Coroaci', 'MG', 311920);
INSERT INTO public.municipio
VALUES (2456, 3119302, 'Coromandel', 'MG', 311930);
INSERT INTO public.municipio
VALUES (2457, 3119401, 'Coronel Fabriciano', 'MG', 311940);
INSERT INTO public.municipio
VALUES (2458, 3119500, 'Coronel Murta', 'MG', 311950);
INSERT INTO public.municipio
VALUES (2459, 3119609, 'Coronel Pacheco', 'MG', 311960);
INSERT INTO public.municipio
VALUES (2460, 3119708, 'Coronel Xavier Chaves', 'MG', 311970);
INSERT INTO public.municipio
VALUES (2461, 3119807, 'Córrego Danta', 'MG', 311980);
INSERT INTO public.municipio
VALUES (2462, 3119906, 'Córrego do Bom Jesus', 'MG', 311990);
INSERT INTO public.municipio
VALUES (2463, 3119955, 'Córrego Fundo', 'MG', 311995);
INSERT INTO public.municipio
VALUES (2464, 3120003, 'Córrego Novo', 'MG', 312000);
INSERT INTO public.municipio
VALUES (2465, 3120102, 'Couto de Magalhães de Minas', 'MG', 312010);
INSERT INTO public.municipio
VALUES (2466, 3120151, 'Crisólita', 'MG', 312015);
INSERT INTO public.municipio
VALUES (2467, 3120201, 'Cristais', 'MG', 312020);
INSERT INTO public.municipio
VALUES (2468, 3120300, 'Cristália', 'MG', 312030);
INSERT INTO public.municipio
VALUES (2469, 3120409, 'Cristiano Otoni', 'MG', 312040);
INSERT INTO public.municipio
VALUES (2470, 3120508, 'Cristina', 'MG', 312050);
INSERT INTO public.municipio
VALUES (2471, 3120607, 'Crucilândia', 'MG', 312060);
INSERT INTO public.municipio
VALUES (2472, 3120706, 'Cruzeiro da Fortaleza', 'MG', 312070);
INSERT INTO public.municipio
VALUES (2473, 3120805, 'Cruzília', 'MG', 312080);
INSERT INTO public.municipio
VALUES (2474, 3120839, 'Cuparaque', 'MG', 312083);
INSERT INTO public.municipio
VALUES (2475, 3120870, 'Curral de Dentro', 'MG', 312087);
INSERT INTO public.municipio
VALUES (2476, 3120904, 'Curvelo', 'MG', 312090);
INSERT INTO public.municipio
VALUES (2477, 3121001, 'Datas', 'MG', 312100);
INSERT INTO public.municipio
VALUES (2478, 3121100, 'Delfim Moreira', 'MG', 312110);
INSERT INTO public.municipio
VALUES (2479, 3121209, 'Delfinópolis', 'MG', 312120);
INSERT INTO public.municipio
VALUES (2480, 3121258, 'Delta', 'MG', 312125);
INSERT INTO public.municipio
VALUES (2481, 3121308, 'Descoberto', 'MG', 312130);
INSERT INTO public.municipio
VALUES (2482, 3121407, 'Desterro de Entre Rios', 'MG', 312140);
INSERT INTO public.municipio
VALUES (2483, 3121506, 'Desterro do Melo', 'MG', 312150);
INSERT INTO public.municipio
VALUES (2484, 3121605, 'Diamantina', 'MG', 312160);
INSERT INTO public.municipio
VALUES (2485, 3121704, 'Diogo de Vasconcelos', 'MG', 312170);
INSERT INTO public.municipio
VALUES (2486, 3121803, 'Dionísio', 'MG', 312180);
INSERT INTO public.municipio
VALUES (2487, 3121902, 'Divinésia', 'MG', 312190);
INSERT INTO public.municipio
VALUES (2488, 3122009, 'Divino', 'MG', 312200);
INSERT INTO public.municipio
VALUES (2489, 3122108, 'Divino das Laranjeiras', 'MG', 312210);
INSERT INTO public.municipio
VALUES (2490, 3122207, 'Divinolândia de Minas', 'MG', 312220);
INSERT INTO public.municipio
VALUES (2491, 3122306, 'Divinópolis', 'MG', 312230);
INSERT INTO public.municipio
VALUES (2492, 3122355, 'Divisa Alegre', 'MG', 312235);
INSERT INTO public.municipio
VALUES (2493, 3122405, 'Divisa Nova', 'MG', 312240);
INSERT INTO public.municipio
VALUES (2494, 3122454, 'Divisópolis', 'MG', 312245);
INSERT INTO public.municipio
VALUES (2495, 3122470, 'Dom Bosco', 'MG', 312247);
INSERT INTO public.municipio
VALUES (2496, 3122504, 'Dom Cavati', 'MG', 312250);
INSERT INTO public.municipio
VALUES (2497, 3122603, 'Dom Joaquim', 'MG', 312260);
INSERT INTO public.municipio
VALUES (2498, 3122702, 'Dom Silvério', 'MG', 312270);
INSERT INTO public.municipio
VALUES (2499, 3122801, 'Dom Viçoso', 'MG', 312280);
INSERT INTO public.municipio
VALUES (2500, 3122900, 'Dona Eusébia', 'MG', 312290);
INSERT INTO public.municipio
VALUES (2501, 3123007, 'Dores de Campos', 'MG', 312300);
INSERT INTO public.municipio
VALUES (2502, 3123106, 'Dores de Guanhães', 'MG', 312310);
INSERT INTO public.municipio
VALUES (2503, 3123205, 'Dores do Indaiá', 'MG', 312320);
INSERT INTO public.municipio
VALUES (2504, 3123304, 'Dores do Turvo', 'MG', 312330);
INSERT INTO public.municipio
VALUES (2505, 3123403, 'Doresópolis', 'MG', 312340);
INSERT INTO public.municipio
VALUES (2506, 3123502, 'Douradoquara', 'MG', 312350);
INSERT INTO public.municipio
VALUES (2507, 3123528, 'Durandé', 'MG', 312352);
INSERT INTO public.municipio
VALUES (2508, 3123601, 'Elói Mendes', 'MG', 312360);
INSERT INTO public.municipio
VALUES (2509, 3123700, 'Engenheiro Caldas', 'MG', 312370);
INSERT INTO public.municipio
VALUES (2510, 3123809, 'Engenheiro Navarro', 'MG', 312380);
INSERT INTO public.municipio
VALUES (2511, 3123858, 'Entre Folhas', 'MG', 312385);
INSERT INTO public.municipio
VALUES (2512, 3123908, 'Entre Rios de Minas', 'MG', 312390);
INSERT INTO public.municipio
VALUES (2513, 3124005, 'Ervália', 'MG', 312400);
INSERT INTO public.municipio
VALUES (2514, 3124104, 'Esmeraldas', 'MG', 312410);
INSERT INTO public.municipio
VALUES (2515, 3124203, 'Espera Feliz', 'MG', 312420);
INSERT INTO public.municipio
VALUES (2516, 3124302, 'Espinosa', 'MG', 312430);
INSERT INTO public.municipio
VALUES (2517, 3124401, 'Espírito Santo do Dourado', 'MG', 312440);
INSERT INTO public.municipio
VALUES (2518, 3124500, 'Estiva', 'MG', 312450);
INSERT INTO public.municipio
VALUES (2519, 3124609, 'Estrela Dalva', 'MG', 312460);
INSERT INTO public.municipio
VALUES (2520, 3124708, 'Estrela do Indaiá', 'MG', 312470);
INSERT INTO public.municipio
VALUES (2521, 3124807, 'Estrela do Sul', 'MG', 312480);
INSERT INTO public.municipio
VALUES (2522, 3124906, 'Eugenópolis', 'MG', 312490);
INSERT INTO public.municipio
VALUES (2523, 3125002, 'Ewbank da Câmara', 'MG', 312500);
INSERT INTO public.municipio
VALUES (2524, 3125101, 'Extrema', 'MG', 312510);
INSERT INTO public.municipio
VALUES (2525, 3125200, 'Fama', 'MG', 312520);
INSERT INTO public.municipio
VALUES (2526, 3125309, 'Faria Lemos', 'MG', 312530);
INSERT INTO public.municipio
VALUES (2527, 3125408, 'Felício dos Santos', 'MG', 312540);
INSERT INTO public.municipio
VALUES (2528, 3125507, 'São Gonçalo do Rio Preto', 'MG', 312550);
INSERT INTO public.municipio
VALUES (2529, 3125606, 'Felisburgo', 'MG', 312560);
INSERT INTO public.municipio
VALUES (2530, 3125705, 'Felixlândia', 'MG', 312570);
INSERT INTO public.municipio
VALUES (2531, 3125804, 'Fernandes Tourinho', 'MG', 312580);
INSERT INTO public.municipio
VALUES (2532, 3125903, 'Ferros', 'MG', 312590);
INSERT INTO public.municipio
VALUES (2533, 3125952, 'Fervedouro', 'MG', 312595);
INSERT INTO public.municipio
VALUES (2534, 3126000, 'Florestal', 'MG', 312600);
INSERT INTO public.municipio
VALUES (2535, 3126109, 'Formiga', 'MG', 312610);
INSERT INTO public.municipio
VALUES (2536, 3126208, 'Formoso', 'MG', 312620);
INSERT INTO public.municipio
VALUES (2537, 3126307, 'Fortaleza de Minas', 'MG', 312630);
INSERT INTO public.municipio
VALUES (2538, 3126406, 'Fortuna de Minas', 'MG', 312640);
INSERT INTO public.municipio
VALUES (2539, 3126505, 'Francisco Badaró', 'MG', 312650);
INSERT INTO public.municipio
VALUES (2540, 3126604, 'Francisco Dumont', 'MG', 312660);
INSERT INTO public.municipio
VALUES (2541, 3126703, 'Francisco Sá', 'MG', 312670);
INSERT INTO public.municipio
VALUES (2542, 3126752, 'Franciscópolis', 'MG', 312675);
INSERT INTO public.municipio
VALUES (2543, 3126802, 'Frei Gaspar', 'MG', 312680);
INSERT INTO public.municipio
VALUES (2544, 3126901, 'Frei Inocêncio', 'MG', 312690);
INSERT INTO public.municipio
VALUES (2545, 3126950, 'Frei Lagonegro', 'MG', 312695);
INSERT INTO public.municipio
VALUES (2546, 3127008, 'Fronteira', 'MG', 312700);
INSERT INTO public.municipio
VALUES (2547, 3127057, 'Fronteira dos Vales', 'MG', 312705);
INSERT INTO public.municipio
VALUES (2548, 3127073, 'Fruta de Leite', 'MG', 312707);
INSERT INTO public.municipio
VALUES (2549, 3127107, 'Frutal', 'MG', 312710);
INSERT INTO public.municipio
VALUES (2550, 3127206, 'Funilândia', 'MG', 312720);
INSERT INTO public.municipio
VALUES (2551, 3127305, 'Galiléia', 'MG', 312730);
INSERT INTO public.municipio
VALUES (2552, 3127339, 'Gameleiras', 'MG', 312733);
INSERT INTO public.municipio
VALUES (2553, 3127354, 'Glaucilândia', 'MG', 312735);
INSERT INTO public.municipio
VALUES (2554, 3127370, 'Goiabeira', 'MG', 312737);
INSERT INTO public.municipio
VALUES (2555, 3127388, 'Goianá', 'MG', 312738);
INSERT INTO public.municipio
VALUES (2556, 3127404, 'Gonçalves', 'MG', 312740);
INSERT INTO public.municipio
VALUES (2557, 3127503, 'Gonzaga', 'MG', 312750);
INSERT INTO public.municipio
VALUES (2558, 3127602, 'Gouveia', 'MG', 312760);
INSERT INTO public.municipio
VALUES (2559, 3127701, 'Governador Valadares', 'MG', 312770);
INSERT INTO public.municipio
VALUES (2560, 3127800, 'Grão Mogol', 'MG', 312780);
INSERT INTO public.municipio
VALUES (2561, 3127909, 'Grupiara', 'MG', 312790);
INSERT INTO public.municipio
VALUES (2562, 3128006, 'Guanhães', 'MG', 312800);
INSERT INTO public.municipio
VALUES (2563, 3128105, 'Guapé', 'MG', 312810);
INSERT INTO public.municipio
VALUES (2564, 3128204, 'Guaraciaba', 'MG', 312820);
INSERT INTO public.municipio
VALUES (2565, 3128253, 'Guaraciama', 'MG', 312825);
INSERT INTO public.municipio
VALUES (2566, 3128303, 'Guaranésia', 'MG', 312830);
INSERT INTO public.municipio
VALUES (2567, 3128402, 'Guarani', 'MG', 312840);
INSERT INTO public.municipio
VALUES (2568, 3128501, 'Guarará', 'MG', 312850);
INSERT INTO public.municipio
VALUES (2569, 3128600, 'Guarda-Mor', 'MG', 312860);
INSERT INTO public.municipio
VALUES (2570, 3128709, 'Guaxupé', 'MG', 312870);
INSERT INTO public.municipio
VALUES (2571, 3128808, 'Guidoval', 'MG', 312880);
INSERT INTO public.municipio
VALUES (2572, 3128907, 'Guimarânia', 'MG', 312890);
INSERT INTO public.municipio
VALUES (2573, 3129004, 'Guiricema', 'MG', 312900);
INSERT INTO public.municipio
VALUES (2574, 3129103, 'Gurinhatã', 'MG', 312910);
INSERT INTO public.municipio
VALUES (2575, 3129202, 'Heliodora', 'MG', 312920);
INSERT INTO public.municipio
VALUES (2576, 3129301, 'Iapu', 'MG', 312930);
INSERT INTO public.municipio
VALUES (2577, 3129400, 'Ibertioga', 'MG', 312940);
INSERT INTO public.municipio
VALUES (2578, 3129509, 'Ibiá', 'MG', 312950);
INSERT INTO public.municipio
VALUES (2579, 3129608, 'Ibiaí', 'MG', 312960);
INSERT INTO public.municipio
VALUES (2580, 3129657, 'Ibiracatu', 'MG', 312965);
INSERT INTO public.municipio
VALUES (2581, 3129707, 'Ibiraci', 'MG', 312970);
INSERT INTO public.municipio
VALUES (2582, 3129806, 'Ibirité', 'MG', 312980);
INSERT INTO public.municipio
VALUES (2583, 3129905, 'Ibitiúra de Minas', 'MG', 312990);
INSERT INTO public.municipio
VALUES (2584, 3130002, 'Ibituruna', 'MG', 313000);
INSERT INTO public.municipio
VALUES (2585, 3130051, 'Icaraí de Minas', 'MG', 313005);
INSERT INTO public.municipio
VALUES (2586, 3130101, 'Igarapé', 'MG', 313010);
INSERT INTO public.municipio
VALUES (2587, 3130200, 'Igaratinga', 'MG', 313020);
INSERT INTO public.municipio
VALUES (2588, 3130309, 'Iguatama', 'MG', 313030);
INSERT INTO public.municipio
VALUES (2589, 3130408, 'Ijaci', 'MG', 313040);
INSERT INTO public.municipio
VALUES (2590, 3130507, 'Ilicínea', 'MG', 313050);
INSERT INTO public.municipio
VALUES (2591, 3130556, 'Imbé de Minas', 'MG', 313055);
INSERT INTO public.municipio
VALUES (2592, 3130606, 'Inconfidentes', 'MG', 313060);
INSERT INTO public.municipio
VALUES (2593, 3130655, 'Indaiabira', 'MG', 313065);
INSERT INTO public.municipio
VALUES (2594, 3130705, 'Indianópolis', 'MG', 313070);
INSERT INTO public.municipio
VALUES (2595, 3130804, 'Ingaí', 'MG', 313080);
INSERT INTO public.municipio
VALUES (2596, 3130903, 'Inhapim', 'MG', 313090);
INSERT INTO public.municipio
VALUES (2597, 3131000, 'Inhaúma', 'MG', 313100);
INSERT INTO public.municipio
VALUES (2598, 3131109, 'Inimutaba', 'MG', 313110);
INSERT INTO public.municipio
VALUES (2599, 3131158, 'Ipaba', 'MG', 313115);
INSERT INTO public.municipio
VALUES (2600, 3131208, 'Ipanema', 'MG', 313120);
INSERT INTO public.municipio
VALUES (2601, 3131307, 'Ipatinga', 'MG', 313130);
INSERT INTO public.municipio
VALUES (2602, 3131406, 'Ipiaçu', 'MG', 313140);
INSERT INTO public.municipio
VALUES (2603, 3131505, 'Ipuiúna', 'MG', 313150);
INSERT INTO public.municipio
VALUES (2604, 3131604, 'Iraí de Minas', 'MG', 313160);
INSERT INTO public.municipio
VALUES (2605, 3131703, 'Itabira', 'MG', 313170);
INSERT INTO public.municipio
VALUES (2606, 3131802, 'Itabirinha', 'MG', 313180);
INSERT INTO public.municipio
VALUES (2607, 3131901, 'Itabirito', 'MG', 313190);
INSERT INTO public.municipio
VALUES (2608, 3132008, 'Itacambira', 'MG', 313200);
INSERT INTO public.municipio
VALUES (2609, 3132107, 'Itacarambi', 'MG', 313210);
INSERT INTO public.municipio
VALUES (2610, 3132206, 'Itaguara', 'MG', 313220);
INSERT INTO public.municipio
VALUES (2611, 3132305, 'Itaipé', 'MG', 313230);
INSERT INTO public.municipio
VALUES (2612, 3132404, 'Itajubá', 'MG', 313240);
INSERT INTO public.municipio
VALUES (2613, 3132503, 'Itamarandiba', 'MG', 313250);
INSERT INTO public.municipio
VALUES (2614, 3132602, 'Itamarati de Minas', 'MG', 313260);
INSERT INTO public.municipio
VALUES (2615, 3132701, 'Itambacuri', 'MG', 313270);
INSERT INTO public.municipio
VALUES (2616, 3132800, 'Itambé do Mato Dentro', 'MG', 313280);
INSERT INTO public.municipio
VALUES (2617, 3132909, 'Itamogi', 'MG', 313290);
INSERT INTO public.municipio
VALUES (2618, 3133006, 'Itamonte', 'MG', 313300);
INSERT INTO public.municipio
VALUES (2619, 3133105, 'Itanhandu', 'MG', 313310);
INSERT INTO public.municipio
VALUES (2620, 3133204, 'Itanhomi', 'MG', 313320);
INSERT INTO public.municipio
VALUES (2621, 3133303, 'Itaobim', 'MG', 313330);
INSERT INTO public.municipio
VALUES (2622, 3133402, 'Itapagipe', 'MG', 313340);
INSERT INTO public.municipio
VALUES (2623, 3133501, 'Itapecerica', 'MG', 313350);
INSERT INTO public.municipio
VALUES (2624, 3133600, 'Itapeva', 'MG', 313360);
INSERT INTO public.municipio
VALUES (2625, 3133709, 'Itatiaiuçu', 'MG', 313370);
INSERT INTO public.municipio
VALUES (2626, 3133758, 'Itaú de Minas', 'MG', 313375);
INSERT INTO public.municipio
VALUES (2627, 3133808, 'Itaúna', 'MG', 313380);
INSERT INTO public.municipio
VALUES (2628, 3133907, 'Itaverava', 'MG', 313390);
INSERT INTO public.municipio
VALUES (2629, 3134004, 'Itinga', 'MG', 313400);
INSERT INTO public.municipio
VALUES (2630, 3134103, 'Itueta', 'MG', 313410);
INSERT INTO public.municipio
VALUES (2631, 3134202, 'Ituiutaba', 'MG', 313420);
INSERT INTO public.municipio
VALUES (2632, 3134301, 'Itumirim', 'MG', 313430);
INSERT INTO public.municipio
VALUES (2633, 3134400, 'Iturama', 'MG', 313440);
INSERT INTO public.municipio
VALUES (2634, 3134509, 'Itutinga', 'MG', 313450);
INSERT INTO public.municipio
VALUES (2635, 3134608, 'Jaboticatubas', 'MG', 313460);
INSERT INTO public.municipio
VALUES (2636, 3134707, 'Jacinto', 'MG', 313470);
INSERT INTO public.municipio
VALUES (2637, 3134806, 'Jacuí', 'MG', 313480);
INSERT INTO public.municipio
VALUES (2638, 3134905, 'Jacutinga', 'MG', 313490);
INSERT INTO public.municipio
VALUES (2639, 3135001, 'Jaguaraçu', 'MG', 313500);
INSERT INTO public.municipio
VALUES (2640, 3135050, 'Jaíba', 'MG', 313505);
INSERT INTO public.municipio
VALUES (2641, 3135076, 'Jampruca', 'MG', 313507);
INSERT INTO public.municipio
VALUES (2642, 3135100, 'Janaúba', 'MG', 313510);
INSERT INTO public.municipio
VALUES (2643, 3135209, 'Januária', 'MG', 313520);
INSERT INTO public.municipio
VALUES (2644, 3135308, 'Japaraíba', 'MG', 313530);
INSERT INTO public.municipio
VALUES (2645, 3135357, 'Japonvar', 'MG', 313535);
INSERT INTO public.municipio
VALUES (2646, 3135407, 'Jeceaba', 'MG', 313540);
INSERT INTO public.municipio
VALUES (2647, 3135456, 'Jenipapo de Minas', 'MG', 313545);
INSERT INTO public.municipio
VALUES (2648, 3135506, 'Jequeri', 'MG', 313550);
INSERT INTO public.municipio
VALUES (2649, 3135605, 'Jequitaí', 'MG', 313560);
INSERT INTO public.municipio
VALUES (2650, 3135704, 'Jequitibá', 'MG', 313570);
INSERT INTO public.municipio
VALUES (2651, 3135803, 'Jequitinhonha', 'MG', 313580);
INSERT INTO public.municipio
VALUES (2652, 3135902, 'Jesuânia', 'MG', 313590);
INSERT INTO public.municipio
VALUES (2653, 3136009, 'Joaíma', 'MG', 313600);
INSERT INTO public.municipio
VALUES (2654, 3136108, 'Joanésia', 'MG', 313610);
INSERT INTO public.municipio
VALUES (2655, 3136207, 'João Monlevade', 'MG', 313620);
INSERT INTO public.municipio
VALUES (2656, 3136306, 'João Pinheiro', 'MG', 313630);
INSERT INTO public.municipio
VALUES (2657, 3136405, 'Joaquim Felício', 'MG', 313640);
INSERT INTO public.municipio
VALUES (2658, 3136504, 'Jordânia', 'MG', 313650);
INSERT INTO public.municipio
VALUES (2659, 3136520, 'José Gonçalves de Minas', 'MG', 313652);
INSERT INTO public.municipio
VALUES (2660, 3136553, 'José Raydan', 'MG', 313655);
INSERT INTO public.municipio
VALUES (2661, 3136579, 'Josenópolis', 'MG', 313657);
INSERT INTO public.municipio
VALUES (2662, 3136603, 'Nova União', 'MG', 313660);
INSERT INTO public.municipio
VALUES (2663, 3136652, 'Juatuba', 'MG', 313665);
INSERT INTO public.municipio
VALUES (2664, 3136702, 'Juiz de Fora', 'MG', 313670);
INSERT INTO public.municipio
VALUES (2665, 3136801, 'Juramento', 'MG', 313680);
INSERT INTO public.municipio
VALUES (2666, 3136900, 'Juruaia', 'MG', 313690);
INSERT INTO public.municipio
VALUES (2667, 3136959, 'Juvenília', 'MG', 313695);
INSERT INTO public.municipio
VALUES (2668, 3137007, 'Ladainha', 'MG', 313700);
INSERT INTO public.municipio
VALUES (2669, 3137106, 'Lagamar', 'MG', 313710);
INSERT INTO public.municipio
VALUES (2670, 3137205, 'Lagoa da Prata', 'MG', 313720);
INSERT INTO public.municipio
VALUES (2671, 3137304, 'Lagoa dos Patos', 'MG', 313730);
INSERT INTO public.municipio
VALUES (2672, 3137403, 'Lagoa Dourada', 'MG', 313740);
INSERT INTO public.municipio
VALUES (2673, 3137502, 'Lagoa Formosa', 'MG', 313750);
INSERT INTO public.municipio
VALUES (2674, 3137536, 'Lagoa Grande', 'MG', 313753);
INSERT INTO public.municipio
VALUES (2675, 3137601, 'Lagoa Santa', 'MG', 313760);
INSERT INTO public.municipio
VALUES (2676, 3137700, 'Lajinha', 'MG', 313770);
INSERT INTO public.municipio
VALUES (2677, 3137809, 'Lambari', 'MG', 313780);
INSERT INTO public.municipio
VALUES (2678, 3137908, 'Lamim', 'MG', 313790);
INSERT INTO public.municipio
VALUES (2679, 3138005, 'Laranjal', 'MG', 313800);
INSERT INTO public.municipio
VALUES (2680, 3138104, 'Lassance', 'MG', 313810);
INSERT INTO public.municipio
VALUES (2681, 3138203, 'Lavras', 'MG', 313820);
INSERT INTO public.municipio
VALUES (2682, 3138302, 'Leandro Ferreira', 'MG', 313830);
INSERT INTO public.municipio
VALUES (2683, 3138351, 'Leme do Prado', 'MG', 313835);
INSERT INTO public.municipio
VALUES (2684, 3138401, 'Leopoldina', 'MG', 313840);
INSERT INTO public.municipio
VALUES (2685, 3138500, 'Liberdade', 'MG', 313850);
INSERT INTO public.municipio
VALUES (2686, 3138609, 'Lima Duarte', 'MG', 313860);
INSERT INTO public.municipio
VALUES (2687, 3138625, 'Limeira do Oeste', 'MG', 313862);
INSERT INTO public.municipio
VALUES (2688, 3138658, 'Lontra', 'MG', 313865);
INSERT INTO public.municipio
VALUES (2689, 3138674, 'Luisburgo', 'MG', 313867);
INSERT INTO public.municipio
VALUES (2690, 3138682, 'Luislândia', 'MG', 313868);
INSERT INTO public.municipio
VALUES (2691, 3138708, 'Luminárias', 'MG', 313870);
INSERT INTO public.municipio
VALUES (2692, 3138807, 'Luz', 'MG', 313880);
INSERT INTO public.municipio
VALUES (2693, 3138906, 'Machacalis', 'MG', 313890);
INSERT INTO public.municipio
VALUES (2694, 3139003, 'Machado', 'MG', 313900);
INSERT INTO public.municipio
VALUES (2695, 3139102, 'Madre de Deus de Minas', 'MG', 313910);
INSERT INTO public.municipio
VALUES (2696, 3139201, 'Malacacheta', 'MG', 313920);
INSERT INTO public.municipio
VALUES (2697, 3139250, 'Mamonas', 'MG', 313925);
INSERT INTO public.municipio
VALUES (2698, 3139300, 'Manga', 'MG', 313930);
INSERT INTO public.municipio
VALUES (2699, 3139409, 'Manhuaçu', 'MG', 313940);
INSERT INTO public.municipio
VALUES (2700, 3139508, 'Manhumirim', 'MG', 313950);
INSERT INTO public.municipio
VALUES (2701, 3139607, 'Mantena', 'MG', 313960);
INSERT INTO public.municipio
VALUES (2702, 3139706, 'Maravilhas', 'MG', 313970);
INSERT INTO public.municipio
VALUES (2703, 3139805, 'Mar de Espanha', 'MG', 313980);
INSERT INTO public.municipio
VALUES (2704, 3139904, 'Maria da Fé', 'MG', 313990);
INSERT INTO public.municipio
VALUES (2705, 3140001, 'Mariana', 'MG', 314000);
INSERT INTO public.municipio
VALUES (2706, 3140100, 'Marilac', 'MG', 314010);
INSERT INTO public.municipio
VALUES (2707, 3140159, 'Mário Campos', 'MG', 314015);
INSERT INTO public.municipio
VALUES (2708, 3140209, 'Maripá de Minas', 'MG', 314020);
INSERT INTO public.municipio
VALUES (2709, 3140308, 'Marliéria', 'MG', 314030);
INSERT INTO public.municipio
VALUES (2710, 3140407, 'Marmelópolis', 'MG', 314040);
INSERT INTO public.municipio
VALUES (2711, 3140506, 'Martinho Campos', 'MG', 314050);
INSERT INTO public.municipio
VALUES (2712, 3140530, 'Martins Soares', 'MG', 314053);
INSERT INTO public.municipio
VALUES (2713, 3140555, 'Mata Verde', 'MG', 314055);
INSERT INTO public.municipio
VALUES (2714, 3140605, 'Materlândia', 'MG', 314060);
INSERT INTO public.municipio
VALUES (2715, 3140704, 'Mateus Leme', 'MG', 314070);
INSERT INTO public.municipio
VALUES (2716, 3140803, 'Matias Barbosa', 'MG', 314080);
INSERT INTO public.municipio
VALUES (2717, 3140852, 'Matias Cardoso', 'MG', 314085);
INSERT INTO public.municipio
VALUES (2718, 3140902, 'Matipó', 'MG', 314090);
INSERT INTO public.municipio
VALUES (2719, 3141009, 'Mato Verde', 'MG', 314100);
INSERT INTO public.municipio
VALUES (2720, 3141108, 'Matozinhos', 'MG', 314110);
INSERT INTO public.municipio
VALUES (2721, 3141207, 'Matutina', 'MG', 314120);
INSERT INTO public.municipio
VALUES (2722, 3141306, 'Medeiros', 'MG', 314130);
INSERT INTO public.municipio
VALUES (2723, 3141405, 'Medina', 'MG', 314140);
INSERT INTO public.municipio
VALUES (2724, 3141504, 'Mendes Pimentel', 'MG', 314150);
INSERT INTO public.municipio
VALUES (2725, 3141603, 'Mercês', 'MG', 314160);
INSERT INTO public.municipio
VALUES (2726, 3141702, 'Mesquita', 'MG', 314170);
INSERT INTO public.municipio
VALUES (2727, 3141801, 'Minas Novas', 'MG', 314180);
INSERT INTO public.municipio
VALUES (2728, 3141900, 'Minduri', 'MG', 314190);
INSERT INTO public.municipio
VALUES (2729, 3142007, 'Mirabela', 'MG', 314200);
INSERT INTO public.municipio
VALUES (2730, 3142106, 'Miradouro', 'MG', 314210);
INSERT INTO public.municipio
VALUES (2731, 3142205, 'Miraí', 'MG', 314220);
INSERT INTO public.municipio
VALUES (2732, 3142254, 'Miravânia', 'MG', 314225);
INSERT INTO public.municipio
VALUES (2733, 3142304, 'Moeda', 'MG', 314230);
INSERT INTO public.municipio
VALUES (2734, 3142403, 'Moema', 'MG', 314240);
INSERT INTO public.municipio
VALUES (2735, 3142502, 'Monjolos', 'MG', 314250);
INSERT INTO public.municipio
VALUES (2736, 3142601, 'Monsenhor Paulo', 'MG', 314260);
INSERT INTO public.municipio
VALUES (2737, 3142700, 'Montalvânia', 'MG', 314270);
INSERT INTO public.municipio
VALUES (2738, 3142809, 'Monte Alegre de Minas', 'MG', 314280);
INSERT INTO public.municipio
VALUES (2739, 3142908, 'Monte Azul', 'MG', 314290);
INSERT INTO public.municipio
VALUES (2740, 3143005, 'Monte Belo', 'MG', 314300);
INSERT INTO public.municipio
VALUES (2741, 3143104, 'Monte Carmelo', 'MG', 314310);
INSERT INTO public.municipio
VALUES (2742, 3143153, 'Monte Formoso', 'MG', 314315);
INSERT INTO public.municipio
VALUES (2743, 3143203, 'Monte Santo de Minas', 'MG', 314320);
INSERT INTO public.municipio
VALUES (2744, 3143302, 'Montes Claros', 'MG', 314330);
INSERT INTO public.municipio
VALUES (2745, 3143401, 'Monte Sião', 'MG', 314340);
INSERT INTO public.municipio
VALUES (2746, 3143450, 'Montezuma', 'MG', 314345);
INSERT INTO public.municipio
VALUES (2747, 3143500, 'Morada Nova de Minas', 'MG', 314350);
INSERT INTO public.municipio
VALUES (2748, 3143609, 'Morro da Garça', 'MG', 314360);
INSERT INTO public.municipio
VALUES (2749, 3143708, 'Morro do Pilar', 'MG', 314370);
INSERT INTO public.municipio
VALUES (2750, 3143807, 'Munhoz', 'MG', 314380);
INSERT INTO public.municipio
VALUES (2751, 3143906, 'Muriaé', 'MG', 314390);
INSERT INTO public.municipio
VALUES (2752, 3144003, 'Mutum', 'MG', 314400);
INSERT INTO public.municipio
VALUES (2753, 3144102, 'Muzambinho', 'MG', 314410);
INSERT INTO public.municipio
VALUES (2754, 3144201, 'Nacip Raydan', 'MG', 314420);
INSERT INTO public.municipio
VALUES (2755, 3144300, 'Nanuque', 'MG', 314430);
INSERT INTO public.municipio
VALUES (2756, 3144359, 'Naque', 'MG', 314435);
INSERT INTO public.municipio
VALUES (2757, 3144375, 'Natalândia', 'MG', 314437);
INSERT INTO public.municipio
VALUES (2758, 3144409, 'Natércia', 'MG', 314440);
INSERT INTO public.municipio
VALUES (2759, 3144508, 'Nazareno', 'MG', 314450);
INSERT INTO public.municipio
VALUES (2760, 3144607, 'Nepomuceno', 'MG', 314460);
INSERT INTO public.municipio
VALUES (2761, 3144656, 'Ninheira', 'MG', 314465);
INSERT INTO public.municipio
VALUES (2762, 3144672, 'Nova Belém', 'MG', 314467);
INSERT INTO public.municipio
VALUES (2763, 3144706, 'Nova Era', 'MG', 314470);
INSERT INTO public.municipio
VALUES (2764, 3144805, 'Nova Lima', 'MG', 314480);
INSERT INTO public.municipio
VALUES (2765, 3144904, 'Nova Módica', 'MG', 314490);
INSERT INTO public.municipio
VALUES (2766, 3145000, 'Nova Ponte', 'MG', 314500);
INSERT INTO public.municipio
VALUES (2767, 3145059, 'Nova Porteirinha', 'MG', 314505);
INSERT INTO public.municipio
VALUES (2768, 3145109, 'Nova Resende', 'MG', 314510);
INSERT INTO public.municipio
VALUES (2769, 3145208, 'Nova Serrana', 'MG', 314520);
INSERT INTO public.municipio
VALUES (2770, 3145307, 'Novo Cruzeiro', 'MG', 314530);
INSERT INTO public.municipio
VALUES (2771, 3145356, 'Novo Oriente de Minas', 'MG', 314535);
INSERT INTO public.municipio
VALUES (2772, 3145372, 'Novorizonte', 'MG', 314537);
INSERT INTO public.municipio
VALUES (2773, 3145406, 'Olaria', 'MG', 314540);
INSERT INTO public.municipio
VALUES (2774, 3145455, 'Olhos-D''Água', 'MG', 314545);
INSERT INTO public.municipio
VALUES (2775, 3145505, 'Olímpio Noronha', 'MG', 314550);
INSERT INTO public.municipio
VALUES (2776, 3145604, 'Oliveira', 'MG', 314560);
INSERT INTO public.municipio
VALUES (2777, 3145703, 'Oliveira Fortes', 'MG', 314570);
INSERT INTO public.municipio
VALUES (2778, 3145802, 'Onça de Pitangui', 'MG', 314580);
INSERT INTO public.municipio
VALUES (2779, 3145851, 'Oratórios', 'MG', 314585);
INSERT INTO public.municipio
VALUES (2780, 3145877, 'Orizânia', 'MG', 314587);
INSERT INTO public.municipio
VALUES (2781, 3145901, 'Ouro Branco', 'MG', 314590);
INSERT INTO public.municipio
VALUES (2782, 3146008, 'Ouro Fino', 'MG', 314600);
INSERT INTO public.municipio
VALUES (2783, 3146107, 'Ouro Preto', 'MG', 314610);
INSERT INTO public.municipio
VALUES (2784, 3146206, 'Ouro Verde de Minas', 'MG', 314620);
INSERT INTO public.municipio
VALUES (2785, 3146255, 'Padre Carvalho', 'MG', 314625);
INSERT INTO public.municipio
VALUES (2786, 3146305, 'Padre Paraíso', 'MG', 314630);
INSERT INTO public.municipio
VALUES (2787, 3146404, 'Paineiras', 'MG', 314640);
INSERT INTO public.municipio
VALUES (2788, 3146503, 'Pains', 'MG', 314650);
INSERT INTO public.municipio
VALUES (2789, 3146552, 'Pai Pedro', 'MG', 314655);
INSERT INTO public.municipio
VALUES (2790, 3146602, 'Paiva', 'MG', 314660);
INSERT INTO public.municipio
VALUES (2791, 3146701, 'Palma', 'MG', 314670);
INSERT INTO public.municipio
VALUES (2792, 3146750, 'Palmópolis', 'MG', 314675);
INSERT INTO public.municipio
VALUES (2793, 3146909, 'Papagaios', 'MG', 314690);
INSERT INTO public.municipio
VALUES (2794, 3147006, 'Paracatu', 'MG', 314700);
INSERT INTO public.municipio
VALUES (2795, 3147105, 'Pará de Minas', 'MG', 314710);
INSERT INTO public.municipio
VALUES (2796, 3147204, 'Paraguaçu', 'MG', 314720);
INSERT INTO public.municipio
VALUES (2797, 3147303, 'Paraisópolis', 'MG', 314730);
INSERT INTO public.municipio
VALUES (2798, 3147402, 'Paraopeba', 'MG', 314740);
INSERT INTO public.municipio
VALUES (2799, 3147501, 'Passabém', 'MG', 314750);
INSERT INTO public.municipio
VALUES (2800, 3147600, 'Passa Quatro', 'MG', 314760);
INSERT INTO public.municipio
VALUES (2801, 3147709, 'Passa Tempo', 'MG', 314770);
INSERT INTO public.municipio
VALUES (2802, 3147808, 'Passa-Vinte', 'MG', 314780);
INSERT INTO public.municipio
VALUES (2803, 3147907, 'Passos', 'MG', 314790);
INSERT INTO public.municipio
VALUES (2804, 3147956, 'Patis', 'MG', 314795);
INSERT INTO public.municipio
VALUES (2805, 3148004, 'Patos de Minas', 'MG', 314800);
INSERT INTO public.municipio
VALUES (2806, 3148103, 'Patrocínio', 'MG', 314810);
INSERT INTO public.municipio
VALUES (2807, 3148202, 'Patrocínio do Muriaé', 'MG', 314820);
INSERT INTO public.municipio
VALUES (2808, 3148301, 'Paula Cândido', 'MG', 314830);
INSERT INTO public.municipio
VALUES (2809, 3148400, 'Paulistas', 'MG', 314840);
INSERT INTO public.municipio
VALUES (2810, 3148509, 'Pavão', 'MG', 314850);
INSERT INTO public.municipio
VALUES (2811, 3148608, 'Peçanha', 'MG', 314860);
INSERT INTO public.municipio
VALUES (2812, 3148707, 'Pedra Azul', 'MG', 314870);
INSERT INTO public.municipio
VALUES (2813, 3148756, 'Pedra Bonita', 'MG', 314875);
INSERT INTO public.municipio
VALUES (2814, 3148806, 'Pedra do Anta', 'MG', 314880);
INSERT INTO public.municipio
VALUES (2815, 3148905, 'Pedra do Indaiá', 'MG', 314890);
INSERT INTO public.municipio
VALUES (2816, 3149002, 'Pedra Dourada', 'MG', 314900);
INSERT INTO public.municipio
VALUES (2817, 3149101, 'Pedralva', 'MG', 314910);
INSERT INTO public.municipio
VALUES (2818, 3149150, 'Pedras de Maria da Cruz', 'MG', 314915);
INSERT INTO public.municipio
VALUES (2819, 3149200, 'Pedrinópolis', 'MG', 314920);
INSERT INTO public.municipio
VALUES (2820, 3149309, 'Pedro Leopoldo', 'MG', 314930);
INSERT INTO public.municipio
VALUES (2821, 3149408, 'Pedro Teixeira', 'MG', 314940);
INSERT INTO public.municipio
VALUES (2822, 3149507, 'Pequeri', 'MG', 314950);
INSERT INTO public.municipio
VALUES (2823, 3149606, 'Pequi', 'MG', 314960);
INSERT INTO public.municipio
VALUES (2824, 3149705, 'Perdigão', 'MG', 314970);
INSERT INTO public.municipio
VALUES (2825, 3149804, 'Perdizes', 'MG', 314980);
INSERT INTO public.municipio
VALUES (2826, 3149903, 'Perdões', 'MG', 314990);
INSERT INTO public.municipio
VALUES (2827, 3149952, 'Periquito', 'MG', 314995);
INSERT INTO public.municipio
VALUES (2828, 3150000, 'Pescador', 'MG', 315000);
INSERT INTO public.municipio
VALUES (2829, 3150109, 'Piau', 'MG', 315010);
INSERT INTO public.municipio
VALUES (2830, 3150158, 'Piedade de Caratinga', 'MG', 315015);
INSERT INTO public.municipio
VALUES (2831, 3150208, 'Piedade de Ponte Nova', 'MG', 315020);
INSERT INTO public.municipio
VALUES (2832, 3150307, 'Piedade do Rio Grande', 'MG', 315030);
INSERT INTO public.municipio
VALUES (2833, 3150406, 'Piedade dos Gerais', 'MG', 315040);
INSERT INTO public.municipio
VALUES (2834, 3150505, 'Pimenta', 'MG', 315050);
INSERT INTO public.municipio
VALUES (2835, 3150539, 'Pingo-D''Água', 'MG', 315053);
INSERT INTO public.municipio
VALUES (2836, 3150570, 'Pintópolis', 'MG', 315057);
INSERT INTO public.municipio
VALUES (2837, 3150604, 'Piracema', 'MG', 315060);
INSERT INTO public.municipio
VALUES (2838, 3150703, 'Pirajuba', 'MG', 315070);
INSERT INTO public.municipio
VALUES (2839, 3150802, 'Piranga', 'MG', 315080);
INSERT INTO public.municipio
VALUES (2840, 3150901, 'Piranguçu', 'MG', 315090);
INSERT INTO public.municipio
VALUES (2841, 3151008, 'Piranguinho', 'MG', 315100);
INSERT INTO public.municipio
VALUES (2842, 3151107, 'Pirapetinga', 'MG', 315110);
INSERT INTO public.municipio
VALUES (2843, 3151206, 'Pirapora', 'MG', 315120);
INSERT INTO public.municipio
VALUES (2844, 3151305, 'Piraúba', 'MG', 315130);
INSERT INTO public.municipio
VALUES (2845, 3151404, 'Pitangui', 'MG', 315140);
INSERT INTO public.municipio
VALUES (2846, 3151503, 'Piumhi', 'MG', 315150);
INSERT INTO public.municipio
VALUES (2847, 3151602, 'Planura', 'MG', 315160);
INSERT INTO public.municipio
VALUES (2848, 3151701, 'Poço Fundo', 'MG', 315170);
INSERT INTO public.municipio
VALUES (2849, 3151800, 'Poços de Caldas', 'MG', 315180);
INSERT INTO public.municipio
VALUES (2850, 3151909, 'Pocrane', 'MG', 315190);
INSERT INTO public.municipio
VALUES (2851, 3152006, 'Pompéu', 'MG', 315200);
INSERT INTO public.municipio
VALUES (2852, 3152105, 'Ponte Nova', 'MG', 315210);
INSERT INTO public.municipio
VALUES (2853, 3152131, 'Ponto Chique', 'MG', 315213);
INSERT INTO public.municipio
VALUES (2854, 3152170, 'Ponto dos Volantes', 'MG', 315217);
INSERT INTO public.municipio
VALUES (2855, 3152204, 'Porteirinha', 'MG', 315220);
INSERT INTO public.municipio
VALUES (2856, 3152303, 'Porto Firme', 'MG', 315230);
INSERT INTO public.municipio
VALUES (2857, 3152402, 'Poté', 'MG', 315240);
INSERT INTO public.municipio
VALUES (2858, 3152501, 'Pouso Alegre', 'MG', 315250);
INSERT INTO public.municipio
VALUES (2859, 3152600, 'Pouso Alto', 'MG', 315260);
INSERT INTO public.municipio
VALUES (2860, 3152709, 'Prados', 'MG', 315270);
INSERT INTO public.municipio
VALUES (2861, 3152808, 'Prata', 'MG', 315280);
INSERT INTO public.municipio
VALUES (2862, 3152907, 'Pratápolis', 'MG', 315290);
INSERT INTO public.municipio
VALUES (2863, 3153004, 'Pratinha', 'MG', 315300);
INSERT INTO public.municipio
VALUES (2864, 3153103, 'Presidente Bernardes', 'MG', 315310);
INSERT INTO public.municipio
VALUES (2865, 3153202, 'Presidente Juscelino', 'MG', 315320);
INSERT INTO public.municipio
VALUES (2866, 3153301, 'Presidente Kubitschek', 'MG', 315330);
INSERT INTO public.municipio
VALUES (2867, 3153400, 'Presidente Olegário', 'MG', 315340);
INSERT INTO public.municipio
VALUES (2868, 3153509, 'Alto Jequitibá', 'MG', 315350);
INSERT INTO public.municipio
VALUES (2869, 3153608, 'Prudente de Morais', 'MG', 315360);
INSERT INTO public.municipio
VALUES (2870, 3153707, 'Quartel Geral', 'MG', 315370);
INSERT INTO public.municipio
VALUES (2871, 3153806, 'Queluzito', 'MG', 315380);
INSERT INTO public.municipio
VALUES (2872, 3153905, 'Raposos', 'MG', 315390);
INSERT INTO public.municipio
VALUES (2873, 3154002, 'Raul Soares', 'MG', 315400);
INSERT INTO public.municipio
VALUES (2874, 3154101, 'Recreio', 'MG', 315410);
INSERT INTO public.municipio
VALUES (2875, 3154150, 'Reduto', 'MG', 315415);
INSERT INTO public.municipio
VALUES (2876, 3154200, 'Resende Costa', 'MG', 315420);
INSERT INTO public.municipio
VALUES (2877, 3154309, 'Resplendor', 'MG', 315430);
INSERT INTO public.municipio
VALUES (2878, 3154408, 'Ressaquinha', 'MG', 315440);
INSERT INTO public.municipio
VALUES (2879, 3154457, 'Riachinho', 'MG', 315445);
INSERT INTO public.municipio
VALUES (2880, 3154507, 'Riacho dos Machados', 'MG', 315450);
INSERT INTO public.municipio
VALUES (2881, 3154606, 'Ribeirão das Neves', 'MG', 315460);
INSERT INTO public.municipio
VALUES (2882, 3154705, 'Ribeirão Vermelho', 'MG', 315470);
INSERT INTO public.municipio
VALUES (2883, 3154804, 'Rio Acima', 'MG', 315480);
INSERT INTO public.municipio
VALUES (2884, 3154903, 'Rio Casca', 'MG', 315490);
INSERT INTO public.municipio
VALUES (2885, 3155009, 'Rio Doce', 'MG', 315500);
INSERT INTO public.municipio
VALUES (2886, 3155108, 'Rio do Prado', 'MG', 315510);
INSERT INTO public.municipio
VALUES (2887, 3155207, 'Rio Espera', 'MG', 315520);
INSERT INTO public.municipio
VALUES (2888, 3155306, 'Rio Manso', 'MG', 315530);
INSERT INTO public.municipio
VALUES (2889, 3155405, 'Rio Novo', 'MG', 315540);
INSERT INTO public.municipio
VALUES (2890, 3155504, 'Rio Paranaíba', 'MG', 315550);
INSERT INTO public.municipio
VALUES (2891, 3155603, 'Rio Pardo de Minas', 'MG', 315560);
INSERT INTO public.municipio
VALUES (2892, 3155702, 'Rio Piracicaba', 'MG', 315570);
INSERT INTO public.municipio
VALUES (2893, 3155801, 'Rio Pomba', 'MG', 315580);
INSERT INTO public.municipio
VALUES (2894, 3155900, 'Rio Preto', 'MG', 315590);
INSERT INTO public.municipio
VALUES (2895, 3156007, 'Rio Vermelho', 'MG', 315600);
INSERT INTO public.municipio
VALUES (2896, 3156106, 'Ritápolis', 'MG', 315610);
INSERT INTO public.municipio
VALUES (2897, 3156205, 'Rochedo de Minas', 'MG', 315620);
INSERT INTO public.municipio
VALUES (2898, 3156304, 'Rodeiro', 'MG', 315630);
INSERT INTO public.municipio
VALUES (2899, 3156403, 'Romaria', 'MG', 315640);
INSERT INTO public.municipio
VALUES (2900, 3156452, 'Rosário da Limeira', 'MG', 315645);
INSERT INTO public.municipio
VALUES (2901, 3156502, 'Rubelita', 'MG', 315650);
INSERT INTO public.municipio
VALUES (2902, 3156601, 'Rubim', 'MG', 315660);
INSERT INTO public.municipio
VALUES (2903, 3156700, 'Sabará', 'MG', 315670);
INSERT INTO public.municipio
VALUES (2904, 3156809, 'Sabinópolis', 'MG', 315680);
INSERT INTO public.municipio
VALUES (2905, 3156908, 'Sacramento', 'MG', 315690);
INSERT INTO public.municipio
VALUES (2906, 3157005, 'Salinas', 'MG', 315700);
INSERT INTO public.municipio
VALUES (2907, 3157104, 'Salto da Divisa', 'MG', 315710);
INSERT INTO public.municipio
VALUES (2908, 3157203, 'Santa Bárbara', 'MG', 315720);
INSERT INTO public.municipio
VALUES (2909, 3157252, 'Santa Bárbara do Leste', 'MG', 315725);
INSERT INTO public.municipio
VALUES (2910, 3157278, 'Santa Bárbara do Monte Verde', 'MG', 315727);
INSERT INTO public.municipio
VALUES (2911, 3157302, 'Santa Bárbara do Tugúrio', 'MG', 315730);
INSERT INTO public.municipio
VALUES (2912, 3157336, 'Santa Cruz de Minas', 'MG', 315733);
INSERT INTO public.municipio
VALUES (2913, 3157377, 'Santa Cruz de Salinas', 'MG', 315737);
INSERT INTO public.municipio
VALUES (2914, 3157401, 'Santa Cruz do Escalvado', 'MG', 315740);
INSERT INTO public.municipio
VALUES (2915, 3157500, 'Santa Efigênia de Minas', 'MG', 315750);
INSERT INTO public.municipio
VALUES (2916, 3157609, 'Santa Fé de Minas', 'MG', 315760);
INSERT INTO public.municipio
VALUES (2917, 3157658, 'Santa Helena de Minas', 'MG', 315765);
INSERT INTO public.municipio
VALUES (2918, 3157708, 'Santa Juliana', 'MG', 315770);
INSERT INTO public.municipio
VALUES (2919, 3157807, 'Santa Luzia', 'MG', 315780);
INSERT INTO public.municipio
VALUES (2920, 3157906, 'Santa Margarida', 'MG', 315790);
INSERT INTO public.municipio
VALUES (2921, 3158003, 'Santa Maria de Itabira', 'MG', 315800);
INSERT INTO public.municipio
VALUES (2922, 3158102, 'Santa Maria do Salto', 'MG', 315810);
INSERT INTO public.municipio
VALUES (2923, 3158201, 'Santa Maria do Suaçuí', 'MG', 315820);
INSERT INTO public.municipio
VALUES (2924, 3158300, 'Santana da Vargem', 'MG', 315830);
INSERT INTO public.municipio
VALUES (2925, 3158409, 'Santana de Cataguases', 'MG', 315840);
INSERT INTO public.municipio
VALUES (2926, 3158508, 'Santana de Pirapama', 'MG', 315850);
INSERT INTO public.municipio
VALUES (2927, 3158607, 'Santana do Deserto', 'MG', 315860);
INSERT INTO public.municipio
VALUES (2928, 3158706, 'Santana do Garambéu', 'MG', 315870);
INSERT INTO public.municipio
VALUES (2929, 3158805, 'Santana do Jacaré', 'MG', 315880);
INSERT INTO public.municipio
VALUES (2930, 3158904, 'Santana do Manhuaçu', 'MG', 315890);
INSERT INTO public.municipio
VALUES (2931, 3158953, 'Santana do Paraíso', 'MG', 315895);
INSERT INTO public.municipio
VALUES (2932, 3159001, 'Santana do Riacho', 'MG', 315900);
INSERT INTO public.municipio
VALUES (2933, 3159100, 'Santana dos Montes', 'MG', 315910);
INSERT INTO public.municipio
VALUES (2934, 3159209, 'Santa Rita de Caldas', 'MG', 315920);
INSERT INTO public.municipio
VALUES (2935, 3159308, 'Santa Rita de Jacutinga', 'MG', 315930);
INSERT INTO public.municipio
VALUES (2936, 3159357, 'Santa Rita de Minas', 'MG', 315935);
INSERT INTO public.municipio
VALUES (2937, 3159407, 'Santa Rita de Ibitipoca', 'MG', 315940);
INSERT INTO public.municipio
VALUES (2938, 3159506, 'Santa Rita do Itueto', 'MG', 315950);
INSERT INTO public.municipio
VALUES (2939, 3159605, 'Santa Rita do Sapucaí', 'MG', 315960);
INSERT INTO public.municipio
VALUES (2940, 3159704, 'Santa Rosa da Serra', 'MG', 315970);
INSERT INTO public.municipio
VALUES (2941, 3159803, 'Santa Vitória', 'MG', 315980);
INSERT INTO public.municipio
VALUES (2942, 3159902, 'Santo Antônio do Amparo', 'MG', 315990);
INSERT INTO public.municipio
VALUES (2943, 3160009, 'Santo Antônio do Aventureiro', 'MG', 316000);
INSERT INTO public.municipio
VALUES (2944, 3160108, 'Santo Antônio do Grama', 'MG', 316010);
INSERT INTO public.municipio
VALUES (2945, 3160207, 'Santo Antônio do Itambé', 'MG', 316020);
INSERT INTO public.municipio
VALUES (2946, 3160306, 'Santo Antônio do Jacinto', 'MG', 316030);
INSERT INTO public.municipio
VALUES (2947, 3160405, 'Santo Antônio do Monte', 'MG', 316040);
INSERT INTO public.municipio
VALUES (2948, 3160454, 'Santo Antônio do Retiro', 'MG', 316045);
INSERT INTO public.municipio
VALUES (2949, 3160504, 'Santo Antônio do Rio Abaixo', 'MG', 316050);
INSERT INTO public.municipio
VALUES (2950, 3160603, 'Santo Hipólito', 'MG', 316060);
INSERT INTO public.municipio
VALUES (2951, 3160702, 'Santos Dumont', 'MG', 316070);
INSERT INTO public.municipio
VALUES (2952, 3160801, 'São Bento Abade', 'MG', 316080);
INSERT INTO public.municipio
VALUES (2953, 3160900, 'São Brás do Suaçuí', 'MG', 316090);
INSERT INTO public.municipio
VALUES (2954, 3160959, 'São Domingos das Dores', 'MG', 316095);
INSERT INTO public.municipio
VALUES (2955, 3161007, 'São Domingos do Prata', 'MG', 316100);
INSERT INTO public.municipio
VALUES (2956, 3161056, 'São Félix de Minas', 'MG', 316105);
INSERT INTO public.municipio
VALUES (2957, 3161106, 'São Francisco', 'MG', 316110);
INSERT INTO public.municipio
VALUES (2958, 3161205, 'São Francisco de Paula', 'MG', 316120);
INSERT INTO public.municipio
VALUES (2959, 3161304, 'São Francisco de Sales', 'MG', 316130);
INSERT INTO public.municipio
VALUES (2960, 3161403, 'São Francisco do Glória', 'MG', 316140);
INSERT INTO public.municipio
VALUES (2961, 3161502, 'São Geraldo', 'MG', 316150);
INSERT INTO public.municipio
VALUES (2962, 3161601, 'São Geraldo da Piedade', 'MG', 316160);
INSERT INTO public.municipio
VALUES (2963, 3161650, 'São Geraldo do Baixio', 'MG', 316165);
INSERT INTO public.municipio
VALUES (2964, 3161700, 'São Gonçalo do Abaeté', 'MG', 316170);
INSERT INTO public.municipio
VALUES (2965, 3161809, 'São Gonçalo do Pará', 'MG', 316180);
INSERT INTO public.municipio
VALUES (2966, 3161908, 'São Gonçalo do Rio Abaixo', 'MG', 316190);
INSERT INTO public.municipio
VALUES (2967, 3162005, 'São Gonçalo do Sapucaí', 'MG', 316200);
INSERT INTO public.municipio
VALUES (2968, 3162104, 'São Gotardo', 'MG', 316210);
INSERT INTO public.municipio
VALUES (2969, 3162203, 'São João Batista do Glória', 'MG', 316220);
INSERT INTO public.municipio
VALUES (2970, 3162252, 'São João da Lagoa', 'MG', 316225);
INSERT INTO public.municipio
VALUES (2971, 3162302, 'São João da Mata', 'MG', 316230);
INSERT INTO public.municipio
VALUES (2972, 3162401, 'São João da Ponte', 'MG', 316240);
INSERT INTO public.municipio
VALUES (2973, 3162450, 'São João das Missões', 'MG', 316245);
INSERT INTO public.municipio
VALUES (2974, 3162500, 'São João del Rei', 'MG', 316250);
INSERT INTO public.municipio
VALUES (2975, 3162559, 'São João do Manhuaçu', 'MG', 316255);
INSERT INTO public.municipio
VALUES (2976, 3162575, 'São João do Manteninha', 'MG', 316257);
INSERT INTO public.municipio
VALUES (2977, 3162609, 'São João do Oriente', 'MG', 316260);
INSERT INTO public.municipio
VALUES (2978, 3162658, 'São João do Pacuí', 'MG', 316265);
INSERT INTO public.municipio
VALUES (2979, 3162708, 'São João do Paraíso', 'MG', 316270);
INSERT INTO public.municipio
VALUES (2980, 3162807, 'São João Evangelista', 'MG', 316280);
INSERT INTO public.municipio
VALUES (2981, 3162906, 'São João Nepomuceno', 'MG', 316290);
INSERT INTO public.municipio
VALUES (2982, 3162922, 'São Joaquim de Bicas', 'MG', 316292);
INSERT INTO public.municipio
VALUES (2983, 3162948, 'São José da Barra', 'MG', 316294);
INSERT INTO public.municipio
VALUES (2984, 3162955, 'São José da Lapa', 'MG', 316295);
INSERT INTO public.municipio
VALUES (2985, 3163003, 'São José da Safira', 'MG', 316300);
INSERT INTO public.municipio
VALUES (2986, 3163102, 'São José da Varginha', 'MG', 316310);
INSERT INTO public.municipio
VALUES (2987, 3163201, 'São José do Alegre', 'MG', 316320);
INSERT INTO public.municipio
VALUES (2988, 3163300, 'São José do Divino', 'MG', 316330);
INSERT INTO public.municipio
VALUES (2989, 3163409, 'São José do Goiabal', 'MG', 316340);
INSERT INTO public.municipio
VALUES (2990, 3163508, 'São José do Jacuri', 'MG', 316350);
INSERT INTO public.municipio
VALUES (2991, 3163607, 'São José do Mantimento', 'MG', 316360);
INSERT INTO public.municipio
VALUES (2992, 3163706, 'São Lourenço', 'MG', 316370);
INSERT INTO public.municipio
VALUES (2993, 3163805, 'São Miguel do Anta', 'MG', 316380);
INSERT INTO public.municipio
VALUES (2994, 3163904, 'São Pedro da União', 'MG', 316390);
INSERT INTO public.municipio
VALUES (2995, 3164001, 'São Pedro dos Ferros', 'MG', 316400);
INSERT INTO public.municipio
VALUES (2996, 3164100, 'São Pedro do Suaçuí', 'MG', 316410);
INSERT INTO public.municipio
VALUES (2997, 3164209, 'São Romão', 'MG', 316420);
INSERT INTO public.municipio
VALUES (2998, 3164308, 'São Roque de Minas', 'MG', 316430);
INSERT INTO public.municipio
VALUES (2999, 3164407, 'São Sebastião da Bela Vista', 'MG', 316440);
INSERT INTO public.municipio
VALUES (3000, 3164431, 'São Sebastião da Vargem Alegre', 'MG', 316443);
INSERT INTO public.municipio
VALUES (3001, 3164472, 'São Sebastião do Anta', 'MG', 316447);
INSERT INTO public.municipio
VALUES (3002, 3164506, 'São Sebastião do Maranhão', 'MG', 316450);
INSERT INTO public.municipio
VALUES (3003, 3164605, 'São Sebastião do Oeste', 'MG', 316460);
INSERT INTO public.municipio
VALUES (3004, 3164704, 'São Sebastião do Paraíso', 'MG', 316470);
INSERT INTO public.municipio
VALUES (3005, 3164803, 'São Sebastião do Rio Preto', 'MG', 316480);
INSERT INTO public.municipio
VALUES (3006, 3164902, 'São Sebastião do Rio Verde', 'MG', 316490);
INSERT INTO public.municipio
VALUES (3007, 3165008, 'São Tiago', 'MG', 316500);
INSERT INTO public.municipio
VALUES (3008, 3165107, 'São Tomás de Aquino', 'MG', 316510);
INSERT INTO public.municipio
VALUES (3009, 3165206, 'São Thomé das Letras', 'MG', 316520);
INSERT INTO public.municipio
VALUES (3010, 3165305, 'São Vicente de Minas', 'MG', 316530);
INSERT INTO public.municipio
VALUES (3011, 3165404, 'Sapucaí-Mirim', 'MG', 316540);
INSERT INTO public.municipio
VALUES (3012, 3165503, 'Sardoá', 'MG', 316550);
INSERT INTO public.municipio
VALUES (3013, 3165537, 'Sarzedo', 'MG', 316553);
INSERT INTO public.municipio
VALUES (3014, 3165552, 'Setubinha', 'MG', 316555);
INSERT INTO public.municipio
VALUES (3015, 3165560, 'Sem-Peixe', 'MG', 316556);
INSERT INTO public.municipio
VALUES (3016, 3165578, 'Senador Amaral', 'MG', 316557);
INSERT INTO public.municipio
VALUES (3017, 3165602, 'Senador Cortes', 'MG', 316560);
INSERT INTO public.municipio
VALUES (3018, 3165701, 'Senador Firmino', 'MG', 316570);
INSERT INTO public.municipio
VALUES (3019, 3165800, 'Senador José Bento', 'MG', 316580);
INSERT INTO public.municipio
VALUES (3020, 3165909, 'Senador Modestino Gonçalves', 'MG', 316590);
INSERT INTO public.municipio
VALUES (3021, 3166006, 'Senhora de Oliveira', 'MG', 316600);
INSERT INTO public.municipio
VALUES (3022, 3166105, 'Senhora do Porto', 'MG', 316610);
INSERT INTO public.municipio
VALUES (3023, 3166204, 'Senhora dos Remédios', 'MG', 316620);
INSERT INTO public.municipio
VALUES (3024, 3166303, 'Sericita', 'MG', 316630);
INSERT INTO public.municipio
VALUES (3025, 3166402, 'Seritinga', 'MG', 316640);
INSERT INTO public.municipio
VALUES (3026, 3166501, 'Serra Azul de Minas', 'MG', 316650);
INSERT INTO public.municipio
VALUES (3027, 3166600, 'Serra da Saudade', 'MG', 316660);
INSERT INTO public.municipio
VALUES (3028, 3166709, 'Serra dos Aimorés', 'MG', 316670);
INSERT INTO public.municipio
VALUES (3029, 3166808, 'Serra do Salitre', 'MG', 316680);
INSERT INTO public.municipio
VALUES (3030, 3166907, 'Serrania', 'MG', 316690);
INSERT INTO public.municipio
VALUES (3031, 3166956, 'Serranópolis de Minas', 'MG', 316695);
INSERT INTO public.municipio
VALUES (3032, 3167004, 'Serranos', 'MG', 316700);
INSERT INTO public.municipio
VALUES (3033, 3167103, 'Serro', 'MG', 316710);
INSERT INTO public.municipio
VALUES (3034, 3167202, 'Sete Lagoas', 'MG', 316720);
INSERT INTO public.municipio
VALUES (3035, 3167301, 'Silveirânia', 'MG', 316730);
INSERT INTO public.municipio
VALUES (3036, 3167400, 'Silvianópolis', 'MG', 316740);
INSERT INTO public.municipio
VALUES (3037, 3167509, 'Simão Pereira', 'MG', 316750);
INSERT INTO public.municipio
VALUES (3038, 3167608, 'Simonésia', 'MG', 316760);
INSERT INTO public.municipio
VALUES (3039, 3167707, 'Sobrália', 'MG', 316770);
INSERT INTO public.municipio
VALUES (3040, 3167806, 'Soledade de Minas', 'MG', 316780);
INSERT INTO public.municipio
VALUES (3041, 3167905, 'Tabuleiro', 'MG', 316790);
INSERT INTO public.municipio
VALUES (3042, 3168002, 'Taiobeiras', 'MG', 316800);
INSERT INTO public.municipio
VALUES (3043, 3168051, 'Taparuba', 'MG', 316805);
INSERT INTO public.municipio
VALUES (3044, 3168101, 'Tapira', 'MG', 316810);
INSERT INTO public.municipio
VALUES (3045, 3168200, 'Tapiraí', 'MG', 316820);
INSERT INTO public.municipio
VALUES (3046, 3168309, 'Taquaraçu de Minas', 'MG', 316830);
INSERT INTO public.municipio
VALUES (3047, 3168408, 'Tarumirim', 'MG', 316840);
INSERT INTO public.municipio
VALUES (3048, 3168507, 'Teixeiras', 'MG', 316850);
INSERT INTO public.municipio
VALUES (3049, 3168606, 'Teófilo Otoni', 'MG', 316860);
INSERT INTO public.municipio
VALUES (3050, 3168705, 'Timóteo', 'MG', 316870);
INSERT INTO public.municipio
VALUES (3051, 3168804, 'Tiradentes', 'MG', 316880);
INSERT INTO public.municipio
VALUES (3052, 3168903, 'Tiros', 'MG', 316890);
INSERT INTO public.municipio
VALUES (3053, 3169000, 'Tocantins', 'MG', 316900);
INSERT INTO public.municipio
VALUES (3054, 3169059, 'Tocos do Moji', 'MG', 316905);
INSERT INTO public.municipio
VALUES (3055, 3169109, 'Toledo', 'MG', 316910);
INSERT INTO public.municipio
VALUES (3056, 3169208, 'Tombos', 'MG', 316920);
INSERT INTO public.municipio
VALUES (3057, 3169307, 'Três Corações', 'MG', 316930);
INSERT INTO public.municipio
VALUES (3058, 3169356, 'Três Marias', 'MG', 316935);
INSERT INTO public.municipio
VALUES (3059, 3169406, 'Três Pontas', 'MG', 316940);
INSERT INTO public.municipio
VALUES (3060, 3169505, 'Tumiritinga', 'MG', 316950);
INSERT INTO public.municipio
VALUES (3061, 3169604, 'Tupaciguara', 'MG', 316960);
INSERT INTO public.municipio
VALUES (3062, 3169703, 'Turmalina', 'MG', 316970);
INSERT INTO public.municipio
VALUES (3063, 3169802, 'Turvolândia', 'MG', 316980);
INSERT INTO public.municipio
VALUES (3064, 3169901, 'Ubá', 'MG', 316990);
INSERT INTO public.municipio
VALUES (3065, 3170008, 'Ubaí', 'MG', 317000);
INSERT INTO public.municipio
VALUES (3066, 3170057, 'Ubaporanga', 'MG', 317005);
INSERT INTO public.municipio
VALUES (3067, 3170107, 'Uberaba', 'MG', 317010);
INSERT INTO public.municipio
VALUES (3068, 3170206, 'Uberlândia', 'MG', 317020);
INSERT INTO public.municipio
VALUES (3069, 3170305, 'Umburatiba', 'MG', 317030);
INSERT INTO public.municipio
VALUES (3070, 3170404, 'Unaí', 'MG', 317040);
INSERT INTO public.municipio
VALUES (3071, 3170438, 'União de Minas', 'MG', 317043);
INSERT INTO public.municipio
VALUES (3072, 3170479, 'Uruana de Minas', 'MG', 317047);
INSERT INTO public.municipio
VALUES (3073, 3170503, 'Urucânia', 'MG', 317050);
INSERT INTO public.municipio
VALUES (3074, 3170529, 'Urucuia', 'MG', 317052);
INSERT INTO public.municipio
VALUES (3075, 3170578, 'Vargem Alegre', 'MG', 317057);
INSERT INTO public.municipio
VALUES (3076, 3170602, 'Vargem Bonita', 'MG', 317060);
INSERT INTO public.municipio
VALUES (3077, 3170651, 'Vargem Grande do Rio Pardo', 'MG', 317065);
INSERT INTO public.municipio
VALUES (3078, 3170701, 'Varginha', 'MG', 317070);
INSERT INTO public.municipio
VALUES (3079, 3170750, 'Varjão de Minas', 'MG', 317075);
INSERT INTO public.municipio
VALUES (3080, 3170800, 'Várzea da Palma', 'MG', 317080);
INSERT INTO public.municipio
VALUES (3081, 3170909, 'Varzelândia', 'MG', 317090);
INSERT INTO public.municipio
VALUES (3082, 3171006, 'Vazante', 'MG', 317100);
INSERT INTO public.municipio
VALUES (3083, 3171030, 'Verdelândia', 'MG', 317103);
INSERT INTO public.municipio
VALUES (3084, 3171071, 'Veredinha', 'MG', 317107);
INSERT INTO public.municipio
VALUES (3085, 3171105, 'Veríssimo', 'MG', 317110);
INSERT INTO public.municipio
VALUES (3086, 3171154, 'Vermelho Novo', 'MG', 317115);
INSERT INTO public.municipio
VALUES (3087, 3171204, 'Vespasiano', 'MG', 317120);
INSERT INTO public.municipio
VALUES (3088, 3171303, 'Viçosa', 'MG', 317130);
INSERT INTO public.municipio
VALUES (3089, 3171402, 'Vieiras', 'MG', 317140);
INSERT INTO public.municipio
VALUES (3090, 3171501, 'Mathias Lobato', 'MG', 317150);
INSERT INTO public.municipio
VALUES (3091, 3171600, 'Virgem da Lapa', 'MG', 317160);
INSERT INTO public.municipio
VALUES (3092, 3171709, 'Virgínia', 'MG', 317170);
INSERT INTO public.municipio
VALUES (3093, 3171808, 'Virginópolis', 'MG', 317180);
INSERT INTO public.municipio
VALUES (3094, 3171907, 'Virgolândia', 'MG', 317190);
INSERT INTO public.municipio
VALUES (3095, 3172004, 'Visconde do Rio Branco', 'MG', 317200);
INSERT INTO public.municipio
VALUES (3096, 3172103, 'Volta Grande', 'MG', 317210);
INSERT INTO public.municipio
VALUES (3097, 3172202, 'Wenceslau Braz', 'MG', 317220);
INSERT INTO public.municipio
VALUES (3098, 3200102, 'Afonso Cláudio', 'ES', 320010);
INSERT INTO public.municipio
VALUES (3099, 3200136, 'Águia Branca', 'ES', 320013);
INSERT INTO public.municipio
VALUES (3100, 3200169, 'Água Doce do Norte', 'ES', 320016);
INSERT INTO public.municipio
VALUES (3101, 3200201, 'Alegre', 'ES', 320020);
INSERT INTO public.municipio
VALUES (3102, 3200300, 'Alfredo Chaves', 'ES', 320030);
INSERT INTO public.municipio
VALUES (3103, 3200359, 'Alto Rio Novo', 'ES', 320035);
INSERT INTO public.municipio
VALUES (3104, 3200409, 'Anchieta', 'ES', 320040);
INSERT INTO public.municipio
VALUES (3105, 3200508, 'Apiacá', 'ES', 320050);
INSERT INTO public.municipio
VALUES (3106, 3200607, 'Aracruz', 'ES', 320060);
INSERT INTO public.municipio
VALUES (3107, 3200706, 'Atilio Vivacqua', 'ES', 320070);
INSERT INTO public.municipio
VALUES (3108, 3200805, 'Baixo Guandu', 'ES', 320080);
INSERT INTO public.municipio
VALUES (3109, 3200904, 'Barra de São Francisco', 'ES', 320090);
INSERT INTO public.municipio
VALUES (3110, 3201001, 'Boa Esperança', 'ES', 320100);
INSERT INTO public.municipio
VALUES (3111, 3201100, 'Bom Jesus do Norte', 'ES', 320110);
INSERT INTO public.municipio
VALUES (3112, 3201159, 'Brejetuba', 'ES', 320115);
INSERT INTO public.municipio
VALUES (3113, 3201209, 'Cachoeiro de Itapemirim', 'ES', 320120);
INSERT INTO public.municipio
VALUES (3114, 3201308, 'Cariacica', 'ES', 320130);
INSERT INTO public.municipio
VALUES (3115, 3201407, 'Castelo', 'ES', 320140);
INSERT INTO public.municipio
VALUES (3116, 3201506, 'Colatina', 'ES', 320150);
INSERT INTO public.municipio
VALUES (3117, 3201605, 'Conceição da Barra', 'ES', 320160);
INSERT INTO public.municipio
VALUES (3118, 3201704, 'Conceição do Castelo', 'ES', 320170);
INSERT INTO public.municipio
VALUES (3119, 3201803, 'Divino de São Lourenço', 'ES', 320180);
INSERT INTO public.municipio
VALUES (3120, 3201902, 'Domingos Martins', 'ES', 320190);
INSERT INTO public.municipio
VALUES (3121, 3202009, 'Dores do Rio Preto', 'ES', 320200);
INSERT INTO public.municipio
VALUES (3122, 3202108, 'Ecoporanga', 'ES', 320210);
INSERT INTO public.municipio
VALUES (3123, 3202207, 'Fundão', 'ES', 320220);
INSERT INTO public.municipio
VALUES (3124, 3202256, 'Governador Lindenberg', 'ES', 320225);
INSERT INTO public.municipio
VALUES (3125, 3202306, 'Guaçuí', 'ES', 320230);
INSERT INTO public.municipio
VALUES (3126, 3202405, 'Guarapari', 'ES', 320240);
INSERT INTO public.municipio
VALUES (3127, 3202454, 'Ibatiba', 'ES', 320245);
INSERT INTO public.municipio
VALUES (3128, 3202504, 'Ibiraçu', 'ES', 320250);
INSERT INTO public.municipio
VALUES (3129, 3202553, 'Ibitirama', 'ES', 320255);
INSERT INTO public.municipio
VALUES (3130, 3202603, 'Iconha', 'ES', 320260);
INSERT INTO public.municipio
VALUES (3131, 3202652, 'Irupi', 'ES', 320265);
INSERT INTO public.municipio
VALUES (3132, 3202702, 'Itaguaçu', 'ES', 320270);
INSERT INTO public.municipio
VALUES (3133, 3202801, 'Itapemirim', 'ES', 320280);
INSERT INTO public.municipio
VALUES (3134, 3202900, 'Itarana', 'ES', 320290);
INSERT INTO public.municipio
VALUES (3135, 3203007, 'Iúna', 'ES', 320300);
INSERT INTO public.municipio
VALUES (3136, 3203056, 'Jaguaré', 'ES', 320305);
INSERT INTO public.municipio
VALUES (3137, 3203106, 'Jerônimo Monteiro', 'ES', 320310);
INSERT INTO public.municipio
VALUES (3138, 3203130, 'João Neiva', 'ES', 320313);
INSERT INTO public.municipio
VALUES (3139, 3203163, 'Laranja da Terra', 'ES', 320316);
INSERT INTO public.municipio
VALUES (3140, 3203205, 'Linhares', 'ES', 320320);
INSERT INTO public.municipio
VALUES (3141, 3203304, 'Mantenópolis', 'ES', 320330);
INSERT INTO public.municipio
VALUES (3142, 3203320, 'Marataízes', 'ES', 320332);
INSERT INTO public.municipio
VALUES (3143, 3203346, 'Marechal Floriano', 'ES', 320334);
INSERT INTO public.municipio
VALUES (3144, 3203353, 'Marilândia', 'ES', 320335);
INSERT INTO public.municipio
VALUES (3145, 3203403, 'Mimoso do Sul', 'ES', 320340);
INSERT INTO public.municipio
VALUES (3146, 3203502, 'Montanha', 'ES', 320350);
INSERT INTO public.municipio
VALUES (3147, 3203601, 'Mucurici', 'ES', 320360);
INSERT INTO public.municipio
VALUES (3148, 3203700, 'Muniz Freire', 'ES', 320370);
INSERT INTO public.municipio
VALUES (3149, 3203809, 'Muqui', 'ES', 320380);
INSERT INTO public.municipio
VALUES (3150, 3203908, 'Nova Venécia', 'ES', 320390);
INSERT INTO public.municipio
VALUES (3151, 3204005, 'Pancas', 'ES', 320400);
INSERT INTO public.municipio
VALUES (3152, 3204054, 'Pedro Canário', 'ES', 320405);
INSERT INTO public.municipio
VALUES (3153, 3204104, 'Pinheiros', 'ES', 320410);
INSERT INTO public.municipio
VALUES (3154, 3204203, 'Piúma', 'ES', 320420);
INSERT INTO public.municipio
VALUES (3155, 3204252, 'Ponto Belo', 'ES', 320425);
INSERT INTO public.municipio
VALUES (3156, 3204302, 'Presidente Kennedy', 'ES', 320430);
INSERT INTO public.municipio
VALUES (3157, 3204351, 'Rio Bananal', 'ES', 320435);
INSERT INTO public.municipio
VALUES (3158, 3204401, 'Rio Novo do Sul', 'ES', 320440);
INSERT INTO public.municipio
VALUES (3159, 3204500, 'Santa Leopoldina', 'ES', 320450);
INSERT INTO public.municipio
VALUES (3160, 3204559, 'Santa Maria de Jetibá', 'ES', 320455);
INSERT INTO public.municipio
VALUES (3161, 3204609, 'Santa Teresa', 'ES', 320460);
INSERT INTO public.municipio
VALUES (3162, 3204658, 'São Domingos do Norte', 'ES', 320465);
INSERT INTO public.municipio
VALUES (3163, 3204708, 'São Gabriel da Palha', 'ES', 320470);
INSERT INTO public.municipio
VALUES (3164, 3204807, 'São José do Calçado', 'ES', 320480);
INSERT INTO public.municipio
VALUES (3165, 3204906, 'São Mateus', 'ES', 320490);
INSERT INTO public.municipio
VALUES (3166, 3204955, 'São Roque do Canaã', 'ES', 320495);
INSERT INTO public.municipio
VALUES (3167, 3205002, 'Serra', 'ES', 320500);
INSERT INTO public.municipio
VALUES (3168, 3205010, 'Sooretama', 'ES', 320501);
INSERT INTO public.municipio
VALUES (3169, 3205036, 'Vargem Alta', 'ES', 320503);
INSERT INTO public.municipio
VALUES (3170, 3205069, 'Venda Nova do Imigrante', 'ES', 320506);
INSERT INTO public.municipio
VALUES (3171, 3205101, 'Viana', 'ES', 320510);
INSERT INTO public.municipio
VALUES (3172, 3205150, 'Vila Pavão', 'ES', 320515);
INSERT INTO public.municipio
VALUES (3173, 3205176, 'Vila Valério', 'ES', 320517);
INSERT INTO public.municipio
VALUES (3174, 3205200, 'Vila Velha', 'ES', 320520);
INSERT INTO public.municipio
VALUES (3175, 3205309, 'Vitória', 'ES', 320530);
INSERT INTO public.municipio
VALUES (3176, 3300100, 'Angra dos Reis', 'RJ', 330010);
INSERT INTO public.municipio
VALUES (3177, 3300159, 'Aperibé', 'RJ', 330015);
INSERT INTO public.municipio
VALUES (3178, 3300209, 'Araruama', 'RJ', 330020);
INSERT INTO public.municipio
VALUES (3179, 3300225, 'Areal', 'RJ', 330022);
INSERT INTO public.municipio
VALUES (3180, 3300233, 'Armação dos Búzios', 'RJ', 330023);
INSERT INTO public.municipio
VALUES (3181, 3300258, 'Arraial do Cabo', 'RJ', 330025);
INSERT INTO public.municipio
VALUES (3182, 3300308, 'Barra do Piraí', 'RJ', 330030);
INSERT INTO public.municipio
VALUES (3183, 3300407, 'Barra Mansa', 'RJ', 330040);
INSERT INTO public.municipio
VALUES (3184, 3300456, 'Belford Roxo', 'RJ', 330045);
INSERT INTO public.municipio
VALUES (3185, 3300506, 'Bom Jardim', 'RJ', 330050);
INSERT INTO public.municipio
VALUES (3186, 3300605, 'Bom Jesus do Itabapoana', 'RJ', 330060);
INSERT INTO public.municipio
VALUES (3187, 3300704, 'Cabo Frio', 'RJ', 330070);
INSERT INTO public.municipio
VALUES (3188, 3300803, 'Cachoeiras de Macacu', 'RJ', 330080);
INSERT INTO public.municipio
VALUES (3189, 3300902, 'Cambuci', 'RJ', 330090);
INSERT INTO public.municipio
VALUES (3190, 3300936, 'Carapebus', 'RJ', 330093);
INSERT INTO public.municipio
VALUES (3191, 3300951, 'Comendador Levy Gasparian', 'RJ', 330095);
INSERT INTO public.municipio
VALUES (3192, 3301009, 'Campos dos Goytacazes', 'RJ', 330100);
INSERT INTO public.municipio
VALUES (3193, 3301108, 'Cantagalo', 'RJ', 330110);
INSERT INTO public.municipio
VALUES (3194, 3301157, 'Cardoso Moreira', 'RJ', 330115);
INSERT INTO public.municipio
VALUES (3195, 3301207, 'Carmo', 'RJ', 330120);
INSERT INTO public.municipio
VALUES (3196, 3301306, 'Casimiro de Abreu', 'RJ', 330130);
INSERT INTO public.municipio
VALUES (3197, 3301405, 'Conceição de Macabu', 'RJ', 330140);
INSERT INTO public.municipio
VALUES (3198, 3301504, 'Cordeiro', 'RJ', 330150);
INSERT INTO public.municipio
VALUES (3199, 3301603, 'Duas Barras', 'RJ', 330160);
INSERT INTO public.municipio
VALUES (3200, 3301702, 'Duque de Caxias', 'RJ', 330170);
INSERT INTO public.municipio
VALUES (3201, 3301801, 'Engenheiro Paulo de Frontin', 'RJ', 330180);
INSERT INTO public.municipio
VALUES (3202, 3301850, 'Guapimirim', 'RJ', 330185);
INSERT INTO public.municipio
VALUES (3203, 3301876, 'Iguaba Grande', 'RJ', 330187);
INSERT INTO public.municipio
VALUES (3204, 3301900, 'Itaboraí', 'RJ', 330190);
INSERT INTO public.municipio
VALUES (3205, 3302007, 'Itaguaí', 'RJ', 330200);
INSERT INTO public.municipio
VALUES (3206, 3302056, 'Italva', 'RJ', 330205);
INSERT INTO public.municipio
VALUES (3207, 3302106, 'Itaocara', 'RJ', 330210);
INSERT INTO public.municipio
VALUES (3208, 3302205, 'Itaperuna', 'RJ', 330220);
INSERT INTO public.municipio
VALUES (3209, 3302254, 'Itatiaia', 'RJ', 330225);
INSERT INTO public.municipio
VALUES (3210, 3302270, 'Japeri', 'RJ', 330227);
INSERT INTO public.municipio
VALUES (3211, 3302304, 'Laje do Muriaé', 'RJ', 330230);
INSERT INTO public.municipio
VALUES (3212, 3302403, 'Macaé', 'RJ', 330240);
INSERT INTO public.municipio
VALUES (3213, 3302452, 'Macuco', 'RJ', 330245);
INSERT INTO public.municipio
VALUES (3214, 3302502, 'Magé', 'RJ', 330250);
INSERT INTO public.municipio
VALUES (3215, 3302601, 'Mangaratiba', 'RJ', 330260);
INSERT INTO public.municipio
VALUES (3216, 3302700, 'Maricá', 'RJ', 330270);
INSERT INTO public.municipio
VALUES (3217, 3302809, 'Mendes', 'RJ', 330280);
INSERT INTO public.municipio
VALUES (3218, 3302858, 'Mesquita', 'RJ', 330285);
INSERT INTO public.municipio
VALUES (3219, 3302908, 'Miguel Pereira', 'RJ', 330290);
INSERT INTO public.municipio
VALUES (3220, 3303005, 'Miracema', 'RJ', 330300);
INSERT INTO public.municipio
VALUES (3221, 3303104, 'Natividade', 'RJ', 330310);
INSERT INTO public.municipio
VALUES (3222, 3303203, 'Nilópolis', 'RJ', 330320);
INSERT INTO public.municipio
VALUES (3223, 3303302, 'Niterói', 'RJ', 330330);
INSERT INTO public.municipio
VALUES (3224, 3303401, 'Nova Friburgo', 'RJ', 330340);
INSERT INTO public.municipio
VALUES (3225, 3303500, 'Nova Iguaçu', 'RJ', 330350);
INSERT INTO public.municipio
VALUES (3226, 3303609, 'Paracambi', 'RJ', 330360);
INSERT INTO public.municipio
VALUES (3227, 3303708, 'Paraíba do Sul', 'RJ', 330370);
INSERT INTO public.municipio
VALUES (3228, 3303807, 'Paraty', 'RJ', 330380);
INSERT INTO public.municipio
VALUES (3229, 3303856, 'Paty do Alferes', 'RJ', 330385);
INSERT INTO public.municipio
VALUES (3230, 3303906, 'Petrópolis', 'RJ', 330390);
INSERT INTO public.municipio
VALUES (3231, 3303955, 'Pinheiral', 'RJ', 330395);
INSERT INTO public.municipio
VALUES (3232, 3304003, 'Piraí', 'RJ', 330400);
INSERT INTO public.municipio
VALUES (3233, 3304102, 'Porciúncula', 'RJ', 330410);
INSERT INTO public.municipio
VALUES (3234, 3304110, 'Porto Real', 'RJ', 330411);
INSERT INTO public.municipio
VALUES (3235, 3304128, 'Quatis', 'RJ', 330412);
INSERT INTO public.municipio
VALUES (3236, 3304144, 'Queimados', 'RJ', 330414);
INSERT INTO public.municipio
VALUES (3237, 3304151, 'Quissamã', 'RJ', 330415);
INSERT INTO public.municipio
VALUES (3238, 3304201, 'Resende', 'RJ', 330420);
INSERT INTO public.municipio
VALUES (3239, 3304300, 'Rio Bonito', 'RJ', 330430);
INSERT INTO public.municipio
VALUES (3240, 3304409, 'Rio Claro', 'RJ', 330440);
INSERT INTO public.municipio
VALUES (3241, 3304508, 'Rio das Flores', 'RJ', 330450);
INSERT INTO public.municipio
VALUES (3242, 3304524, 'Rio das Ostras', 'RJ', 330452);
INSERT INTO public.municipio
VALUES (3243, 3304557, 'Rio de Janeiro', 'RJ', 330455);
INSERT INTO public.municipio
VALUES (3244, 3304607, 'Santa Maria Madalena', 'RJ', 330460);
INSERT INTO public.municipio
VALUES (3245, 3304706, 'Santo Antônio de Pádua', 'RJ', 330470);
INSERT INTO public.municipio
VALUES (3246, 3304755, 'São Francisco de Itabapoana', 'RJ', 330475);
INSERT INTO public.municipio
VALUES (3247, 3304805, 'São Fidélis', 'RJ', 330480);
INSERT INTO public.municipio
VALUES (3248, 3304904, 'São Gonçalo', 'RJ', 330490);
INSERT INTO public.municipio
VALUES (3249, 3305000, 'São João da Barra', 'RJ', 330500);
INSERT INTO public.municipio
VALUES (3250, 3305109, 'São João de Meriti', 'RJ', 330510);
INSERT INTO public.municipio
VALUES (3251, 3305133, 'São José de Ubá', 'RJ', 330513);
INSERT INTO public.municipio
VALUES (3252, 3305158, 'São José do Vale do Rio Preto', 'RJ', 330515);
INSERT INTO public.municipio
VALUES (3253, 3305208, 'São Pedro da Aldeia', 'RJ', 330520);
INSERT INTO public.municipio
VALUES (3254, 3305307, 'São Sebastião do Alto', 'RJ', 330530);
INSERT INTO public.municipio
VALUES (3255, 3305406, 'Sapucaia', 'RJ', 330540);
INSERT INTO public.municipio
VALUES (3256, 3305505, 'Saquarema', 'RJ', 330550);
INSERT INTO public.municipio
VALUES (3257, 3305554, 'Seropédica', 'RJ', 330555);
INSERT INTO public.municipio
VALUES (3258, 3305604, 'Silva Jardim', 'RJ', 330560);
INSERT INTO public.municipio
VALUES (3259, 3305703, 'Sumidouro', 'RJ', 330570);
INSERT INTO public.municipio
VALUES (3260, 3305752, 'Tanguá', 'RJ', 330575);
INSERT INTO public.municipio
VALUES (3261, 3305802, 'Teresópolis', 'RJ', 330580);
INSERT INTO public.municipio
VALUES (3262, 3305901, 'Trajano de Moraes', 'RJ', 330590);
INSERT INTO public.municipio
VALUES (3263, 3306008, 'Três Rios', 'RJ', 330600);
INSERT INTO public.municipio
VALUES (3264, 3306107, 'Valença', 'RJ', 330610);
INSERT INTO public.municipio
VALUES (3265, 3306156, 'Varre-Sai', 'RJ', 330615);
INSERT INTO public.municipio
VALUES (3266, 3306206, 'Vassouras', 'RJ', 330620);
INSERT INTO public.municipio
VALUES (3267, 3306305, 'Volta Redonda', 'RJ', 330630);
INSERT INTO public.municipio
VALUES (3268, 3500105, 'Adamantina', 'SP', 350010);
INSERT INTO public.municipio
VALUES (3269, 3500204, 'Adolfo', 'SP', 350020);
INSERT INTO public.municipio
VALUES (3270, 3500303, 'Aguaí', 'SP', 350030);
INSERT INTO public.municipio
VALUES (3271, 3500402, 'Águas da Prata', 'SP', 350040);
INSERT INTO public.municipio
VALUES (3272, 3500501, 'Águas de Lindóia', 'SP', 350050);
INSERT INTO public.municipio
VALUES (3273, 3500550, 'Águas de Santa Bárbara', 'SP', 350055);
INSERT INTO public.municipio
VALUES (3274, 3500600, 'Águas de São Pedro', 'SP', 350060);
INSERT INTO public.municipio
VALUES (3275, 3500709, 'Agudos', 'SP', 350070);
INSERT INTO public.municipio
VALUES (3276, 3500758, 'Alambari', 'SP', 350075);
INSERT INTO public.municipio
VALUES (3277, 3500808, 'Alfredo Marcondes', 'SP', 350080);
INSERT INTO public.municipio
VALUES (3278, 3500907, 'Altair', 'SP', 350090);
INSERT INTO public.municipio
VALUES (3279, 3501004, 'Altinópolis', 'SP', 350100);
INSERT INTO public.municipio
VALUES (3280, 3501103, 'Alto Alegre', 'SP', 350110);
INSERT INTO public.municipio
VALUES (3281, 3501152, 'Alumínio', 'SP', 350115);
INSERT INTO public.municipio
VALUES (3282, 3501202, 'Álvares Florence', 'SP', 350120);
INSERT INTO public.municipio
VALUES (3283, 3501301, 'Álvares Machado', 'SP', 350130);
INSERT INTO public.municipio
VALUES (3284, 3501400, 'Álvaro de Carvalho', 'SP', 350140);
INSERT INTO public.municipio
VALUES (3285, 3501509, 'Alvinlândia', 'SP', 350150);
INSERT INTO public.municipio
VALUES (3286, 3501608, 'Americana', 'SP', 350160);
INSERT INTO public.municipio
VALUES (3287, 3501707, 'Américo Brasiliense', 'SP', 350170);
INSERT INTO public.municipio
VALUES (3288, 3501806, 'Américo de Campos', 'SP', 350180);
INSERT INTO public.municipio
VALUES (3289, 3501905, 'Amparo', 'SP', 350190);
INSERT INTO public.municipio
VALUES (3290, 3502002, 'Analândia', 'SP', 350200);
INSERT INTO public.municipio
VALUES (3291, 3502101, 'Andradina', 'SP', 350210);
INSERT INTO public.municipio
VALUES (3292, 3502200, 'Angatuba', 'SP', 350220);
INSERT INTO public.municipio
VALUES (3293, 3502309, 'Anhembi', 'SP', 350230);
INSERT INTO public.municipio
VALUES (3294, 3502408, 'Anhumas', 'SP', 350240);
INSERT INTO public.municipio
VALUES (3295, 3502507, 'Aparecida', 'SP', 350250);
INSERT INTO public.municipio
VALUES (3296, 3502606, 'Aparecida D''Oeste', 'SP', 350260);
INSERT INTO public.municipio
VALUES (3297, 3502705, 'Apiaí', 'SP', 350270);
INSERT INTO public.municipio
VALUES (3298, 3502754, 'Araçariguama', 'SP', 350275);
INSERT INTO public.municipio
VALUES (3299, 3502804, 'Araçatuba', 'SP', 350280);
INSERT INTO public.municipio
VALUES (3300, 3502903, 'Araçoiaba da Serra', 'SP', 350290);
INSERT INTO public.municipio
VALUES (3301, 3503000, 'Aramina', 'SP', 350300);
INSERT INTO public.municipio
VALUES (3302, 3503109, 'Arandu', 'SP', 350310);
INSERT INTO public.municipio
VALUES (3303, 3503158, 'Arapeí', 'SP', 350315);
INSERT INTO public.municipio
VALUES (3304, 3503208, 'Araraquara', 'SP', 350320);
INSERT INTO public.municipio
VALUES (3305, 3503307, 'Araras', 'SP', 350330);
INSERT INTO public.municipio
VALUES (3306, 3503356, 'Arco-Íris', 'SP', 350335);
INSERT INTO public.municipio
VALUES (3307, 3503406, 'Arealva', 'SP', 350340);
INSERT INTO public.municipio
VALUES (3308, 3503505, 'Areias', 'SP', 350350);
INSERT INTO public.municipio
VALUES (3309, 3503604, 'Areiópolis', 'SP', 350360);
INSERT INTO public.municipio
VALUES (3310, 3503703, 'Ariranha', 'SP', 350370);
INSERT INTO public.municipio
VALUES (3311, 3503802, 'Artur Nogueira', 'SP', 350380);
INSERT INTO public.municipio
VALUES (3312, 3503901, 'Arujá', 'SP', 350390);
INSERT INTO public.municipio
VALUES (3313, 3503950, 'Aspásia', 'SP', 350395);
INSERT INTO public.municipio
VALUES (3314, 3504008, 'Assis', 'SP', 350400);
INSERT INTO public.municipio
VALUES (3315, 3504107, 'Atibaia', 'SP', 350410);
INSERT INTO public.municipio
VALUES (3316, 3504206, 'Auriflama', 'SP', 350420);
INSERT INTO public.municipio
VALUES (3317, 3504305, 'Avaí', 'SP', 350430);
INSERT INTO public.municipio
VALUES (3318, 3504404, 'Avanhandava', 'SP', 350440);
INSERT INTO public.municipio
VALUES (3319, 3504503, 'Avaré', 'SP', 350450);
INSERT INTO public.municipio
VALUES (3320, 3504602, 'Bady Bassitt', 'SP', 350460);
INSERT INTO public.municipio
VALUES (3321, 3504701, 'Balbinos', 'SP', 350470);
INSERT INTO public.municipio
VALUES (3322, 3504800, 'Bálsamo', 'SP', 350480);
INSERT INTO public.municipio
VALUES (3323, 3504909, 'Bananal', 'SP', 350490);
INSERT INTO public.municipio
VALUES (3324, 3505005, 'Barão de Antonina', 'SP', 350500);
INSERT INTO public.municipio
VALUES (3325, 3505104, 'Barbosa', 'SP', 350510);
INSERT INTO public.municipio
VALUES (3326, 3505203, 'Bariri', 'SP', 350520);
INSERT INTO public.municipio
VALUES (3327, 3505302, 'Barra Bonita', 'SP', 350530);
INSERT INTO public.municipio
VALUES (3328, 3505351, 'Barra do Chapéu', 'SP', 350535);
INSERT INTO public.municipio
VALUES (3329, 3505401, 'Barra do Turvo', 'SP', 350540);
INSERT INTO public.municipio
VALUES (3330, 3505500, 'Barretos', 'SP', 350550);
INSERT INTO public.municipio
VALUES (3331, 3505609, 'Barrinha', 'SP', 350560);
INSERT INTO public.municipio
VALUES (3332, 3505708, 'Barueri', 'SP', 350570);
INSERT INTO public.municipio
VALUES (3333, 3505807, 'Bastos', 'SP', 350580);
INSERT INTO public.municipio
VALUES (3334, 3505906, 'Batatais', 'SP', 350590);
INSERT INTO public.municipio
VALUES (3335, 3506003, 'Bauru', 'SP', 350600);
INSERT INTO public.municipio
VALUES (3336, 3506102, 'Bebedouro', 'SP', 350610);
INSERT INTO public.municipio
VALUES (3337, 3506201, 'Bento de Abreu', 'SP', 350620);
INSERT INTO public.municipio
VALUES (3338, 3506300, 'Bernardino de Campos', 'SP', 350630);
INSERT INTO public.municipio
VALUES (3339, 3506359, 'Bertioga', 'SP', 350635);
INSERT INTO public.municipio
VALUES (3340, 3506409, 'Bilac', 'SP', 350640);
INSERT INTO public.municipio
VALUES (3341, 3506508, 'Birigui', 'SP', 350650);
INSERT INTO public.municipio
VALUES (3342, 3506607, 'Biritiba-Mirim', 'SP', 350660);
INSERT INTO public.municipio
VALUES (3343, 3506706, 'Boa Esperança do Sul', 'SP', 350670);
INSERT INTO public.municipio
VALUES (3344, 3506805, 'Bocaina', 'SP', 350680);
INSERT INTO public.municipio
VALUES (3345, 3506904, 'Bofete', 'SP', 350690);
INSERT INTO public.municipio
VALUES (3346, 3507001, 'Boituva', 'SP', 350700);
INSERT INTO public.municipio
VALUES (3347, 3507100, 'Bom Jesus dos Perdões', 'SP', 350710);
INSERT INTO public.municipio
VALUES (3348, 3507159, 'Bom Sucesso de Itararé', 'SP', 350715);
INSERT INTO public.municipio
VALUES (3349, 3507209, 'Borá', 'SP', 350720);
INSERT INTO public.municipio
VALUES (3350, 3507308, 'Boracéia', 'SP', 350730);
INSERT INTO public.municipio
VALUES (3351, 3507407, 'Borborema', 'SP', 350740);
INSERT INTO public.municipio
VALUES (3352, 3507456, 'Borebi', 'SP', 350745);
INSERT INTO public.municipio
VALUES (3353, 3507506, 'Botucatu', 'SP', 350750);
INSERT INTO public.municipio
VALUES (3354, 3507605, 'Bragança Paulista', 'SP', 350760);
INSERT INTO public.municipio
VALUES (3355, 3507704, 'Braúna', 'SP', 350770);
INSERT INTO public.municipio
VALUES (3356, 3507753, 'Brejo Alegre', 'SP', 350775);
INSERT INTO public.municipio
VALUES (3357, 3507803, 'Brodowski', 'SP', 350780);
INSERT INTO public.municipio
VALUES (3358, 3507902, 'Brotas', 'SP', 350790);
INSERT INTO public.municipio
VALUES (3359, 3508009, 'Buri', 'SP', 350800);
INSERT INTO public.municipio
VALUES (3360, 3508108, 'Buritama', 'SP', 350810);
INSERT INTO public.municipio
VALUES (3361, 3508207, 'Buritizal', 'SP', 350820);
INSERT INTO public.municipio
VALUES (3362, 3508306, 'Cabrália Paulista', 'SP', 350830);
INSERT INTO public.municipio
VALUES (3363, 3508405, 'Cabreúva', 'SP', 350840);
INSERT INTO public.municipio
VALUES (3364, 3508504, 'Caçapava', 'SP', 350850);
INSERT INTO public.municipio
VALUES (3365, 3508603, 'Cachoeira Paulista', 'SP', 350860);
INSERT INTO public.municipio
VALUES (3366, 3508702, 'Caconde', 'SP', 350870);
INSERT INTO public.municipio
VALUES (3367, 3508801, 'Cafelândia', 'SP', 350880);
INSERT INTO public.municipio
VALUES (3368, 3508900, 'Caiabu', 'SP', 350890);
INSERT INTO public.municipio
VALUES (3369, 3509007, 'Caieiras', 'SP', 350900);
INSERT INTO public.municipio
VALUES (3370, 3509106, 'Caiuá', 'SP', 350910);
INSERT INTO public.municipio
VALUES (3371, 3509205, 'Cajamar', 'SP', 350920);
INSERT INTO public.municipio
VALUES (3372, 3509254, 'Cajati', 'SP', 350925);
INSERT INTO public.municipio
VALUES (3373, 3509304, 'Cajobi', 'SP', 350930);
INSERT INTO public.municipio
VALUES (3374, 3509403, 'Cajuru', 'SP', 350940);
INSERT INTO public.municipio
VALUES (3375, 3509452, 'Campina do Monte Alegre', 'SP', 350945);
INSERT INTO public.municipio
VALUES (3376, 3509502, 'Campinas', 'SP', 350950);
INSERT INTO public.municipio
VALUES (3377, 3509601, 'Campo Limpo Paulista', 'SP', 350960);
INSERT INTO public.municipio
VALUES (3378, 3509700, 'Campos do Jordão', 'SP', 350970);
INSERT INTO public.municipio
VALUES (3379, 3509809, 'Campos Novos Paulista', 'SP', 350980);
INSERT INTO public.municipio
VALUES (3380, 3509908, 'Cananéia', 'SP', 350990);
INSERT INTO public.municipio
VALUES (3381, 3509957, 'Canas', 'SP', 350995);
INSERT INTO public.municipio
VALUES (3382, 3510005, 'Cândido Mota', 'SP', 351000);
INSERT INTO public.municipio
VALUES (3383, 3510104, 'Cândido Rodrigues', 'SP', 351010);
INSERT INTO public.municipio
VALUES (3384, 3510153, 'Canitar', 'SP', 351015);
INSERT INTO public.municipio
VALUES (3385, 3510203, 'Capão Bonito', 'SP', 351020);
INSERT INTO public.municipio
VALUES (3386, 3510302, 'Capela do Alto', 'SP', 351030);
INSERT INTO public.municipio
VALUES (3387, 3510401, 'Capivari', 'SP', 351040);
INSERT INTO public.municipio
VALUES (3388, 3510500, 'Caraguatatuba', 'SP', 351050);
INSERT INTO public.municipio
VALUES (3389, 3510609, 'Carapicuíba', 'SP', 351060);
INSERT INTO public.municipio
VALUES (3390, 3510708, 'Cardoso', 'SP', 351070);
INSERT INTO public.municipio
VALUES (3391, 3510807, 'Casa Branca', 'SP', 351080);
INSERT INTO public.municipio
VALUES (3392, 3510906, 'Cássia dos Coqueiros', 'SP', 351090);
INSERT INTO public.municipio
VALUES (3393, 3511003, 'Castilho', 'SP', 351100);
INSERT INTO public.municipio
VALUES (3394, 3511102, 'Catanduva', 'SP', 351110);
INSERT INTO public.municipio
VALUES (3395, 3511201, 'Catiguá', 'SP', 351120);
INSERT INTO public.municipio
VALUES (3396, 3511300, 'Cedral', 'SP', 351130);
INSERT INTO public.municipio
VALUES (3397, 3511409, 'Cerqueira César', 'SP', 351140);
INSERT INTO public.municipio
VALUES (3398, 3511508, 'Cerquilho', 'SP', 351150);
INSERT INTO public.municipio
VALUES (3399, 3511607, 'Cesário Lange', 'SP', 351160);
INSERT INTO public.municipio
VALUES (3400, 3511706, 'Charqueada', 'SP', 351170);
INSERT INTO public.municipio
VALUES (3401, 3511904, 'Clementina', 'SP', 351190);
INSERT INTO public.municipio
VALUES (3402, 3512001, 'Colina', 'SP', 351200);
INSERT INTO public.municipio
VALUES (3403, 3512100, 'Colômbia', 'SP', 351210);
INSERT INTO public.municipio
VALUES (3404, 3512209, 'Conchal', 'SP', 351220);
INSERT INTO public.municipio
VALUES (3405, 3512308, 'Conchas', 'SP', 351230);
INSERT INTO public.municipio
VALUES (3406, 3512407, 'Cordeirópolis', 'SP', 351240);
INSERT INTO public.municipio
VALUES (3407, 3512506, 'Coroados', 'SP', 351250);
INSERT INTO public.municipio
VALUES (3408, 3512605, 'Coronel Macedo', 'SP', 351260);
INSERT INTO public.municipio
VALUES (3409, 3512704, 'Corumbataí', 'SP', 351270);
INSERT INTO public.municipio
VALUES (3410, 3512803, 'Cosmópolis', 'SP', 351280);
INSERT INTO public.municipio
VALUES (3411, 3512902, 'Cosmorama', 'SP', 351290);
INSERT INTO public.municipio
VALUES (3412, 3513009, 'Cotia', 'SP', 351300);
INSERT INTO public.municipio
VALUES (3413, 3513108, 'Cravinhos', 'SP', 351310);
INSERT INTO public.municipio
VALUES (3414, 3513207, 'Cristais Paulista', 'SP', 351320);
INSERT INTO public.municipio
VALUES (3415, 3513306, 'Cruzália', 'SP', 351330);
INSERT INTO public.municipio
VALUES (3416, 3513405, 'Cruzeiro', 'SP', 351340);
INSERT INTO public.municipio
VALUES (3417, 3513504, 'Cubatão', 'SP', 351350);
INSERT INTO public.municipio
VALUES (3418, 3513603, 'Cunha', 'SP', 351360);
INSERT INTO public.municipio
VALUES (3419, 3513702, 'Descalvado', 'SP', 351370);
INSERT INTO public.municipio
VALUES (3420, 3513801, 'Diadema', 'SP', 351380);
INSERT INTO public.municipio
VALUES (3421, 3513850, 'Dirce Reis', 'SP', 351385);
INSERT INTO public.municipio
VALUES (3422, 3513900, 'Divinolândia', 'SP', 351390);
INSERT INTO public.municipio
VALUES (3423, 3514007, 'Dobrada', 'SP', 351400);
INSERT INTO public.municipio
VALUES (3424, 3514106, 'Dois Córregos', 'SP', 351410);
INSERT INTO public.municipio
VALUES (3425, 3514205, 'Dolcinópolis', 'SP', 351420);
INSERT INTO public.municipio
VALUES (3426, 3514304, 'Dourado', 'SP', 351430);
INSERT INTO public.municipio
VALUES (3427, 3514403, 'Dracena', 'SP', 351440);
INSERT INTO public.municipio
VALUES (3428, 3514502, 'Duartina', 'SP', 351450);
INSERT INTO public.municipio
VALUES (3429, 3514601, 'Dumont', 'SP', 351460);
INSERT INTO public.municipio
VALUES (3430, 3514700, 'Echaporã', 'SP', 351470);
INSERT INTO public.municipio
VALUES (3431, 3514809, 'Eldorado', 'SP', 351480);
INSERT INTO public.municipio
VALUES (3432, 3514908, 'Elias Fausto', 'SP', 351490);
INSERT INTO public.municipio
VALUES (3433, 3514924, 'Elisiário', 'SP', 351492);
INSERT INTO public.municipio
VALUES (3434, 3514957, 'Embaúba', 'SP', 351495);
INSERT INTO public.municipio
VALUES (3435, 3515004, 'Embu das Artes', 'SP', 351500);
INSERT INTO public.municipio
VALUES (3436, 3515103, 'Embu-Guaçu', 'SP', 351510);
INSERT INTO public.municipio
VALUES (3437, 3515129, 'Emilianópolis', 'SP', 351512);
INSERT INTO public.municipio
VALUES (3438, 3515152, 'Engenheiro Coelho', 'SP', 351515);
INSERT INTO public.municipio
VALUES (3439, 3515186, 'Espírito Santo do Pinhal', 'SP', 351518);
INSERT INTO public.municipio
VALUES (3440, 3515194, 'Espírito Santo do Turvo', 'SP', 351519);
INSERT INTO public.municipio
VALUES (3441, 3515202, 'Estrela D''Oeste', 'SP', 351520);
INSERT INTO public.municipio
VALUES (3442, 3515301, 'Estrela do Norte', 'SP', 351530);
INSERT INTO public.municipio
VALUES (3443, 3515350, 'Euclides da Cunha Paulista', 'SP', 351535);
INSERT INTO public.municipio
VALUES (3444, 3515400, 'Fartura', 'SP', 351540);
INSERT INTO public.municipio
VALUES (3445, 3515509, 'Fernandópolis', 'SP', 351550);
INSERT INTO public.municipio
VALUES (3446, 3515608, 'Fernando Prestes', 'SP', 351560);
INSERT INTO public.municipio
VALUES (3447, 3515657, 'Fernão', 'SP', 351565);
INSERT INTO public.municipio
VALUES (3448, 3515707, 'Ferraz de Vasconcelos', 'SP', 351570);
INSERT INTO public.municipio
VALUES (3449, 3515806, 'Flora Rica', 'SP', 351580);
INSERT INTO public.municipio
VALUES (3450, 3515905, 'Floreal', 'SP', 351590);
INSERT INTO public.municipio
VALUES (3451, 3516002, 'Flórida Paulista', 'SP', 351600);
INSERT INTO public.municipio
VALUES (3452, 3516101, 'Florínia', 'SP', 351610);
INSERT INTO public.municipio
VALUES (3453, 3516200, 'Franca', 'SP', 351620);
INSERT INTO public.municipio
VALUES (3454, 3516309, 'Francisco Morato', 'SP', 351630);
INSERT INTO public.municipio
VALUES (3455, 3516408, 'Franco da Rocha', 'SP', 351640);
INSERT INTO public.municipio
VALUES (3456, 3516507, 'Gabriel Monteiro', 'SP', 351650);
INSERT INTO public.municipio
VALUES (3457, 3516606, 'Gália', 'SP', 351660);
INSERT INTO public.municipio
VALUES (3458, 3516705, 'Garça', 'SP', 351670);
INSERT INTO public.municipio
VALUES (3459, 3516804, 'Gastão Vidigal', 'SP', 351680);
INSERT INTO public.municipio
VALUES (3460, 3516853, 'Gavião Peixoto', 'SP', 351685);
INSERT INTO public.municipio
VALUES (3461, 3516903, 'General Salgado', 'SP', 351690);
INSERT INTO public.municipio
VALUES (3462, 3517000, 'Getulina', 'SP', 351700);
INSERT INTO public.municipio
VALUES (3463, 3517109, 'Glicério', 'SP', 351710);
INSERT INTO public.municipio
VALUES (3464, 3517208, 'Guaiçara', 'SP', 351720);
INSERT INTO public.municipio
VALUES (3465, 3517307, 'Guaimbê', 'SP', 351730);
INSERT INTO public.municipio
VALUES (3466, 3517406, 'Guaíra', 'SP', 351740);
INSERT INTO public.municipio
VALUES (3467, 3517505, 'Guapiaçu', 'SP', 351750);
INSERT INTO public.municipio
VALUES (3468, 3517604, 'Guapiara', 'SP', 351760);
INSERT INTO public.municipio
VALUES (3469, 3517703, 'Guará', 'SP', 351770);
INSERT INTO public.municipio
VALUES (3470, 3517802, 'Guaraçaí', 'SP', 351780);
INSERT INTO public.municipio
VALUES (3471, 3517901, 'Guaraci', 'SP', 351790);
INSERT INTO public.municipio
VALUES (3472, 3518008, 'Guarani D''Oeste', 'SP', 351800);
INSERT INTO public.municipio
VALUES (3473, 3518107, 'Guarantã', 'SP', 351810);
INSERT INTO public.municipio
VALUES (3474, 3518206, 'Guararapes', 'SP', 351820);
INSERT INTO public.municipio
VALUES (3475, 3518305, 'Guararema', 'SP', 351830);
INSERT INTO public.municipio
VALUES (3476, 3518404, 'Guaratinguetá', 'SP', 351840);
INSERT INTO public.municipio
VALUES (3477, 3518503, 'Guareí', 'SP', 351850);
INSERT INTO public.municipio
VALUES (3478, 3518602, 'Guariba', 'SP', 351860);
INSERT INTO public.municipio
VALUES (3479, 3518701, 'Guarujá', 'SP', 351870);
INSERT INTO public.municipio
VALUES (3480, 3518800, 'Guarulhos', 'SP', 351880);
INSERT INTO public.municipio
VALUES (3481, 3518859, 'Guatapará', 'SP', 351885);
INSERT INTO public.municipio
VALUES (3482, 3518909, 'Guzolândia', 'SP', 351890);
INSERT INTO public.municipio
VALUES (3483, 3519006, 'Herculândia', 'SP', 351900);
INSERT INTO public.municipio
VALUES (3484, 3519055, 'Holambra', 'SP', 351905);
INSERT INTO public.municipio
VALUES (3485, 3519071, 'Hortolândia', 'SP', 351907);
INSERT INTO public.municipio
VALUES (3486, 3519105, 'Iacanga', 'SP', 351910);
INSERT INTO public.municipio
VALUES (3487, 3519204, 'Iacri', 'SP', 351920);
INSERT INTO public.municipio
VALUES (3488, 3519253, 'Iaras', 'SP', 351925);
INSERT INTO public.municipio
VALUES (3489, 3519303, 'Ibaté', 'SP', 351930);
INSERT INTO public.municipio
VALUES (3490, 3519402, 'Ibirá', 'SP', 351940);
INSERT INTO public.municipio
VALUES (3491, 3519501, 'Ibirarema', 'SP', 351950);
INSERT INTO public.municipio
VALUES (3492, 3519600, 'Ibitinga', 'SP', 351960);
INSERT INTO public.municipio
VALUES (3493, 3519709, 'Ibiúna', 'SP', 351970);
INSERT INTO public.municipio
VALUES (3494, 3519808, 'Icém', 'SP', 351980);
INSERT INTO public.municipio
VALUES (3495, 3519907, 'Iepê', 'SP', 351990);
INSERT INTO public.municipio
VALUES (3496, 3520004, 'Igaraçu do Tietê', 'SP', 352000);
INSERT INTO public.municipio
VALUES (3497, 3520103, 'Igarapava', 'SP', 352010);
INSERT INTO public.municipio
VALUES (3498, 3520202, 'Igaratá', 'SP', 352020);
INSERT INTO public.municipio
VALUES (3499, 3520301, 'Iguape', 'SP', 352030);
INSERT INTO public.municipio
VALUES (3500, 3520400, 'Ilhabela', 'SP', 352040);
INSERT INTO public.municipio
VALUES (3501, 3520426, 'Ilha Comprida', 'SP', 352042);
INSERT INTO public.municipio
VALUES (3502, 3520442, 'Ilha Solteira', 'SP', 352044);
INSERT INTO public.municipio
VALUES (3503, 3520509, 'Indaiatuba', 'SP', 352050);
INSERT INTO public.municipio
VALUES (3504, 3520608, 'Indiana', 'SP', 352060);
INSERT INTO public.municipio
VALUES (3505, 3520707, 'Indiaporã', 'SP', 352070);
INSERT INTO public.municipio
VALUES (3506, 3520806, 'Inúbia Paulista', 'SP', 352080);
INSERT INTO public.municipio
VALUES (3507, 3520905, 'Ipaussu', 'SP', 352090);
INSERT INTO public.municipio
VALUES (3508, 3521002, 'Iperó', 'SP', 352100);
INSERT INTO public.municipio
VALUES (3509, 3521101, 'Ipeúna', 'SP', 352110);
INSERT INTO public.municipio
VALUES (3510, 3521150, 'Ipiguá', 'SP', 352115);
INSERT INTO public.municipio
VALUES (3511, 3521200, 'Iporanga', 'SP', 352120);
INSERT INTO public.municipio
VALUES (3512, 3521309, 'Ipuã', 'SP', 352130);
INSERT INTO public.municipio
VALUES (3513, 3521408, 'Iracemápolis', 'SP', 352140);
INSERT INTO public.municipio
VALUES (3514, 3521507, 'Irapuã', 'SP', 352150);
INSERT INTO public.municipio
VALUES (3515, 3521606, 'Irapuru', 'SP', 352160);
INSERT INTO public.municipio
VALUES (3516, 3521705, 'Itaberá', 'SP', 352170);
INSERT INTO public.municipio
VALUES (3517, 3521804, 'Itaí', 'SP', 352180);
INSERT INTO public.municipio
VALUES (3518, 3521903, 'Itajobi', 'SP', 352190);
INSERT INTO public.municipio
VALUES (3519, 3522000, 'Itaju', 'SP', 352200);
INSERT INTO public.municipio
VALUES (3520, 3522109, 'Itanhaém', 'SP', 352210);
INSERT INTO public.municipio
VALUES (3521, 3522158, 'Itaóca', 'SP', 352215);
INSERT INTO public.municipio
VALUES (3522, 3522208, 'Itapecerica da Serra', 'SP', 352220);
INSERT INTO public.municipio
VALUES (3523, 3522307, 'Itapetininga', 'SP', 352230);
INSERT INTO public.municipio
VALUES (3524, 3522406, 'Itapeva', 'SP', 352240);
INSERT INTO public.municipio
VALUES (3525, 3522505, 'Itapevi', 'SP', 352250);
INSERT INTO public.municipio
VALUES (3526, 3522604, 'Itapira', 'SP', 352260);
INSERT INTO public.municipio
VALUES (3527, 3522653, 'Itapirapuã Paulista', 'SP', 352265);
INSERT INTO public.municipio
VALUES (3528, 3522703, 'Itápolis', 'SP', 352270);
INSERT INTO public.municipio
VALUES (3529, 3522802, 'Itaporanga', 'SP', 352280);
INSERT INTO public.municipio
VALUES (3530, 3522901, 'Itapuí', 'SP', 352290);
INSERT INTO public.municipio
VALUES (3531, 3523008, 'Itapura', 'SP', 352300);
INSERT INTO public.municipio
VALUES (3532, 3523107, 'Itaquaquecetuba', 'SP', 352310);
INSERT INTO public.municipio
VALUES (3533, 3523206, 'Itararé', 'SP', 352320);
INSERT INTO public.municipio
VALUES (3534, 3523305, 'Itariri', 'SP', 352330);
INSERT INTO public.municipio
VALUES (3535, 3523404, 'Itatiba', 'SP', 352340);
INSERT INTO public.municipio
VALUES (3536, 3523503, 'Itatinga', 'SP', 352350);
INSERT INTO public.municipio
VALUES (3537, 3523602, 'Itirapina', 'SP', 352360);
INSERT INTO public.municipio
VALUES (3538, 3523701, 'Itirapuã', 'SP', 352370);
INSERT INTO public.municipio
VALUES (3539, 3523800, 'Itobi', 'SP', 352380);
INSERT INTO public.municipio
VALUES (3540, 3523909, 'Itu', 'SP', 352390);
INSERT INTO public.municipio
VALUES (3541, 3524006, 'Itupeva', 'SP', 352400);
INSERT INTO public.municipio
VALUES (3542, 3524105, 'Ituverava', 'SP', 352410);
INSERT INTO public.municipio
VALUES (3543, 3524204, 'Jaborandi', 'SP', 352420);
INSERT INTO public.municipio
VALUES (3544, 3524303, 'Jaboticabal', 'SP', 352430);
INSERT INTO public.municipio
VALUES (3545, 3524402, 'Jacareí', 'SP', 352440);
INSERT INTO public.municipio
VALUES (3546, 3524501, 'Jaci', 'SP', 352450);
INSERT INTO public.municipio
VALUES (3547, 3524600, 'Jacupiranga', 'SP', 352460);
INSERT INTO public.municipio
VALUES (3548, 3524709, 'Jaguariúna', 'SP', 352470);
INSERT INTO public.municipio
VALUES (3549, 3524808, 'Jales', 'SP', 352480);
INSERT INTO public.municipio
VALUES (3550, 3524907, 'Jambeiro', 'SP', 352490);
INSERT INTO public.municipio
VALUES (3551, 3525003, 'Jandira', 'SP', 352500);
INSERT INTO public.municipio
VALUES (3552, 3525102, 'Jardinópolis', 'SP', 352510);
INSERT INTO public.municipio
VALUES (3553, 3525201, 'Jarinu', 'SP', 352520);
INSERT INTO public.municipio
VALUES (3554, 3525300, 'Jaú', 'SP', 352530);
INSERT INTO public.municipio
VALUES (3555, 3525409, 'Jeriquara', 'SP', 352540);
INSERT INTO public.municipio
VALUES (3556, 3525508, 'Joanópolis', 'SP', 352550);
INSERT INTO public.municipio
VALUES (3557, 3525607, 'João Ramalho', 'SP', 352560);
INSERT INTO public.municipio
VALUES (3558, 3525706, 'José Bonifácio', 'SP', 352570);
INSERT INTO public.municipio
VALUES (3559, 3525805, 'Júlio Mesquita', 'SP', 352580);
INSERT INTO public.municipio
VALUES (3560, 3525854, 'Jumirim', 'SP', 352585);
INSERT INTO public.municipio
VALUES (3561, 3525904, 'Jundiaí', 'SP', 352590);
INSERT INTO public.municipio
VALUES (3562, 3526001, 'Junqueirópolis', 'SP', 352600);
INSERT INTO public.municipio
VALUES (3563, 3526100, 'Juquiá', 'SP', 352610);
INSERT INTO public.municipio
VALUES (3564, 3526209, 'Juquitiba', 'SP', 352620);
INSERT INTO public.municipio
VALUES (3565, 3526308, 'Lagoinha', 'SP', 352630);
INSERT INTO public.municipio
VALUES (3566, 3526407, 'Laranjal Paulista', 'SP', 352640);
INSERT INTO public.municipio
VALUES (3567, 3526506, 'Lavínia', 'SP', 352650);
INSERT INTO public.municipio
VALUES (3568, 3526605, 'Lavrinhas', 'SP', 352660);
INSERT INTO public.municipio
VALUES (3569, 3526704, 'Leme', 'SP', 352670);
INSERT INTO public.municipio
VALUES (3570, 3526803, 'Lençóis Paulista', 'SP', 352680);
INSERT INTO public.municipio
VALUES (3571, 3526902, 'Limeira', 'SP', 352690);
INSERT INTO public.municipio
VALUES (3572, 3527009, 'Lindóia', 'SP', 352700);
INSERT INTO public.municipio
VALUES (3573, 3527108, 'Lins', 'SP', 352710);
INSERT INTO public.municipio
VALUES (3574, 3527207, 'Lorena', 'SP', 352720);
INSERT INTO public.municipio
VALUES (3575, 3527256, 'Lourdes', 'SP', 352725);
INSERT INTO public.municipio
VALUES (3576, 3527306, 'Louveira', 'SP', 352730);
INSERT INTO public.municipio
VALUES (3577, 3527405, 'Lucélia', 'SP', 352740);
INSERT INTO public.municipio
VALUES (3578, 3527504, 'Lucianópolis', 'SP', 352750);
INSERT INTO public.municipio
VALUES (3579, 3527603, 'Luís Antônio', 'SP', 352760);
INSERT INTO public.municipio
VALUES (3580, 3527702, 'Luiziânia', 'SP', 352770);
INSERT INTO public.municipio
VALUES (3581, 3527801, 'Lupércio', 'SP', 352780);
INSERT INTO public.municipio
VALUES (3582, 3527900, 'Lutécia', 'SP', 352790);
INSERT INTO public.municipio
VALUES (3583, 3528007, 'Macatuba', 'SP', 352800);
INSERT INTO public.municipio
VALUES (3584, 3528106, 'Macaubal', 'SP', 352810);
INSERT INTO public.municipio
VALUES (3585, 3528205, 'Macedônia', 'SP', 352820);
INSERT INTO public.municipio
VALUES (3586, 3528304, 'Magda', 'SP', 352830);
INSERT INTO public.municipio
VALUES (3587, 3528403, 'Mairinque', 'SP', 352840);
INSERT INTO public.municipio
VALUES (3588, 3528502, 'Mairiporã', 'SP', 352850);
INSERT INTO public.municipio
VALUES (3589, 3528601, 'Manduri', 'SP', 352860);
INSERT INTO public.municipio
VALUES (3590, 3528700, 'Marabá Paulista', 'SP', 352870);
INSERT INTO public.municipio
VALUES (3591, 3528809, 'Maracaí', 'SP', 352880);
INSERT INTO public.municipio
VALUES (3592, 3528858, 'Marapoama', 'SP', 352885);
INSERT INTO public.municipio
VALUES (3593, 3528908, 'Mariápolis', 'SP', 352890);
INSERT INTO public.municipio
VALUES (3594, 3529005, 'Marília', 'SP', 352900);
INSERT INTO public.municipio
VALUES (3595, 3529104, 'Marinópolis', 'SP', 352910);
INSERT INTO public.municipio
VALUES (3596, 3529203, 'Martinópolis', 'SP', 352920);
INSERT INTO public.municipio
VALUES (3597, 3529302, 'Matão', 'SP', 352930);
INSERT INTO public.municipio
VALUES (3598, 3529401, 'Mauá', 'SP', 352940);
INSERT INTO public.municipio
VALUES (3599, 3529500, 'Mendonça', 'SP', 352950);
INSERT INTO public.municipio
VALUES (3600, 3529609, 'Meridiano', 'SP', 352960);
INSERT INTO public.municipio
VALUES (3601, 3529658, 'Mesópolis', 'SP', 352965);
INSERT INTO public.municipio
VALUES (3602, 3529708, 'Miguelópolis', 'SP', 352970);
INSERT INTO public.municipio
VALUES (3603, 3529807, 'Mineiros do Tietê', 'SP', 352980);
INSERT INTO public.municipio
VALUES (3604, 3529906, 'Miracatu', 'SP', 352990);
INSERT INTO public.municipio
VALUES (3605, 3530003, 'Mira Estrela', 'SP', 353000);
INSERT INTO public.municipio
VALUES (3606, 3530102, 'Mirandópolis', 'SP', 353010);
INSERT INTO public.municipio
VALUES (3607, 3530201, 'Mirante do Paranapanema', 'SP', 353020);
INSERT INTO public.municipio
VALUES (3608, 3530300, 'Mirassol', 'SP', 353030);
INSERT INTO public.municipio
VALUES (3609, 3530409, 'Mirassolândia', 'SP', 353040);
INSERT INTO public.municipio
VALUES (3610, 3530508, 'Mococa', 'SP', 353050);
INSERT INTO public.municipio
VALUES (3611, 3530607, 'Mogi das Cruzes', 'SP', 353060);
INSERT INTO public.municipio
VALUES (3612, 3530706, 'Mogi Guaçu', 'SP', 353070);
INSERT INTO public.municipio
VALUES (3613, 3530805, 'Moji Mirim', 'SP', 353080);
INSERT INTO public.municipio
VALUES (3614, 3530904, 'Mombuca', 'SP', 353090);
INSERT INTO public.municipio
VALUES (3615, 3531001, 'Monções', 'SP', 353100);
INSERT INTO public.municipio
VALUES (3616, 3531100, 'Mongaguá', 'SP', 353110);
INSERT INTO public.municipio
VALUES (3617, 3531209, 'Monte Alegre do Sul', 'SP', 353120);
INSERT INTO public.municipio
VALUES (3618, 3531308, 'Monte Alto', 'SP', 353130);
INSERT INTO public.municipio
VALUES (3619, 3531407, 'Monte Aprazível', 'SP', 353140);
INSERT INTO public.municipio
VALUES (3620, 3531506, 'Monte Azul Paulista', 'SP', 353150);
INSERT INTO public.municipio
VALUES (3621, 3531605, 'Monte Castelo', 'SP', 353160);
INSERT INTO public.municipio
VALUES (3622, 3531704, 'Monteiro Lobato', 'SP', 353170);
INSERT INTO public.municipio
VALUES (3623, 3531803, 'Monte Mor', 'SP', 353180);
INSERT INTO public.municipio
VALUES (3624, 3531902, 'Morro Agudo', 'SP', 353190);
INSERT INTO public.municipio
VALUES (3625, 3532009, 'Morungaba', 'SP', 353200);
INSERT INTO public.municipio
VALUES (3626, 3532058, 'Motuca', 'SP', 353205);
INSERT INTO public.municipio
VALUES (3627, 3532108, 'Murutinga do Sul', 'SP', 353210);
INSERT INTO public.municipio
VALUES (3628, 3532157, 'Nantes', 'SP', 353215);
INSERT INTO public.municipio
VALUES (3629, 3532207, 'Narandiba', 'SP', 353220);
INSERT INTO public.municipio
VALUES (3630, 3532306, 'Natividade da Serra', 'SP', 353230);
INSERT INTO public.municipio
VALUES (3631, 3532405, 'Nazaré Paulista', 'SP', 353240);
INSERT INTO public.municipio
VALUES (3632, 3532504, 'Neves Paulista', 'SP', 353250);
INSERT INTO public.municipio
VALUES (3633, 3532603, 'Nhandeara', 'SP', 353260);
INSERT INTO public.municipio
VALUES (3634, 3532702, 'Nipoã', 'SP', 353270);
INSERT INTO public.municipio
VALUES (3635, 3532801, 'Nova Aliança', 'SP', 353280);
INSERT INTO public.municipio
VALUES (3636, 3532827, 'Nova Campina', 'SP', 353282);
INSERT INTO public.municipio
VALUES (3637, 3532843, 'Nova Canaã Paulista', 'SP', 353284);
INSERT INTO public.municipio
VALUES (3638, 3532868, 'Nova Castilho', 'SP', 353286);
INSERT INTO public.municipio
VALUES (3639, 3532900, 'Nova Europa', 'SP', 353290);
INSERT INTO public.municipio
VALUES (3640, 3533007, 'Nova Granada', 'SP', 353300);
INSERT INTO public.municipio
VALUES (3641, 3533106, 'Nova Guataporanga', 'SP', 353310);
INSERT INTO public.municipio
VALUES (3642, 3533205, 'Nova Independência', 'SP', 353320);
INSERT INTO public.municipio
VALUES (3643, 3533254, 'Novais', 'SP', 353325);
INSERT INTO public.municipio
VALUES (3644, 3533304, 'Nova Luzitânia', 'SP', 353330);
INSERT INTO public.municipio
VALUES (3645, 3533403, 'Nova Odessa', 'SP', 353340);
INSERT INTO public.municipio
VALUES (3646, 3533502, 'Novo Horizonte', 'SP', 353350);
INSERT INTO public.municipio
VALUES (3647, 3533601, 'Nuporanga', 'SP', 353360);
INSERT INTO public.municipio
VALUES (3648, 3533700, 'Ocauçu', 'SP', 353370);
INSERT INTO public.municipio
VALUES (3649, 3533809, 'Óleo', 'SP', 353380);
INSERT INTO public.municipio
VALUES (3650, 3533908, 'Olímpia', 'SP', 353390);
INSERT INTO public.municipio
VALUES (3651, 3534005, 'Onda Verde', 'SP', 353400);
INSERT INTO public.municipio
VALUES (3652, 3534104, 'Oriente', 'SP', 353410);
INSERT INTO public.municipio
VALUES (3653, 3534203, 'Orindiúva', 'SP', 353420);
INSERT INTO public.municipio
VALUES (3654, 3534302, 'Orlândia', 'SP', 353430);
INSERT INTO public.municipio
VALUES (3655, 3534401, 'Osasco', 'SP', 353440);
INSERT INTO public.municipio
VALUES (3656, 3534500, 'Oscar Bressane', 'SP', 353450);
INSERT INTO public.municipio
VALUES (3657, 3534609, 'Osvaldo Cruz', 'SP', 353460);
INSERT INTO public.municipio
VALUES (3658, 3534708, 'Ourinhos', 'SP', 353470);
INSERT INTO public.municipio
VALUES (3659, 3534757, 'Ouroeste', 'SP', 353475);
INSERT INTO public.municipio
VALUES (3660, 3534807, 'Ouro Verde', 'SP', 353480);
INSERT INTO public.municipio
VALUES (3661, 3534906, 'Pacaembu', 'SP', 353490);
INSERT INTO public.municipio
VALUES (3662, 3535002, 'Palestina', 'SP', 353500);
INSERT INTO public.municipio
VALUES (3663, 3535101, 'Palmares Paulista', 'SP', 353510);
INSERT INTO public.municipio
VALUES (3664, 3535200, 'Palmeira D''Oeste', 'SP', 353520);
INSERT INTO public.municipio
VALUES (3665, 3535309, 'Palmital', 'SP', 353530);
INSERT INTO public.municipio
VALUES (3666, 3535408, 'Panorama', 'SP', 353540);
INSERT INTO public.municipio
VALUES (3667, 3535507, 'Paraguaçu Paulista', 'SP', 353550);
INSERT INTO public.municipio
VALUES (3668, 3535606, 'Paraibuna', 'SP', 353560);
INSERT INTO public.municipio
VALUES (3669, 3535705, 'Paraíso', 'SP', 353570);
INSERT INTO public.municipio
VALUES (3670, 3535804, 'Paranapanema', 'SP', 353580);
INSERT INTO public.municipio
VALUES (3671, 3535903, 'Paranapuã', 'SP', 353590);
INSERT INTO public.municipio
VALUES (3672, 3536000, 'Parapuã', 'SP', 353600);
INSERT INTO public.municipio
VALUES (3673, 3536109, 'Pardinho', 'SP', 353610);
INSERT INTO public.municipio
VALUES (3674, 3536208, 'Pariquera-Açu', 'SP', 353620);
INSERT INTO public.municipio
VALUES (3675, 3536257, 'Parisi', 'SP', 353625);
INSERT INTO public.municipio
VALUES (3676, 3536307, 'Patrocínio Paulista', 'SP', 353630);
INSERT INTO public.municipio
VALUES (3677, 3536406, 'Paulicéia', 'SP', 353640);
INSERT INTO public.municipio
VALUES (3678, 3536505, 'Paulínia', 'SP', 353650);
INSERT INTO public.municipio
VALUES (3679, 3536570, 'Paulistânia', 'SP', 353657);
INSERT INTO public.municipio
VALUES (3680, 3536604, 'Paulo de Faria', 'SP', 353660);
INSERT INTO public.municipio
VALUES (3681, 3536703, 'Pederneiras', 'SP', 353670);
INSERT INTO public.municipio
VALUES (3682, 3536802, 'Pedra Bela', 'SP', 353680);
INSERT INTO public.municipio
VALUES (3683, 3536901, 'Pedranópolis', 'SP', 353690);
INSERT INTO public.municipio
VALUES (3684, 3537008, 'Pedregulho', 'SP', 353700);
INSERT INTO public.municipio
VALUES (3685, 3537107, 'Pedreira', 'SP', 353710);
INSERT INTO public.municipio
VALUES (3686, 3537156, 'Pedrinhas Paulista', 'SP', 353715);
INSERT INTO public.municipio
VALUES (3687, 3537206, 'Pedro de Toledo', 'SP', 353720);
INSERT INTO public.municipio
VALUES (3688, 3537305, 'Penápolis', 'SP', 353730);
INSERT INTO public.municipio
VALUES (3689, 3537404, 'Pereira Barreto', 'SP', 353740);
INSERT INTO public.municipio
VALUES (3690, 3537503, 'Pereiras', 'SP', 353750);
INSERT INTO public.municipio
VALUES (3691, 3537602, 'Peruíbe', 'SP', 353760);
INSERT INTO public.municipio
VALUES (3692, 3537701, 'Piacatu', 'SP', 353770);
INSERT INTO public.municipio
VALUES (3693, 3537800, 'Piedade', 'SP', 353780);
INSERT INTO public.municipio
VALUES (3694, 3537909, 'Pilar do Sul', 'SP', 353790);
INSERT INTO public.municipio
VALUES (3695, 3538006, 'Pindamonhangaba', 'SP', 353800);
INSERT INTO public.municipio
VALUES (3696, 3538105, 'Pindorama', 'SP', 353810);
INSERT INTO public.municipio
VALUES (3697, 3538204, 'Pinhalzinho', 'SP', 353820);
INSERT INTO public.municipio
VALUES (3698, 3538303, 'Piquerobi', 'SP', 353830);
INSERT INTO public.municipio
VALUES (3699, 3538501, 'Piquete', 'SP', 353850);
INSERT INTO public.municipio
VALUES (3700, 3538600, 'Piracaia', 'SP', 353860);
INSERT INTO public.municipio
VALUES (3701, 3538709, 'Piracicaba', 'SP', 353870);
INSERT INTO public.municipio
VALUES (3702, 3538808, 'Piraju', 'SP', 353880);
INSERT INTO public.municipio
VALUES (3703, 3538907, 'Pirajuí', 'SP', 353890);
INSERT INTO public.municipio
VALUES (3704, 3539004, 'Pirangi', 'SP', 353900);
INSERT INTO public.municipio
VALUES (3705, 3539103, 'Pirapora do Bom Jesus', 'SP', 353910);
INSERT INTO public.municipio
VALUES (3706, 3539202, 'Pirapozinho', 'SP', 353920);
INSERT INTO public.municipio
VALUES (3707, 3539301, 'Pirassununga', 'SP', 353930);
INSERT INTO public.municipio
VALUES (3708, 3539400, 'Piratininga', 'SP', 353940);
INSERT INTO public.municipio
VALUES (3709, 3539509, 'Pitangueiras', 'SP', 353950);
INSERT INTO public.municipio
VALUES (3710, 3539608, 'Planalto', 'SP', 353960);
INSERT INTO public.municipio
VALUES (3711, 3539707, 'Platina', 'SP', 353970);
INSERT INTO public.municipio
VALUES (3712, 3539806, 'Poá', 'SP', 353980);
INSERT INTO public.municipio
VALUES (3713, 3539905, 'Poloni', 'SP', 353990);
INSERT INTO public.municipio
VALUES (3714, 3540002, 'Pompéia', 'SP', 354000);
INSERT INTO public.municipio
VALUES (3715, 3540101, 'Pongaí', 'SP', 354010);
INSERT INTO public.municipio
VALUES (3716, 3540200, 'Pontal', 'SP', 354020);
INSERT INTO public.municipio
VALUES (3717, 3540259, 'Pontalinda', 'SP', 354025);
INSERT INTO public.municipio
VALUES (3718, 3540309, 'Pontes Gestal', 'SP', 354030);
INSERT INTO public.municipio
VALUES (3719, 3540408, 'Populina', 'SP', 354040);
INSERT INTO public.municipio
VALUES (3720, 3540507, 'Porangaba', 'SP', 354050);
INSERT INTO public.municipio
VALUES (3721, 3540606, 'Porto Feliz', 'SP', 354060);
INSERT INTO public.municipio
VALUES (3722, 3540705, 'Porto Ferreira', 'SP', 354070);
INSERT INTO public.municipio
VALUES (3723, 3540754, 'Potim', 'SP', 354075);
INSERT INTO public.municipio
VALUES (3724, 3540804, 'Potirendaba', 'SP', 354080);
INSERT INTO public.municipio
VALUES (3725, 3540853, 'Pracinha', 'SP', 354085);
INSERT INTO public.municipio
VALUES (3726, 3540903, 'Pradópolis', 'SP', 354090);
INSERT INTO public.municipio
VALUES (3727, 3541000, 'Praia Grande', 'SP', 354100);
INSERT INTO public.municipio
VALUES (3728, 3541059, 'Pratânia', 'SP', 354105);
INSERT INTO public.municipio
VALUES (3729, 3541109, 'Presidente Alves', 'SP', 354110);
INSERT INTO public.municipio
VALUES (3730, 3541208, 'Presidente Bernardes', 'SP', 354120);
INSERT INTO public.municipio
VALUES (3731, 3541307, 'Presidente Epitácio', 'SP', 354130);
INSERT INTO public.municipio
VALUES (3732, 3541406, 'Presidente Prudente', 'SP', 354140);
INSERT INTO public.municipio
VALUES (3733, 3541505, 'Presidente Venceslau', 'SP', 354150);
INSERT INTO public.municipio
VALUES (3734, 3541604, 'Promissão', 'SP', 354160);
INSERT INTO public.municipio
VALUES (3735, 3541653, 'Quadra', 'SP', 354165);
INSERT INTO public.municipio
VALUES (3736, 3541703, 'Quatá', 'SP', 354170);
INSERT INTO public.municipio
VALUES (3737, 3541802, 'Queiroz', 'SP', 354180);
INSERT INTO public.municipio
VALUES (3738, 3541901, 'Queluz', 'SP', 354190);
INSERT INTO public.municipio
VALUES (3739, 3542008, 'Quintana', 'SP', 354200);
INSERT INTO public.municipio
VALUES (3740, 3542107, 'Rafard', 'SP', 354210);
INSERT INTO public.municipio
VALUES (3741, 3542206, 'Rancharia', 'SP', 354220);
INSERT INTO public.municipio
VALUES (3742, 3542305, 'Redenção da Serra', 'SP', 354230);
INSERT INTO public.municipio
VALUES (3743, 3542404, 'Regente Feijó', 'SP', 354240);
INSERT INTO public.municipio
VALUES (3744, 3542503, 'Reginópolis', 'SP', 354250);
INSERT INTO public.municipio
VALUES (3745, 3542602, 'Registro', 'SP', 354260);
INSERT INTO public.municipio
VALUES (3746, 3542701, 'Restinga', 'SP', 354270);
INSERT INTO public.municipio
VALUES (3747, 3542800, 'Ribeira', 'SP', 354280);
INSERT INTO public.municipio
VALUES (3748, 3542909, 'Ribeirão Bonito', 'SP', 354290);
INSERT INTO public.municipio
VALUES (3749, 3543006, 'Ribeirão Branco', 'SP', 354300);
INSERT INTO public.municipio
VALUES (3750, 3543105, 'Ribeirão Corrente', 'SP', 354310);
INSERT INTO public.municipio
VALUES (3751, 3543204, 'Ribeirão do Sul', 'SP', 354320);
INSERT INTO public.municipio
VALUES (3752, 3543238, 'Ribeirão dos Índios', 'SP', 354323);
INSERT INTO public.municipio
VALUES (3753, 3543253, 'Ribeirão Grande', 'SP', 354325);
INSERT INTO public.municipio
VALUES (3754, 3543303, 'Ribeirão Pires', 'SP', 354330);
INSERT INTO public.municipio
VALUES (3755, 3543402, 'Ribeirão Preto', 'SP', 354340);
INSERT INTO public.municipio
VALUES (3756, 3543501, 'Riversul', 'SP', 354350);
INSERT INTO public.municipio
VALUES (3757, 3543600, 'Rifaina', 'SP', 354360);
INSERT INTO public.municipio
VALUES (3758, 3543709, 'Rincão', 'SP', 354370);
INSERT INTO public.municipio
VALUES (3759, 3543808, 'Rinópolis', 'SP', 354380);
INSERT INTO public.municipio
VALUES (3760, 3543907, 'Rio Claro', 'SP', 354390);
INSERT INTO public.municipio
VALUES (3761, 3544004, 'Rio das Pedras', 'SP', 354400);
INSERT INTO public.municipio
VALUES (3762, 3544103, 'Rio Grande da Serra', 'SP', 354410);
INSERT INTO public.municipio
VALUES (3763, 3544202, 'Riolândia', 'SP', 354420);
INSERT INTO public.municipio
VALUES (3764, 3544251, 'Rosana', 'SP', 354425);
INSERT INTO public.municipio
VALUES (3765, 3544301, 'Roseira', 'SP', 354430);
INSERT INTO public.municipio
VALUES (3766, 3544400, 'Rubiácea', 'SP', 354440);
INSERT INTO public.municipio
VALUES (3767, 3544509, 'Rubinéia', 'SP', 354450);
INSERT INTO public.municipio
VALUES (3768, 3544608, 'Sabino', 'SP', 354460);
INSERT INTO public.municipio
VALUES (3769, 3544707, 'Sagres', 'SP', 354470);
INSERT INTO public.municipio
VALUES (3770, 3544806, 'Sales', 'SP', 354480);
INSERT INTO public.municipio
VALUES (3771, 3544905, 'Sales Oliveira', 'SP', 354490);
INSERT INTO public.municipio
VALUES (3772, 3545001, 'Salesópolis', 'SP', 354500);
INSERT INTO public.municipio
VALUES (3773, 3545100, 'Salmourão', 'SP', 354510);
INSERT INTO public.municipio
VALUES (3774, 3545159, 'Saltinho', 'SP', 354515);
INSERT INTO public.municipio
VALUES (3775, 3545209, 'Salto', 'SP', 354520);
INSERT INTO public.municipio
VALUES (3776, 3545308, 'Salto de Pirapora', 'SP', 354530);
INSERT INTO public.municipio
VALUES (3777, 3545407, 'Salto Grande', 'SP', 354540);
INSERT INTO public.municipio
VALUES (3778, 3545506, 'Sandovalina', 'SP', 354550);
INSERT INTO public.municipio
VALUES (3779, 3545605, 'Santa Adélia', 'SP', 354560);
INSERT INTO public.municipio
VALUES (3780, 3545704, 'Santa Albertina', 'SP', 354570);
INSERT INTO public.municipio
VALUES (3781, 3545803, 'Santa Bárbara D''Oeste', 'SP', 354580);
INSERT INTO public.municipio
VALUES (3782, 3546009, 'Santa Branca', 'SP', 354600);
INSERT INTO public.municipio
VALUES (3783, 3546108, 'Santa Clara D''Oeste', 'SP', 354610);
INSERT INTO public.municipio
VALUES (3784, 3546207, 'Santa Cruz da Conceição', 'SP', 354620);
INSERT INTO public.municipio
VALUES (3785, 3546256, 'Santa Cruz da Esperança', 'SP', 354625);
INSERT INTO public.municipio
VALUES (3786, 3546306, 'Santa Cruz das Palmeiras', 'SP', 354630);
INSERT INTO public.municipio
VALUES (3787, 3546405, 'Santa Cruz do Rio Pardo', 'SP', 354640);
INSERT INTO public.municipio
VALUES (3788, 3546504, 'Santa Ernestina', 'SP', 354650);
INSERT INTO public.municipio
VALUES (3789, 3546603, 'Santa Fé do Sul', 'SP', 354660);
INSERT INTO public.municipio
VALUES (3790, 3546702, 'Santa Gertrudes', 'SP', 354670);
INSERT INTO public.municipio
VALUES (3791, 3546801, 'Santa Isabel', 'SP', 354680);
INSERT INTO public.municipio
VALUES (3792, 3546900, 'Santa Lúcia', 'SP', 354690);
INSERT INTO public.municipio
VALUES (3793, 3547007, 'Santa Maria da Serra', 'SP', 354700);
INSERT INTO public.municipio
VALUES (3794, 3547106, 'Santa Mercedes', 'SP', 354710);
INSERT INTO public.municipio
VALUES (3795, 3547205, 'Santana da Ponte Pensa', 'SP', 354720);
INSERT INTO public.municipio
VALUES (3796, 3547304, 'Santana de Parnaíba', 'SP', 354730);
INSERT INTO public.municipio
VALUES (3797, 3547403, 'Santa Rita D''Oeste', 'SP', 354740);
INSERT INTO public.municipio
VALUES (3798, 3547502, 'Santa Rita do Passa Quatro', 'SP', 354750);
INSERT INTO public.municipio
VALUES (3799, 3547601, 'Santa Rosa de Viterbo', 'SP', 354760);
INSERT INTO public.municipio
VALUES (3800, 3547650, 'Santa Salete', 'SP', 354765);
INSERT INTO public.municipio
VALUES (3801, 3547700, 'Santo Anastácio', 'SP', 354770);
INSERT INTO public.municipio
VALUES (3802, 3547809, 'Santo André', 'SP', 354780);
INSERT INTO public.municipio
VALUES (3803, 3547908, 'Santo Antônio da Alegria', 'SP', 354790);
INSERT INTO public.municipio
VALUES (3804, 3548005, 'Santo Antônio de Posse', 'SP', 354800);
INSERT INTO public.municipio
VALUES (3805, 3548054, 'Santo Antônio do Aracanguá', 'SP', 354805);
INSERT INTO public.municipio
VALUES (3806, 3548104, 'Santo Antônio do Jardim', 'SP', 354810);
INSERT INTO public.municipio
VALUES (3807, 3548203, 'Santo Antônio do Pinhal', 'SP', 354820);
INSERT INTO public.municipio
VALUES (3808, 3548302, 'Santo Expedito', 'SP', 354830);
INSERT INTO public.municipio
VALUES (3809, 3548401, 'Santópolis do Aguapeí', 'SP', 354840);
INSERT INTO public.municipio
VALUES (3810, 3548500, 'Santos', 'SP', 354850);
INSERT INTO public.municipio
VALUES (3811, 3548609, 'São Bento do Sapucaí', 'SP', 354860);
INSERT INTO public.municipio
VALUES (3812, 3548708, 'São Bernardo do Campo', 'SP', 354870);
INSERT INTO public.municipio
VALUES (3813, 3548807, 'São Caetano do Sul', 'SP', 354880);
INSERT INTO public.municipio
VALUES (3814, 3548906, 'São Carlos', 'SP', 354890);
INSERT INTO public.municipio
VALUES (3815, 3549003, 'São Francisco', 'SP', 354900);
INSERT INTO public.municipio
VALUES (3816, 3549102, 'São João da Boa Vista', 'SP', 354910);
INSERT INTO public.municipio
VALUES (3817, 3549201, 'São João das Duas Pontes', 'SP', 354920);
INSERT INTO public.municipio
VALUES (3818, 3549250, 'São João de Iracema', 'SP', 354925);
INSERT INTO public.municipio
VALUES (3819, 3549300, 'São João do Pau D''Alho', 'SP', 354930);
INSERT INTO public.municipio
VALUES (3820, 3549409, 'São Joaquim da Barra', 'SP', 354940);
INSERT INTO public.municipio
VALUES (3821, 3549508, 'São José da Bela Vista', 'SP', 354950);
INSERT INTO public.municipio
VALUES (3822, 3549607, 'São José do Barreiro', 'SP', 354960);
INSERT INTO public.municipio
VALUES (3823, 3549706, 'São José do Rio Pardo', 'SP', 354970);
INSERT INTO public.municipio
VALUES (3824, 3549805, 'São José do Rio Preto', 'SP', 354980);
INSERT INTO public.municipio
VALUES (3825, 3549904, 'São José dos Campos', 'SP', 354990);
INSERT INTO public.municipio
VALUES (3826, 3549953, 'São Lourenço da Serra', 'SP', 354995);
INSERT INTO public.municipio
VALUES (3827, 3550001, 'São Luís do Paraitinga', 'SP', 355000);
INSERT INTO public.municipio
VALUES (3828, 3550100, 'São Manuel', 'SP', 355010);
INSERT INTO public.municipio
VALUES (3829, 3550209, 'São Miguel Arcanjo', 'SP', 355020);
INSERT INTO public.municipio
VALUES (3830, 3550308, 'São Paulo', 'SP', 355030);
INSERT INTO public.municipio
VALUES (3831, 3550407, 'São Pedro', 'SP', 355040);
INSERT INTO public.municipio
VALUES (3832, 3550506, 'São Pedro do Turvo', 'SP', 355050);
INSERT INTO public.municipio
VALUES (3833, 3550605, 'São Roque', 'SP', 355060);
INSERT INTO public.municipio
VALUES (3834, 3550704, 'São Sebastião', 'SP', 355070);
INSERT INTO public.municipio
VALUES (3835, 3550803, 'São Sebastião da Grama', 'SP', 355080);
INSERT INTO public.municipio
VALUES (3836, 3550902, 'São Simão', 'SP', 355090);
INSERT INTO public.municipio
VALUES (3837, 3551009, 'São Vicente', 'SP', 355100);
INSERT INTO public.municipio
VALUES (3838, 3551108, 'Sarapuí', 'SP', 355110);
INSERT INTO public.municipio
VALUES (3839, 3551207, 'Sarutaiá', 'SP', 355120);
INSERT INTO public.municipio
VALUES (3840, 3551306, 'Sebastianópolis do Sul', 'SP', 355130);
INSERT INTO public.municipio
VALUES (3841, 3551405, 'Serra Azul', 'SP', 355140);
INSERT INTO public.municipio
VALUES (3842, 3551504, 'Serrana', 'SP', 355150);
INSERT INTO public.municipio
VALUES (3843, 3551603, 'Serra Negra', 'SP', 355160);
INSERT INTO public.municipio
VALUES (3844, 3551702, 'Sertãozinho', 'SP', 355170);
INSERT INTO public.municipio
VALUES (3845, 3551801, 'Sete Barras', 'SP', 355180);
INSERT INTO public.municipio
VALUES (3846, 3551900, 'Severínia', 'SP', 355190);
INSERT INTO public.municipio
VALUES (3847, 3552007, 'Silveiras', 'SP', 355200);
INSERT INTO public.municipio
VALUES (3848, 3552106, 'Socorro', 'SP', 355210);
INSERT INTO public.municipio
VALUES (3849, 3552205, 'Sorocaba', 'SP', 355220);
INSERT INTO public.municipio
VALUES (3850, 3552304, 'Sud Mennucci', 'SP', 355230);
INSERT INTO public.municipio
VALUES (3851, 3552403, 'Sumaré', 'SP', 355240);
INSERT INTO public.municipio
VALUES (3852, 3552502, 'Suzano', 'SP', 355250);
INSERT INTO public.municipio
VALUES (3853, 3552551, 'Suzanápolis', 'SP', 355255);
INSERT INTO public.municipio
VALUES (3854, 3552601, 'Tabapuã', 'SP', 355260);
INSERT INTO public.municipio
VALUES (3855, 3552700, 'Tabatinga', 'SP', 355270);
INSERT INTO public.municipio
VALUES (3856, 3552809, 'Taboão da Serra', 'SP', 355280);
INSERT INTO public.municipio
VALUES (3857, 3552908, 'Taciba', 'SP', 355290);
INSERT INTO public.municipio
VALUES (3858, 3553005, 'Taguaí', 'SP', 355300);
INSERT INTO public.municipio
VALUES (3859, 3553104, 'Taiaçu', 'SP', 355310);
INSERT INTO public.municipio
VALUES (3860, 3553203, 'Taiúva', 'SP', 355320);
INSERT INTO public.municipio
VALUES (3861, 3553302, 'Tambaú', 'SP', 355330);
INSERT INTO public.municipio
VALUES (3862, 3553401, 'Tanabi', 'SP', 355340);
INSERT INTO public.municipio
VALUES (3863, 3553500, 'Tapiraí', 'SP', 355350);
INSERT INTO public.municipio
VALUES (3864, 3553609, 'Tapiratiba', 'SP', 355360);
INSERT INTO public.municipio
VALUES (3865, 3553658, 'Taquaral', 'SP', 355365);
INSERT INTO public.municipio
VALUES (3866, 3553708, 'Taquaritinga', 'SP', 355370);
INSERT INTO public.municipio
VALUES (3867, 3553807, 'Taquarituba', 'SP', 355380);
INSERT INTO public.municipio
VALUES (3868, 3553856, 'Taquarivaí', 'SP', 355385);
INSERT INTO public.municipio
VALUES (3869, 3553906, 'Tarabai', 'SP', 355390);
INSERT INTO public.municipio
VALUES (3870, 3553955, 'Tarumã', 'SP', 355395);
INSERT INTO public.municipio
VALUES (3871, 3554003, 'Tatuí', 'SP', 355400);
INSERT INTO public.municipio
VALUES (3872, 3554102, 'Taubaté', 'SP', 355410);
INSERT INTO public.municipio
VALUES (3873, 3554201, 'Tejupá', 'SP', 355420);
INSERT INTO public.municipio
VALUES (3874, 3554300, 'Teodoro Sampaio', 'SP', 355430);
INSERT INTO public.municipio
VALUES (3875, 3554409, 'Terra Roxa', 'SP', 355440);
INSERT INTO public.municipio
VALUES (3876, 3554508, 'Tietê', 'SP', 355450);
INSERT INTO public.municipio
VALUES (3877, 3554607, 'Timburi', 'SP', 355460);
INSERT INTO public.municipio
VALUES (3878, 3554656, 'Torre de Pedra', 'SP', 355465);
INSERT INTO public.municipio
VALUES (3879, 3554706, 'Torrinha', 'SP', 355470);
INSERT INTO public.municipio
VALUES (3880, 3554755, 'Trabiju', 'SP', 355475);
INSERT INTO public.municipio
VALUES (3881, 3554805, 'Tremembé', 'SP', 355480);
INSERT INTO public.municipio
VALUES (3882, 3554904, 'Três Fronteiras', 'SP', 355490);
INSERT INTO public.municipio
VALUES (3883, 3554953, 'Tuiuti', 'SP', 355495);
INSERT INTO public.municipio
VALUES (3884, 3555000, 'Tupã', 'SP', 355500);
INSERT INTO public.municipio
VALUES (3885, 3555109, 'Tupi Paulista', 'SP', 355510);
INSERT INTO public.municipio
VALUES (3886, 3555208, 'Turiúba', 'SP', 355520);
INSERT INTO public.municipio
VALUES (3887, 3555307, 'Turmalina', 'SP', 355530);
INSERT INTO public.municipio
VALUES (3888, 3555356, 'Ubarana', 'SP', 355535);
INSERT INTO public.municipio
VALUES (3889, 3555406, 'Ubatuba', 'SP', 355540);
INSERT INTO public.municipio
VALUES (3890, 3555505, 'Ubirajara', 'SP', 355550);
INSERT INTO public.municipio
VALUES (3891, 3555604, 'Uchoa', 'SP', 355560);
INSERT INTO public.municipio
VALUES (3892, 3555703, 'União Paulista', 'SP', 355570);
INSERT INTO public.municipio
VALUES (3893, 3555802, 'Urânia', 'SP', 355580);
INSERT INTO public.municipio
VALUES (3894, 3555901, 'Uru', 'SP', 355590);
INSERT INTO public.municipio
VALUES (3895, 3556008, 'Urupês', 'SP', 355600);
INSERT INTO public.municipio
VALUES (3896, 3556107, 'Valentim Gentil', 'SP', 355610);
INSERT INTO public.municipio
VALUES (3897, 3556206, 'Valinhos', 'SP', 355620);
INSERT INTO public.municipio
VALUES (3898, 3556305, 'Valparaíso', 'SP', 355630);
INSERT INTO public.municipio
VALUES (3899, 3556354, 'Vargem', 'SP', 355635);
INSERT INTO public.municipio
VALUES (3900, 3556404, 'Vargem Grande do Sul', 'SP', 355640);
INSERT INTO public.municipio
VALUES (3901, 3556453, 'Vargem Grande Paulista', 'SP', 355645);
INSERT INTO public.municipio
VALUES (3902, 3556503, 'Várzea Paulista', 'SP', 355650);
INSERT INTO public.municipio
VALUES (3903, 3556602, 'Vera Cruz', 'SP', 355660);
INSERT INTO public.municipio
VALUES (3904, 3556701, 'Vinhedo', 'SP', 355670);
INSERT INTO public.municipio
VALUES (3905, 3556800, 'Viradouro', 'SP', 355680);
INSERT INTO public.municipio
VALUES (3906, 3556909, 'Vista Alegre do Alto', 'SP', 355690);
INSERT INTO public.municipio
VALUES (3907, 3556958, 'Vitória Brasil', 'SP', 355695);
INSERT INTO public.municipio
VALUES (3908, 3557006, 'Votorantim', 'SP', 355700);
INSERT INTO public.municipio
VALUES (3909, 3557105, 'Votuporanga', 'SP', 355710);
INSERT INTO public.municipio
VALUES (3910, 3557154, 'Zacarias', 'SP', 355715);
INSERT INTO public.municipio
VALUES (3911, 3557204, 'Chavantes', 'SP', 355720);
INSERT INTO public.municipio
VALUES (3912, 3557303, 'Estiva Gerbi', 'SP', 355730);
INSERT INTO public.municipio
VALUES (3913, 4100103, 'Abatiá', 'PR', 410010);
INSERT INTO public.municipio
VALUES (3914, 4100202, 'Adrianópolis', 'PR', 410020);
INSERT INTO public.municipio
VALUES (3915, 4100301, 'Agudos do Sul', 'PR', 410030);
INSERT INTO public.municipio
VALUES (3916, 4100400, 'Almirante Tamandaré', 'PR', 410040);
INSERT INTO public.municipio
VALUES (3917, 4100459, 'Altamira do Paraná', 'PR', 410045);
INSERT INTO public.municipio
VALUES (3918, 4100509, 'Altônia', 'PR', 410050);
INSERT INTO public.municipio
VALUES (3919, 4100608, 'Alto Paraná', 'PR', 410060);
INSERT INTO public.municipio
VALUES (3920, 4100707, 'Alto Piquiri', 'PR', 410070);
INSERT INTO public.municipio
VALUES (3921, 4100806, 'Alvorada do Sul', 'PR', 410080);
INSERT INTO public.municipio
VALUES (3922, 4100905, 'Amaporã', 'PR', 410090);
INSERT INTO public.municipio
VALUES (3923, 4101002, 'Ampére', 'PR', 410100);
INSERT INTO public.municipio
VALUES (3924, 4101051, 'Anahy', 'PR', 410105);
INSERT INTO public.municipio
VALUES (3925, 4101101, 'Andirá', 'PR', 410110);
INSERT INTO public.municipio
VALUES (3926, 4101150, 'Ângulo', 'PR', 410115);
INSERT INTO public.municipio
VALUES (3927, 4101200, 'Antonina', 'PR', 410120);
INSERT INTO public.municipio
VALUES (3928, 4101309, 'Antônio Olinto', 'PR', 410130);
INSERT INTO public.municipio
VALUES (3929, 4101408, 'Apucarana', 'PR', 410140);
INSERT INTO public.municipio
VALUES (3930, 4101507, 'Arapongas', 'PR', 410150);
INSERT INTO public.municipio
VALUES (3931, 4101606, 'Arapoti', 'PR', 410160);
INSERT INTO public.municipio
VALUES (3932, 4101655, 'Arapuã', 'PR', 410165);
INSERT INTO public.municipio
VALUES (3933, 4101705, 'Araruna', 'PR', 410170);
INSERT INTO public.municipio
VALUES (3934, 4101804, 'Araucária', 'PR', 410180);
INSERT INTO public.municipio
VALUES (3935, 4101853, 'Ariranha do Ivaí', 'PR', 410185);
INSERT INTO public.municipio
VALUES (3936, 4101903, 'Assaí', 'PR', 410190);
INSERT INTO public.municipio
VALUES (3937, 4102000, 'Assis Chateaubriand', 'PR', 410200);
INSERT INTO public.municipio
VALUES (3938, 4102109, 'Astorga', 'PR', 410210);
INSERT INTO public.municipio
VALUES (3939, 4102208, 'Atalaia', 'PR', 410220);
INSERT INTO public.municipio
VALUES (3940, 4102307, 'Balsa Nova', 'PR', 410230);
INSERT INTO public.municipio
VALUES (3941, 4102406, 'Bandeirantes', 'PR', 410240);
INSERT INTO public.municipio
VALUES (3942, 4102505, 'Barbosa Ferraz', 'PR', 410250);
INSERT INTO public.municipio
VALUES (3943, 4102604, 'Barracão', 'PR', 410260);
INSERT INTO public.municipio
VALUES (3944, 4102703, 'Barra do Jacaré', 'PR', 410270);
INSERT INTO public.municipio
VALUES (3945, 4102752, 'Bela Vista da Caroba', 'PR', 410275);
INSERT INTO public.municipio
VALUES (3946, 4102802, 'Bela Vista do Paraíso', 'PR', 410280);
INSERT INTO public.municipio
VALUES (3947, 4102901, 'Bituruna', 'PR', 410290);
INSERT INTO public.municipio
VALUES (3948, 4103008, 'Boa Esperança', 'PR', 410300);
INSERT INTO public.municipio
VALUES (3949, 4103024, 'Boa Esperança do Iguaçu', 'PR', 410302);
INSERT INTO public.municipio
VALUES (3950, 4103040, 'Boa Ventura de São Roque', 'PR', 410304);
INSERT INTO public.municipio
VALUES (3951, 4103057, 'Boa Vista da Aparecida', 'PR', 410305);
INSERT INTO public.municipio
VALUES (3952, 4103107, 'Bocaiúva do Sul', 'PR', 410310);
INSERT INTO public.municipio
VALUES (3953, 4103156, 'Bom Jesus do Sul', 'PR', 410315);
INSERT INTO public.municipio
VALUES (3954, 4103206, 'Bom Sucesso', 'PR', 410320);
INSERT INTO public.municipio
VALUES (3955, 4103222, 'Bom Sucesso do Sul', 'PR', 410322);
INSERT INTO public.municipio
VALUES (3956, 4103305, 'Borrazópolis', 'PR', 410330);
INSERT INTO public.municipio
VALUES (3957, 4103354, 'Braganey', 'PR', 410335);
INSERT INTO public.municipio
VALUES (3958, 4103370, 'Brasilândia do Sul', 'PR', 410337);
INSERT INTO public.municipio
VALUES (3959, 4103404, 'Cafeara', 'PR', 410340);
INSERT INTO public.municipio
VALUES (3960, 4103453, 'Cafelândia', 'PR', 410345);
INSERT INTO public.municipio
VALUES (3961, 4103479, 'Cafezal do Sul', 'PR', 410347);
INSERT INTO public.municipio
VALUES (3962, 4103503, 'Califórnia', 'PR', 410350);
INSERT INTO public.municipio
VALUES (3963, 4103602, 'Cambará', 'PR', 410360);
INSERT INTO public.municipio
VALUES (3964, 4103701, 'Cambé', 'PR', 410370);
INSERT INTO public.municipio
VALUES (3965, 4103800, 'Cambira', 'PR', 410380);
INSERT INTO public.municipio
VALUES (3966, 4103909, 'Campina da Lagoa', 'PR', 410390);
INSERT INTO public.municipio
VALUES (3967, 4103958, 'Campina do Simão', 'PR', 410395);
INSERT INTO public.municipio
VALUES (3968, 4104006, 'Campina Grande do Sul', 'PR', 410400);
INSERT INTO public.municipio
VALUES (3969, 4104055, 'Campo Bonito', 'PR', 410405);
INSERT INTO public.municipio
VALUES (3970, 4104105, 'Campo do Tenente', 'PR', 410410);
INSERT INTO public.municipio
VALUES (3971, 4104204, 'Campo Largo', 'PR', 410420);
INSERT INTO public.municipio
VALUES (3972, 4104253, 'Campo Magro', 'PR', 410425);
INSERT INTO public.municipio
VALUES (3973, 4104303, 'Campo Mourão', 'PR', 410430);
INSERT INTO public.municipio
VALUES (3974, 4104402, 'Cândido de Abreu', 'PR', 410440);
INSERT INTO public.municipio
VALUES (3975, 4104428, 'Candói', 'PR', 410442);
INSERT INTO public.municipio
VALUES (3976, 4104451, 'Cantagalo', 'PR', 410445);
INSERT INTO public.municipio
VALUES (3977, 4104501, 'Capanema', 'PR', 410450);
INSERT INTO public.municipio
VALUES (3978, 4104600, 'Capitão Leônidas Marques', 'PR', 410460);
INSERT INTO public.municipio
VALUES (3979, 4104659, 'Carambeí', 'PR', 410465);
INSERT INTO public.municipio
VALUES (3980, 4104709, 'Carlópolis', 'PR', 410470);
INSERT INTO public.municipio
VALUES (3981, 4104808, 'Cascavel', 'PR', 410480);
INSERT INTO public.municipio
VALUES (3982, 4104907, 'Castro', 'PR', 410490);
INSERT INTO public.municipio
VALUES (3983, 4105003, 'Catanduvas', 'PR', 410500);
INSERT INTO public.municipio
VALUES (3984, 4105102, 'Centenário do Sul', 'PR', 410510);
INSERT INTO public.municipio
VALUES (3985, 4105201, 'Cerro Azul', 'PR', 410520);
INSERT INTO public.municipio
VALUES (3986, 4105300, 'Céu Azul', 'PR', 410530);
INSERT INTO public.municipio
VALUES (3987, 4105409, 'Chopinzinho', 'PR', 410540);
INSERT INTO public.municipio
VALUES (3988, 4105508, 'Cianorte', 'PR', 410550);
INSERT INTO public.municipio
VALUES (3989, 4105607, 'Cidade Gaúcha', 'PR', 410560);
INSERT INTO public.municipio
VALUES (3990, 4105706, 'Clevelândia', 'PR', 410570);
INSERT INTO public.municipio
VALUES (3991, 4105805, 'Colombo', 'PR', 410580);
INSERT INTO public.municipio
VALUES (3992, 4105904, 'Colorado', 'PR', 410590);
INSERT INTO public.municipio
VALUES (3993, 4106001, 'Congonhinhas', 'PR', 410600);
INSERT INTO public.municipio
VALUES (3994, 4106100, 'Conselheiro Mairinck', 'PR', 410610);
INSERT INTO public.municipio
VALUES (3995, 4106209, 'Contenda', 'PR', 410620);
INSERT INTO public.municipio
VALUES (3996, 4106308, 'Corbélia', 'PR', 410630);
INSERT INTO public.municipio
VALUES (3997, 4106407, 'Cornélio Procópio', 'PR', 410640);
INSERT INTO public.municipio
VALUES (3998, 4106456, 'Coronel Domingos Soares', 'PR', 410645);
INSERT INTO public.municipio
VALUES (3999, 4106506, 'Coronel Vivida', 'PR', 410650);
INSERT INTO public.municipio
VALUES (4000, 4106555, 'Corumbataí do Sul', 'PR', 410655);
INSERT INTO public.municipio
VALUES (4001, 4106571, 'Cruzeiro do Iguaçu', 'PR', 410657);
INSERT INTO public.municipio
VALUES (4002, 4106605, 'Cruzeiro do Oeste', 'PR', 410660);
INSERT INTO public.municipio
VALUES (4003, 4106704, 'Cruzeiro do Sul', 'PR', 410670);
INSERT INTO public.municipio
VALUES (4004, 4106803, 'Cruz Machado', 'PR', 410680);
INSERT INTO public.municipio
VALUES (4005, 4106852, 'Cruzmaltina', 'PR', 410685);
INSERT INTO public.municipio
VALUES (4006, 4106902, 'Curitiba', 'PR', 410690);
INSERT INTO public.municipio
VALUES (4007, 4107009, 'Curiúva', 'PR', 410700);
INSERT INTO public.municipio
VALUES (4008, 4107108, 'Diamante do Norte', 'PR', 410710);
INSERT INTO public.municipio
VALUES (4009, 4107124, 'Diamante do Sul', 'PR', 410712);
INSERT INTO public.municipio
VALUES (4010, 4107157, 'Diamante D''Oeste', 'PR', 410715);
INSERT INTO public.municipio
VALUES (4011, 4107207, 'Dois Vizinhos', 'PR', 410720);
INSERT INTO public.municipio
VALUES (4012, 4107256, 'Douradina', 'PR', 410725);
INSERT INTO public.municipio
VALUES (4013, 4107306, 'Doutor Camargo', 'PR', 410730);
INSERT INTO public.municipio
VALUES (4014, 4107405, 'Enéas Marques', 'PR', 410740);
INSERT INTO public.municipio
VALUES (4015, 4107504, 'Engenheiro Beltrão', 'PR', 410750);
INSERT INTO public.municipio
VALUES (4016, 4107520, 'Esperança Nova', 'PR', 410752);
INSERT INTO public.municipio
VALUES (4017, 4107538, 'Entre Rios do Oeste', 'PR', 410753);
INSERT INTO public.municipio
VALUES (4018, 4107546, 'Espigão Alto do Iguaçu', 'PR', 410754);
INSERT INTO public.municipio
VALUES (4019, 4107553, 'Farol', 'PR', 410755);
INSERT INTO public.municipio
VALUES (4020, 4107603, 'Faxinal', 'PR', 410760);
INSERT INTO public.municipio
VALUES (4021, 4107652, 'Fazenda Rio Grande', 'PR', 410765);
INSERT INTO public.municipio
VALUES (4022, 4107702, 'Fênix', 'PR', 410770);
INSERT INTO public.municipio
VALUES (4023, 4107736, 'Fernandes Pinheiro', 'PR', 410773);
INSERT INTO public.municipio
VALUES (4024, 4107751, 'Figueira', 'PR', 410775);
INSERT INTO public.municipio
VALUES (4025, 4107801, 'Floraí', 'PR', 410780);
INSERT INTO public.municipio
VALUES (4026, 4107850, 'Flor da Serra do Sul', 'PR', 410785);
INSERT INTO public.municipio
VALUES (4027, 4107900, 'Floresta', 'PR', 410790);
INSERT INTO public.municipio
VALUES (4028, 4108007, 'Florestópolis', 'PR', 410800);
INSERT INTO public.municipio
VALUES (4029, 4108106, 'Flórida', 'PR', 410810);
INSERT INTO public.municipio
VALUES (4030, 4108205, 'Formosa do Oeste', 'PR', 410820);
INSERT INTO public.municipio
VALUES (4031, 4108304, 'Foz do Iguaçu', 'PR', 410830);
INSERT INTO public.municipio
VALUES (4032, 4108320, 'Francisco Alves', 'PR', 410832);
INSERT INTO public.municipio
VALUES (4033, 4108403, 'Francisco Beltrão', 'PR', 410840);
INSERT INTO public.municipio
VALUES (4034, 4108452, 'Foz do Jordão', 'PR', 410845);
INSERT INTO public.municipio
VALUES (4035, 4108502, 'General Carneiro', 'PR', 410850);
INSERT INTO public.municipio
VALUES (4036, 4108551, 'Godoy Moreira', 'PR', 410855);
INSERT INTO public.municipio
VALUES (4037, 4108601, 'Goioerê', 'PR', 410860);
INSERT INTO public.municipio
VALUES (4038, 4108650, 'Goioxim', 'PR', 410865);
INSERT INTO public.municipio
VALUES (4039, 4108700, 'Grandes Rios', 'PR', 410870);
INSERT INTO public.municipio
VALUES (4040, 4108809, 'Guaíra', 'PR', 410880);
INSERT INTO public.municipio
VALUES (4041, 4108908, 'Guairaçá', 'PR', 410890);
INSERT INTO public.municipio
VALUES (4042, 4108957, 'Guamiranga', 'PR', 410895);
INSERT INTO public.municipio
VALUES (4043, 4109005, 'Guapirama', 'PR', 410900);
INSERT INTO public.municipio
VALUES (4044, 4109104, 'Guaporema', 'PR', 410910);
INSERT INTO public.municipio
VALUES (4045, 4109203, 'Guaraci', 'PR', 410920);
INSERT INTO public.municipio
VALUES (4046, 4109302, 'Guaraniaçu', 'PR', 410930);
INSERT INTO public.municipio
VALUES (4047, 4109401, 'Guarapuava', 'PR', 410940);
INSERT INTO public.municipio
VALUES (4048, 4109500, 'Guaraqueçaba', 'PR', 410950);
INSERT INTO public.municipio
VALUES (4049, 4109609, 'Guaratuba', 'PR', 410960);
INSERT INTO public.municipio
VALUES (4050, 4109658, 'Honório Serpa', 'PR', 410965);
INSERT INTO public.municipio
VALUES (4051, 4109708, 'Ibaiti', 'PR', 410970);
INSERT INTO public.municipio
VALUES (4052, 4109757, 'Ibema', 'PR', 410975);
INSERT INTO public.municipio
VALUES (4053, 4109807, 'Ibiporã', 'PR', 410980);
INSERT INTO public.municipio
VALUES (4054, 4109906, 'Icaraíma', 'PR', 410990);
INSERT INTO public.municipio
VALUES (4055, 4110003, 'Iguaraçu', 'PR', 411000);
INSERT INTO public.municipio
VALUES (4056, 4110052, 'Iguatu', 'PR', 411005);
INSERT INTO public.municipio
VALUES (4057, 4110078, 'Imbaú', 'PR', 411007);
INSERT INTO public.municipio
VALUES (4058, 4110102, 'Imbituva', 'PR', 411010);
INSERT INTO public.municipio
VALUES (4059, 4110201, 'Inácio Martins', 'PR', 411020);
INSERT INTO public.municipio
VALUES (4060, 4110300, 'Inajá', 'PR', 411030);
INSERT INTO public.municipio
VALUES (4061, 4110409, 'Indianópolis', 'PR', 411040);
INSERT INTO public.municipio
VALUES (4062, 4110508, 'Ipiranga', 'PR', 411050);
INSERT INTO public.municipio
VALUES (4063, 4110607, 'Iporã', 'PR', 411060);
INSERT INTO public.municipio
VALUES (4064, 4110656, 'Iracema do Oeste', 'PR', 411065);
INSERT INTO public.municipio
VALUES (4065, 4110706, 'Irati', 'PR', 411070);
INSERT INTO public.municipio
VALUES (4066, 4110805, 'Iretama', 'PR', 411080);
INSERT INTO public.municipio
VALUES (4067, 4110904, 'Itaguajé', 'PR', 411090);
INSERT INTO public.municipio
VALUES (4068, 4110953, 'Itaipulândia', 'PR', 411095);
INSERT INTO public.municipio
VALUES (4069, 4111001, 'Itambaracá', 'PR', 411100);
INSERT INTO public.municipio
VALUES (4070, 4111100, 'Itambé', 'PR', 411110);
INSERT INTO public.municipio
VALUES (4071, 4111209, 'Itapejara D''Oeste', 'PR', 411120);
INSERT INTO public.municipio
VALUES (4072, 4111258, 'Itaperuçu', 'PR', 411125);
INSERT INTO public.municipio
VALUES (4073, 4111308, 'Itaúna do Sul', 'PR', 411130);
INSERT INTO public.municipio
VALUES (4074, 4111407, 'Ivaí', 'PR', 411140);
INSERT INTO public.municipio
VALUES (4075, 4111506, 'Ivaiporã', 'PR', 411150);
INSERT INTO public.municipio
VALUES (4076, 4111555, 'Ivaté', 'PR', 411155);
INSERT INTO public.municipio
VALUES (4077, 4111605, 'Ivatuba', 'PR', 411160);
INSERT INTO public.municipio
VALUES (4078, 4111704, 'Jaboti', 'PR', 411170);
INSERT INTO public.municipio
VALUES (4079, 4111803, 'Jacarezinho', 'PR', 411180);
INSERT INTO public.municipio
VALUES (4080, 4111902, 'Jaguapitã', 'PR', 411190);
INSERT INTO public.municipio
VALUES (4081, 4112009, 'Jaguariaíva', 'PR', 411200);
INSERT INTO public.municipio
VALUES (4082, 4112108, 'Jandaia do Sul', 'PR', 411210);
INSERT INTO public.municipio
VALUES (4083, 4112207, 'Janiópolis', 'PR', 411220);
INSERT INTO public.municipio
VALUES (4084, 4112306, 'Japira', 'PR', 411230);
INSERT INTO public.municipio
VALUES (4085, 4112405, 'Japurá', 'PR', 411240);
INSERT INTO public.municipio
VALUES (4086, 4112504, 'Jardim Alegre', 'PR', 411250);
INSERT INTO public.municipio
VALUES (4087, 4112603, 'Jardim Olinda', 'PR', 411260);
INSERT INTO public.municipio
VALUES (4088, 4112702, 'Jataizinho', 'PR', 411270);
INSERT INTO public.municipio
VALUES (4089, 4112751, 'Jesuítas', 'PR', 411275);
INSERT INTO public.municipio
VALUES (4090, 4112801, 'Joaquim Távora', 'PR', 411280);
INSERT INTO public.municipio
VALUES (4091, 4112900, 'Jundiaí do Sul', 'PR', 411290);
INSERT INTO public.municipio
VALUES (4092, 4112959, 'Juranda', 'PR', 411295);
INSERT INTO public.municipio
VALUES (4093, 4113007, 'Jussara', 'PR', 411300);
INSERT INTO public.municipio
VALUES (4094, 4113106, 'Kaloré', 'PR', 411310);
INSERT INTO public.municipio
VALUES (4095, 4113205, 'Lapa', 'PR', 411320);
INSERT INTO public.municipio
VALUES (4096, 4113254, 'Laranjal', 'PR', 411325);
INSERT INTO public.municipio
VALUES (4097, 4113304, 'Laranjeiras do Sul', 'PR', 411330);
INSERT INTO public.municipio
VALUES (4098, 4113403, 'Leópolis', 'PR', 411340);
INSERT INTO public.municipio
VALUES (4099, 4113429, 'Lidianópolis', 'PR', 411342);
INSERT INTO public.municipio
VALUES (4100, 4113452, 'Lindoeste', 'PR', 411345);
INSERT INTO public.municipio
VALUES (4101, 4113502, 'Loanda', 'PR', 411350);
INSERT INTO public.municipio
VALUES (4102, 4113601, 'Lobato', 'PR', 411360);
INSERT INTO public.municipio
VALUES (4103, 4113700, 'Londrina', 'PR', 411370);
INSERT INTO public.municipio
VALUES (4104, 4113734, 'Luiziana', 'PR', 411373);
INSERT INTO public.municipio
VALUES (4105, 4113759, 'Lunardelli', 'PR', 411375);
INSERT INTO public.municipio
VALUES (4106, 4113809, 'Lupionópolis', 'PR', 411380);
INSERT INTO public.municipio
VALUES (4107, 4113908, 'Mallet', 'PR', 411390);
INSERT INTO public.municipio
VALUES (4108, 4114005, 'Mamborê', 'PR', 411400);
INSERT INTO public.municipio
VALUES (4109, 4114104, 'Mandaguaçu', 'PR', 411410);
INSERT INTO public.municipio
VALUES (4110, 4114203, 'Mandaguari', 'PR', 411420);
INSERT INTO public.municipio
VALUES (4111, 4114302, 'Mandirituba', 'PR', 411430);
INSERT INTO public.municipio
VALUES (4112, 4114351, 'Manfrinópolis', 'PR', 411435);
INSERT INTO public.municipio
VALUES (4113, 4114401, 'Mangueirinha', 'PR', 411440);
INSERT INTO public.municipio
VALUES (4114, 4114500, 'Manoel Ribas', 'PR', 411450);
INSERT INTO public.municipio
VALUES (4115, 4114609, 'Marechal Cândido Rondon', 'PR', 411460);
INSERT INTO public.municipio
VALUES (4116, 4114708, 'Maria Helena', 'PR', 411470);
INSERT INTO public.municipio
VALUES (4117, 4114807, 'Marialva', 'PR', 411480);
INSERT INTO public.municipio
VALUES (4118, 4114906, 'Marilândia do Sul', 'PR', 411490);
INSERT INTO public.municipio
VALUES (4119, 4115002, 'Marilena', 'PR', 411500);
INSERT INTO public.municipio
VALUES (4120, 4115101, 'Mariluz', 'PR', 411510);
INSERT INTO public.municipio
VALUES (4121, 4115200, 'Maringá', 'PR', 411520);
INSERT INTO public.municipio
VALUES (4122, 4115309, 'Mariópolis', 'PR', 411530);
INSERT INTO public.municipio
VALUES (4123, 4115358, 'Maripá', 'PR', 411535);
INSERT INTO public.municipio
VALUES (4124, 4115408, 'Marmeleiro', 'PR', 411540);
INSERT INTO public.municipio
VALUES (4125, 4115457, 'Marquinho', 'PR', 411545);
INSERT INTO public.municipio
VALUES (4126, 4115507, 'Marumbi', 'PR', 411550);
INSERT INTO public.municipio
VALUES (4127, 4115606, 'Matelândia', 'PR', 411560);
INSERT INTO public.municipio
VALUES (4128, 4115705, 'Matinhos', 'PR', 411570);
INSERT INTO public.municipio
VALUES (4129, 4115739, 'Mato Rico', 'PR', 411573);
INSERT INTO public.municipio
VALUES (4130, 4115754, 'Mauá da Serra', 'PR', 411575);
INSERT INTO public.municipio
VALUES (4131, 4115804, 'Medianeira', 'PR', 411580);
INSERT INTO public.municipio
VALUES (4132, 4115853, 'Mercedes', 'PR', 411585);
INSERT INTO public.municipio
VALUES (4133, 4115903, 'Mirador', 'PR', 411590);
INSERT INTO public.municipio
VALUES (4134, 4116000, 'Miraselva', 'PR', 411600);
INSERT INTO public.municipio
VALUES (4135, 4116059, 'Missal', 'PR', 411605);
INSERT INTO public.municipio
VALUES (4136, 4116109, 'Moreira Sales', 'PR', 411610);
INSERT INTO public.municipio
VALUES (4137, 4116208, 'Morretes', 'PR', 411620);
INSERT INTO public.municipio
VALUES (4138, 4116307, 'Munhoz de Melo', 'PR', 411630);
INSERT INTO public.municipio
VALUES (4139, 4116406, 'Nossa Senhora das Graças', 'PR', 411640);
INSERT INTO public.municipio
VALUES (4140, 4116505, 'Nova Aliança do Ivaí', 'PR', 411650);
INSERT INTO public.municipio
VALUES (4141, 4116604, 'Nova América da Colina', 'PR', 411660);
INSERT INTO public.municipio
VALUES (4142, 4116703, 'Nova Aurora', 'PR', 411670);
INSERT INTO public.municipio
VALUES (4143, 4116802, 'Nova Cantu', 'PR', 411680);
INSERT INTO public.municipio
VALUES (4144, 4116901, 'Nova Esperança', 'PR', 411690);
INSERT INTO public.municipio
VALUES (4145, 4116950, 'Nova Esperança do Sudoeste', 'PR', 411695);
INSERT INTO public.municipio
VALUES (4146, 4117008, 'Nova Fátima', 'PR', 411700);
INSERT INTO public.municipio
VALUES (4147, 4117057, 'Nova Laranjeiras', 'PR', 411705);
INSERT INTO public.municipio
VALUES (4148, 4117107, 'Nova Londrina', 'PR', 411710);
INSERT INTO public.municipio
VALUES (4149, 4117206, 'Nova Olímpia', 'PR', 411720);
INSERT INTO public.municipio
VALUES (4150, 4117214, 'Nova Santa Bárbara', 'PR', 411721);
INSERT INTO public.municipio
VALUES (4151, 4117222, 'Nova Santa Rosa', 'PR', 411722);
INSERT INTO public.municipio
VALUES (4152, 4117255, 'Nova Prata do Iguaçu', 'PR', 411725);
INSERT INTO public.municipio
VALUES (4153, 4117271, 'Nova Tebas', 'PR', 411727);
INSERT INTO public.municipio
VALUES (4154, 4117297, 'Novo Itacolomi', 'PR', 411729);
INSERT INTO public.municipio
VALUES (4155, 4117305, 'Ortigueira', 'PR', 411730);
INSERT INTO public.municipio
VALUES (4156, 4117404, 'Ourizona', 'PR', 411740);
INSERT INTO public.municipio
VALUES (4157, 4117453, 'Ouro Verde do Oeste', 'PR', 411745);
INSERT INTO public.municipio
VALUES (4158, 4117503, 'Paiçandu', 'PR', 411750);
INSERT INTO public.municipio
VALUES (4159, 4117602, 'Palmas', 'PR', 411760);
INSERT INTO public.municipio
VALUES (4160, 4117701, 'Palmeira', 'PR', 411770);
INSERT INTO public.municipio
VALUES (4161, 4117800, 'Palmital', 'PR', 411780);
INSERT INTO public.municipio
VALUES (4162, 4117909, 'Palotina', 'PR', 411790);
INSERT INTO public.municipio
VALUES (4163, 4118006, 'Paraíso do Norte', 'PR', 411800);
INSERT INTO public.municipio
VALUES (4164, 4118105, 'Paranacity', 'PR', 411810);
INSERT INTO public.municipio
VALUES (4165, 4118204, 'Paranaguá', 'PR', 411820);
INSERT INTO public.municipio
VALUES (4166, 4118303, 'Paranapoema', 'PR', 411830);
INSERT INTO public.municipio
VALUES (4167, 4118402, 'Paranavaí', 'PR', 411840);
INSERT INTO public.municipio
VALUES (4168, 4118451, 'Pato Bragado', 'PR', 411845);
INSERT INTO public.municipio
VALUES (4169, 4118501, 'Pato Branco', 'PR', 411850);
INSERT INTO public.municipio
VALUES (4170, 4118600, 'Paula Freitas', 'PR', 411860);
INSERT INTO public.municipio
VALUES (4171, 4118709, 'Paulo Frontin', 'PR', 411870);
INSERT INTO public.municipio
VALUES (4172, 4118808, 'Peabiru', 'PR', 411880);
INSERT INTO public.municipio
VALUES (4173, 4118857, 'Perobal', 'PR', 411885);
INSERT INTO public.municipio
VALUES (4174, 4118907, 'Pérola', 'PR', 411890);
INSERT INTO public.municipio
VALUES (4175, 4119004, 'Pérola D''Oeste', 'PR', 411900);
INSERT INTO public.municipio
VALUES (4176, 4119103, 'Piên', 'PR', 411910);
INSERT INTO public.municipio
VALUES (4177, 4119152, 'Pinhais', 'PR', 411915);
INSERT INTO public.municipio
VALUES (4178, 4119202, 'Pinhalão', 'PR', 411920);
INSERT INTO public.municipio
VALUES (4179, 4119251, 'Pinhal de São Bento', 'PR', 411925);
INSERT INTO public.municipio
VALUES (4180, 4119301, 'Pinhão', 'PR', 411930);
INSERT INTO public.municipio
VALUES (4181, 4119400, 'Piraí do Sul', 'PR', 411940);
INSERT INTO public.municipio
VALUES (4182, 4119509, 'Piraquara', 'PR', 411950);
INSERT INTO public.municipio
VALUES (4183, 4119608, 'Pitanga', 'PR', 411960);
INSERT INTO public.municipio
VALUES (4184, 4119657, 'Pitangueiras', 'PR', 411965);
INSERT INTO public.municipio
VALUES (4185, 4119707, 'Planaltina do Paraná', 'PR', 411970);
INSERT INTO public.municipio
VALUES (4186, 4119806, 'Planalto', 'PR', 411980);
INSERT INTO public.municipio
VALUES (4187, 4119905, 'Ponta Grossa', 'PR', 411990);
INSERT INTO public.municipio
VALUES (4188, 4119954, 'Pontal do Paraná', 'PR', 411995);
INSERT INTO public.municipio
VALUES (4189, 4120002, 'Porecatu', 'PR', 412000);
INSERT INTO public.municipio
VALUES (4190, 4120101, 'Porto Amazonas', 'PR', 412010);
INSERT INTO public.municipio
VALUES (4191, 4120150, 'Porto Barreiro', 'PR', 412015);
INSERT INTO public.municipio
VALUES (4192, 4120200, 'Porto Rico', 'PR', 412020);
INSERT INTO public.municipio
VALUES (4193, 4120309, 'Porto Vitória', 'PR', 412030);
INSERT INTO public.municipio
VALUES (4194, 4120333, 'Prado Ferreira', 'PR', 412033);
INSERT INTO public.municipio
VALUES (4195, 4120358, 'Pranchita', 'PR', 412035);
INSERT INTO public.municipio
VALUES (4196, 4120408, 'Presidente Castelo Branco', 'PR', 412040);
INSERT INTO public.municipio
VALUES (4197, 4120507, 'Primeiro de Maio', 'PR', 412050);
INSERT INTO public.municipio
VALUES (4198, 4120606, 'Prudentópolis', 'PR', 412060);
INSERT INTO public.municipio
VALUES (4199, 4120655, 'Quarto Centenário', 'PR', 412065);
INSERT INTO public.municipio
VALUES (4200, 4120705, 'Quatiguá', 'PR', 412070);
INSERT INTO public.municipio
VALUES (4201, 4120804, 'Quatro Barras', 'PR', 412080);
INSERT INTO public.municipio
VALUES (4202, 4120853, 'Quatro Pontes', 'PR', 412085);
INSERT INTO public.municipio
VALUES (4203, 4120903, 'Quedas do Iguaçu', 'PR', 412090);
INSERT INTO public.municipio
VALUES (4204, 4121000, 'Querência do Norte', 'PR', 412100);
INSERT INTO public.municipio
VALUES (4205, 4121109, 'Quinta do Sol', 'PR', 412110);
INSERT INTO public.municipio
VALUES (4206, 4121208, 'Quitandinha', 'PR', 412120);
INSERT INTO public.municipio
VALUES (4207, 4121257, 'Ramilândia', 'PR', 412125);
INSERT INTO public.municipio
VALUES (4208, 4121307, 'Rancho Alegre', 'PR', 412130);
INSERT INTO public.municipio
VALUES (4209, 4121356, 'Rancho Alegre D''Oeste', 'PR', 412135);
INSERT INTO public.municipio
VALUES (4210, 4121406, 'Realeza', 'PR', 412140);
INSERT INTO public.municipio
VALUES (4211, 4121505, 'Rebouças', 'PR', 412150);
INSERT INTO public.municipio
VALUES (4212, 4121604, 'Renascença', 'PR', 412160);
INSERT INTO public.municipio
VALUES (4213, 4121703, 'Reserva', 'PR', 412170);
INSERT INTO public.municipio
VALUES (4214, 4121752, 'Reserva do Iguaçu', 'PR', 412175);
INSERT INTO public.municipio
VALUES (4215, 4121802, 'Ribeirão Claro', 'PR', 412180);
INSERT INTO public.municipio
VALUES (4216, 4121901, 'Ribeirão do Pinhal', 'PR', 412190);
INSERT INTO public.municipio
VALUES (4217, 4122008, 'Rio Azul', 'PR', 412200);
INSERT INTO public.municipio
VALUES (4218, 4122107, 'Rio Bom', 'PR', 412210);
INSERT INTO public.municipio
VALUES (4219, 4122156, 'Rio Bonito do Iguaçu', 'PR', 412215);
INSERT INTO public.municipio
VALUES (4220, 4122172, 'Rio Branco do Ivaí', 'PR', 412217);
INSERT INTO public.municipio
VALUES (4221, 4122206, 'Rio Branco do Sul', 'PR', 412220);
INSERT INTO public.municipio
VALUES (4222, 4122305, 'Rio Negro', 'PR', 412230);
INSERT INTO public.municipio
VALUES (4223, 4122404, 'Rolândia', 'PR', 412240);
INSERT INTO public.municipio
VALUES (4224, 4122503, 'Roncador', 'PR', 412250);
INSERT INTO public.municipio
VALUES (4225, 4122602, 'Rondon', 'PR', 412260);
INSERT INTO public.municipio
VALUES (4226, 4122651, 'Rosário do Ivaí', 'PR', 412265);
INSERT INTO public.municipio
VALUES (4227, 4122701, 'Sabáudia', 'PR', 412270);
INSERT INTO public.municipio
VALUES (4228, 4122800, 'Salgado Filho', 'PR', 412280);
INSERT INTO public.municipio
VALUES (4229, 4122909, 'Salto do Itararé', 'PR', 412290);
INSERT INTO public.municipio
VALUES (4230, 4123006, 'Salto do Lontra', 'PR', 412300);
INSERT INTO public.municipio
VALUES (4231, 4123105, 'Santa Amélia', 'PR', 412310);
INSERT INTO public.municipio
VALUES (4232, 4123204, 'Santa Cecília do Pavão', 'PR', 412320);
INSERT INTO public.municipio
VALUES (4233, 4123303, 'Santa Cruz de Monte Castelo', 'PR', 412330);
INSERT INTO public.municipio
VALUES (4234, 4123402, 'Santa Fé', 'PR', 412340);
INSERT INTO public.municipio
VALUES (4235, 4123501, 'Santa Helena', 'PR', 412350);
INSERT INTO public.municipio
VALUES (4236, 4123600, 'Santa Inês', 'PR', 412360);
INSERT INTO public.municipio
VALUES (4237, 4123709, 'Santa Isabel do Ivaí', 'PR', 412370);
INSERT INTO public.municipio
VALUES (4238, 4123808, 'Santa Izabel do Oeste', 'PR', 412380);
INSERT INTO public.municipio
VALUES (4239, 4123824, 'Santa Lúcia', 'PR', 412382);
INSERT INTO public.municipio
VALUES (4240, 4123857, 'Santa Maria do Oeste', 'PR', 412385);
INSERT INTO public.municipio
VALUES (4241, 4123907, 'Santa Mariana', 'PR', 412390);
INSERT INTO public.municipio
VALUES (4242, 4123956, 'Santa Mônica', 'PR', 412395);
INSERT INTO public.municipio
VALUES (4243, 4124004, 'Santana do Itararé', 'PR', 412400);
INSERT INTO public.municipio
VALUES (4244, 4124020, 'Santa Tereza do Oeste', 'PR', 412402);
INSERT INTO public.municipio
VALUES (4245, 4124053, 'Santa Terezinha de Itaipu', 'PR', 412405);
INSERT INTO public.municipio
VALUES (4246, 4124103, 'Santo Antônio da Platina', 'PR', 412410);
INSERT INTO public.municipio
VALUES (4247, 4124202, 'Santo Antônio do Caiuá', 'PR', 412420);
INSERT INTO public.municipio
VALUES (4248, 4124301, 'Santo Antônio do Paraíso', 'PR', 412430);
INSERT INTO public.municipio
VALUES (4249, 4124400, 'Santo Antônio do Sudoeste', 'PR', 412440);
INSERT INTO public.municipio
VALUES (4250, 4124509, 'Santo Inácio', 'PR', 412450);
INSERT INTO public.municipio
VALUES (4251, 4124608, 'São Carlos do Ivaí', 'PR', 412460);
INSERT INTO public.municipio
VALUES (4252, 4124707, 'São Jerônimo da Serra', 'PR', 412470);
INSERT INTO public.municipio
VALUES (4253, 4124806, 'São João', 'PR', 412480);
INSERT INTO public.municipio
VALUES (4254, 4124905, 'São João do Caiuá', 'PR', 412490);
INSERT INTO public.municipio
VALUES (4255, 4125001, 'São João do Ivaí', 'PR', 412500);
INSERT INTO public.municipio
VALUES (4256, 4125100, 'São João do Triunfo', 'PR', 412510);
INSERT INTO public.municipio
VALUES (4257, 4125209, 'São Jorge D''Oeste', 'PR', 412520);
INSERT INTO public.municipio
VALUES (4258, 4125308, 'São Jorge do Ivaí', 'PR', 412530);
INSERT INTO public.municipio
VALUES (4259, 4125357, 'São Jorge do Patrocínio', 'PR', 412535);
INSERT INTO public.municipio
VALUES (4260, 4125407, 'São José da Boa Vista', 'PR', 412540);
INSERT INTO public.municipio
VALUES (4261, 4125456, 'São José das Palmeiras', 'PR', 412545);
INSERT INTO public.municipio
VALUES (4262, 4125506, 'São José dos Pinhais', 'PR', 412550);
INSERT INTO public.municipio
VALUES (4263, 4125555, 'São Manoel do Paraná', 'PR', 412555);
INSERT INTO public.municipio
VALUES (4264, 4125605, 'São Mateus do Sul', 'PR', 412560);
INSERT INTO public.municipio
VALUES (4265, 4125704, 'São Miguel do Iguaçu', 'PR', 412570);
INSERT INTO public.municipio
VALUES (4266, 4125753, 'São Pedro do Iguaçu', 'PR', 412575);
INSERT INTO public.municipio
VALUES (4267, 4125803, 'São Pedro do Ivaí', 'PR', 412580);
INSERT INTO public.municipio
VALUES (4268, 4125902, 'São Pedro do Paraná', 'PR', 412590);
INSERT INTO public.municipio
VALUES (4269, 4126009, 'São Sebastião da Amoreira', 'PR', 412600);
INSERT INTO public.municipio
VALUES (4270, 4126108, 'São Tomé', 'PR', 412610);
INSERT INTO public.municipio
VALUES (4271, 4126207, 'Sapopema', 'PR', 412620);
INSERT INTO public.municipio
VALUES (4272, 4126256, 'Sarandi', 'PR', 412625);
INSERT INTO public.municipio
VALUES (4273, 4126272, 'Saudade do Iguaçu', 'PR', 412627);
INSERT INTO public.municipio
VALUES (4274, 4126306, 'Sengés', 'PR', 412630);
INSERT INTO public.municipio
VALUES (4275, 4126355, 'Serranópolis do Iguaçu', 'PR', 412635);
INSERT INTO public.municipio
VALUES (4276, 4126405, 'Sertaneja', 'PR', 412640);
INSERT INTO public.municipio
VALUES (4277, 4126504, 'Sertanópolis', 'PR', 412650);
INSERT INTO public.municipio
VALUES (4278, 4126603, 'Siqueira Campos', 'PR', 412660);
INSERT INTO public.municipio
VALUES (4279, 4126652, 'Sulina', 'PR', 412665);
INSERT INTO public.municipio
VALUES (4280, 4126678, 'Tamarana', 'PR', 412667);
INSERT INTO public.municipio
VALUES (4281, 4126702, 'Tamboara', 'PR', 412670);
INSERT INTO public.municipio
VALUES (4282, 4126801, 'Tapejara', 'PR', 412680);
INSERT INTO public.municipio
VALUES (4283, 4126900, 'Tapira', 'PR', 412690);
INSERT INTO public.municipio
VALUES (4284, 4127007, 'Teixeira Soares', 'PR', 412700);
INSERT INTO public.municipio
VALUES (4285, 4127106, 'Telêmaco Borba', 'PR', 412710);
INSERT INTO public.municipio
VALUES (4286, 4127205, 'Terra Boa', 'PR', 412720);
INSERT INTO public.municipio
VALUES (4287, 4127304, 'Terra Rica', 'PR', 412730);
INSERT INTO public.municipio
VALUES (4288, 4127403, 'Terra Roxa', 'PR', 412740);
INSERT INTO public.municipio
VALUES (4289, 4127502, 'Tibagi', 'PR', 412750);
INSERT INTO public.municipio
VALUES (4290, 4127601, 'Tijucas do Sul', 'PR', 412760);
INSERT INTO public.municipio
VALUES (4291, 4127700, 'Toledo', 'PR', 412770);
INSERT INTO public.municipio
VALUES (4292, 4127809, 'Tomazina', 'PR', 412780);
INSERT INTO public.municipio
VALUES (4293, 4127858, 'Três Barras do Paraná', 'PR', 412785);
INSERT INTO public.municipio
VALUES (4294, 4127882, 'Tunas do Paraná', 'PR', 412788);
INSERT INTO public.municipio
VALUES (4295, 4127908, 'Tuneiras do Oeste', 'PR', 412790);
INSERT INTO public.municipio
VALUES (4296, 4127957, 'Tupãssi', 'PR', 412795);
INSERT INTO public.municipio
VALUES (4297, 4127965, 'Turvo', 'PR', 412796);
INSERT INTO public.municipio
VALUES (4298, 4128005, 'Ubiratã', 'PR', 412800);
INSERT INTO public.municipio
VALUES (4299, 4128104, 'Umuarama', 'PR', 412810);
INSERT INTO public.municipio
VALUES (4300, 4128203, 'União da Vitória', 'PR', 412820);
INSERT INTO public.municipio
VALUES (4301, 4128302, 'Uniflor', 'PR', 412830);
INSERT INTO public.municipio
VALUES (4302, 4128401, 'Uraí', 'PR', 412840);
INSERT INTO public.municipio
VALUES (4303, 4128500, 'Wenceslau Braz', 'PR', 412850);
INSERT INTO public.municipio
VALUES (4304, 4128534, 'Ventania', 'PR', 412853);
INSERT INTO public.municipio
VALUES (4305, 4128559, 'Vera Cruz do Oeste', 'PR', 412855);
INSERT INTO public.municipio
VALUES (4306, 4128609, 'Verê', 'PR', 412860);
INSERT INTO public.municipio
VALUES (4307, 4128625, 'Alto Paraíso', 'PR', 412862);
INSERT INTO public.municipio
VALUES (4308, 4128633, 'Doutor Ulysses', 'PR', 412863);
INSERT INTO public.municipio
VALUES (4309, 4128658, 'Virmond', 'PR', 412865);
INSERT INTO public.municipio
VALUES (4310, 4128708, 'Vitorino', 'PR', 412870);
INSERT INTO public.municipio
VALUES (4311, 4128807, 'Xambrê', 'PR', 412880);
INSERT INTO public.municipio
VALUES (4312, 4200051, 'Abdon Batista', 'SC', 420005);
INSERT INTO public.municipio
VALUES (4313, 4200101, 'Abelardo Luz', 'SC', 420010);
INSERT INTO public.municipio
VALUES (4314, 4200200, 'Agrolândia', 'SC', 420020);
INSERT INTO public.municipio
VALUES (4315, 4200309, 'Agronômica', 'SC', 420030);
INSERT INTO public.municipio
VALUES (4316, 4200408, 'Água Doce', 'SC', 420040);
INSERT INTO public.municipio
VALUES (4317, 4200507, 'Águas de Chapecó', 'SC', 420050);
INSERT INTO public.municipio
VALUES (4318, 4200556, 'Águas Frias', 'SC', 420055);
INSERT INTO public.municipio
VALUES (4319, 4200606, 'Águas Mornas', 'SC', 420060);
INSERT INTO public.municipio
VALUES (4320, 4200705, 'Alfredo Wagner', 'SC', 420070);
INSERT INTO public.municipio
VALUES (4321, 4200754, 'Alto Bela Vista', 'SC', 420075);
INSERT INTO public.municipio
VALUES (4322, 4200804, 'Anchieta', 'SC', 420080);
INSERT INTO public.municipio
VALUES (4323, 4200903, 'Angelina', 'SC', 420090);
INSERT INTO public.municipio
VALUES (4324, 4201000, 'Anita Garibaldi', 'SC', 420100);
INSERT INTO public.municipio
VALUES (4325, 4201109, 'Anitápolis', 'SC', 420110);
INSERT INTO public.municipio
VALUES (4326, 4201208, 'Antônio Carlos', 'SC', 420120);
INSERT INTO public.municipio
VALUES (4327, 4201257, 'Apiúna', 'SC', 420125);
INSERT INTO public.municipio
VALUES (4328, 4201273, 'Arabutã', 'SC', 420127);
INSERT INTO public.municipio
VALUES (4329, 4201307, 'Araquari', 'SC', 420130);
INSERT INTO public.municipio
VALUES (4330, 4201406, 'Araranguá', 'SC', 420140);
INSERT INTO public.municipio
VALUES (4331, 4201505, 'Armazém', 'SC', 420150);
INSERT INTO public.municipio
VALUES (4332, 4201604, 'Arroio Trinta', 'SC', 420160);
INSERT INTO public.municipio
VALUES (4333, 4201653, 'Arvoredo', 'SC', 420165);
INSERT INTO public.municipio
VALUES (4334, 4201703, 'Ascurra', 'SC', 420170);
INSERT INTO public.municipio
VALUES (4335, 4201802, 'Atalanta', 'SC', 420180);
INSERT INTO public.municipio
VALUES (4336, 4201901, 'Aurora', 'SC', 420190);
INSERT INTO public.municipio
VALUES (4337, 4201950, 'Balneário Arroio do Silva', 'SC', 420195);
INSERT INTO public.municipio
VALUES (4338, 4202008, 'Balneário Camboriú', 'SC', 420200);
INSERT INTO public.municipio
VALUES (4339, 4202057, 'Balneário Barra do Sul', 'SC', 420205);
INSERT INTO public.municipio
VALUES (4340, 4202073, 'Balneário Gaivota', 'SC', 420207);
INSERT INTO public.municipio
VALUES (4341, 4202081, 'Bandeirante', 'SC', 420208);
INSERT INTO public.municipio
VALUES (4342, 4202099, 'Barra Bonita', 'SC', 420209);
INSERT INTO public.municipio
VALUES (4343, 4202107, 'Barra Velha', 'SC', 420210);
INSERT INTO public.municipio
VALUES (4344, 4202131, 'Bela Vista do Toldo', 'SC', 420213);
INSERT INTO public.municipio
VALUES (4345, 4202156, 'Belmonte', 'SC', 420215);
INSERT INTO public.municipio
VALUES (4346, 4202206, 'Benedito Novo', 'SC', 420220);
INSERT INTO public.municipio
VALUES (4347, 4202305, 'Biguaçu', 'SC', 420230);
INSERT INTO public.municipio
VALUES (4348, 4202404, 'Blumenau', 'SC', 420240);
INSERT INTO public.municipio
VALUES (4349, 4202438, 'Bocaina do Sul', 'SC', 420243);
INSERT INTO public.municipio
VALUES (4350, 4202453, 'Bombinhas', 'SC', 420245);
INSERT INTO public.municipio
VALUES (4351, 4202503, 'Bom Jardim da Serra', 'SC', 420250);
INSERT INTO public.municipio
VALUES (4352, 4202537, 'Bom Jesus', 'SC', 420253);
INSERT INTO public.municipio
VALUES (4353, 4202578, 'Bom Jesus do Oeste', 'SC', 420257);
INSERT INTO public.municipio
VALUES (4354, 4202602, 'Bom Retiro', 'SC', 420260);
INSERT INTO public.municipio
VALUES (4355, 4202701, 'Botuverá', 'SC', 420270);
INSERT INTO public.municipio
VALUES (4356, 4202800, 'Braço do Norte', 'SC', 420280);
INSERT INTO public.municipio
VALUES (4357, 4202859, 'Braço do Trombudo', 'SC', 420285);
INSERT INTO public.municipio
VALUES (4358, 4202875, 'Brunópolis', 'SC', 420287);
INSERT INTO public.municipio
VALUES (4359, 4202909, 'Brusque', 'SC', 420290);
INSERT INTO public.municipio
VALUES (4360, 4203006, 'Caçador', 'SC', 420300);
INSERT INTO public.municipio
VALUES (4361, 4203105, 'Caibi', 'SC', 420310);
INSERT INTO public.municipio
VALUES (4362, 4203154, 'Calmon', 'SC', 420315);
INSERT INTO public.municipio
VALUES (4363, 4203204, 'Camboriú', 'SC', 420320);
INSERT INTO public.municipio
VALUES (4364, 4203253, 'Capão Alto', 'SC', 420325);
INSERT INTO public.municipio
VALUES (4365, 4203303, 'Campo Alegre', 'SC', 420330);
INSERT INTO public.municipio
VALUES (4366, 4203402, 'Campo Belo do Sul', 'SC', 420340);
INSERT INTO public.municipio
VALUES (4367, 4203501, 'Campo Erê', 'SC', 420350);
INSERT INTO public.municipio
VALUES (4368, 4203600, 'Campos Novos', 'SC', 420360);
INSERT INTO public.municipio
VALUES (4369, 4203709, 'Canelinha', 'SC', 420370);
INSERT INTO public.municipio
VALUES (4370, 4203808, 'Canoinhas', 'SC', 420380);
INSERT INTO public.municipio
VALUES (4371, 4203907, 'Capinzal', 'SC', 420390);
INSERT INTO public.municipio
VALUES (4372, 4203956, 'Capivari de Baixo', 'SC', 420395);
INSERT INTO public.municipio
VALUES (4373, 4204004, 'Catanduvas', 'SC', 420400);
INSERT INTO public.municipio
VALUES (4374, 4204103, 'Caxambu do Sul', 'SC', 420410);
INSERT INTO public.municipio
VALUES (4375, 4204152, 'Celso Ramos', 'SC', 420415);
INSERT INTO public.municipio
VALUES (4376, 4204178, 'Cerro Negro', 'SC', 420417);
INSERT INTO public.municipio
VALUES (4377, 4204194, 'Chapadão do Lageado', 'SC', 420419);
INSERT INTO public.municipio
VALUES (4378, 4204202, 'Chapecó', 'SC', 420420);
INSERT INTO public.municipio
VALUES (4379, 4204251, 'Cocal do Sul', 'SC', 420425);
INSERT INTO public.municipio
VALUES (4380, 4204301, 'Concórdia', 'SC', 420430);
INSERT INTO public.municipio
VALUES (4381, 4204350, 'Cordilheira Alta', 'SC', 420435);
INSERT INTO public.municipio
VALUES (4382, 4204400, 'Coronel Freitas', 'SC', 420440);
INSERT INTO public.municipio
VALUES (4383, 4204459, 'Coronel Martins', 'SC', 420445);
INSERT INTO public.municipio
VALUES (4384, 4204509, 'Corupá', 'SC', 420450);
INSERT INTO public.municipio
VALUES (4385, 4204558, 'Correia Pinto', 'SC', 420455);
INSERT INTO public.municipio
VALUES (4386, 4204608, 'Criciúma', 'SC', 420460);
INSERT INTO public.municipio
VALUES (4387, 4204707, 'Cunha Porã', 'SC', 420470);
INSERT INTO public.municipio
VALUES (4388, 4204756, 'Cunhataí', 'SC', 420475);
INSERT INTO public.municipio
VALUES (4389, 4204806, 'Curitibanos', 'SC', 420480);
INSERT INTO public.municipio
VALUES (4390, 4204905, 'Descanso', 'SC', 420490);
INSERT INTO public.municipio
VALUES (4391, 4205001, 'Dionísio Cerqueira', 'SC', 420500);
INSERT INTO public.municipio
VALUES (4392, 4205100, 'Dona Emma', 'SC', 420510);
INSERT INTO public.municipio
VALUES (4393, 4205159, 'Doutor Pedrinho', 'SC', 420515);
INSERT INTO public.municipio
VALUES (4394, 4205175, 'Entre Rios', 'SC', 420517);
INSERT INTO public.municipio
VALUES (4396, 4205209, 'Erval Velho', 'SC', 420520);
INSERT INTO public.municipio
VALUES (4397, 4205308, 'Faxinal dos Guedes', 'SC', 420530);
INSERT INTO public.municipio
VALUES (4398, 4205357, 'Flor do Sertão', 'SC', 420535);
INSERT INTO public.municipio
VALUES (4399, 4205407, 'Florianópolis', 'SC', 420540);
INSERT INTO public.municipio
VALUES (4400, 4205431, 'Formosa do Sul', 'SC', 420543);
INSERT INTO public.municipio
VALUES (4401, 4205456, 'Forquilhinha', 'SC', 420545);
INSERT INTO public.municipio
VALUES (4402, 4205506, 'Fraiburgo', 'SC', 420550);
INSERT INTO public.municipio
VALUES (4403, 4205555, 'Frei Rogério', 'SC', 420555);
INSERT INTO public.municipio
VALUES (4404, 4205605, 'Galvão', 'SC', 420560);
INSERT INTO public.municipio
VALUES (4405, 4205704, 'Garopaba', 'SC', 420570);
INSERT INTO public.municipio
VALUES (4406, 4205803, 'Garuva', 'SC', 420580);
INSERT INTO public.municipio
VALUES (4407, 4205902, 'Gaspar', 'SC', 420590);
INSERT INTO public.municipio
VALUES (4408, 4206009, 'Governador Celso Ramos', 'SC', 420600);
INSERT INTO public.municipio
VALUES (4409, 4206108, 'Grão Pará', 'SC', 420610);
INSERT INTO public.municipio
VALUES (4410, 4206207, 'Gravatal', 'SC', 420620);
INSERT INTO public.municipio
VALUES (4411, 4206306, 'Guabiruba', 'SC', 420630);
INSERT INTO public.municipio
VALUES (4412, 4206405, 'Guaraciaba', 'SC', 420640);
INSERT INTO public.municipio
VALUES (4413, 4206504, 'Guaramirim', 'SC', 420650);
INSERT INTO public.municipio
VALUES (4414, 4206603, 'Guarujá do Sul', 'SC', 420660);
INSERT INTO public.municipio
VALUES (4415, 4206652, 'Guatambú', 'SC', 420665);
INSERT INTO public.municipio
VALUES (4416, 4206702, 'Herval D''Oeste', 'SC', 420670);
INSERT INTO public.municipio
VALUES (4417, 4206751, 'Ibiam', 'SC', 420675);
INSERT INTO public.municipio
VALUES (4418, 4206801, 'Ibicaré', 'SC', 420680);
INSERT INTO public.municipio
VALUES (4419, 4206900, 'Ibirama', 'SC', 420690);
INSERT INTO public.municipio
VALUES (4420, 4207007, 'Içara', 'SC', 420700);
INSERT INTO public.municipio
VALUES (4421, 4207106, 'Ilhota', 'SC', 420710);
INSERT INTO public.municipio
VALUES (4422, 4207205, 'Imaruí', 'SC', 420720);
INSERT INTO public.municipio
VALUES (4423, 4207304, 'Imbituba', 'SC', 420730);
INSERT INTO public.municipio
VALUES (4424, 4207403, 'Imbuia', 'SC', 420740);
INSERT INTO public.municipio
VALUES (4425, 4207502, 'Indaial', 'SC', 420750);
INSERT INTO public.municipio
VALUES (4426, 4207577, 'Iomerê', 'SC', 420757);
INSERT INTO public.municipio
VALUES (4427, 4207601, 'Ipira', 'SC', 420760);
INSERT INTO public.municipio
VALUES (4428, 4207650, 'Iporã do Oeste', 'SC', 420765);
INSERT INTO public.municipio
VALUES (4429, 4207684, 'Ipuaçu', 'SC', 420768);
INSERT INTO public.municipio
VALUES (4430, 4207700, 'Ipumirim', 'SC', 420770);
INSERT INTO public.municipio
VALUES (4431, 4207759, 'Iraceminha', 'SC', 420775);
INSERT INTO public.municipio
VALUES (4432, 4207809, 'Irani', 'SC', 420780);
INSERT INTO public.municipio
VALUES (4433, 4207858, 'Irati', 'SC', 420785);
INSERT INTO public.municipio
VALUES (4434, 4207908, 'Irineópolis', 'SC', 420790);
INSERT INTO public.municipio
VALUES (4435, 4208005, 'Itá', 'SC', 420800);
INSERT INTO public.municipio
VALUES (4436, 4208104, 'Itaiópolis', 'SC', 420810);
INSERT INTO public.municipio
VALUES (4437, 4208203, 'Itajaí', 'SC', 420820);
INSERT INTO public.municipio
VALUES (4438, 4208302, 'Itapema', 'SC', 420830);
INSERT INTO public.municipio
VALUES (4439, 4208401, 'Itapiranga', 'SC', 420840);
INSERT INTO public.municipio
VALUES (4440, 4208450, 'Itapoá', 'SC', 420845);
INSERT INTO public.municipio
VALUES (4441, 4208500, 'Ituporanga', 'SC', 420850);
INSERT INTO public.municipio
VALUES (4442, 4208609, 'Jaborá', 'SC', 420860);
INSERT INTO public.municipio
VALUES (4443, 4208708, 'Jacinto Machado', 'SC', 420870);
INSERT INTO public.municipio
VALUES (4444, 4208807, 'Jaguaruna', 'SC', 420880);
INSERT INTO public.municipio
VALUES (4445, 4208906, 'Jaraguá do Sul', 'SC', 420890);
INSERT INTO public.municipio
VALUES (4446, 4208955, 'Jardinópolis', 'SC', 420895);
INSERT INTO public.municipio
VALUES (4447, 4209003, 'Joaçaba', 'SC', 420900);
INSERT INTO public.municipio
VALUES (4448, 4209102, 'Joinville', 'SC', 420910);
INSERT INTO public.municipio
VALUES (4449, 4209151, 'José Boiteux', 'SC', 420915);
INSERT INTO public.municipio
VALUES (4450, 4209177, 'Jupiá', 'SC', 420917);
INSERT INTO public.municipio
VALUES (4451, 4209201, 'Lacerdópolis', 'SC', 420920);
INSERT INTO public.municipio
VALUES (4452, 4209300, 'Lages', 'SC', 420930);
INSERT INTO public.municipio
VALUES (4453, 4209409, 'Laguna', 'SC', 420940);
INSERT INTO public.municipio
VALUES (4454, 4209458, 'Lajeado Grande', 'SC', 420945);
INSERT INTO public.municipio
VALUES (4455, 4209508, 'Laurentino', 'SC', 420950);
INSERT INTO public.municipio
VALUES (4456, 4209607, 'Lauro Muller', 'SC', 420960);
INSERT INTO public.municipio
VALUES (4457, 4209706, 'Lebon Régis', 'SC', 420970);
INSERT INTO public.municipio
VALUES (4458, 4209805, 'Leoberto Leal', 'SC', 420980);
INSERT INTO public.municipio
VALUES (4459, 4209854, 'Lindóia do Sul', 'SC', 420985);
INSERT INTO public.municipio
VALUES (4460, 4209904, 'Lontras', 'SC', 420990);
INSERT INTO public.municipio
VALUES (4461, 4210001, 'Luiz Alves', 'SC', 421000);
INSERT INTO public.municipio
VALUES (4462, 4210035, 'Luzerna', 'SC', 421003);
INSERT INTO public.municipio
VALUES (4463, 4210050, 'Macieira', 'SC', 421005);
INSERT INTO public.municipio
VALUES (4464, 4210100, 'Mafra', 'SC', 421010);
INSERT INTO public.municipio
VALUES (4465, 4210209, 'Major Gercino', 'SC', 421020);
INSERT INTO public.municipio
VALUES (4466, 4210308, 'Major Vieira', 'SC', 421030);
INSERT INTO public.municipio
VALUES (4467, 4210407, 'Maracajá', 'SC', 421040);
INSERT INTO public.municipio
VALUES (4468, 4210506, 'Maravilha', 'SC', 421050);
INSERT INTO public.municipio
VALUES (4469, 4210555, 'Marema', 'SC', 421055);
INSERT INTO public.municipio
VALUES (4470, 4210605, 'Massaranduba', 'SC', 421060);
INSERT INTO public.municipio
VALUES (4471, 4210704, 'Matos Costa', 'SC', 421070);
INSERT INTO public.municipio
VALUES (4472, 4210803, 'Meleiro', 'SC', 421080);
INSERT INTO public.municipio
VALUES (4473, 4210852, 'Mirim Doce', 'SC', 421085);
INSERT INTO public.municipio
VALUES (4474, 4210902, 'Modelo', 'SC', 421090);
INSERT INTO public.municipio
VALUES (4475, 4211009, 'Mondaí', 'SC', 421100);
INSERT INTO public.municipio
VALUES (4476, 4211058, 'Monte Carlo', 'SC', 421105);
INSERT INTO public.municipio
VALUES (4477, 4211108, 'Monte Castelo', 'SC', 421110);
INSERT INTO public.municipio
VALUES (4478, 4211207, 'Morro da Fumaça', 'SC', 421120);
INSERT INTO public.municipio
VALUES (4479, 4211256, 'Morro Grande', 'SC', 421125);
INSERT INTO public.municipio
VALUES (4480, 4211306, 'Navegantes', 'SC', 421130);
INSERT INTO public.municipio
VALUES (4481, 4211405, 'Nova Erechim', 'SC', 421140);
INSERT INTO public.municipio
VALUES (4482, 4211454, 'Nova Itaberaba', 'SC', 421145);
INSERT INTO public.municipio
VALUES (4483, 4211504, 'Nova Trento', 'SC', 421150);
INSERT INTO public.municipio
VALUES (4484, 4211603, 'Nova Veneza', 'SC', 421160);
INSERT INTO public.municipio
VALUES (4485, 4211652, 'Novo Horizonte', 'SC', 421165);
INSERT INTO public.municipio
VALUES (4486, 4211702, 'Orleans', 'SC', 421170);
INSERT INTO public.municipio
VALUES (4487, 4211751, 'Otacílio Costa', 'SC', 421175);
INSERT INTO public.municipio
VALUES (4488, 4211801, 'Ouro', 'SC', 421180);
INSERT INTO public.municipio
VALUES (4489, 4211850, 'Ouro Verde', 'SC', 421185);
INSERT INTO public.municipio
VALUES (4490, 4211876, 'Paial', 'SC', 421187);
INSERT INTO public.municipio
VALUES (4491, 4211892, 'Painel', 'SC', 421189);
INSERT INTO public.municipio
VALUES (4492, 4211900, 'Palhoça', 'SC', 421190);
INSERT INTO public.municipio
VALUES (4493, 4212007, 'Palma Sola', 'SC', 421200);
INSERT INTO public.municipio
VALUES (4494, 4212056, 'Palmeira', 'SC', 421205);
INSERT INTO public.municipio
VALUES (4495, 4212106, 'Palmitos', 'SC', 421210);
INSERT INTO public.municipio
VALUES (4496, 4212205, 'Papanduva', 'SC', 421220);
INSERT INTO public.municipio
VALUES (4497, 4212239, 'Paraíso', 'SC', 421223);
INSERT INTO public.municipio
VALUES (4498, 4212254, 'Passo de Torres', 'SC', 421225);
INSERT INTO public.municipio
VALUES (4499, 4212270, 'Passos Maia', 'SC', 421227);
INSERT INTO public.municipio
VALUES (4500, 4212304, 'Paulo Lopes', 'SC', 421230);
INSERT INTO public.municipio
VALUES (4501, 4212403, 'Pedras Grandes', 'SC', 421240);
INSERT INTO public.municipio
VALUES (4502, 4212502, 'Penha', 'SC', 421250);
INSERT INTO public.municipio
VALUES (4503, 4212601, 'Peritiba', 'SC', 421260);
INSERT INTO public.municipio
VALUES (4504, 4212650, 'Pescaria Brava', 'SC', 421265);
INSERT INTO public.municipio
VALUES (4505, 4212700, 'Petrolândia', 'SC', 421270);
INSERT INTO public.municipio
VALUES (4506, 4212809, 'Balneário Piçarras', 'SC', 421280);
INSERT INTO public.municipio
VALUES (4507, 4212908, 'Pinhalzinho', 'SC', 421290);
INSERT INTO public.municipio
VALUES (4508, 4213005, 'Pinheiro Preto', 'SC', 421300);
INSERT INTO public.municipio
VALUES (4509, 4213104, 'Piratuba', 'SC', 421310);
INSERT INTO public.municipio
VALUES (4510, 4213153, 'Planalto Alegre', 'SC', 421315);
INSERT INTO public.municipio
VALUES (4511, 4213203, 'Pomerode', 'SC', 421320);
INSERT INTO public.municipio
VALUES (4512, 4213302, 'Ponte Alta', 'SC', 421330);
INSERT INTO public.municipio
VALUES (4513, 4213351, 'Ponte Alta do Norte', 'SC', 421335);
INSERT INTO public.municipio
VALUES (4514, 4213401, 'Ponte Serrada', 'SC', 421340);
INSERT INTO public.municipio
VALUES (4515, 4213500, 'Porto Belo', 'SC', 421350);
INSERT INTO public.municipio
VALUES (4516, 4213609, 'Porto União', 'SC', 421360);
INSERT INTO public.municipio
VALUES (4517, 4213708, 'Pouso Redondo', 'SC', 421370);
INSERT INTO public.municipio
VALUES (4518, 4213807, 'Praia Grande', 'SC', 421380);
INSERT INTO public.municipio
VALUES (4519, 4213906, 'Presidente Castello Branco', 'SC', 421390);
INSERT INTO public.municipio
VALUES (4520, 4214003, 'Presidente Getúlio', 'SC', 421400);
INSERT INTO public.municipio
VALUES (4521, 4214102, 'Presidente Nereu', 'SC', 421410);
INSERT INTO public.municipio
VALUES (4522, 4214151, 'Princesa', 'SC', 421415);
INSERT INTO public.municipio
VALUES (4523, 4214201, 'Quilombo', 'SC', 421420);
INSERT INTO public.municipio
VALUES (4524, 4214300, 'Rancho Queimado', 'SC', 421430);
INSERT INTO public.municipio
VALUES (4525, 4214409, 'Rio das Antas', 'SC', 421440);
INSERT INTO public.municipio
VALUES (4526, 4214508, 'Rio do Campo', 'SC', 421450);
INSERT INTO public.municipio
VALUES (4527, 4214607, 'Rio do Oeste', 'SC', 421460);
INSERT INTO public.municipio
VALUES (4528, 4214706, 'Rio dos Cedros', 'SC', 421470);
INSERT INTO public.municipio
VALUES (4529, 4214805, 'Rio do Sul', 'SC', 421480);
INSERT INTO public.municipio
VALUES (4530, 4214904, 'Rio Fortuna', 'SC', 421490);
INSERT INTO public.municipio
VALUES (4531, 4215000, 'Rio Negrinho', 'SC', 421500);
INSERT INTO public.municipio
VALUES (4532, 4215059, 'Rio Rufino', 'SC', 421505);
INSERT INTO public.municipio
VALUES (4533, 4215075, 'Riqueza', 'SC', 421507);
INSERT INTO public.municipio
VALUES (4534, 4215109, 'Rodeio', 'SC', 421510);
INSERT INTO public.municipio
VALUES (4535, 4215208, 'Romelândia', 'SC', 421520);
INSERT INTO public.municipio
VALUES (4536, 4215307, 'Salete', 'SC', 421530);
INSERT INTO public.municipio
VALUES (4537, 4215356, 'Saltinho', 'SC', 421535);
INSERT INTO public.municipio
VALUES (4538, 4215406, 'Salto Veloso', 'SC', 421540);
INSERT INTO public.municipio
VALUES (4540, 4215505, 'Santa Cecília', 'SC', 421550);
INSERT INTO public.municipio
VALUES (4541, 4215554, 'Santa Helena', 'SC', 421555);
INSERT INTO public.municipio
VALUES (4542, 4215604, 'Santa Rosa de Lima', 'SC', 421560);
INSERT INTO public.municipio
VALUES (4543, 4215653, 'Santa Rosa do Sul', 'SC', 421565);
INSERT INTO public.municipio
VALUES (4544, 4215679, 'Santa Terezinha', 'SC', 421567);
INSERT INTO public.municipio
VALUES (4545, 4215687, 'Santa Terezinha do Progresso', 'SC', 421568);
INSERT INTO public.municipio
VALUES (4546, 4215695, 'Santiago do Sul', 'SC', 421569);
INSERT INTO public.municipio
VALUES (4547, 4215703, 'Santo Amaro da Imperatriz', 'SC', 421570);
INSERT INTO public.municipio
VALUES (4548, 4215752, 'São Bernardino', 'SC', 421575);
INSERT INTO public.municipio
VALUES (4549, 4215802, 'São Bento do Sul', 'SC', 421580);
INSERT INTO public.municipio
VALUES (4550, 4215901, 'São Bonifácio', 'SC', 421590);
INSERT INTO public.municipio
VALUES (4551, 4216008, 'São Carlos', 'SC', 421600);
INSERT INTO public.municipio
VALUES (4552, 4216057, 'São Cristovão do Sul', 'SC', 421605);
INSERT INTO public.municipio
VALUES (4553, 4216107, 'São Domingos', 'SC', 421610);
INSERT INTO public.municipio
VALUES (4554, 4216206, 'São Francisco do Sul', 'SC', 421620);
INSERT INTO public.municipio
VALUES (4555, 4216255, 'São João do Oeste', 'SC', 421625);
INSERT INTO public.municipio
VALUES (4556, 4216305, 'São João Batista', 'SC', 421630);
INSERT INTO public.municipio
VALUES (4557, 4216354, 'São João do Itaperiú', 'SC', 421635);
INSERT INTO public.municipio
VALUES (4558, 4216404, 'São João do Sul', 'SC', 421640);
INSERT INTO public.municipio
VALUES (4559, 4216503, 'São Joaquim', 'SC', 421650);
INSERT INTO public.municipio
VALUES (4560, 4216602, 'São José', 'SC', 421660);
INSERT INTO public.municipio
VALUES (4561, 4216701, 'São José do Cedro', 'SC', 421670);
INSERT INTO public.municipio
VALUES (4562, 4216800, 'São José do Cerrito', 'SC', 421680);
INSERT INTO public.municipio
VALUES (4563, 4216909, 'São Lourenço do Oeste', 'SC', 421690);
INSERT INTO public.municipio
VALUES (4564, 4217006, 'São Ludgero', 'SC', 421700);
INSERT INTO public.municipio
VALUES (4565, 4217105, 'São Martinho', 'SC', 421710);
INSERT INTO public.municipio
VALUES (4566, 4217154, 'São Miguel da Boa Vista', 'SC', 421715);
INSERT INTO public.municipio
VALUES (4567, 4217204, 'São Miguel do Oeste', 'SC', 421720);
INSERT INTO public.municipio
VALUES (4568, 4217253, 'São Pedro de Alcântara', 'SC', 421725);
INSERT INTO public.municipio
VALUES (4569, 4217303, 'Saudades', 'SC', 421730);
INSERT INTO public.municipio
VALUES (4570, 4217402, 'Schroeder', 'SC', 421740);
INSERT INTO public.municipio
VALUES (4571, 4217501, 'Seara', 'SC', 421750);
INSERT INTO public.municipio
VALUES (4572, 4217550, 'Serra Alta', 'SC', 421755);
INSERT INTO public.municipio
VALUES (4573, 4217600, 'Siderópolis', 'SC', 421760);
INSERT INTO public.municipio
VALUES (4574, 4217709, 'Sombrio', 'SC', 421770);
INSERT INTO public.municipio
VALUES (4575, 4217758, 'Sul Brasil', 'SC', 421775);
INSERT INTO public.municipio
VALUES (4576, 4217808, 'Taió', 'SC', 421780);
INSERT INTO public.municipio
VALUES (4577, 4217907, 'Tangará', 'SC', 421790);
INSERT INTO public.municipio
VALUES (4578, 4217956, 'Tigrinhos', 'SC', 421795);
INSERT INTO public.municipio
VALUES (4579, 4218004, 'Tijucas', 'SC', 421800);
INSERT INTO public.municipio
VALUES (4580, 4218103, 'Timbé do Sul', 'SC', 421810);
INSERT INTO public.municipio
VALUES (4581, 4218202, 'Timbó', 'SC', 421820);
INSERT INTO public.municipio
VALUES (4582, 4218251, 'Timbó Grande', 'SC', 421825);
INSERT INTO public.municipio
VALUES (4583, 4218301, 'Três Barras', 'SC', 421830);
INSERT INTO public.municipio
VALUES (4584, 4218350, 'Treviso', 'SC', 421835);
INSERT INTO public.municipio
VALUES (4585, 4218400, 'Treze de Maio', 'SC', 421840);
INSERT INTO public.municipio
VALUES (4586, 4218509, 'Treze Tílias', 'SC', 421850);
INSERT INTO public.municipio
VALUES (4587, 4218608, 'Trombudo Central', 'SC', 421860);
INSERT INTO public.municipio
VALUES (4588, 4218707, 'Tubarão', 'SC', 421870);
INSERT INTO public.municipio
VALUES (4589, 4218756, 'Tunápolis', 'SC', 421875);
INSERT INTO public.municipio
VALUES (4590, 4218806, 'Turvo', 'SC', 421880);
INSERT INTO public.municipio
VALUES (4591, 4218855, 'União do Oeste', 'SC', 421885);
INSERT INTO public.municipio
VALUES (4592, 4218905, 'Urubici', 'SC', 421890);
INSERT INTO public.municipio
VALUES (4593, 4218954, 'Urupema', 'SC', 421895);
INSERT INTO public.municipio
VALUES (4594, 4219002, 'Urussanga', 'SC', 421900);
INSERT INTO public.municipio
VALUES (4595, 4219101, 'Vargeão', 'SC', 421910);
INSERT INTO public.municipio
VALUES (4596, 4219150, 'Vargem', 'SC', 421915);
INSERT INTO public.municipio
VALUES (4597, 4219176, 'Vargem Bonita', 'SC', 421917);
INSERT INTO public.municipio
VALUES (4598, 4219200, 'Vidal Ramos', 'SC', 421920);
INSERT INTO public.municipio
VALUES (4599, 4219309, 'Videira', 'SC', 421930);
INSERT INTO public.municipio
VALUES (4600, 4219358, 'Vitor Meireles', 'SC', 421935);
INSERT INTO public.municipio
VALUES (4601, 4219408, 'Witmarsum', 'SC', 421940);
INSERT INTO public.municipio
VALUES (4602, 4219507, 'Xanxerê', 'SC', 421950);
INSERT INTO public.municipio
VALUES (4603, 4219606, 'Xavantina', 'SC', 421960);
INSERT INTO public.municipio
VALUES (4604, 4219705, 'Xaxim', 'SC', 421970);
INSERT INTO public.municipio
VALUES (4605, 4219853, 'Zortéa', 'SC', 421985);
INSERT INTO public.municipio
VALUES (4606, 4220000, 'Balneário Rincão', 'SC', 422000);
INSERT INTO public.municipio
VALUES (4607, 4300034, 'Aceguá', 'RS', 430003);
INSERT INTO public.municipio
VALUES (4608, 4300059, 'Água Santa', 'RS', 430005);
INSERT INTO public.municipio
VALUES (4609, 4300109, 'Agudo', 'RS', 430010);
INSERT INTO public.municipio
VALUES (4610, 4300208, 'Ajuricaba', 'RS', 430020);
INSERT INTO public.municipio
VALUES (4611, 4300307, 'Alecrim', 'RS', 430030);
INSERT INTO public.municipio
VALUES (4612, 4300406, 'Alegrete', 'RS', 430040);
INSERT INTO public.municipio
VALUES (4613, 4300455, 'Alegria', 'RS', 430045);
INSERT INTO public.municipio
VALUES (4614, 4300471, 'Almirante Tamandaré do Sul', 'RS', 430047);
INSERT INTO public.municipio
VALUES (4615, 4300505, 'Alpestre', 'RS', 430050);
INSERT INTO public.municipio
VALUES (4616, 4300554, 'Alto Alegre', 'RS', 430055);
INSERT INTO public.municipio
VALUES (4617, 4300570, 'Alto Feliz', 'RS', 430057);
INSERT INTO public.municipio
VALUES (4618, 4300604, 'Alvorada', 'RS', 430060);
INSERT INTO public.municipio
VALUES (4619, 4300638, 'Amaral Ferrador', 'RS', 430063);
INSERT INTO public.municipio
VALUES (4620, 4300646, 'Ametista do Sul', 'RS', 430064);
INSERT INTO public.municipio
VALUES (4621, 4300661, 'André da Rocha', 'RS', 430066);
INSERT INTO public.municipio
VALUES (4622, 4300703, 'Anta Gorda', 'RS', 430070);
INSERT INTO public.municipio
VALUES (4623, 4300802, 'Antônio Prado', 'RS', 430080);
INSERT INTO public.municipio
VALUES (4624, 4300851, 'Arambaré', 'RS', 430085);
INSERT INTO public.municipio
VALUES (4625, 4300877, 'Araricá', 'RS', 430087);
INSERT INTO public.municipio
VALUES (4626, 4300901, 'Aratiba', 'RS', 430090);
INSERT INTO public.municipio
VALUES (4627, 4301008, 'Arroio do Meio', 'RS', 430100);
INSERT INTO public.municipio
VALUES (4628, 4301057, 'Arroio do Sal', 'RS', 430105);
INSERT INTO public.municipio
VALUES (4629, 4301073, 'Arroio do Padre', 'RS', 430107);
INSERT INTO public.municipio
VALUES (4630, 4301107, 'Arroio dos Ratos', 'RS', 430110);
INSERT INTO public.municipio
VALUES (4631, 4301206, 'Arroio do Tigre', 'RS', 430120);
INSERT INTO public.municipio
VALUES (4632, 4301305, 'Arroio Grande', 'RS', 430130);
INSERT INTO public.municipio
VALUES (4633, 4301404, 'Arvorezinha', 'RS', 430140);
INSERT INTO public.municipio
VALUES (4634, 4301503, 'Augusto Pestana', 'RS', 430150);
INSERT INTO public.municipio
VALUES (4635, 4301552, 'Áurea', 'RS', 430155);
INSERT INTO public.municipio
VALUES (4636, 4301602, 'Bagé', 'RS', 430160);
INSERT INTO public.municipio
VALUES (4637, 4301636, 'Balneário Pinhal', 'RS', 430163);
INSERT INTO public.municipio
VALUES (4638, 4301651, 'Barão', 'RS', 430165);
INSERT INTO public.municipio
VALUES (4639, 4301701, 'Barão de Cotegipe', 'RS', 430170);
INSERT INTO public.municipio
VALUES (4640, 4301750, 'Barão do Triunfo', 'RS', 430175);
INSERT INTO public.municipio
VALUES (4641, 4301800, 'Barracão', 'RS', 430180);
INSERT INTO public.municipio
VALUES (4642, 4301859, 'Barra do Guarita', 'RS', 430185);
INSERT INTO public.municipio
VALUES (4643, 4301875, 'Barra do Quaraí', 'RS', 430187);
INSERT INTO public.municipio
VALUES (4644, 4301909, 'Barra do Ribeiro', 'RS', 430190);
INSERT INTO public.municipio
VALUES (4645, 4301925, 'Barra do Rio Azul', 'RS', 430192);
INSERT INTO public.municipio
VALUES (4646, 4301958, 'Barra Funda', 'RS', 430195);
INSERT INTO public.municipio
VALUES (4647, 4302006, 'Barros Cassal', 'RS', 430200);
INSERT INTO public.municipio
VALUES (4648, 4302055, 'Benjamin Constant do Sul', 'RS', 430205);
INSERT INTO public.municipio
VALUES (4649, 4302105, 'Bento Gonçalves', 'RS', 430210);
INSERT INTO public.municipio
VALUES (4650, 4302154, 'Boa Vista das Missões', 'RS', 430215);
INSERT INTO public.municipio
VALUES (4651, 4302204, 'Boa Vista do Buricá', 'RS', 430220);
INSERT INTO public.municipio
VALUES (4652, 4302220, 'Boa Vista do Cadeado', 'RS', 430222);
INSERT INTO public.municipio
VALUES (4653, 4302238, 'Boa Vista do Incra', 'RS', 430223);
INSERT INTO public.municipio
VALUES (4654, 4302253, 'Boa Vista do Sul', 'RS', 430225);
INSERT INTO public.municipio
VALUES (4655, 4302303, 'Bom Jesus', 'RS', 430230);
INSERT INTO public.municipio
VALUES (4656, 4302352, 'Bom Princípio', 'RS', 430235);
INSERT INTO public.municipio
VALUES (4657, 4302378, 'Bom Progresso', 'RS', 430237);
INSERT INTO public.municipio
VALUES (4658, 4302402, 'Bom Retiro do Sul', 'RS', 430240);
INSERT INTO public.municipio
VALUES (4659, 4302451, 'Boqueirão do Leão', 'RS', 430245);
INSERT INTO public.municipio
VALUES (4660, 4302501, 'Bossoroca', 'RS', 430250);
INSERT INTO public.municipio
VALUES (4661, 4302584, 'Bozano', 'RS', 430258);
INSERT INTO public.municipio
VALUES (4662, 4302600, 'Braga', 'RS', 430260);
INSERT INTO public.municipio
VALUES (4663, 4302659, 'Brochier', 'RS', 430265);
INSERT INTO public.municipio
VALUES (4664, 4302709, 'Butiá', 'RS', 430270);
INSERT INTO public.municipio
VALUES (4665, 4302808, 'Caçapava do Sul', 'RS', 430280);
INSERT INTO public.municipio
VALUES (4666, 4302907, 'Cacequi', 'RS', 430290);
INSERT INTO public.municipio
VALUES (4667, 4303004, 'Cachoeira do Sul', 'RS', 430300);
INSERT INTO public.municipio
VALUES (4668, 4303103, 'Cachoeirinha', 'RS', 430310);
INSERT INTO public.municipio
VALUES (4669, 4303202, 'Cacique Doble', 'RS', 430320);
INSERT INTO public.municipio
VALUES (4670, 4303301, 'Caibaté', 'RS', 430330);
INSERT INTO public.municipio
VALUES (4671, 4303400, 'Caiçara', 'RS', 430340);
INSERT INTO public.municipio
VALUES (4672, 4303509, 'Camaquã', 'RS', 430350);
INSERT INTO public.municipio
VALUES (4673, 4303558, 'Camargo', 'RS', 430355);
INSERT INTO public.municipio
VALUES (4674, 4303608, 'Cambará do Sul', 'RS', 430360);
INSERT INTO public.municipio
VALUES (4675, 4303673, 'Campestre da Serra', 'RS', 430367);
INSERT INTO public.municipio
VALUES (4676, 4303707, 'Campina das Missões', 'RS', 430370);
INSERT INTO public.municipio
VALUES (4677, 4303806, 'Campinas do Sul', 'RS', 430380);
INSERT INTO public.municipio
VALUES (4678, 4303905, 'Campo Bom', 'RS', 430390);
INSERT INTO public.municipio
VALUES (4679, 4304002, 'Campo Novo', 'RS', 430400);
INSERT INTO public.municipio
VALUES (4680, 4304101, 'Campos Borges', 'RS', 430410);
INSERT INTO public.municipio
VALUES (4681, 4304200, 'Candelária', 'RS', 430420);
INSERT INTO public.municipio
VALUES (4682, 4304309, 'Cândido Godói', 'RS', 430430);
INSERT INTO public.municipio
VALUES (4683, 4304358, 'Candiota', 'RS', 430435);
INSERT INTO public.municipio
VALUES (4684, 4304408, 'Canela', 'RS', 430440);
INSERT INTO public.municipio
VALUES (4685, 4304507, 'Canguçu', 'RS', 430450);
INSERT INTO public.municipio
VALUES (4686, 4304606, 'Canoas', 'RS', 430460);
INSERT INTO public.municipio
VALUES (4687, 4304614, 'Canudos do Vale', 'RS', 430461);
INSERT INTO public.municipio
VALUES (4688, 4304622, 'Capão Bonito do Sul', 'RS', 430462);
INSERT INTO public.municipio
VALUES (4689, 4304630, 'Capão da Canoa', 'RS', 430463);
INSERT INTO public.municipio
VALUES (4690, 4304655, 'Capão do Cipó', 'RS', 430465);
INSERT INTO public.municipio
VALUES (4691, 4304663, 'Capão do Leão', 'RS', 430466);
INSERT INTO public.municipio
VALUES (4692, 4304671, 'Capivari do Sul', 'RS', 430467);
INSERT INTO public.municipio
VALUES (4693, 4304689, 'Capela de Santana', 'RS', 430468);
INSERT INTO public.municipio
VALUES (4694, 4304697, 'Capitão', 'RS', 430469);
INSERT INTO public.municipio
VALUES (4695, 4304705, 'Carazinho', 'RS', 430470);
INSERT INTO public.municipio
VALUES (4696, 4304713, 'Caraá', 'RS', 430471);
INSERT INTO public.municipio
VALUES (4697, 4304804, 'Carlos Barbosa', 'RS', 430480);
INSERT INTO public.municipio
VALUES (4698, 4304853, 'Carlos Gomes', 'RS', 430485);
INSERT INTO public.municipio
VALUES (4699, 4304903, 'Casca', 'RS', 430490);
INSERT INTO public.municipio
VALUES (4700, 4304952, 'Caseiros', 'RS', 430495);
INSERT INTO public.municipio
VALUES (4701, 4305009, 'Catuípe', 'RS', 430500);
INSERT INTO public.municipio
VALUES (4702, 4305108, 'Caxias do Sul', 'RS', 430510);
INSERT INTO public.municipio
VALUES (4703, 4305116, 'Centenário', 'RS', 430511);
INSERT INTO public.municipio
VALUES (4704, 4305124, 'Cerrito', 'RS', 430512);
INSERT INTO public.municipio
VALUES (4705, 4305132, 'Cerro Branco', 'RS', 430513);
INSERT INTO public.municipio
VALUES (4706, 4305157, 'Cerro Grande', 'RS', 430515);
INSERT INTO public.municipio
VALUES (4707, 4305173, 'Cerro Grande do Sul', 'RS', 430517);
INSERT INTO public.municipio
VALUES (4708, 4305207, 'Cerro Largo', 'RS', 430520);
INSERT INTO public.municipio
VALUES (4709, 4305306, 'Chapada', 'RS', 430530);
INSERT INTO public.municipio
VALUES (4710, 4305355, 'Charqueadas', 'RS', 430535);
INSERT INTO public.municipio
VALUES (4711, 4305371, 'Charrua', 'RS', 430537);
INSERT INTO public.municipio
VALUES (4712, 4305405, 'Chiapetta', 'RS', 430540);
INSERT INTO public.municipio
VALUES (4713, 4305439, 'Chuí', 'RS', 430543);
INSERT INTO public.municipio
VALUES (4714, 4305447, 'Chuvisca', 'RS', 430544);
INSERT INTO public.municipio
VALUES (4715, 4305454, 'Cidreira', 'RS', 430545);
INSERT INTO public.municipio
VALUES (4716, 4305504, 'Ciríaco', 'RS', 430550);
INSERT INTO public.municipio
VALUES (4717, 4305587, 'Colinas', 'RS', 430558);
INSERT INTO public.municipio
VALUES (4718, 4305603, 'Colorado', 'RS', 430560);
INSERT INTO public.municipio
VALUES (4719, 4305702, 'Condor', 'RS', 430570);
INSERT INTO public.municipio
VALUES (4720, 4305801, 'Constantina', 'RS', 430580);
INSERT INTO public.municipio
VALUES (4721, 4305835, 'Coqueiro Baixo', 'RS', 430583);
INSERT INTO public.municipio
VALUES (4722, 4305850, 'Coqueiros do Sul', 'RS', 430585);
INSERT INTO public.municipio
VALUES (4723, 4305871, 'Coronel Barros', 'RS', 430587);
INSERT INTO public.municipio
VALUES (4724, 4305900, 'Coronel Bicaco', 'RS', 430590);
INSERT INTO public.municipio
VALUES (4725, 4305934, 'Coronel Pilar', 'RS', 430593);
INSERT INTO public.municipio
VALUES (4726, 4305959, 'Cotiporã', 'RS', 430595);
INSERT INTO public.municipio
VALUES (4727, 4305975, 'Coxilha', 'RS', 430597);
INSERT INTO public.municipio
VALUES (4728, 4306007, 'Crissiumal', 'RS', 430600);
INSERT INTO public.municipio
VALUES (4729, 4306056, 'Cristal', 'RS', 430605);
INSERT INTO public.municipio
VALUES (4730, 4306072, 'Cristal do Sul', 'RS', 430607);
INSERT INTO public.municipio
VALUES (4731, 4306106, 'Cruz Alta', 'RS', 430610);
INSERT INTO public.municipio
VALUES (4732, 4306130, 'Cruzaltense', 'RS', 430613);
INSERT INTO public.municipio
VALUES (4733, 4306205, 'Cruzeiro do Sul', 'RS', 430620);
INSERT INTO public.municipio
VALUES (4734, 4306304, 'David Canabarro', 'RS', 430630);
INSERT INTO public.municipio
VALUES (4735, 4306320, 'Derrubadas', 'RS', 430632);
INSERT INTO public.municipio
VALUES (4736, 4306353, 'Dezesseis de Novembro', 'RS', 430635);
INSERT INTO public.municipio
VALUES (4737, 4306379, 'Dilermando de Aguiar', 'RS', 430637);
INSERT INTO public.municipio
VALUES (4738, 4306403, 'Dois Irmãos', 'RS', 430640);
INSERT INTO public.municipio
VALUES (4739, 4306429, 'Dois Irmãos das Missões', 'RS', 430642);
INSERT INTO public.municipio
VALUES (4740, 4306452, 'Dois Lajeados', 'RS', 430645);
INSERT INTO public.municipio
VALUES (4741, 4306502, 'Dom Feliciano', 'RS', 430650);
INSERT INTO public.municipio
VALUES (4742, 4306551, 'Dom Pedro de Alcântara', 'RS', 430655);
INSERT INTO public.municipio
VALUES (4743, 4306601, 'Dom Pedrito', 'RS', 430660);
INSERT INTO public.municipio
VALUES (4744, 4306700, 'Dona Francisca', 'RS', 430670);
INSERT INTO public.municipio
VALUES (4745, 4306734, 'Doutor Maurício Cardoso', 'RS', 430673);
INSERT INTO public.municipio
VALUES (4746, 4306759, 'Doutor Ricardo', 'RS', 430675);
INSERT INTO public.municipio
VALUES (4747, 4306767, 'Eldorado do Sul', 'RS', 430676);
INSERT INTO public.municipio
VALUES (4748, 4306809, 'Encantado', 'RS', 430680);
INSERT INTO public.municipio
VALUES (4749, 4306908, 'Encruzilhada do Sul', 'RS', 430690);
INSERT INTO public.municipio
VALUES (4750, 4306924, 'Engenho Velho', 'RS', 430692);
INSERT INTO public.municipio
VALUES (4751, 4306932, 'Entre-Ijuís', 'RS', 430693);
INSERT INTO public.municipio
VALUES (4752, 4306957, 'Entre Rios do Sul', 'RS', 430695);
INSERT INTO public.municipio
VALUES (4753, 4306973, 'Erebango', 'RS', 430697);
INSERT INTO public.municipio
VALUES (4754, 4307005, 'Erechim', 'RS', 430700);
INSERT INTO public.municipio
VALUES (4755, 4307054, 'Ernestina', 'RS', 430705);
INSERT INTO public.municipio
VALUES (4756, 4307104, 'Herval', 'RS', 430710);
INSERT INTO public.municipio
VALUES (4757, 4307203, 'Erval Grande', 'RS', 430720);
INSERT INTO public.municipio
VALUES (4758, 4307302, 'Erval Seco', 'RS', 430730);
INSERT INTO public.municipio
VALUES (4759, 4307401, 'Esmeralda', 'RS', 430740);
INSERT INTO public.municipio
VALUES (4760, 4307450, 'Esperança do Sul', 'RS', 430745);
INSERT INTO public.municipio
VALUES (4761, 4307500, 'Espumoso', 'RS', 430750);
INSERT INTO public.municipio
VALUES (4762, 4307559, 'Estação', 'RS', 430755);
INSERT INTO public.municipio
VALUES (4763, 4307609, 'Estância Velha', 'RS', 430760);
INSERT INTO public.municipio
VALUES (4764, 4307708, 'Esteio', 'RS', 430770);
INSERT INTO public.municipio
VALUES (4765, 4307807, 'Estrela', 'RS', 430780);
INSERT INTO public.municipio
VALUES (4766, 4307815, 'Estrela Velha', 'RS', 430781);
INSERT INTO public.municipio
VALUES (4767, 4307831, 'Eugênio de Castro', 'RS', 430783);
INSERT INTO public.municipio
VALUES (4768, 4307864, 'Fagundes Varela', 'RS', 430786);
INSERT INTO public.municipio
VALUES (4769, 4307906, 'Farroupilha', 'RS', 430790);
INSERT INTO public.municipio
VALUES (4770, 4308003, 'Faxinal do Soturno', 'RS', 430800);
INSERT INTO public.municipio
VALUES (4771, 4308052, 'Faxinalzinho', 'RS', 430805);
INSERT INTO public.municipio
VALUES (4772, 4308078, 'Fazenda Vilanova', 'RS', 430807);
INSERT INTO public.municipio
VALUES (4773, 4308102, 'Feliz', 'RS', 430810);
INSERT INTO public.municipio
VALUES (4774, 4308201, 'Flores da Cunha', 'RS', 430820);
INSERT INTO public.municipio
VALUES (4775, 4308250, 'Floriano Peixoto', 'RS', 430825);
INSERT INTO public.municipio
VALUES (4776, 4308300, 'Fontoura Xavier', 'RS', 430830);
INSERT INTO public.municipio
VALUES (4777, 4308409, 'Formigueiro', 'RS', 430840);
INSERT INTO public.municipio
VALUES (4778, 4308433, 'Forquetinha', 'RS', 430843);
INSERT INTO public.municipio
VALUES (4779, 4308458, 'Fortaleza dos Valos', 'RS', 430845);
INSERT INTO public.municipio
VALUES (4780, 4308508, 'Frederico Westphalen', 'RS', 430850);
INSERT INTO public.municipio
VALUES (4781, 4308607, 'Garibaldi', 'RS', 430860);
INSERT INTO public.municipio
VALUES (4782, 4308656, 'Garruchos', 'RS', 430865);
INSERT INTO public.municipio
VALUES (4783, 4308706, 'Gaurama', 'RS', 430870);
INSERT INTO public.municipio
VALUES (4784, 4308805, 'General Câmara', 'RS', 430880);
INSERT INTO public.municipio
VALUES (4785, 4308854, 'Gentil', 'RS', 430885);
INSERT INTO public.municipio
VALUES (4786, 4308904, 'Getúlio Vargas', 'RS', 430890);
INSERT INTO public.municipio
VALUES (4787, 4309001, 'Giruá', 'RS', 430900);
INSERT INTO public.municipio
VALUES (4788, 4309050, 'Glorinha', 'RS', 430905);
INSERT INTO public.municipio
VALUES (4789, 4309100, 'Gramado', 'RS', 430910);
INSERT INTO public.municipio
VALUES (4790, 4309126, 'Gramado dos Loureiros', 'RS', 430912);
INSERT INTO public.municipio
VALUES (4791, 4309159, 'Gramado Xavier', 'RS', 430915);
INSERT INTO public.municipio
VALUES (4792, 4309209, 'Gravataí', 'RS', 430920);
INSERT INTO public.municipio
VALUES (4793, 4309258, 'Guabiju', 'RS', 430925);
INSERT INTO public.municipio
VALUES (4794, 4309308, 'Guaíba', 'RS', 430930);
INSERT INTO public.municipio
VALUES (4795, 4309407, 'Guaporé', 'RS', 430940);
INSERT INTO public.municipio
VALUES (4796, 4309506, 'Guarani das Missões', 'RS', 430950);
INSERT INTO public.municipio
VALUES (4797, 4309555, 'Harmonia', 'RS', 430955);
INSERT INTO public.municipio
VALUES (4798, 4309571, 'Herveiras', 'RS', 430957);
INSERT INTO public.municipio
VALUES (4799, 4309605, 'Horizontina', 'RS', 430960);
INSERT INTO public.municipio
VALUES (4800, 4309654, 'Hulha Negra', 'RS', 430965);
INSERT INTO public.municipio
VALUES (4801, 4309704, 'Humaitá', 'RS', 430970);
INSERT INTO public.municipio
VALUES (4802, 4309753, 'Ibarama', 'RS', 430975);
INSERT INTO public.municipio
VALUES (4803, 4309803, 'Ibiaçá', 'RS', 430980);
INSERT INTO public.municipio
VALUES (4804, 4309902, 'Ibiraiaras', 'RS', 430990);
INSERT INTO public.municipio
VALUES (4805, 4309951, 'Ibirapuitã', 'RS', 430995);
INSERT INTO public.municipio
VALUES (4806, 4310009, 'Ibirubá', 'RS', 431000);
INSERT INTO public.municipio
VALUES (4807, 4310108, 'Igrejinha', 'RS', 431010);
INSERT INTO public.municipio
VALUES (4808, 4310207, 'Ijuí', 'RS', 431020);
INSERT INTO public.municipio
VALUES (4809, 4310306, 'Ilópolis', 'RS', 431030);
INSERT INTO public.municipio
VALUES (4810, 4310330, 'Imbé', 'RS', 431033);
INSERT INTO public.municipio
VALUES (4811, 4310363, 'Imigrante', 'RS', 431036);
INSERT INTO public.municipio
VALUES (4812, 4310405, 'Independência', 'RS', 431040);
INSERT INTO public.municipio
VALUES (4813, 4310413, 'Inhacorá', 'RS', 431041);
INSERT INTO public.municipio
VALUES (4814, 4310439, 'Ipê', 'RS', 431043);
INSERT INTO public.municipio
VALUES (4815, 4310462, 'Ipiranga do Sul', 'RS', 431046);
INSERT INTO public.municipio
VALUES (4816, 4310504, 'Iraí', 'RS', 431050);
INSERT INTO public.municipio
VALUES (4817, 4310538, 'Itaara', 'RS', 431053);
INSERT INTO public.municipio
VALUES (4818, 4310553, 'Itacurubi', 'RS', 431055);
INSERT INTO public.municipio
VALUES (4819, 4310579, 'Itapuca', 'RS', 431057);
INSERT INTO public.municipio
VALUES (4820, 4310603, 'Itaqui', 'RS', 431060);
INSERT INTO public.municipio
VALUES (4821, 4310652, 'Itati', 'RS', 431065);
INSERT INTO public.municipio
VALUES (4822, 4310702, 'Itatiba do Sul', 'RS', 431070);
INSERT INTO public.municipio
VALUES (4823, 4310751, 'Ivorá', 'RS', 431075);
INSERT INTO public.municipio
VALUES (4824, 4310801, 'Ivoti', 'RS', 431080);
INSERT INTO public.municipio
VALUES (4825, 4310850, 'Jaboticaba', 'RS', 431085);
INSERT INTO public.municipio
VALUES (4826, 4310876, 'Jacuizinho', 'RS', 431087);
INSERT INTO public.municipio
VALUES (4827, 4310900, 'Jacutinga', 'RS', 431090);
INSERT INTO public.municipio
VALUES (4828, 4311007, 'Jaguarão', 'RS', 431100);
INSERT INTO public.municipio
VALUES (4829, 4311106, 'Jaguari', 'RS', 431110);
INSERT INTO public.municipio
VALUES (4830, 4311122, 'Jaquirana', 'RS', 431112);
INSERT INTO public.municipio
VALUES (4831, 4311130, 'Jari', 'RS', 431113);
INSERT INTO public.municipio
VALUES (4832, 4311155, 'Jóia', 'RS', 431115);
INSERT INTO public.municipio
VALUES (4833, 4311205, 'Júlio de Castilhos', 'RS', 431120);
INSERT INTO public.municipio
VALUES (4834, 4311239, 'Lagoa Bonita do Sul', 'RS', 431123);
INSERT INTO public.municipio
VALUES (4835, 4311254, 'Lagoão', 'RS', 431125);
INSERT INTO public.municipio
VALUES (4836, 4311270, 'Lagoa dos Três Cantos', 'RS', 431127);
INSERT INTO public.municipio
VALUES (4837, 4311304, 'Lagoa Vermelha', 'RS', 431130);
INSERT INTO public.municipio
VALUES (4838, 4311403, 'Lajeado', 'RS', 431140);
INSERT INTO public.municipio
VALUES (4839, 4311429, 'Lajeado do Bugre', 'RS', 431142);
INSERT INTO public.municipio
VALUES (4840, 4311502, 'Lavras do Sul', 'RS', 431150);
INSERT INTO public.municipio
VALUES (4841, 4311601, 'Liberato Salzano', 'RS', 431160);
INSERT INTO public.municipio
VALUES (4842, 4311627, 'Lindolfo Collor', 'RS', 431162);
INSERT INTO public.municipio
VALUES (4843, 4311643, 'Linha Nova', 'RS', 431164);
INSERT INTO public.municipio
VALUES (4844, 4311700, 'Machadinho', 'RS', 431170);
INSERT INTO public.municipio
VALUES (4845, 4311718, 'Maçambará', 'RS', 431171);
INSERT INTO public.municipio
VALUES (4846, 4311734, 'Mampituba', 'RS', 431173);
INSERT INTO public.municipio
VALUES (4847, 4311759, 'Manoel Viana', 'RS', 431175);
INSERT INTO public.municipio
VALUES (4848, 4311775, 'Maquiné', 'RS', 431177);
INSERT INTO public.municipio
VALUES (4849, 4311791, 'Maratá', 'RS', 431179);
INSERT INTO public.municipio
VALUES (4850, 4311809, 'Marau', 'RS', 431180);
INSERT INTO public.municipio
VALUES (4851, 4311908, 'Marcelino Ramos', 'RS', 431190);
INSERT INTO public.municipio
VALUES (4852, 4311981, 'Mariana Pimentel', 'RS', 431198);
INSERT INTO public.municipio
VALUES (4853, 4312005, 'Mariano Moro', 'RS', 431200);
INSERT INTO public.municipio
VALUES (4854, 4312054, 'Marques de Souza', 'RS', 431205);
INSERT INTO public.municipio
VALUES (4855, 4312104, 'Mata', 'RS', 431210);
INSERT INTO public.municipio
VALUES (4856, 4312138, 'Mato Castelhano', 'RS', 431213);
INSERT INTO public.municipio
VALUES (4857, 4312153, 'Mato Leitão', 'RS', 431215);
INSERT INTO public.municipio
VALUES (4858, 4312179, 'Mato Queimado', 'RS', 431217);
INSERT INTO public.municipio
VALUES (4859, 4312203, 'Maximiliano de Almeida', 'RS', 431220);
INSERT INTO public.municipio
VALUES (4860, 4312252, 'Minas do Leão', 'RS', 431225);
INSERT INTO public.municipio
VALUES (4861, 4312302, 'Miraguaí', 'RS', 431230);
INSERT INTO public.municipio
VALUES (4862, 4312351, 'Montauri', 'RS', 431235);
INSERT INTO public.municipio
VALUES (4863, 4312377, 'Monte Alegre dos Campos', 'RS', 431237);
INSERT INTO public.municipio
VALUES (4864, 4312385, 'Monte Belo do Sul', 'RS', 431238);
INSERT INTO public.municipio
VALUES (4865, 4312401, 'Montenegro', 'RS', 431240);
INSERT INTO public.municipio
VALUES (4866, 4312427, 'Mormaço', 'RS', 431242);
INSERT INTO public.municipio
VALUES (4867, 4312443, 'Morrinhos do Sul', 'RS', 431244);
INSERT INTO public.municipio
VALUES (4868, 4312450, 'Morro Redondo', 'RS', 431245);
INSERT INTO public.municipio
VALUES (4869, 4312476, 'Morro Reuter', 'RS', 431247);
INSERT INTO public.municipio
VALUES (4870, 4312500, 'Mostardas', 'RS', 431250);
INSERT INTO public.municipio
VALUES (4871, 4312609, 'Muçum', 'RS', 431260);
INSERT INTO public.municipio
VALUES (4872, 4312617, 'Muitos Capões', 'RS', 431261);
INSERT INTO public.municipio
VALUES (4873, 4312625, 'Muliterno', 'RS', 431262);
INSERT INTO public.municipio
VALUES (4874, 4312658, 'Não-Me-Toque', 'RS', 431265);
INSERT INTO public.municipio
VALUES (4875, 4312674, 'Nicolau Vergueiro', 'RS', 431267);
INSERT INTO public.municipio
VALUES (4876, 4312708, 'Nonoai', 'RS', 431270);
INSERT INTO public.municipio
VALUES (4877, 4312757, 'Nova Alvorada', 'RS', 431275);
INSERT INTO public.municipio
VALUES (4878, 4312807, 'Nova Araçá', 'RS', 431280);
INSERT INTO public.municipio
VALUES (4879, 4312906, 'Nova Bassano', 'RS', 431290);
INSERT INTO public.municipio
VALUES (4880, 4312955, 'Nova Boa Vista', 'RS', 431295);
INSERT INTO public.municipio
VALUES (4881, 4313003, 'Nova Bréscia', 'RS', 431300);
INSERT INTO public.municipio
VALUES (4882, 4313011, 'Nova Candelária', 'RS', 431301);
INSERT INTO public.municipio
VALUES (4883, 4313037, 'Nova Esperança do Sul', 'RS', 431303);
INSERT INTO public.municipio
VALUES (4884, 4313060, 'Nova Hartz', 'RS', 431306);
INSERT INTO public.municipio
VALUES (4885, 4313086, 'Nova Pádua', 'RS', 431308);
INSERT INTO public.municipio
VALUES (4886, 4313102, 'Nova Palma', 'RS', 431310);
INSERT INTO public.municipio
VALUES (4887, 4313201, 'Nova Petrópolis', 'RS', 431320);
INSERT INTO public.municipio
VALUES (4888, 4313300, 'Nova Prata', 'RS', 431330);
INSERT INTO public.municipio
VALUES (4889, 4313334, 'Nova Ramada', 'RS', 431333);
INSERT INTO public.municipio
VALUES (4890, 4313359, 'Nova Roma do Sul', 'RS', 431335);
INSERT INTO public.municipio
VALUES (4891, 4313375, 'Nova Santa Rita', 'RS', 431337);
INSERT INTO public.municipio
VALUES (4892, 4313391, 'Novo Cabrais', 'RS', 431339);
INSERT INTO public.municipio
VALUES (4893, 4313409, 'Novo Hamburgo', 'RS', 431340);
INSERT INTO public.municipio
VALUES (4894, 4313425, 'Novo Machado', 'RS', 431342);
INSERT INTO public.municipio
VALUES (4895, 4313441, 'Novo Tiradentes', 'RS', 431344);
INSERT INTO public.municipio
VALUES (4896, 4313466, 'Novo Xingu', 'RS', 431346);
INSERT INTO public.municipio
VALUES (4897, 4313490, 'Novo Barreiro', 'RS', 431349);
INSERT INTO public.municipio
VALUES (4898, 4313508, 'Osório', 'RS', 431350);
INSERT INTO public.municipio
VALUES (4899, 4313607, 'Paim Filho', 'RS', 431360);
INSERT INTO public.municipio
VALUES (4900, 4313656, 'Palmares do Sul', 'RS', 431365);
INSERT INTO public.municipio
VALUES (4901, 4313706, 'Palmeira das Missões', 'RS', 431370);
INSERT INTO public.municipio
VALUES (4902, 4313805, 'Palmitinho', 'RS', 431380);
INSERT INTO public.municipio
VALUES (4903, 4313904, 'Panambi', 'RS', 431390);
INSERT INTO public.municipio
VALUES (4904, 4313953, 'Pantano Grande', 'RS', 431395);
INSERT INTO public.municipio
VALUES (4905, 4314001, 'Paraí', 'RS', 431400);
INSERT INTO public.municipio
VALUES (4906, 4314027, 'Paraíso do Sul', 'RS', 431402);
INSERT INTO public.municipio
VALUES (4907, 4314035, 'Pareci Novo', 'RS', 431403);
INSERT INTO public.municipio
VALUES (4908, 4314050, 'Parobé', 'RS', 431405);
INSERT INTO public.municipio
VALUES (4909, 4314068, 'Passa Sete', 'RS', 431406);
INSERT INTO public.municipio
VALUES (4910, 4314076, 'Passo do Sobrado', 'RS', 431407);
INSERT INTO public.municipio
VALUES (4911, 4314100, 'Passo Fundo', 'RS', 431410);
INSERT INTO public.municipio
VALUES (4912, 4314134, 'Paulo Bento', 'RS', 431413);
INSERT INTO public.municipio
VALUES (4913, 4314159, 'Paverama', 'RS', 431415);
INSERT INTO public.municipio
VALUES (4914, 4314175, 'Pedras Altas', 'RS', 431417);
INSERT INTO public.municipio
VALUES (4915, 4314209, 'Pedro Osório', 'RS', 431420);
INSERT INTO public.municipio
VALUES (4916, 4314308, 'Pejuçara', 'RS', 431430);
INSERT INTO public.municipio
VALUES (4917, 4314407, 'Pelotas', 'RS', 431440);
INSERT INTO public.municipio
VALUES (4918, 4314423, 'Picada Café', 'RS', 431442);
INSERT INTO public.municipio
VALUES (4919, 4314456, 'Pinhal', 'RS', 431445);
INSERT INTO public.municipio
VALUES (4920, 4314464, 'Pinhal da Serra', 'RS', 431446);
INSERT INTO public.municipio
VALUES (4921, 4314472, 'Pinhal Grande', 'RS', 431447);
INSERT INTO public.municipio
VALUES (4922, 4314498, 'Pinheirinho do Vale', 'RS', 431449);
INSERT INTO public.municipio
VALUES (4923, 4314506, 'Pinheiro Machado', 'RS', 431450);
INSERT INTO public.municipio
VALUES (4924, 4314548, 'Pinto Bandeira', 'RS', 431454);
INSERT INTO public.municipio
VALUES (4925, 4314555, 'Pirapó', 'RS', 431455);
INSERT INTO public.municipio
VALUES (4926, 4314605, 'Piratini', 'RS', 431460);
INSERT INTO public.municipio
VALUES (4927, 4314704, 'Planalto', 'RS', 431470);
INSERT INTO public.municipio
VALUES (4928, 4314753, 'Poço das Antas', 'RS', 431475);
INSERT INTO public.municipio
VALUES (4929, 4314779, 'Pontão', 'RS', 431477);
INSERT INTO public.municipio
VALUES (4930, 4314787, 'Ponte Preta', 'RS', 431478);
INSERT INTO public.municipio
VALUES (4931, 4314803, 'Portão', 'RS', 431480);
INSERT INTO public.municipio
VALUES (4932, 4314902, 'Porto Alegre', 'RS', 431490);
INSERT INTO public.municipio
VALUES (4933, 4315008, 'Porto Lucena', 'RS', 431500);
INSERT INTO public.municipio
VALUES (4934, 4315057, 'Porto Mauá', 'RS', 431505);
INSERT INTO public.municipio
VALUES (4935, 4315073, 'Porto Vera Cruz', 'RS', 431507);
INSERT INTO public.municipio
VALUES (4936, 4315107, 'Porto Xavier', 'RS', 431510);
INSERT INTO public.municipio
VALUES (4937, 4315131, 'Pouso Novo', 'RS', 431513);
INSERT INTO public.municipio
VALUES (4938, 4315149, 'Presidente Lucena', 'RS', 431514);
INSERT INTO public.municipio
VALUES (4939, 4315156, 'Progresso', 'RS', 431515);
INSERT INTO public.municipio
VALUES (4940, 4315172, 'Protásio Alves', 'RS', 431517);
INSERT INTO public.municipio
VALUES (4941, 4315206, 'Putinga', 'RS', 431520);
INSERT INTO public.municipio
VALUES (4942, 4315305, 'Quaraí', 'RS', 431530);
INSERT INTO public.municipio
VALUES (4943, 4315313, 'Quatro Irmãos', 'RS', 431531);
INSERT INTO public.municipio
VALUES (4944, 4315321, 'Quevedos', 'RS', 431532);
INSERT INTO public.municipio
VALUES (4945, 4315354, 'Quinze de Novembro', 'RS', 431535);
INSERT INTO public.municipio
VALUES (4946, 4315404, 'Redentora', 'RS', 431540);
INSERT INTO public.municipio
VALUES (4947, 4315453, 'Relvado', 'RS', 431545);
INSERT INTO public.municipio
VALUES (4948, 4315503, 'Restinga Seca', 'RS', 431550);
INSERT INTO public.municipio
VALUES (4949, 4315552, 'Rio dos Índios', 'RS', 431555);
INSERT INTO public.municipio
VALUES (4950, 4315602, 'Rio Grande', 'RS', 431560);
INSERT INTO public.municipio
VALUES (4951, 4315701, 'Rio Pardo', 'RS', 431570);
INSERT INTO public.municipio
VALUES (4952, 4315750, 'Riozinho', 'RS', 431575);
INSERT INTO public.municipio
VALUES (4953, 4315800, 'Roca Sales', 'RS', 431580);
INSERT INTO public.municipio
VALUES (4954, 4315909, 'Rodeio Bonito', 'RS', 431590);
INSERT INTO public.municipio
VALUES (4955, 4315958, 'Rolador', 'RS', 431595);
INSERT INTO public.municipio
VALUES (4956, 4316006, 'Rolante', 'RS', 431600);
INSERT INTO public.municipio
VALUES (4957, 4316105, 'Ronda Alta', 'RS', 431610);
INSERT INTO public.municipio
VALUES (4958, 4316204, 'Rondinha', 'RS', 431620);
INSERT INTO public.municipio
VALUES (4959, 4316303, 'Roque Gonzales', 'RS', 431630);
INSERT INTO public.municipio
VALUES (4960, 4316402, 'Rosário do Sul', 'RS', 431640);
INSERT INTO public.municipio
VALUES (4961, 4316428, 'Sagrada Família', 'RS', 431642);
INSERT INTO public.municipio
VALUES (4962, 4316436, 'Saldanha Marinho', 'RS', 431643);
INSERT INTO public.municipio
VALUES (4963, 4316451, 'Salto do Jacuí', 'RS', 431645);
INSERT INTO public.municipio
VALUES (4964, 4316477, 'Salvador das Missões', 'RS', 431647);
INSERT INTO public.municipio
VALUES (4965, 4316501, 'Salvador do Sul', 'RS', 431650);
INSERT INTO public.municipio
VALUES (4966, 4316600, 'Sananduva', 'RS', 431660);
INSERT INTO public.municipio
VALUES (4967, 4316709, 'Santa Bárbara do Sul', 'RS', 431670);
INSERT INTO public.municipio
VALUES (4968, 4316733, 'Santa Cecília do Sul', 'RS', 431673);
INSERT INTO public.municipio
VALUES (4969, 4316758, 'Santa Clara do Sul', 'RS', 431675);
INSERT INTO public.municipio
VALUES (4970, 4316808, 'Santa Cruz do Sul', 'RS', 431680);
INSERT INTO public.municipio
VALUES (4971, 4316907, 'Santa Maria', 'RS', 431690);
INSERT INTO public.municipio
VALUES (4972, 4316956, 'Santa Maria do Herval', 'RS', 431695);
INSERT INTO public.municipio
VALUES (4973, 4316972, 'Santa Margarida do Sul', 'RS', 431697);
INSERT INTO public.municipio
VALUES (4974, 4317004, 'Santana da Boa Vista', 'RS', 431700);
INSERT INTO public.municipio
VALUES (4975, 4317103, 'Sant''Ana do Livramento', 'RS', 431710);
INSERT INTO public.municipio
VALUES (4976, 4317202, 'Santa Rosa', 'RS', 431720);
INSERT INTO public.municipio
VALUES (4977, 4317251, 'Santa Tereza', 'RS', 431725);
INSERT INTO public.municipio
VALUES (4978, 4317301, 'Santa Vitória do Palmar', 'RS', 431730);
INSERT INTO public.municipio
VALUES (4979, 4317400, 'Santiago', 'RS', 431740);
INSERT INTO public.municipio
VALUES (4980, 4317509, 'Santo Ângelo', 'RS', 431750);
INSERT INTO public.municipio
VALUES (4981, 4317558, 'Santo Antônio do Palma', 'RS', 431755);
INSERT INTO public.municipio
VALUES (4982, 4317608, 'Santo Antônio da Patrulha', 'RS', 431760);
INSERT INTO public.municipio
VALUES (4983, 4317707, 'Santo Antônio das Missões', 'RS', 431770);
INSERT INTO public.municipio
VALUES (4984, 4317756, 'Santo Antônio do Planalto', 'RS', 431775);
INSERT INTO public.municipio
VALUES (4985, 4317806, 'Santo Augusto', 'RS', 431780);
INSERT INTO public.municipio
VALUES (4986, 4317905, 'Santo Cristo', 'RS', 431790);
INSERT INTO public.municipio
VALUES (4987, 4317954, 'Santo Expedito do Sul', 'RS', 431795);
INSERT INTO public.municipio
VALUES (4988, 4318002, 'São Borja', 'RS', 431800);
INSERT INTO public.municipio
VALUES (4989, 4318051, 'São Domingos do Sul', 'RS', 431805);
INSERT INTO public.municipio
VALUES (4990, 4318101, 'São Francisco de Assis', 'RS', 431810);
INSERT INTO public.municipio
VALUES (4991, 4318200, 'São Francisco de Paula', 'RS', 431820);
INSERT INTO public.municipio
VALUES (4992, 4318309, 'São Gabriel', 'RS', 431830);
INSERT INTO public.municipio
VALUES (4993, 4318408, 'São Jerônimo', 'RS', 431840);
INSERT INTO public.municipio
VALUES (4994, 4318424, 'São João da Urtiga', 'RS', 431842);
INSERT INTO public.municipio
VALUES (4995, 4318432, 'São João do Polêsine', 'RS', 431843);
INSERT INTO public.municipio
VALUES (4996, 4318440, 'São Jorge', 'RS', 431844);
INSERT INTO public.municipio
VALUES (4997, 4318457, 'São José das Missões', 'RS', 431845);
INSERT INTO public.municipio
VALUES (4998, 4318465, 'São José do Herval', 'RS', 431846);
INSERT INTO public.municipio
VALUES (4999, 4318481, 'São José do Hortêncio', 'RS', 431848);
INSERT INTO public.municipio
VALUES (5000, 4318499, 'São José do Inhacorá', 'RS', 431849);
INSERT INTO public.municipio
VALUES (5001, 4318507, 'São José do Norte', 'RS', 431850);
INSERT INTO public.municipio
VALUES (5002, 4318606, 'São José do Ouro', 'RS', 431860);
INSERT INTO public.municipio
VALUES (5003, 4318614, 'São José do Sul', 'RS', 431861);
INSERT INTO public.municipio
VALUES (5004, 4318622, 'São José dos Ausentes', 'RS', 431862);
INSERT INTO public.municipio
VALUES (5005, 4318705, 'São Leopoldo', 'RS', 431870);
INSERT INTO public.municipio
VALUES (5006, 4318804, 'São Lourenço do Sul', 'RS', 431880);
INSERT INTO public.municipio
VALUES (5007, 4318903, 'São Luiz Gonzaga', 'RS', 431890);
INSERT INTO public.municipio
VALUES (5008, 4319000, 'São Marcos', 'RS', 431900);
INSERT INTO public.municipio
VALUES (5009, 4319109, 'São Martinho', 'RS', 431910);
INSERT INTO public.municipio
VALUES (5010, 4319125, 'São Martinho da Serra', 'RS', 431912);
INSERT INTO public.municipio
VALUES (5011, 4319158, 'São Miguel das Missões', 'RS', 431915);
INSERT INTO public.municipio
VALUES (5012, 4319208, 'São Nicolau', 'RS', 431920);
INSERT INTO public.municipio
VALUES (5013, 4319307, 'São Paulo das Missões', 'RS', 431930);
INSERT INTO public.municipio
VALUES (5014, 4319356, 'São Pedro da Serra', 'RS', 431935);
INSERT INTO public.municipio
VALUES (5015, 4319364, 'São Pedro das Missões', 'RS', 431936);
INSERT INTO public.municipio
VALUES (5016, 4319372, 'São Pedro do Butiá', 'RS', 431937);
INSERT INTO public.municipio
VALUES (5017, 4319406, 'São Pedro do Sul', 'RS', 431940);
INSERT INTO public.municipio
VALUES (5018, 4319505, 'São Sebastião do Caí', 'RS', 431950);
INSERT INTO public.municipio
VALUES (5019, 4319604, 'São Sepé', 'RS', 431960);
INSERT INTO public.municipio
VALUES (5020, 4319703, 'São Valentim', 'RS', 431970);
INSERT INTO public.municipio
VALUES (5021, 4319711, 'São Valentim do Sul', 'RS', 431971);
INSERT INTO public.municipio
VALUES (5022, 4319737, 'São Valério do Sul', 'RS', 431973);
INSERT INTO public.municipio
VALUES (5023, 4319752, 'São Vendelino', 'RS', 431975);
INSERT INTO public.municipio
VALUES (5024, 4319802, 'São Vicente do Sul', 'RS', 431980);
INSERT INTO public.municipio
VALUES (5025, 4319901, 'Sapiranga', 'RS', 431990);
INSERT INTO public.municipio
VALUES (5026, 4320008, 'Sapucaia do Sul', 'RS', 432000);
INSERT INTO public.municipio
VALUES (5027, 4320107, 'Sarandi', 'RS', 432010);
INSERT INTO public.municipio
VALUES (5028, 4320206, 'Seberi', 'RS', 432020);
INSERT INTO public.municipio
VALUES (5029, 4320230, 'Sede Nova', 'RS', 432023);
INSERT INTO public.municipio
VALUES (5030, 4320263, 'Segredo', 'RS', 432026);
INSERT INTO public.municipio
VALUES (5031, 4320305, 'Selbach', 'RS', 432030);
INSERT INTO public.municipio
VALUES (5032, 4320321, 'Senador Salgado Filho', 'RS', 432032);
INSERT INTO public.municipio
VALUES (5033, 4320354, 'Sentinela do Sul', 'RS', 432035);
INSERT INTO public.municipio
VALUES (5034, 4320404, 'Serafina Corrêa', 'RS', 432040);
INSERT INTO public.municipio
VALUES (5035, 4320453, 'Sério', 'RS', 432045);
INSERT INTO public.municipio
VALUES (5036, 4320503, 'Sertão', 'RS', 432050);
INSERT INTO public.municipio
VALUES (5037, 4320552, 'Sertão Santana', 'RS', 432055);
INSERT INTO public.municipio
VALUES (5038, 4320578, 'Sete de Setembro', 'RS', 432057);
INSERT INTO public.municipio
VALUES (5039, 4320602, 'Severiano de Almeida', 'RS', 432060);
INSERT INTO public.municipio
VALUES (5040, 4320651, 'Silveira Martins', 'RS', 432065);
INSERT INTO public.municipio
VALUES (5041, 4320677, 'Sinimbu', 'RS', 432067);
INSERT INTO public.municipio
VALUES (5042, 4320701, 'Sobradinho', 'RS', 432070);
INSERT INTO public.municipio
VALUES (5043, 4320800, 'Soledade', 'RS', 432080);
INSERT INTO public.municipio
VALUES (5044, 4320859, 'Tabaí', 'RS', 432085);
INSERT INTO public.municipio
VALUES (5045, 4320909, 'Tapejara', 'RS', 432090);
INSERT INTO public.municipio
VALUES (5046, 4321006, 'Tapera', 'RS', 432100);
INSERT INTO public.municipio
VALUES (5047, 4321105, 'Tapes', 'RS', 432110);
INSERT INTO public.municipio
VALUES (5048, 4321204, 'Taquara', 'RS', 432120);
INSERT INTO public.municipio
VALUES (5049, 4321303, 'Taquari', 'RS', 432130);
INSERT INTO public.municipio
VALUES (5050, 4321329, 'Taquaruçu do Sul', 'RS', 432132);
INSERT INTO public.municipio
VALUES (5051, 4321352, 'Tavares', 'RS', 432135);
INSERT INTO public.municipio
VALUES (5052, 4321402, 'Tenente Portela', 'RS', 432140);
INSERT INTO public.municipio
VALUES (5053, 4321436, 'Terra de Areia', 'RS', 432143);
INSERT INTO public.municipio
VALUES (5054, 4321451, 'Teutônia', 'RS', 432145);
INSERT INTO public.municipio
VALUES (5055, 4321469, 'Tio Hugo', 'RS', 432146);
INSERT INTO public.municipio
VALUES (5056, 4321477, 'Tiradentes do Sul', 'RS', 432147);
INSERT INTO public.municipio
VALUES (5057, 4321493, 'Toropi', 'RS', 432149);
INSERT INTO public.municipio
VALUES (5058, 4321501, 'Torres', 'RS', 432150);
INSERT INTO public.municipio
VALUES (5059, 4321600, 'Tramandaí', 'RS', 432160);
INSERT INTO public.municipio
VALUES (5060, 4321626, 'Travesseiro', 'RS', 432162);
INSERT INTO public.municipio
VALUES (5061, 4321634, 'Três Arroios', 'RS', 432163);
INSERT INTO public.municipio
VALUES (5062, 4321667, 'Três Cachoeiras', 'RS', 432166);
INSERT INTO public.municipio
VALUES (5063, 4321709, 'Três Coroas', 'RS', 432170);
INSERT INTO public.municipio
VALUES (5064, 4321808, 'Três de Maio', 'RS', 432180);
INSERT INTO public.municipio
VALUES (5065, 4321832, 'Três Forquilhas', 'RS', 432183);
INSERT INTO public.municipio
VALUES (5066, 4321857, 'Três Palmeiras', 'RS', 432185);
INSERT INTO public.municipio
VALUES (5067, 4321907, 'Três Passos', 'RS', 432190);
INSERT INTO public.municipio
VALUES (5068, 4321956, 'Trindade do Sul', 'RS', 432195);
INSERT INTO public.municipio
VALUES (5069, 4322004, 'Triunfo', 'RS', 432200);
INSERT INTO public.municipio
VALUES (5070, 4322103, 'Tucunduva', 'RS', 432210);
INSERT INTO public.municipio
VALUES (5071, 4322152, 'Tunas', 'RS', 432215);
INSERT INTO public.municipio
VALUES (5072, 4322186, 'Tupanci do Sul', 'RS', 432218);
INSERT INTO public.municipio
VALUES (5073, 4322202, 'Tupanciretã', 'RS', 432220);
INSERT INTO public.municipio
VALUES (5074, 4322251, 'Tupandi', 'RS', 432225);
INSERT INTO public.municipio
VALUES (5075, 4322301, 'Tuparendi', 'RS', 432230);
INSERT INTO public.municipio
VALUES (5076, 4322327, 'Turuçu', 'RS', 432232);
INSERT INTO public.municipio
VALUES (5077, 4322343, 'Ubiretama', 'RS', 432234);
INSERT INTO public.municipio
VALUES (5078, 4322350, 'União da Serra', 'RS', 432235);
INSERT INTO public.municipio
VALUES (5079, 4322376, 'Unistalda', 'RS', 432237);
INSERT INTO public.municipio
VALUES (5080, 4322400, 'Uruguaiana', 'RS', 432240);
INSERT INTO public.municipio
VALUES (5081, 4322509, 'Vacaria', 'RS', 432250);
INSERT INTO public.municipio
VALUES (5082, 4322525, 'Vale Verde', 'RS', 432252);
INSERT INTO public.municipio
VALUES (5083, 4322533, 'Vale do Sol', 'RS', 432253);
INSERT INTO public.municipio
VALUES (5084, 4322541, 'Vale Real', 'RS', 432254);
INSERT INTO public.municipio
VALUES (5085, 4322558, 'Vanini', 'RS', 432255);
INSERT INTO public.municipio
VALUES (5086, 4322608, 'Venâncio Aires', 'RS', 432260);
INSERT INTO public.municipio
VALUES (5087, 4322707, 'Vera Cruz', 'RS', 432270);
INSERT INTO public.municipio
VALUES (5088, 4322806, 'Veranópolis', 'RS', 432280);
INSERT INTO public.municipio
VALUES (5089, 4322855, 'Vespasiano Correa', 'RS', 432285);
INSERT INTO public.municipio
VALUES (5090, 4322905, 'Viadutos', 'RS', 432290);
INSERT INTO public.municipio
VALUES (5091, 4323002, 'Viamão', 'RS', 432300);
INSERT INTO public.municipio
VALUES (5092, 4323101, 'Vicente Dutra', 'RS', 432310);
INSERT INTO public.municipio
VALUES (5093, 4323200, 'Victor Graeff', 'RS', 432320);
INSERT INTO public.municipio
VALUES (5094, 4323309, 'Vila Flores', 'RS', 432330);
INSERT INTO public.municipio
VALUES (5095, 4323358, 'Vila Lângaro', 'RS', 432335);
INSERT INTO public.municipio
VALUES (5096, 4323408, 'Vila Maria', 'RS', 432340);
INSERT INTO public.municipio
VALUES (5097, 4323457, 'Vila Nova do Sul', 'RS', 432345);
INSERT INTO public.municipio
VALUES (5098, 4323507, 'Vista Alegre', 'RS', 432350);
INSERT INTO public.municipio
VALUES (5099, 4323606, 'Vista Alegre do Prata', 'RS', 432360);
INSERT INTO public.municipio
VALUES (5100, 4323705, 'Vista Gaúcha', 'RS', 432370);
INSERT INTO public.municipio
VALUES (5101, 4323754, 'Vitória das Missões', 'RS', 432375);
INSERT INTO public.municipio
VALUES (5102, 4323770, 'Westfalia', 'RS', 432377);
INSERT INTO public.municipio
VALUES (5103, 4323804, 'Xangri-lá', 'RS', 432380);
INSERT INTO public.municipio
VALUES (5104, 5000203, 'Água Clara', 'MS', 500020);
INSERT INTO public.municipio
VALUES (5105, 5000252, 'Alcinópolis', 'MS', 500025);
INSERT INTO public.municipio
VALUES (5106, 5000609, 'Amambai', 'MS', 500060);
INSERT INTO public.municipio
VALUES (5107, 5000708, 'Anastácio', 'MS', 500070);
INSERT INTO public.municipio
VALUES (5108, 5000807, 'Anaurilândia', 'MS', 500080);
INSERT INTO public.municipio
VALUES (5109, 5000856, 'Angélica', 'MS', 500085);
INSERT INTO public.municipio
VALUES (5110, 5000906, 'Antônio João', 'MS', 500090);
INSERT INTO public.municipio
VALUES (5111, 5001003, 'Aparecida do Taboado', 'MS', 500100);
INSERT INTO public.municipio
VALUES (5112, 5001102, 'Aquidauana', 'MS', 500110);
INSERT INTO public.municipio
VALUES (5113, 5001243, 'Aral Moreira', 'MS', 500124);
INSERT INTO public.municipio
VALUES (5114, 5001508, 'Bandeirantes', 'MS', 500150);
INSERT INTO public.municipio
VALUES (5115, 5001904, 'Bataguassu', 'MS', 500190);
INSERT INTO public.municipio
VALUES (5116, 5002001, 'Batayporã', 'MS', 500200);
INSERT INTO public.municipio
VALUES (5117, 5002100, 'Bela Vista', 'MS', 500210);
INSERT INTO public.municipio
VALUES (5118, 5002159, 'Bodoquena', 'MS', 500215);
INSERT INTO public.municipio
VALUES (5119, 5002209, 'Bonito', 'MS', 500220);
INSERT INTO public.municipio
VALUES (5120, 5002308, 'Brasilândia', 'MS', 500230);
INSERT INTO public.municipio
VALUES (5121, 5002407, 'Caarapó', 'MS', 500240);
INSERT INTO public.municipio
VALUES (5122, 5002605, 'Camapuã', 'MS', 500260);
INSERT INTO public.municipio
VALUES (5123, 5002704, 'Campo Grande', 'MS', 500270);
INSERT INTO public.municipio
VALUES (5124, 5002803, 'Caracol', 'MS', 500280);
INSERT INTO public.municipio
VALUES (5125, 5002902, 'Cassilândia', 'MS', 500290);
INSERT INTO public.municipio
VALUES (5126, 5002951, 'Chapadão do Sul', 'MS', 500295);
INSERT INTO public.municipio
VALUES (5127, 5003108, 'Corguinho', 'MS', 500310);
INSERT INTO public.municipio
VALUES (5128, 5003157, 'Coronel Sapucaia', 'MS', 500315);
INSERT INTO public.municipio
VALUES (5129, 5003207, 'Corumbá', 'MS', 500320);
INSERT INTO public.municipio
VALUES (5130, 5003256, 'Costa Rica', 'MS', 500325);
INSERT INTO public.municipio
VALUES (5131, 5003306, 'Coxim', 'MS', 500330);
INSERT INTO public.municipio
VALUES (5132, 5003454, 'Deodápolis', 'MS', 500345);
INSERT INTO public.municipio
VALUES (5133, 5003488, 'Dois Irmãos do Buriti', 'MS', 500348);
INSERT INTO public.municipio
VALUES (5134, 5003504, 'Douradina', 'MS', 500350);
INSERT INTO public.municipio
VALUES (5135, 5003702, 'Dourados', 'MS', 500370);
INSERT INTO public.municipio
VALUES (5136, 5003751, 'Eldorado', 'MS', 500375);
INSERT INTO public.municipio
VALUES (5137, 5003801, 'Fátima do Sul', 'MS', 500380);
INSERT INTO public.municipio
VALUES (5138, 5003900, 'Figueirão', 'MS', 500390);
INSERT INTO public.municipio
VALUES (5139, 5004007, 'Glória de Dourados', 'MS', 500400);
INSERT INTO public.municipio
VALUES (5140, 5004106, 'Guia Lopes da Laguna', 'MS', 500410);
INSERT INTO public.municipio
VALUES (5141, 5004304, 'Iguatemi', 'MS', 500430);
INSERT INTO public.municipio
VALUES (5142, 5004403, 'Inocência', 'MS', 500440);
INSERT INTO public.municipio
VALUES (5143, 5004502, 'Itaporã', 'MS', 500450);
INSERT INTO public.municipio
VALUES (5144, 5004601, 'Itaquiraí', 'MS', 500460);
INSERT INTO public.municipio
VALUES (5145, 5004700, 'Ivinhema', 'MS', 500470);
INSERT INTO public.municipio
VALUES (5146, 5004809, 'Japorã', 'MS', 500480);
INSERT INTO public.municipio
VALUES (5147, 5004908, 'Jaraguari', 'MS', 500490);
INSERT INTO public.municipio
VALUES (5148, 5005004, 'Jardim', 'MS', 500500);
INSERT INTO public.municipio
VALUES (5149, 5005103, 'Jateí', 'MS', 500510);
INSERT INTO public.municipio
VALUES (5150, 5005152, 'Juti', 'MS', 500515);
INSERT INTO public.municipio
VALUES (5151, 5005202, 'Ladário', 'MS', 500520);
INSERT INTO public.municipio
VALUES (5152, 5005251, 'Laguna Carapã', 'MS', 500525);
INSERT INTO public.municipio
VALUES (5153, 5005400, 'Maracaju', 'MS', 500540);
INSERT INTO public.municipio
VALUES (5154, 5005608, 'Miranda', 'MS', 500560);
INSERT INTO public.municipio
VALUES (5155, 5005681, 'Mundo Novo', 'MS', 500568);
INSERT INTO public.municipio
VALUES (5156, 5005707, 'Naviraí', 'MS', 500570);
INSERT INTO public.municipio
VALUES (5157, 5005806, 'Nioaque', 'MS', 500580);
INSERT INTO public.municipio
VALUES (5158, 5006002, 'Nova Alvorada do Sul', 'MS', 500600);
INSERT INTO public.municipio
VALUES (5159, 5006200, 'Nova Andradina', 'MS', 500620);
INSERT INTO public.municipio
VALUES (5160, 5006259, 'Novo Horizonte do Sul', 'MS', 500625);
INSERT INTO public.municipio
VALUES (5161, 5006275, 'Paraíso das Águas', 'MS', 500627);
INSERT INTO public.municipio
VALUES (5162, 5006309, 'Paranaíba', 'MS', 500630);
INSERT INTO public.municipio
VALUES (5163, 5006358, 'Paranhos', 'MS', 500635);
INSERT INTO public.municipio
VALUES (5164, 5006408, 'Pedro Gomes', 'MS', 500640);
INSERT INTO public.municipio
VALUES (5165, 5006606, 'Ponta Porã', 'MS', 500660);
INSERT INTO public.municipio
VALUES (5166, 5006903, 'Porto Murtinho', 'MS', 500690);
INSERT INTO public.municipio
VALUES (5167, 5007109, 'Ribas do Rio Pardo', 'MS', 500710);
INSERT INTO public.municipio
VALUES (5168, 5007208, 'Rio Brilhante', 'MS', 500720);
INSERT INTO public.municipio
VALUES (5169, 5007307, 'Rio Negro', 'MS', 500730);
INSERT INTO public.municipio
VALUES (5170, 5007406, 'Rio Verde de Mato Grosso', 'MS', 500740);
INSERT INTO public.municipio
VALUES (5171, 5007505, 'Rochedo', 'MS', 500750);
INSERT INTO public.municipio
VALUES (5172, 5007554, 'Santa Rita do Pardo', 'MS', 500755);
INSERT INTO public.municipio
VALUES (5173, 5007695, 'São Gabriel do Oeste', 'MS', 500769);
INSERT INTO public.municipio
VALUES (5174, 5007703, 'Sete Quedas', 'MS', 500770);
INSERT INTO public.municipio
VALUES (5175, 5007802, 'Selvíria', 'MS', 500780);
INSERT INTO public.municipio
VALUES (5176, 5007901, 'Sidrolândia', 'MS', 500790);
INSERT INTO public.municipio
VALUES (5177, 5007935, 'Sonora', 'MS', 500793);
INSERT INTO public.municipio
VALUES (5178, 5007950, 'Tacuru', 'MS', 500795);
INSERT INTO public.municipio
VALUES (5179, 5007976, 'Taquarussu', 'MS', 500797);
INSERT INTO public.municipio
VALUES (5180, 5008008, 'Terenos', 'MS', 500800);
INSERT INTO public.municipio
VALUES (5181, 5008305, 'Três Lagoas', 'MS', 500830);
INSERT INTO public.municipio
VALUES (5182, 5008404, 'Vicentina', 'MS', 500840);
INSERT INTO public.municipio
VALUES (5183, 5100102, 'Acorizal', 'MT', 510010);
INSERT INTO public.municipio
VALUES (5184, 5100201, 'Água Boa', 'MT', 510020);
INSERT INTO public.municipio
VALUES (5185, 5100250, 'Alta Floresta', 'MT', 510025);
INSERT INTO public.municipio
VALUES (5186, 5100300, 'Alto Araguaia', 'MT', 510030);
INSERT INTO public.municipio
VALUES (5187, 5100359, 'Alto Boa Vista', 'MT', 510035);
INSERT INTO public.municipio
VALUES (5188, 5100409, 'Alto Garças', 'MT', 510040);
INSERT INTO public.municipio
VALUES (5189, 5100508, 'Alto Paraguai', 'MT', 510050);
INSERT INTO public.municipio
VALUES (5190, 5100607, 'Alto Taquari', 'MT', 510060);
INSERT INTO public.municipio
VALUES (5191, 5100805, 'Apiacás', 'MT', 510080);
INSERT INTO public.municipio
VALUES (5192, 5101001, 'Araguaiana', 'MT', 510100);
INSERT INTO public.municipio
VALUES (5193, 5101209, 'Araguainha', 'MT', 510120);
INSERT INTO public.municipio
VALUES (5194, 5101258, 'Araputanga', 'MT', 510125);
INSERT INTO public.municipio
VALUES (5195, 5101308, 'Arenápolis', 'MT', 510130);
INSERT INTO public.municipio
VALUES (5196, 5101407, 'Aripuanã', 'MT', 510140);
INSERT INTO public.municipio
VALUES (5197, 5101605, 'Barão de Melgaço', 'MT', 510160);
INSERT INTO public.municipio
VALUES (5198, 5101704, 'Barra do Bugres', 'MT', 510170);
INSERT INTO public.municipio
VALUES (5199, 5101803, 'Barra do Garças', 'MT', 510180);
INSERT INTO public.municipio
VALUES (5200, 5101852, 'Bom Jesus do Araguaia', 'MT', 510185);
INSERT INTO public.municipio
VALUES (5201, 5101902, 'Brasnorte', 'MT', 510190);
INSERT INTO public.municipio
VALUES (5202, 5102504, 'Cáceres', 'MT', 510250);
INSERT INTO public.municipio
VALUES (5203, 5102603, 'Campinápolis', 'MT', 510260);
INSERT INTO public.municipio
VALUES (5204, 5102637, 'Campo Novo do Parecis', 'MT', 510263);
INSERT INTO public.municipio
VALUES (5205, 5102678, 'Campo Verde', 'MT', 510267);
INSERT INTO public.municipio
VALUES (5206, 5102686, 'Campos de Júlio', 'MT', 510268);
INSERT INTO public.municipio
VALUES (5207, 5102694, 'Canabrava do Norte', 'MT', 510269);
INSERT INTO public.municipio
VALUES (5208, 5102702, 'Canarana', 'MT', 510270);
INSERT INTO public.municipio
VALUES (5209, 5102793, 'Carlinda', 'MT', 510279);
INSERT INTO public.municipio
VALUES (5210, 5102850, 'Castanheira', 'MT', 510285);
INSERT INTO public.municipio
VALUES (5211, 5103007, 'Chapada dos Guimarães', 'MT', 510300);
INSERT INTO public.municipio
VALUES (5212, 5103056, 'Cláudia', 'MT', 510305);
INSERT INTO public.municipio
VALUES (5213, 5103106, 'Cocalinho', 'MT', 510310);
INSERT INTO public.municipio
VALUES (5214, 5103205, 'Colíder', 'MT', 510320);
INSERT INTO public.municipio
VALUES (5215, 5103254, 'Colniza', 'MT', 510325);
INSERT INTO public.municipio
VALUES (5216, 5103304, 'Comodoro', 'MT', 510330);
INSERT INTO public.municipio
VALUES (5217, 5103353, 'Confresa', 'MT', 510335);
INSERT INTO public.municipio
VALUES (5218, 5103361, 'Conquista D''Oeste', 'MT', 510336);
INSERT INTO public.municipio
VALUES (5219, 5103379, 'Cotriguaçu', 'MT', 510337);
INSERT INTO public.municipio
VALUES (5220, 5103403, 'Cuiabá', 'MT', 510340);
INSERT INTO public.municipio
VALUES (5221, 5103437, 'Curvelândia', 'MT', 510343);
INSERT INTO public.municipio
VALUES (5222, 5103452, 'Denise', 'MT', 510345);
INSERT INTO public.municipio
VALUES (5223, 5103502, 'Diamantino', 'MT', 510350);
INSERT INTO public.municipio
VALUES (5224, 5103601, 'Dom Aquino', 'MT', 510360);
INSERT INTO public.municipio
VALUES (5225, 5103700, 'Feliz Natal', 'MT', 510370);
INSERT INTO public.municipio
VALUES (5226, 5103809, 'Figueirópolis D''Oeste', 'MT', 510380);
INSERT INTO public.municipio
VALUES (5227, 5103858, 'Gaúcha do Norte', 'MT', 510385);
INSERT INTO public.municipio
VALUES (5228, 5103908, 'General Carneiro', 'MT', 510390);
INSERT INTO public.municipio
VALUES (5229, 5103957, 'Glória D''Oeste', 'MT', 510395);
INSERT INTO public.municipio
VALUES (5230, 5104104, 'Guarantã do Norte', 'MT', 510410);
INSERT INTO public.municipio
VALUES (5231, 5104203, 'Guiratinga', 'MT', 510420);
INSERT INTO public.municipio
VALUES (5232, 5104500, 'Indiavaí', 'MT', 510450);
INSERT INTO public.municipio
VALUES (5233, 5104526, 'Ipiranga do Norte', 'MT', 510452);
INSERT INTO public.municipio
VALUES (5234, 5104542, 'Itanhangá', 'MT', 510454);
INSERT INTO public.municipio
VALUES (5235, 5104559, 'Itaúba', 'MT', 510455);
INSERT INTO public.municipio
VALUES (5236, 5104609, 'Itiquira', 'MT', 510460);
INSERT INTO public.municipio
VALUES (5237, 5104807, 'Jaciara', 'MT', 510480);
INSERT INTO public.municipio
VALUES (5238, 5104906, 'Jangada', 'MT', 510490);
INSERT INTO public.municipio
VALUES (5239, 5105002, 'Jauru', 'MT', 510500);
INSERT INTO public.municipio
VALUES (5240, 5105101, 'Juara', 'MT', 510510);
INSERT INTO public.municipio
VALUES (5241, 5105150, 'Juína', 'MT', 510515);
INSERT INTO public.municipio
VALUES (5242, 5105176, 'Juruena', 'MT', 510517);
INSERT INTO public.municipio
VALUES (5243, 5105200, 'Juscimeira', 'MT', 510520);
INSERT INTO public.municipio
VALUES (5244, 5105234, 'Lambari D''Oeste', 'MT', 510523);
INSERT INTO public.municipio
VALUES (5245, 5105259, 'Lucas do Rio Verde', 'MT', 510525);
INSERT INTO public.municipio
VALUES (5246, 5105309, 'Luciara', 'MT', 510530);
INSERT INTO public.municipio
VALUES (5247, 5105507, 'Vila Bela da Santíssima Trindade', 'MT', 510550);
INSERT INTO public.municipio
VALUES (5248, 5105580, 'Marcelândia', 'MT', 510558);
INSERT INTO public.municipio
VALUES (5249, 5105606, 'Matupá', 'MT', 510560);
INSERT INTO public.municipio
VALUES (5250, 5105622, 'Mirassol D''Oeste', 'MT', 510562);
INSERT INTO public.municipio
VALUES (5251, 5105903, 'Nobres', 'MT', 510590);
INSERT INTO public.municipio
VALUES (5252, 5106000, 'Nortelândia', 'MT', 510600);
INSERT INTO public.municipio
VALUES (5253, 5106109, 'Nossa Senhora do Livramento', 'MT', 510610);
INSERT INTO public.municipio
VALUES (5254, 5106158, 'Nova Bandeirantes', 'MT', 510615);
INSERT INTO public.municipio
VALUES (5255, 5106174, 'Nova Nazaré', 'MT', 510617);
INSERT INTO public.municipio
VALUES (5256, 5106182, 'Nova Lacerda', 'MT', 510618);
INSERT INTO public.municipio
VALUES (5257, 5106190, 'Nova Santa Helena', 'MT', 510619);
INSERT INTO public.municipio
VALUES (5258, 5106208, 'Nova Brasilândia', 'MT', 510620);
INSERT INTO public.municipio
VALUES (5259, 5106216, 'Nova Canaã do Norte', 'MT', 510621);
INSERT INTO public.municipio
VALUES (5260, 5106224, 'Nova Mutum', 'MT', 510622);
INSERT INTO public.municipio
VALUES (5261, 5106232, 'Nova Olímpia', 'MT', 510623);
INSERT INTO public.municipio
VALUES (5262, 5106240, 'Nova Ubiratã', 'MT', 510624);
INSERT INTO public.municipio
VALUES (5263, 5106257, 'Nova Xavantina', 'MT', 510625);
INSERT INTO public.municipio
VALUES (5264, 5106265, 'Novo Mundo', 'MT', 510626);
INSERT INTO public.municipio
VALUES (5265, 5106273, 'Novo Horizonte do Norte', 'MT', 510627);
INSERT INTO public.municipio
VALUES (5266, 5106281, 'Novo São Joaquim', 'MT', 510628);
INSERT INTO public.municipio
VALUES (5267, 5106299, 'Paranaíta', 'MT', 510629);
INSERT INTO public.municipio
VALUES (5268, 5106307, 'Paranatinga', 'MT', 510630);
INSERT INTO public.municipio
VALUES (5269, 5106315, 'Novo Santo Antônio', 'MT', 510631);
INSERT INTO public.municipio
VALUES (5270, 5106372, 'Pedra Preta', 'MT', 510637);
INSERT INTO public.municipio
VALUES (5271, 5106422, 'Peixoto de Azevedo', 'MT', 510642);
INSERT INTO public.municipio
VALUES (5272, 5106455, 'Planalto da Serra', 'MT', 510645);
INSERT INTO public.municipio
VALUES (5273, 5106505, 'Poconé', 'MT', 510650);
INSERT INTO public.municipio
VALUES (5274, 5106653, 'Pontal do Araguaia', 'MT', 510665);
INSERT INTO public.municipio
VALUES (5275, 5106703, 'Ponte Branca', 'MT', 510670);
INSERT INTO public.municipio
VALUES (5276, 5106752, 'Pontes e Lacerda', 'MT', 510675);
INSERT INTO public.municipio
VALUES (5277, 5106778, 'Porto Alegre do Norte', 'MT', 510677);
INSERT INTO public.municipio
VALUES (5278, 5106802, 'Porto dos Gaúchos', 'MT', 510680);
INSERT INTO public.municipio
VALUES (5279, 5106828, 'Porto Esperidião', 'MT', 510682);
INSERT INTO public.municipio
VALUES (5280, 5106851, 'Porto Estrela', 'MT', 510685);
INSERT INTO public.municipio
VALUES (5281, 5107008, 'Poxoréo', 'MT', 510700);
INSERT INTO public.municipio
VALUES (5282, 5107040, 'Primavera do Leste', 'MT', 510704);
INSERT INTO public.municipio
VALUES (5283, 5107065, 'Querência', 'MT', 510706);
INSERT INTO public.municipio
VALUES (5284, 5107107, 'São José dos Quatro Marcos', 'MT', 510710);
INSERT INTO public.municipio
VALUES (5285, 5107156, 'Reserva do Cabaçal', 'MT', 510715);
INSERT INTO public.municipio
VALUES (5286, 5107180, 'Ribeirão Cascalheira', 'MT', 510718);
INSERT INTO public.municipio
VALUES (5287, 5107198, 'Ribeirãozinho', 'MT', 510719);
INSERT INTO public.municipio
VALUES (5288, 5107206, 'Rio Branco', 'MT', 510720);
INSERT INTO public.municipio
VALUES (5289, 5107248, 'Santa Carmem', 'MT', 510724);
INSERT INTO public.municipio
VALUES (5290, 5107263, 'Santo Afonso', 'MT', 510726);
INSERT INTO public.municipio
VALUES (5291, 5107297, 'São José do Povo', 'MT', 510729);
INSERT INTO public.municipio
VALUES (5292, 5107305, 'São José do Rio Claro', 'MT', 510730);
INSERT INTO public.municipio
VALUES (5293, 5107354, 'São José do Xingu', 'MT', 510735);
INSERT INTO public.municipio
VALUES (5294, 5107404, 'São Pedro da Cipa', 'MT', 510740);
INSERT INTO public.municipio
VALUES (5295, 5107578, 'Rondolândia', 'MT', 510757);
INSERT INTO public.municipio
VALUES (5296, 5107602, 'Rondonópolis', 'MT', 510760);
INSERT INTO public.municipio
VALUES (5297, 5107701, 'Rosário Oeste', 'MT', 510770);
INSERT INTO public.municipio
VALUES (5298, 5107743, 'Santa Cruz do Xingu', 'MT', 510774);
INSERT INTO public.municipio
VALUES (5299, 5107750, 'Salto do Céu', 'MT', 510775);
INSERT INTO public.municipio
VALUES (5300, 5107768, 'Santa Rita do Trivelato', 'MT', 510776);
INSERT INTO public.municipio
VALUES (5301, 5107776, 'Santa Terezinha', 'MT', 510777);
INSERT INTO public.municipio
VALUES (5302, 5107792, 'Santo Antônio do Leste', 'MT', 510779);
INSERT INTO public.municipio
VALUES (5303, 5107800, 'Santo Antônio do Leverger', 'MT', 510780);
INSERT INTO public.municipio
VALUES (5304, 5107859, 'São Félix do Araguaia', 'MT', 510785);
INSERT INTO public.municipio
VALUES (5305, 5107875, 'Sapezal', 'MT', 510787);
INSERT INTO public.municipio
VALUES (5306, 5107883, 'Serra Nova Dourada', 'MT', 510788);
INSERT INTO public.municipio
VALUES (5307, 5107909, 'Sinop', 'MT', 510790);
INSERT INTO public.municipio
VALUES (5308, 5107925, 'Sorriso', 'MT', 510792);
INSERT INTO public.municipio
VALUES (5309, 5107941, 'Tabaporã', 'MT', 510794);
INSERT INTO public.municipio
VALUES (5310, 5107958, 'Tangará da Serra', 'MT', 510795);
INSERT INTO public.municipio
VALUES (5311, 5108006, 'Tapurah', 'MT', 510800);
INSERT INTO public.municipio
VALUES (5312, 5108055, 'Terra Nova do Norte', 'MT', 510805);
INSERT INTO public.municipio
VALUES (5313, 5108105, 'Tesouro', 'MT', 510810);
INSERT INTO public.municipio
VALUES (5314, 5108204, 'Torixoréu', 'MT', 510820);
INSERT INTO public.municipio
VALUES (5315, 5108303, 'União do Sul', 'MT', 510830);
INSERT INTO public.municipio
VALUES (5316, 5108352, 'Vale de São Domingos', 'MT', 510835);
INSERT INTO public.municipio
VALUES (5317, 5108402, 'Várzea Grande', 'MT', 510840);
INSERT INTO public.municipio
VALUES (5319, 5108600, 'Vila Rica', 'MT', 510860);
INSERT INTO public.municipio
VALUES (5320, 5108808, 'Nova Guarita', 'MT', 510880);
INSERT INTO public.municipio
VALUES (5321, 5108857, 'Nova Marilândia', 'MT', 510885);
INSERT INTO public.municipio
VALUES (5322, 5108907, 'Nova Maringá', 'MT', 510890);
INSERT INTO public.municipio
VALUES (5323, 5108956, 'Nova Monte Verde', 'MT', 510895);
INSERT INTO public.municipio
VALUES (5324, 5200050, 'Abadia de Goiás', 'GO', 520005);
INSERT INTO public.municipio
VALUES (5325, 5200100, 'Abadiânia', 'GO', 520010);
INSERT INTO public.municipio
VALUES (5326, 5200134, 'Acreúna', 'GO', 520013);
INSERT INTO public.municipio
VALUES (5327, 5200159, 'Adelândia', 'GO', 520015);
INSERT INTO public.municipio
VALUES (5328, 5200175, 'Água Fria de Goiás', 'GO', 520017);
INSERT INTO public.municipio
VALUES (5329, 5200209, 'Água Limpa', 'GO', 520020);
INSERT INTO public.municipio
VALUES (5330, 5200258, 'Águas Lindas de Goiás', 'GO', 520025);
INSERT INTO public.municipio
VALUES (5331, 5200308, 'Alexânia', 'GO', 520030);
INSERT INTO public.municipio
VALUES (5332, 5200506, 'Aloândia', 'GO', 520050);
INSERT INTO public.municipio
VALUES (5333, 5200555, 'Alto Horizonte', 'GO', 520055);
INSERT INTO public.municipio
VALUES (5334, 5200605, 'Alto Paraíso de Goiás', 'GO', 520060);
INSERT INTO public.municipio
VALUES (5335, 5200803, 'Alvorada do Norte', 'GO', 520080);
INSERT INTO public.municipio
VALUES (5336, 5200829, 'Amaralina', 'GO', 520082);
INSERT INTO public.municipio
VALUES (5337, 5200852, 'Americano do Brasil', 'GO', 520085);
INSERT INTO public.municipio
VALUES (5338, 5200902, 'Amorinópolis', 'GO', 520090);
INSERT INTO public.municipio
VALUES (5339, 5201108, 'Anápolis', 'GO', 520110);
INSERT INTO public.municipio
VALUES (5340, 5201207, 'Anhanguera', 'GO', 520120);
INSERT INTO public.municipio
VALUES (5341, 5201306, 'Anicuns', 'GO', 520130);
INSERT INTO public.municipio
VALUES (5342, 5201405, 'Aparecida de Goiânia', 'GO', 520140);
INSERT INTO public.municipio
VALUES (5343, 5201454, 'Aparecida do Rio Doce', 'GO', 520145);
INSERT INTO public.municipio
VALUES (5344, 5201504, 'Aporé', 'GO', 520150);
INSERT INTO public.municipio
VALUES (5345, 5201603, 'Araçu', 'GO', 520160);
INSERT INTO public.municipio
VALUES (5346, 5201702, 'Aragarças', 'GO', 520170);
INSERT INTO public.municipio
VALUES (5347, 5201801, 'Aragoiânia', 'GO', 520180);
INSERT INTO public.municipio
VALUES (5348, 5202155, 'Araguapaz', 'GO', 520215);
INSERT INTO public.municipio
VALUES (5349, 5202353, 'Arenópolis', 'GO', 520235);
INSERT INTO public.municipio
VALUES (5350, 5202502, 'Aruanã', 'GO', 520250);
INSERT INTO public.municipio
VALUES (5351, 5202601, 'Aurilândia', 'GO', 520260);
INSERT INTO public.municipio
VALUES (5352, 5202809, 'Avelinópolis', 'GO', 520280);
INSERT INTO public.municipio
VALUES (5353, 5203104, 'Baliza', 'GO', 520310);
INSERT INTO public.municipio
VALUES (5354, 5203203, 'Barro Alto', 'GO', 520320);
INSERT INTO public.municipio
VALUES (5355, 5203302, 'Bela Vista de Goiás', 'GO', 520330);
INSERT INTO public.municipio
VALUES (5356, 5203401, 'Bom Jardim de Goiás', 'GO', 520340);
INSERT INTO public.municipio
VALUES (5357, 5203500, 'Bom Jesus de Goiás', 'GO', 520350);
INSERT INTO public.municipio
VALUES (5358, 5203559, 'Bonfinópolis', 'GO', 520355);
INSERT INTO public.municipio
VALUES (5359, 5203575, 'Bonópolis', 'GO', 520357);
INSERT INTO public.municipio
VALUES (5360, 5203609, 'Brazabrantes', 'GO', 520360);
INSERT INTO public.municipio
VALUES (5361, 5203807, 'Britânia', 'GO', 520380);
INSERT INTO public.municipio
VALUES (5362, 5203906, 'Buriti Alegre', 'GO', 520390);
INSERT INTO public.municipio
VALUES (5363, 5203939, 'Buriti de Goiás', 'GO', 520393);
INSERT INTO public.municipio
VALUES (5364, 5203962, 'Buritinópolis', 'GO', 520396);
INSERT INTO public.municipio
VALUES (5365, 5204003, 'Cabeceiras', 'GO', 520400);
INSERT INTO public.municipio
VALUES (5366, 5204102, 'Cachoeira Alta', 'GO', 520410);
INSERT INTO public.municipio
VALUES (5367, 5204201, 'Cachoeira de Goiás', 'GO', 520420);
INSERT INTO public.municipio
VALUES (5368, 5204250, 'Cachoeira Dourada', 'GO', 520425);
INSERT INTO public.municipio
VALUES (5369, 5204300, 'Caçu', 'GO', 520430);
INSERT INTO public.municipio
VALUES (5370, 5204409, 'Caiapônia', 'GO', 520440);
INSERT INTO public.municipio
VALUES (5371, 5204508, 'Caldas Novas', 'GO', 520450);
INSERT INTO public.municipio
VALUES (5372, 5204557, 'Caldazinha', 'GO', 520455);
INSERT INTO public.municipio
VALUES (5373, 5204607, 'Campestre de Goiás', 'GO', 520460);
INSERT INTO public.municipio
VALUES (5374, 5204656, 'Campinaçu', 'GO', 520465);
INSERT INTO public.municipio
VALUES (5375, 5204706, 'Campinorte', 'GO', 520470);
INSERT INTO public.municipio
VALUES (5376, 5204805, 'Campo Alegre de Goiás', 'GO', 520480);
INSERT INTO public.municipio
VALUES (5377, 5204854, 'Campo Limpo de Goiás', 'GO', 520485);
INSERT INTO public.municipio
VALUES (5378, 5204904, 'Campos Belos', 'GO', 520490);
INSERT INTO public.municipio
VALUES (5379, 5204953, 'Campos Verdes', 'GO', 520495);
INSERT INTO public.municipio
VALUES (5380, 5205000, 'Carmo do Rio Verde', 'GO', 520500);
INSERT INTO public.municipio
VALUES (5381, 5205059, 'Castelândia', 'GO', 520505);
INSERT INTO public.municipio
VALUES (5382, 5205109, 'Catalão', 'GO', 520510);
INSERT INTO public.municipio
VALUES (5383, 5205208, 'Caturaí', 'GO', 520520);
INSERT INTO public.municipio
VALUES (5384, 5205307, 'Cavalcante', 'GO', 520530);
INSERT INTO public.municipio
VALUES (5385, 5205406, 'Ceres', 'GO', 520540);
INSERT INTO public.municipio
VALUES (5386, 5205455, 'Cezarina', 'GO', 520545);
INSERT INTO public.municipio
VALUES (5387, 5205471, 'Chapadão do Céu', 'GO', 520547);
INSERT INTO public.municipio
VALUES (5388, 5205497, 'Cidade Ocidental', 'GO', 520549);
INSERT INTO public.municipio
VALUES (5389, 5205513, 'Cocalzinho de Goiás', 'GO', 520551);
INSERT INTO public.municipio
VALUES (5390, 5205521, 'Colinas do Sul', 'GO', 520552);
INSERT INTO public.municipio
VALUES (5391, 5205703, 'Córrego do Ouro', 'GO', 520570);
INSERT INTO public.municipio
VALUES (5392, 5205802, 'Corumbá de Goiás', 'GO', 520580);
INSERT INTO public.municipio
VALUES (5393, 5205901, 'Corumbaíba', 'GO', 520590);
INSERT INTO public.municipio
VALUES (5394, 5206206, 'Cristalina', 'GO', 520620);
INSERT INTO public.municipio
VALUES (5395, 5206305, 'Cristianópolis', 'GO', 520630);
INSERT INTO public.municipio
VALUES (5396, 5206404, 'Crixás', 'GO', 520640);
INSERT INTO public.municipio
VALUES (5397, 5206503, 'Cromínia', 'GO', 520650);
INSERT INTO public.municipio
VALUES (5398, 5206602, 'Cumari', 'GO', 520660);
INSERT INTO public.municipio
VALUES (5399, 5206701, 'Damianópolis', 'GO', 520670);
INSERT INTO public.municipio
VALUES (5400, 5206800, 'Damolândia', 'GO', 520680);
INSERT INTO public.municipio
VALUES (5401, 5206909, 'Davinópolis', 'GO', 520690);
INSERT INTO public.municipio
VALUES (5402, 5207105, 'Diorama', 'GO', 520710);
INSERT INTO public.municipio
VALUES (5403, 5207253, 'Doverlândia', 'GO', 520725);
INSERT INTO public.municipio
VALUES (5404, 5207352, 'Edealina', 'GO', 520735);
INSERT INTO public.municipio
VALUES (5405, 5207402, 'Edéia', 'GO', 520740);
INSERT INTO public.municipio
VALUES (5406, 5207501, 'Estrela do Norte', 'GO', 520750);
INSERT INTO public.municipio
VALUES (5407, 5207535, 'Faina', 'GO', 520753);
INSERT INTO public.municipio
VALUES (5408, 5207600, 'Fazenda Nova', 'GO', 520760);
INSERT INTO public.municipio
VALUES (5409, 5207808, 'Firminópolis', 'GO', 520780);
INSERT INTO public.municipio
VALUES (5410, 5207907, 'Flores de Goiás', 'GO', 520790);
INSERT INTO public.municipio
VALUES (5411, 5208004, 'Formosa', 'GO', 520800);
INSERT INTO public.municipio
VALUES (5412, 5208103, 'Formoso', 'GO', 520810);
INSERT INTO public.municipio
VALUES (5413, 5208152, 'Gameleira de Goiás', 'GO', 520815);
INSERT INTO public.municipio
VALUES (5414, 5208301, 'Divinópolis de Goiás', 'GO', 520830);
INSERT INTO public.municipio
VALUES (5415, 5208400, 'Goianápolis', 'GO', 520840);
INSERT INTO public.municipio
VALUES (5416, 5208509, 'Goiandira', 'GO', 520850);
INSERT INTO public.municipio
VALUES (5417, 5208608, 'Goianésia', 'GO', 520860);
INSERT INTO public.municipio
VALUES (5418, 5208707, 'Goiânia', 'GO', 520870);
INSERT INTO public.municipio
VALUES (5419, 5208806, 'Goianira', 'GO', 520880);
INSERT INTO public.municipio
VALUES (5420, 5208905, 'Goiás', 'GO', 520890);
INSERT INTO public.municipio
VALUES (5421, 5209101, 'Goiatuba', 'GO', 520910);
INSERT INTO public.municipio
VALUES (5422, 5209150, 'Gouvelândia', 'GO', 520915);
INSERT INTO public.municipio
VALUES (5423, 5209200, 'Guapó', 'GO', 520920);
INSERT INTO public.municipio
VALUES (5424, 5209291, 'Guaraíta', 'GO', 520929);
INSERT INTO public.municipio
VALUES (5425, 5209408, 'Guarani de Goiás', 'GO', 520940);
INSERT INTO public.municipio
VALUES (5426, 5209457, 'Guarinos', 'GO', 520945);
INSERT INTO public.municipio
VALUES (5427, 5209606, 'Heitoraí', 'GO', 520960);
INSERT INTO public.municipio
VALUES (5428, 5209705, 'Hidrolândia', 'GO', 520970);
INSERT INTO public.municipio
VALUES (5429, 5209804, 'Hidrolina', 'GO', 520980);
INSERT INTO public.municipio
VALUES (5430, 5209903, 'Iaciara', 'GO', 520990);
INSERT INTO public.municipio
VALUES (5431, 5209937, 'Inaciolândia', 'GO', 520993);
INSERT INTO public.municipio
VALUES (5432, 5209952, 'Indiara', 'GO', 520995);
INSERT INTO public.municipio
VALUES (5433, 5210000, 'Inhumas', 'GO', 521000);
INSERT INTO public.municipio
VALUES (5434, 5210109, 'Ipameri', 'GO', 521010);
INSERT INTO public.municipio
VALUES (5435, 5210158, 'Ipiranga de Goiás', 'GO', 521015);
INSERT INTO public.municipio
VALUES (5436, 5210208, 'Iporá', 'GO', 521020);
INSERT INTO public.municipio
VALUES (5437, 5210307, 'Israelândia', 'GO', 521030);
INSERT INTO public.municipio
VALUES (5438, 5210406, 'Itaberaí', 'GO', 521040);
INSERT INTO public.municipio
VALUES (5439, 5210562, 'Itaguari', 'GO', 521056);
INSERT INTO public.municipio
VALUES (5440, 5210604, 'Itaguaru', 'GO', 521060);
INSERT INTO public.municipio
VALUES (5441, 5210802, 'Itajá', 'GO', 521080);
INSERT INTO public.municipio
VALUES (5442, 5210901, 'Itapaci', 'GO', 521090);
INSERT INTO public.municipio
VALUES (5443, 5211008, 'Itapirapuã', 'GO', 521100);
INSERT INTO public.municipio
VALUES (5444, 5211206, 'Itapuranga', 'GO', 521120);
INSERT INTO public.municipio
VALUES (5445, 5211305, 'Itarumã', 'GO', 521130);
INSERT INTO public.municipio
VALUES (5446, 5211404, 'Itauçu', 'GO', 521140);
INSERT INTO public.municipio
VALUES (5447, 5211503, 'Itumbiara', 'GO', 521150);
INSERT INTO public.municipio
VALUES (5448, 5211602, 'Ivolândia', 'GO', 521160);
INSERT INTO public.municipio
VALUES (5449, 5211701, 'Jandaia', 'GO', 521170);
INSERT INTO public.municipio
VALUES (5450, 5211800, 'Jaraguá', 'GO', 521180);
INSERT INTO public.municipio
VALUES (5451, 5211909, 'Jataí', 'GO', 521190);
INSERT INTO public.municipio
VALUES (5452, 5212006, 'Jaupaci', 'GO', 521200);
INSERT INTO public.municipio
VALUES (5453, 5212055, 'Jesúpolis', 'GO', 521205);
INSERT INTO public.municipio
VALUES (5454, 5212105, 'Joviânia', 'GO', 521210);
INSERT INTO public.municipio
VALUES (5455, 5212204, 'Jussara', 'GO', 521220);
INSERT INTO public.municipio
VALUES (5456, 5212253, 'Lagoa Santa', 'GO', 521225);
INSERT INTO public.municipio
VALUES (5457, 5212303, 'Leopoldo de Bulhões', 'GO', 521230);
INSERT INTO public.municipio
VALUES (5458, 5212501, 'Luziânia', 'GO', 521250);
INSERT INTO public.municipio
VALUES (5459, 5212600, 'Mairipotaba', 'GO', 521260);
INSERT INTO public.municipio
VALUES (5460, 5212709, 'Mambaí', 'GO', 521270);
INSERT INTO public.municipio
VALUES (5461, 5212808, 'Mara Rosa', 'GO', 521280);
INSERT INTO public.municipio
VALUES (5462, 5212907, 'Marzagão', 'GO', 521290);
INSERT INTO public.municipio
VALUES (5463, 5212956, 'Matrinchã', 'GO', 521295);
INSERT INTO public.municipio
VALUES (5464, 5213004, 'Maurilândia', 'GO', 521300);
INSERT INTO public.municipio
VALUES (5465, 5213053, 'Mimoso de Goiás', 'GO', 521305);
INSERT INTO public.municipio
VALUES (5466, 5213087, 'Minaçu', 'GO', 521308);
INSERT INTO public.municipio
VALUES (5467, 5213103, 'Mineiros', 'GO', 521310);
INSERT INTO public.municipio
VALUES (5468, 5213400, 'Moiporá', 'GO', 521340);
INSERT INTO public.municipio
VALUES (5469, 5213509, 'Monte Alegre de Goiás', 'GO', 521350);
INSERT INTO public.municipio
VALUES (5470, 5213707, 'Montes Claros de Goiás', 'GO', 521370);
INSERT INTO public.municipio
VALUES (5471, 5213756, 'Montividiu', 'GO', 521375);
INSERT INTO public.municipio
VALUES (5472, 5213772, 'Montividiu do Norte', 'GO', 521377);
INSERT INTO public.municipio
VALUES (5473, 5213806, 'Morrinhos', 'GO', 521380);
INSERT INTO public.municipio
VALUES (5474, 5213855, 'Morro Agudo de Goiás', 'GO', 521385);
INSERT INTO public.municipio
VALUES (5475, 5213905, 'Mossâmedes', 'GO', 521390);
INSERT INTO public.municipio
VALUES (5476, 5214002, 'Mozarlândia', 'GO', 521400);
INSERT INTO public.municipio
VALUES (5477, 5214051, 'Mundo Novo', 'GO', 521405);
INSERT INTO public.municipio
VALUES (5478, 5214101, 'Mutunópolis', 'GO', 521410);
INSERT INTO public.municipio
VALUES (5479, 5214408, 'Nazário', 'GO', 521440);
INSERT INTO public.municipio
VALUES (5480, 5214507, 'Nerópolis', 'GO', 521450);
INSERT INTO public.municipio
VALUES (5481, 5214606, 'Niquelândia', 'GO', 521460);
INSERT INTO public.municipio
VALUES (5482, 5214705, 'Nova América', 'GO', 521470);
INSERT INTO public.municipio
VALUES (5483, 5214804, 'Nova Aurora', 'GO', 521480);
INSERT INTO public.municipio
VALUES (5484, 5214838, 'Nova Crixás', 'GO', 521483);
INSERT INTO public.municipio
VALUES (5485, 5214861, 'Nova Glória', 'GO', 521486);
INSERT INTO public.municipio
VALUES (5486, 5214879, 'Nova Iguaçu de Goiás', 'GO', 521487);
INSERT INTO public.municipio
VALUES (5487, 5214903, 'Nova Roma', 'GO', 521490);
INSERT INTO public.municipio
VALUES (5488, 5215009, 'Nova Veneza', 'GO', 521500);
INSERT INTO public.municipio
VALUES (5489, 5215207, 'Novo Brasil', 'GO', 521520);
INSERT INTO public.municipio
VALUES (5490, 5215231, 'Novo Gama', 'GO', 521523);
INSERT INTO public.municipio
VALUES (5491, 5215256, 'Novo Planalto', 'GO', 521525);
INSERT INTO public.municipio
VALUES (5492, 5215306, 'Orizona', 'GO', 521530);
INSERT INTO public.municipio
VALUES (5493, 5215405, 'Ouro Verde de Goiás', 'GO', 521540);
INSERT INTO public.municipio
VALUES (5495, 5215603, 'Padre Bernardo', 'GO', 521560);
INSERT INTO public.municipio
VALUES (5496, 5215652, 'Palestina de Goiás', 'GO', 521565);
INSERT INTO public.municipio
VALUES (5497, 5215702, 'Palmeiras de Goiás', 'GO', 521570);
INSERT INTO public.municipio
VALUES (5498, 5215801, 'Palmelo', 'GO', 521580);
INSERT INTO public.municipio
VALUES (5499, 5215900, 'Palminópolis', 'GO', 521590);
INSERT INTO public.municipio
VALUES (5500, 5216007, 'Panamá', 'GO', 521600);
INSERT INTO public.municipio
VALUES (5501, 5216304, 'Paranaiguara', 'GO', 521630);
INSERT INTO public.municipio
VALUES (5502, 5216403, 'Paraúna', 'GO', 521640);
INSERT INTO public.municipio
VALUES (5503, 5216452, 'Perolândia', 'GO', 521645);
INSERT INTO public.municipio
VALUES (5504, 5216809, 'Petrolina de Goiás', 'GO', 521680);
INSERT INTO public.municipio
VALUES (5505, 5216908, 'Pilar de Goiás', 'GO', 521690);
INSERT INTO public.municipio
VALUES (5506, 5217104, 'Piracanjuba', 'GO', 521710);
INSERT INTO public.municipio
VALUES (5507, 5217203, 'Piranhas', 'GO', 521720);
INSERT INTO public.municipio
VALUES (5508, 5217302, 'Pirenópolis', 'GO', 521730);
INSERT INTO public.municipio
VALUES (5509, 5217401, 'Pires do Rio', 'GO', 521740);
INSERT INTO public.municipio
VALUES (5510, 5217609, 'Planaltina', 'GO', 521760);
INSERT INTO public.municipio
VALUES (5511, 5217708, 'Pontalina', 'GO', 521770);
INSERT INTO public.municipio
VALUES (5512, 5218003, 'Porangatu', 'GO', 521800);
INSERT INTO public.municipio
VALUES (5513, 5218052, 'Porteirão', 'GO', 521805);
INSERT INTO public.municipio
VALUES (5514, 5218102, 'Portelândia', 'GO', 521810);
INSERT INTO public.municipio
VALUES (5515, 5218300, 'Posse', 'GO', 521830);
INSERT INTO public.municipio
VALUES (5516, 5218391, 'Professor Jamil', 'GO', 521839);
INSERT INTO public.municipio
VALUES (5517, 5218508, 'Quirinópolis', 'GO', 521850);
INSERT INTO public.municipio
VALUES (5518, 5218607, 'Rialma', 'GO', 521860);
INSERT INTO public.municipio
VALUES (5519, 5218706, 'Rianápolis', 'GO', 521870);
INSERT INTO public.municipio
VALUES (5520, 5218789, 'Rio Quente', 'GO', 521878);
INSERT INTO public.municipio
VALUES (5521, 5218805, 'Rio Verde', 'GO', 521880);
INSERT INTO public.municipio
VALUES (5522, 5218904, 'Rubiataba', 'GO', 521890);
INSERT INTO public.municipio
VALUES (5523, 5219001, 'Sanclerlândia', 'GO', 521900);
INSERT INTO public.municipio
VALUES (5524, 5219100, 'Santa Bárbara de Goiás', 'GO', 521910);
INSERT INTO public.municipio
VALUES (5525, 5219209, 'Santa Cruz de Goiás', 'GO', 521920);
INSERT INTO public.municipio
VALUES (5526, 5219258, 'Santa Fé de Goiás', 'GO', 521925);
INSERT INTO public.municipio
VALUES (5527, 5219308, 'Santa Helena de Goiás', 'GO', 521930);
INSERT INTO public.municipio
VALUES (5528, 5219357, 'Santa Isabel', 'GO', 521935);
INSERT INTO public.municipio
VALUES (5529, 5219407, 'Santa Rita do Araguaia', 'GO', 521940);
INSERT INTO public.municipio
VALUES (5530, 5219456, 'Santa Rita do Novo Destino', 'GO', 521945);
INSERT INTO public.municipio
VALUES (5531, 5219506, 'Santa Rosa de Goiás', 'GO', 521950);
INSERT INTO public.municipio
VALUES (5532, 5219605, 'Santa Tereza de Goiás', 'GO', 521960);
INSERT INTO public.municipio
VALUES (5533, 5219704, 'Santa Terezinha de Goiás', 'GO', 521970);
INSERT INTO public.municipio
VALUES (5534, 5219712, 'Santo Antônio da Barra', 'GO', 521971);
INSERT INTO public.municipio
VALUES (5535, 5219738, 'Santo Antônio de Goiás', 'GO', 521973);
INSERT INTO public.municipio
VALUES (5536, 5219753, 'Santo Antônio do Descoberto', 'GO', 521975);
INSERT INTO public.municipio
VALUES (5537, 5219803, 'São Domingos', 'GO', 521980);
INSERT INTO public.municipio
VALUES (5538, 5219902, 'São Francisco de Goiás', 'GO', 521990);
INSERT INTO public.municipio
VALUES (5539, 5220009, 'São João D''Aliança', 'GO', 522000);
INSERT INTO public.municipio
VALUES (5540, 5220058, 'São João da Paraúna', 'GO', 522005);
INSERT INTO public.municipio
VALUES (5541, 5220108, 'São Luís de Montes Belos', 'GO', 522010);
INSERT INTO public.municipio
VALUES (5542, 5220157, 'São Luíz do Norte', 'GO', 522015);
INSERT INTO public.municipio
VALUES (5543, 5220207, 'São Miguel do Araguaia', 'GO', 522020);
INSERT INTO public.municipio
VALUES (5544, 5220264, 'São Miguel do Passa Quatro', 'GO', 522026);
INSERT INTO public.municipio
VALUES (5545, 5220280, 'São Patrício', 'GO', 522028);
INSERT INTO public.municipio
VALUES (5546, 5220405, 'São Simão', 'GO', 522040);
INSERT INTO public.municipio
VALUES (5547, 5220454, 'Senador Canedo', 'GO', 522045);
INSERT INTO public.municipio
VALUES (5548, 5220504, 'Serranópolis', 'GO', 522050);
INSERT INTO public.municipio
VALUES (5549, 5220603, 'Silvânia', 'GO', 522060);
INSERT INTO public.municipio
VALUES (5550, 5220686, 'Simolândia', 'GO', 522068);
INSERT INTO public.municipio
VALUES (5551, 5220702, 'Sítio D''Abadia', 'GO', 522070);
INSERT INTO public.municipio
VALUES (5552, 5221007, 'Taquaral de Goiás', 'GO', 522100);
INSERT INTO public.municipio
VALUES (5553, 5221080, 'Teresina de Goiás', 'GO', 522108);
INSERT INTO public.municipio
VALUES (5554, 5221197, 'Terezópolis de Goiás', 'GO', 522119);
INSERT INTO public.municipio
VALUES (5555, 5221304, 'Três Ranchos', 'GO', 522130);
INSERT INTO public.municipio
VALUES (5556, 5221403, 'Trindade', 'GO', 522140);
INSERT INTO public.municipio
VALUES (5557, 5221452, 'Trombas', 'GO', 522145);
INSERT INTO public.municipio
VALUES (5558, 5221502, 'Turvânia', 'GO', 522150);
INSERT INTO public.municipio
VALUES (5559, 5221551, 'Turvelândia', 'GO', 522155);
INSERT INTO public.municipio
VALUES (5560, 5221577, 'Uirapuru', 'GO', 522157);
INSERT INTO public.municipio
VALUES (5561, 5221601, 'Uruaçu', 'GO', 522160);
INSERT INTO public.municipio
VALUES (5562, 5221700, 'Uruana', 'GO', 522170);
INSERT INTO public.municipio
VALUES (5563, 5221809, 'Urutaí', 'GO', 522180);
INSERT INTO public.municipio
VALUES (5564, 5221858, 'Valparaíso de Goiás', 'GO', 522185);
INSERT INTO public.municipio
VALUES (5565, 5221908, 'Varjão', 'GO', 522190);
INSERT INTO public.municipio
VALUES (5566, 5222005, 'Vianópolis', 'GO', 522200);
INSERT INTO public.municipio
VALUES (5567, 5222054, 'Vicentinópolis', 'GO', 522205);
INSERT INTO public.municipio
VALUES (5568, 5222203, 'Vila Boa', 'GO', 522220);
INSERT INTO public.municipio
VALUES (5569, 5222302, 'Vila Propício', 'GO', 522230);
INSERT INTO public.municipio
VALUES (5570, 5300108, 'Brasília', 'DF', 530010);

INSERT INTO public.tipo_pessoa
VALUES (3, 'PJ');
INSERT INTO public.tipo_pessoa
VALUES (1, 'PF');

SELECT pg_catalog.setval('public.estado_id_seq', 27, true);


SELECT pg_catalog.setval('public.municipio_id_seq', 5570, true);


ALTER TABLE ONLY public.estado
  ADD CONSTRAINT estado_pkey PRIMARY KEY (id);


ALTER TABLE ONLY public.lista_cbo
  ADD CONSTRAINT lista_cbo_pk PRIMARY KEY (co_cbo);


ALTER TABLE ONLY public.municipio
  ADD CONSTRAINT municipio_pkey PRIMARY KEY (id);

ALTER TABLE ONLY public.tipo_pessoa
  ADD CONSTRAINT tipo_pessoa_pk PRIMARY KEY (id);

CREATE UNIQUE INDEX estado_uf_uindex ON public.estado USING btree (uf);

CREATE UNIQUE INDEX municipio_codigo_mun_datasus_uindex ON public.municipio USING btree (codigo_mun_datasus);


ALTER TABLE ONLY public.municipio
  ADD CONSTRAINT municipio_estado_uf_fk FOREIGN KEY (uf) REFERENCES public.estado (uf);


