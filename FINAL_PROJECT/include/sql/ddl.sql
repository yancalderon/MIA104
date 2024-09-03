-- Create table
create table truncate table sa_gasto_all
(
  ano_eje                       NUMBER,
  mes_eje                       NUMBER,
  nivel_gobierno                VARCHAR2(2),
  nivel_gobierno_nombre         VARCHAR2(30),
  sector                        NUMBER,
  sector_nombre                 VARCHAR2(50),
  pliego                        NUMBER,
  pliego_nombre                 VARCHAR2(128),
  sec_ejec                      NUMBER,
  ejecutora                     NUMBER,
  ejecutora_nombre              VARCHAR2(100),
  departamento_ejecutora        NUMBER,
  departamento_ejecutora_nombre VARCHAR2(48),
  provincia_ejecutora           NUMBER,
  provincia_ejecutora_nombre    VARCHAR2(64),
  distrito_ejecutora            NUMBER,
  distrito_ejecutora_nombre     VARCHAR2(64),
  sec_func                      NUMBER,
  programa_ppto                 NUMBER,
  programa_ppto_nombre          VARCHAR2(128),
  tipo_act_proy                 NUMBER,
  tipo_act_proy_nombre          VARCHAR2(16),
  producto_proyecto             NUMBER,
  producto_proyecto_nombre      VARCHAR2(512),
  actividad_accion_obra         NUMBER,
  actividad_accion_obra_nombre  VARCHAR2(256),
  funcion                       NUMBER,
  funcion_nombre                VARCHAR2(64),
  division_funcional            NUMBER,
  division_funcional_nombre     VARCHAR2(200),
  grupo_funcional               NUMBER,
  grupo_funcional_nombre        VARCHAR2(200),
  meta                          NUMBER,
  finalidad                     NUMBER,
  meta_nombre                   VARCHAR2(512),
  departamento_meta             NUMBER,
  departamento_meta_nombre      VARCHAR2(48),
  fuente_financiamiento         NUMBER,
  fuente_financiamiento_nombre  VARCHAR2(64),
  rubro                         NUMBER,
  rubro_nombre                  VARCHAR2(128),
  tipo_recurso                  VARCHAR2(8),
  tipo_recurso_nombre           VARCHAR2(128),
  categoria_gasto               NUMBER,
  categoria_gasto_nombre        VARCHAR2(32),
  tipo_transaccion              NUMBER,
  generica                      NUMBER,
  generica_nombre               VARCHAR2(128),
  subgenerica                   NUMBER,
  subgenerica_nombre            VARCHAR2(128),
  subgenerica_det               NUMBER,
  subgenerica_det_nombre        VARCHAR2(128),
  especifica                    NUMBER,
  especifica_nombre             VARCHAR2(128),
  especifica_det                NUMBER,
  especifica_det_nombre         VARCHAR2(200),
  monto_pia                     FLOAT,
  monto_pim                     float,
  monto_certificado             float,
  monto_comprometido_anual      float,
  monto_comprometido            float,
  monto_devengado               float,
  monto_girado                  float,
  fecha_creacion                DATE default sysdate,
  usuario_creacion              VARCHAR2(30) default user
)
NOPARALLEL
NOLOGGING
PARTITION BY RANGE (ano_eje) (
    PARTITION p_2012 VALUES LESS THAN (2013),
    PARTITION p_2013 VALUES LESS THAN (2014),
    PARTITION p_2014 VALUES LESS THAN (2015),
    PARTITION p_2015 VALUES LESS THAN (2016),
    PARTITION p_2016 VALUES LESS THAN (2017),
    PARTITION p_2017 VALUES LESS THAN (2018),
    PARTITION p_2018 VALUES LESS THAN (2019),
    PARTITION p_2019 VALUES LESS THAN (2020),
    PARTITION p_2020 VALUES LESS THAN (2021),
    PARTITION p_2021 VALUES LESS THAN (2022),
    PARTITION p_2022 VALUES LESS THAN (2023),
    PARTITION p_2023 VALUES LESS THAN (2024),
    PARTITION p_2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN (MAXVALUE)
);



create table SA_IRI_D
(CDEP_DPTOPROYECTO VARCHAR2(48),
NIVEL_GOBIERNO VARCHAR2(32),
P_INCO_2024 FLOAT,
P_INCO_2023 float,
P_INCO_2022 FLOAT,
N_RANKING NUMBER(4),
RANGO_PUNTAJE VARCHAR2(32)
)
;
create table SA_IRI_DEPARTAMENTO
(
departamento varchar2(64),
FUNCION varchar2(256),
NIVEL NUMBER(2),
NIVEL_GOBIERNO VARCHAR2(32),
NDEP_PUNTAJEIRI FLOAT)
nologging
;

create table SA_IGEIP
(departamento varchar2(32),
nivel number(2),
nivel_gob varchar2(8),
IGEIP_EJECUCION float
)nologging
;

