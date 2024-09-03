drop table t$_gasto_integrado_nonan_t1 ;
create table t$_gasto_integrado_nonan_t1 nologging as
select anio, 
nivel, 
dpto, 
funcion, 
--dfuncional, 
--gfuncional, 
--activ_accion_obra, 
sum(pia) as pia, 
sum(pim) as pim, 
sum(certificado) as certificado, 
--canual, 
--cmensual, 
sum(devengado) as devengado, 
ip, 
cambio_gobierno_nacional, 
nro_presidentes_x_ano, 
fenomeno_nino, 
pandemia, 
cambio_gobierno_regional_local, 
eleccion_regional_local, 
tipo_gobierno_nacional, 
nro_conflicto_social_x_ano, 
inflacion_anual, 
proyecto, 
ejecutora
--estado
from gasto_integrado_nonan
group by anio, 
nivel, 
dpto, 
funcion, 
ip, 
cambio_gobierno_nacional, 
nro_presidentes_x_ano, 
fenomeno_nino, 
pandemia, 
cambio_gobierno_regional_local, 
eleccion_regional_local, 
tipo_gobierno_nacional, 
nro_conflicto_social_x_ano, 
inflacion_anual, 
proyecto, 
ejecutora
--estado
;

create table t$_t2_anio_proy_ejec_dupli as
with a as(
)select sum(n) from a

--T2: Seleccionar solo los registro con PIM > 0.
create table t$_gasto_integrado_nonan_t2 nologging as
select * from t$_gasto_integrado_nonan_t1
where pim>0;

--T3: Eliminar anio-proy-eject que tengan mas de 1 regitro
create table t$_t2_anio_proy_ejec_dupli nologging as
select anio, proyecto, ejecutora, count(1) n
from t$_gasto_integrado_nonan_t2
group by anio, proyecto, ejecutora
having count(1)>1
order by count(1) desc;

create table t$_gasto_integrado_nonan_t3 nologging as
select * from t$_gasto_integrado_nonan_t2 a
WHERE NOT EXISTS (
    SELECT 1
    FROM t$_t2_anio_proy_ejec_dupli b
    WHERE a.proyecto = b.proyecto
    AND a.ejecutora = b.ejecutora
    and a.anio = b.anio
);

create table ds_gasto nologging as
select anio
       , nivel
       , dpto
       , funcion
       , pia
       , pim
       , devengado
       , ip
       , cambio_gobierno_nacional
       , nro_presidentes_x_ano
       , fenomeno_nino
       , pandemia
       , cambio_gobierno_regional_local
       , eleccion_regional_local
       , tipo_gobierno_nacional
       , nro_conflicto_social_x_ano
       , inflacion_anual
       , proyecto
       , ejecutora
       , round(devengado/pim, 4) as avance
       , case when (round(devengado/pim, 4)) >= 0.80 then 1
              else 0 end as clase
from t$_gasto_integrado_nonan_t3

--######## Edad proyecto #######
create table t$_mef_proyecto_edad nologging as 
with a as(
select anio, proyecto, count(1)
 from ds_gasto a
group by anio, proyecto
) select count(1) edad_neta, max(anio) anio_max, min(anio) anio_min, max(anio)-min(anio)+1 edad_bruta, proyecto
from a 
group by proyecto;
 
create table ds_gasto_2 nologging as 
select a.anio, 
a.nivel, 
b.nivel_gobierno,
a.dpto, 
c.departamento_ejecutora_nombre,
a.funcion, 
d.funcion_nombre,
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
e.edad_neta proyecto_edad_neta,
e.edad_bruta proyecto_edad_bruta,
a.avance, 
a.clase
from ds_gasto a
join mef_c_nivel_gobierno b on a.nivel = b.nivel 
join mef_m_departamento_ejecutora c on a.dpto = c.departamento_ejecutora
join mef_c_funcion d on a.funcion = d.funcion
join t$_mef_proyecto_edad e on a.proyecto = e.proyecto


