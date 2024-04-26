select  p.prd_id as id, p.prd_nomecomp as nome , p.prd_NCM as ncm
from emp_produto p
where p.prd_ncm is null
order by 2