CREATE TABLE usrpwc.SA_DETALLE_INVERSIONES (
NIVEL VARCHAR2(3)
,SECTOR VARCHAR2(60)
,ENTIDAD VARCHAR2(129)
,CODIGO_UNICO FLOAT
,CODIGO_SNIP NUMBER
,NOMBRE_INVERSION VARCHAR2(640)
,NOMBRE_OPMI VARCHAR2(160)
,NOMBRE_UF VARCHAR2(164)
,NOMBRE_UEI VARCHAR2(167)
,SEC_EJEC FLOAT
,NOMBRE_UEP VARCHAR2(158)
,ESTADO VARCHAR2(8)
,SITUACION VARCHAR2(17)
,MONTO_VIABLE FLOAT
,COSTO_ACTUALIZADO FLOAT
,CTRL_CONCURR FLOAT
,ALTERNATIVA VARCHAR2(3)
,FECHA_REGISTRO VARCHAR2(23)
,FECHA_VIABILIDAD VARCHAR2(23)
,FUNCION VARCHAR2(57)
,PROGRAMA VARCHAR2(106)
,SUBPROGRAMA VARCHAR2(116)
,MARCO VARCHAR2(10)
,TIPO_INVERSION VARCHAR2(26)
,DES_MODALIDAD VARCHAR2(236)
,REGISTRADO_PMI VARCHAR2(3)
,PMI_AÑO_1 FLOAT
,PMI_AÑO_2 FLOAT
,PMI_AÑO_3 FLOAT
,PMI_AÑO_4 FLOAT
,EXPEDIENTE_TECNICO VARCHAR2(3)
,INFORME_CIERRE VARCHAR2(4)
,TIENE_F9 VARCHAR2(3)
,FEC_REG_F9 VARCHAR2(23)
,ETAPA_F9 VARCHAR2(29)
,PRIMER_DEVENGADO FLOAT
,ULTIMO_DEVENGADO FLOAT
,DEVEN_ACUMUL_AÑO_ANT FLOAT
,DEV_AÑO_ACTUAL FLOAT
,PIA_AÑO_ACTUAL FLOAT
,PIM_AÑO_ACTUAL NUMBER
,DEV_ENE_AÑO_VIG FLOAT
,DEV_FEB_AÑO_VIG FLOAT
,DEV_MAR_AÑO_VIG FLOAT
,DEV_ABR_AÑO_VIG FLOAT
,DEV_MAY_AÑO_VIG FLOAT
,DEV_JUN_AÑO_VIG FLOAT
,DEV_JUL_AÑO_VIG FLOAT
,DEV_AGO_AÑO_VIG FLOAT
,DEV_SET_AÑO_VIG FLOAT
,DEV_OCT_AÑO_VIG FLOAT
,DEV_NOV_AÑO_VIG FLOAT
,DEV_DIC_AÑO_VIG FLOAT
,CERTIF_AÑO_ACTUAL FLOAT
,COMPROM_ANUAL_AÑO_ACTUAL FLOAT
,SALDO_EJECUTAR FLOAT
,TIENE_F8 VARCHAR2(3)
,ETAPA_F8 VARCHAR2(99)
,TIENE_F12B VARCHAR2(3)
,FECHA_ULT_ACT_F12B VARCHAR2(23)
,ULT_PERIODO_REG_F12B VARCHAR2(9)
,TIENE_AVAN_FISICO VARCHAR2(3)
,AVANCE_FISICO FLOAT
,AVANCE_EJECUCION FLOAT
,ULT_FEC_DECLA_ESTIM VARCHAR2(23)
,DES_TIPOLOGIA VARCHAR2(180)
,PROG_ACTUAL_AÑO_ACTUAL FLOAT
,MONTO_VALORIZACION FLOAT
,SANEAMIENTO VARCHAR2(3)
,DEPARTAMENTO VARCHAR2(16)
,PROVINCIA VARCHAR2(42)
,DISTRITO VARCHAR2(44)
,UBIGEO FLOAT
,LATITUD FLOAT
,LONGITUD FLOAT
,FEC_INI_EJECUCION VARCHAR2(23)
,FEC_FIN_EJECUCION VARCHAR2(23)
,FEC_INI_EJEC_FISICA VARCHAR2(23)
,FEC_FIN_EJEC_FISICA VARCHAR2(23)
,BENEFICIARIO FLOAT
,MONTO_ET_F8 FLOAT
,AÑO_PROCESO NUMBER
)NOLOGGING NOPARALLEL
;

CREATE TABLE sa_iri_proyectos (
    CPRI_CODSNIP NUMBER,
    CPRI_CODUNICO NUMBER,
    CPRI_NOMBREPROYECTO VARCHAR2(600),
    NPRY_PUNTAJEIRI NUMBER,
    CPRI_RANGOPUNTAJE VARCHAR2(50),
    NPRY_POSICIONRANKING NUMBER,
    CPRI_GRUPO VARCHAR2(100),
    NPRY_COSTOACTUALIZADO NUMBER,
    CPRI_FLAGRCC VARCHAR2(2),
    CPRI_RANGOINVERSION VARCHAR2(64),
    CPRI_MARCOLEGAL VARCHAR2(20),
    CPRI_MODALIDADEJEC VARCHAR2(20),
    CPRI_DPTOPROYECTO VARCHAR2(100),
    CPRI_FASEPROYECTO VARCHAR2(50),
    CPRI_FUNCPROYECTO VARCHAR2(100),
    CPRI_CODSIAF NUMBER,
    CPRI_NOMBREENTIDAD VARCHAR2(200),
    CPRI_NIVGOBENTIDAD VARCHAR2(50),
    CPRI_UBIDPTOENTIDAD VARCHAR2(100),
    CPRI_AMBITOCONTROL VARCHAR2(100)
);

create table sa_inco_entidad (
cod_entidad number,
entidad varchar2(150),
puntaje_inco_2024 float
)
;