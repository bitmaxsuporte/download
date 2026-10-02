update emp_produto p
set p.prd_ncm = '15099090'
where p.prd_nomecomp LIKE '%AZEITE%'
and  p.prd_ncm is null
