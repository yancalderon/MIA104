create table ds_gasto_3 nologging as 
select /*+ PARALLEL(8) */
a.anio, 
a.nivel, 
a.nivel_gobierno, 
a.dpto, 
a.departamento_ejecutora_nombre, 
a.funcion, 
a.funcion_nombre, 
a.pia, 
a.pim, 
a.devengado, 
a.ip, 
a.cambio_gobierno_nacional, 
a.nro_presidentes_x_ano, 
a.fenomeno_nino, 
a.pandemia, 
a.cambio_gobierno_regional_local, 
a.eleccion_regional_local, 
a.tipo_gobierno_nacional, 
a.nro_conflicto_social_x_ano, 
a.inflacion_anual, 
a.proyecto, 
a.ejecutora, 
a.proyecto_edad_neta, 
a.proyecto_edad_bruta, 
b.igeip_ejecucion,
c.p_inco_avg,
d.neje_puntajeiri,
e.nro_ejecutoras as nro_ejecutoras_x_proyecto,
a.avance, 
a.clase
 from ds_gasto_2 a
left join sa_igeip_2 b on b.departamento_ejecutora = a.dpto and b.nivel = a.nivel
left join sa_inco_nivel_departamento_2 c on c.DEPARTAMENTO_EJECUTORA = a.dpto and c.nivel = a.nivel
left join sa_iri_ejecutora_2 d on d.ceje_codsiaf = a.ejecutora 
left join t$_nro_ejecutoras_x_proyecto e on e.proyecto = a.proyecto

UPDATE DS_GASTO_3 A
SET A.NEJE_PUNTAJEIRI = (
    SELECT B.NDEP_PUNTAJEIRI
    FROM SA_IRI_DEPARTAMENTO_2 B
    WHERE A.DPTO = B.DEPARTAMENTO_ID AND A.FUNCION = B.FUNCION_ID
     AND A.NIVEL = B.NIVEL
)
WHERE EXISTS (
    SELECT 1
    FROM SA_IRI_DEPARTAMENTO_2 B
    WHERE  A.DPTO = B.DEPARTAMENTO_ID AND A.FUNCION = B.FUNCION_ID
     AND A.NIVEL = B.NIVEL
) AND A.NEJE_PUNTAJEIRI IS NULL;

create table usrpwc.depa as
SELECT DEPARTAMENTO_id, AVG(NDEP_PUNTAJEIRI) NDEP_PUNTAJEIRI
FROM SA_IRI_DEPARTAMENTO_2 B
GROUP BY DEPARTAMENTO_ID

update DS_GASTO_3 A
SET A.NEJE_PUNTAJEIRI = (
    SELECT B.NDEP_PUNTAJEIRI
    FROM depa b
    WHERE A.DPTO = B.DEPARTAMENTO_ID )
WHERE EXISTS (
    SELECT 1
    FROM depa B
    WHERE  A.DPTO = B.DEPARTAMENTO_ID 
) AND A.NEJE_PUNTAJEIRI IS NULL;


with a as(
select * from ds_gasto_3
where devengado >=0
)select * from a
where PIM>=DEVENGADO
;