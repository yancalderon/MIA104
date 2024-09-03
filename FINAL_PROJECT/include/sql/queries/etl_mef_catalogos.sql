select distinct funcion
       , funcion_nombre
 from sa_gasto partition (p_2015);
 
 create table mef_m_departamento_ejecutora nologging as 
 with a as(
 select distinct g.departamento_ejecutora
       , g.departamento_ejecutora_nombre
 from sa_gasto g --partition (p_2014)
)select * from a order by departamento_ejecutora asc

create table mef_c_division_funcional nologging as 
 with a as(
 select distinct funcion
        , funcion_nombre
        , division_funcional
        , division_funcional_nombre
        , grupo_funcional
        , grupo_funcional_nombre
 from sa_gasto --partition (p_2014)
)select * from a order by funcion, division_funcional, grupo_funcional asc








 
with a as(
select ano_eje, --ejecutora,
 sum(monto_pim) as monto_pim
 from sa_gasto partition (p_2014)
group by ano_eje--, ejecutora
)select * from a where monto_pim = 0

select *
 from sa_gasto partition (p_2014);
 
--PIM 0, devengado <> 0
select * from gasto_integrado_nonan
where pim = 0 and devengado = 0 and pia = 0 and anio > 2013
order by anio asc
group by estado
