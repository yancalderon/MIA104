create table usrpwc.sa_inco_nivel_departamento_2 nologging as
SELECT * FROM sa_inco_nivel_departamento a
join usrpwc.mef_m_departamento_ejecutora b on a.departamento = b.departamento_ejecutora_nombre
;

insert into usrpwc.sa_inco_nivel_departamento_2 
with a as(
SELECT nivel_gobierno, avg(p_inco_2024) p_inco_2024, avg(p_inco_2023) p_inco_2023, avg(p_inco_2022) p_inco_2022, max(n_ranking) n_ranking
, max(rango_puntaje) rango_puntaje
FROM sa_inco_nivel_departamento a
where departamento in ('LIMA METROPOLITANA','LIMA PROVINCIAS')
group by nivel_gobierno
)
select 'LIMA', nivel_gobierno, p_inco_2024
, p_inco_2023, p_inco_2022, n_ranking, rango_puntaje, 15, 'LIMA'
from a 

--AJUSTES
update sa_inco_nivel_departamento_2 
set nivel = case nivel_gobierno when 'GOBIERNO NACIONAL' then 1
                                                            when 'GOBIERNO REGIONAL' then 2
                                                            when 'GOBIERNO LOCAL' then 3 end;
                                                              
alter table usrpwc.sa_inco_nivel_departamento_2 add P_INCO_AVG float;
--Sacar promedio
update sa_inco_nivel_departamento_2 
set p_inco_avg = round((p_inco_2024+p_inco_2023+p_inco_2022)/3,2)
select * from sa_inco_nivel_departamento_2;
