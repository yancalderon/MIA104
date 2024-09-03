--select * from SA_IRI_EJECUTORA --for update;

create table sa_iri_ejecutora_2 nologging as
select ceje_codsiaf, avg(neje_puntajeiri) neje_puntajeiri
from sa_iri_ejecutora
group by ceje_codsiaf;

create table sa_igeip_2 nologging as
select departamento, 
nivel, 
nivel_gob, 
igeip_ejecucion,
departamento_ejecutora
 from mef_m_departamento_ejecutora a
left join usrpwc.sa_igeip b on departamento_ejecutora_nombre = b.departamento;

--############ Nro_ejecutoras_x_proyecto ################---
create table t$_nro_ejecutoras_x_proyecto nologging as
with a as(
select distinct proyecto, ejecutora
from ds_gasto_2
)select proyecto, count(1) nro_ejecutoras
from a
group by proyecto;

create table sa_igeip_2 nologging as
select *
 from SA_IRI_DEPARTAMENTO B
left join usrpwc.SA_IRI_DEPARTAMENTO A on departamento_ejecutora_nombre = b.departamento
LEFT JOIN usrpwc.Mef_m_Departamento_Ejecutora C on C.DEPARTAMENTO_EJECUTORA_NOMBRE = b.departamento

CREATE TABLE usrpwc.SA_IRI_DEPARTAMENTO_2 NOLOGGING AS
select A.*, B.FUNCION FUNCION_ID, C.DEPARTAMENTO_EJECUTORA DEPARTAMENTO_ID
 from usrpwc.SA_IRI_DEPARTAMENTO A
JOIN usrpwc.Mef_m_Departamento_Ejecutora C on C.DEPARTAMENTO_EJECUTORA_NOMBRE = a.departamento
Join usrpwc.MEF_C_FUNCION b on B.FUNCION_NOMBRE = a.FUNCION;

INSERT INTO usrpwc.SA_IRI_DEPARTAMENTO
WITH LIMA AS(
SELECT *
FROM usrpwc.SA_IRI_DEPARTAMENTO
WHERE DEPARTAMENTO LIKE '%LIMA%'
)SELECT 'LIMA', FUNCION, NIVEL, NIVEL_GOBIERNO, AVG(NDEP_PUNTAJEIRI) AS NDEP_PUNTAJEIRI FROM LIMA
GROUP BY FUNCION, NIVEL, NIVEL_GOBIERNO
