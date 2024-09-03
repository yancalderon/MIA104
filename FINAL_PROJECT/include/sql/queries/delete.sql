--delete 
with a as(
select * from gasto_integrado_nonan
where pim=0 and pia=0 and devengado=0
)select * from a join mef_c_actividad_accion_obra b on a.activ_accion_obra = b.ACTIVIDAD_ACCION_OBRA  

with a as(
select anio, proyecto, ejecutora, count(1) n
from t$_gasto_integrado_nonan_t3
group by anio, proyecto, ejecutora
having count(1)>1
order by count(1) desc
)select sum(n) from a

select * from gasto_integrado_nonan a where proyecto = 2150000
--join mef_c_funcion b on a.funcion = b.funcion
--join mef_m_ejecutora c on a.ejecutora = c.sec_ejec
where proyecto= 2150000 and a.ejecutora = 1 and anio=2012;

select * from ds_gasto_2;

select count(1) from ds_gasto_2 where devengado > pim 
