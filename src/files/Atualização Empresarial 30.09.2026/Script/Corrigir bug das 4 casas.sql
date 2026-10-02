UPDATE emp_produto
SET
  prd_pcovenda_emb1 = CAST((prd_pcovenda_emb1 + 0.5) AS BIGINT)
WHERE
  (prd_pcovenda_emb1 * 10000) - CAST(prd_pcovenda_emb1 * 10000 AS BIGINT) = 0
  AND (prd_pcovenda_emb1 * 1000) - CAST(prd_pcovenda_emb1 * 1000 AS BIGINT) <> 0;

