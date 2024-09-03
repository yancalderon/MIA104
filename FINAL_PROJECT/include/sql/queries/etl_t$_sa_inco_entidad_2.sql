select * 
from sa_inco_entidad where entidad like '%COCHABAMBA%';
select * from usrpwc.mef_m_ejecutora
where ejecutora_nombre like '%COCHABAMBA%';


SELECT * FROM usrpwc.mef_m_ejecutora A
LEFT JOIN sa_inco_entidad B ON A.EJECUTORA_NOMBRE = B.ENTIDAD
WHERE b.entidad IS NULL


-- LIMPIEZA
select * from usrpwc.mef_m_ejecutora 
where ejecutora_nombre like '%Ã%'
--
update usrpwc.mef_m_ejecutora 
set ejecutora_nombre = REPLACE(ejecutora_nombre, 'Ã‘', 'Ñ')
where ejecutora_nombre like '%Ã‘%';

-- DEPARTAMENTO
--2374 - unicos registros
create table t$_mef_m_ejecutora_dep as
with a as(
select distinct ejecutora, departamento_ejecutora_nombre
from ds_gasto_3
), b as(
SELECT sec_ejec, 
ejecutora, 
ejecutora_nombre
FROM usrpwc.mef_m_ejecutora A
LEFT JOIN sa_inco_entidad B ON A.EJECUTORA_NOMBRE = B.ENTIDAD
WHERE b.entidad IS NULL
)
select sec_ejec, b.ejecutora, ejecutora_nombre, departamento_ejecutora_nombre, 
ejecutora_nombre || ' - ' || departamento_ejecutora_nombre as ejecutora_nombre_departamento
from b
join a on b.sec_ejec = a.ejecutora;

select * from sa_inco_entidad

select * from t$_mef_m_ejecutora_dep

create table t$_sa_inco_entidad_2 as
SELECT sec_ejec
       , ejecutora
       , ejecutora_nombre
       , cod_entidad
       , entidad
       , puntaje_inco_2024 FROM usrpwc.mef_m_ejecutora A
LEFT JOIN sa_inco_entidad B ON A.EJECUTORA_NOMBRE = B.ENTIDAD;

select * from t$_sa_inco_entidad_2 a
join t$_mef_m_ejecutora_dep b on a.ejecutora = b.ejecutora_nombre_departamento
where entidad is null;

create table t4_mef_m_ejecutora_dep_final as
with a as(
select a.*, b.ejecutora_nombre_departamento 
from t$_sa_inco_entidad_2 a
left join t$_mef_m_ejecutora_dep b on a.sec_ejec = b.sec_ejec
where a.entidad is null
) select * from a;
select * from t4_mef_m_ejecutora_dep_final
select * from t$_sa_inco_entidad_2 where sec_ejec = 1303
select * from t$_sa_inco_entidad_2 a 
left join t4_mef_m_ejecutora_dep_final b on a.
where entidad is null

create table t$_mef_m_ejecutora_dep_final_final as
select sec_ejec, ejecutora, ejecutora_nombre, ejecutora_nombre_departamento,
b.cod_entidad, b.entidad, b.puntaje_inco_2024 from t4_mef_m_ejecutora_dep_final a
left join sa_inco_entidad b on a.ejecutora_nombre_departamento = b.entidad
where b.puntaje_inco_2024 is not null;

select * from sa_inco_entidad where
entidad like '%MUNICIPALIDAD DISTRITAL DE HUALLANCA%'

select *
 from T$_sa_inco_entidad_2
where puntaje_inco_2024 is null

update t$_sa_inco_entidad_2 a
set puntaje_inco_2024 = b.puntaje_inco_2024
where puntaje_inco_2024 is null
and exists (select 1 from t$_mef_m_ejecutora_dep_final_final b
           join t$_sa_inco_entidad_2 a on b.sec_ejec = b.sec_ejec)
           
           
select * from t4_mef_m_ejecutora_dep_final;

select * from t$_mef_m_ejecutora_dep_final_final;

UPDATE t$_sa_inco_entidad_2 a
SET a.puntaje_inco_2024 = (
    SELECT b.puntaje_inco_2024
    FROM t$_mef_m_ejecutora_dep_final_final b
    WHERE b.sec_ejec = a.sec_ejec
)
WHERE a.puntaje_inco_2024 is null AND EXISTS (
    SELECT 1
    FROM t$_mef_m_ejecutora_dep_final_final b
    WHERE b.sec_ejec = a.sec_ejec
);


select COUNT(1) from t$_sa_inco_entidad_2
where puntaje_inco_2024 is null --for update
and ejecutora_nombre like '%MANCOMUNIDAD MUNICIPAL%';