------------------ INICO DO SCRIPT QUE INSERE DBVER--------------------------
UPDATE DBVER
SET DBVER_VERSAO = '202504161630EMP' ;

COMMIT WORK;

------------------ FIM DO SCRIPT QUE INSERE DBVER--------------------------


----------- INICIO DO TRECHO QUE INSERE O TIPO DO CADASTRO-------------------------------------------------------------
INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'PRODUTO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'PRODUTO'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'COMPOSIÇÃO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'COMPOSIÇÃO'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'KIT', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'KIT'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'SERVIÇO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'SERVIÇO'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'GLP', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'GLP'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'COMBUSTÍVEL', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'COMBUSTÍVEL'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'OUTRO DERIVADO DE PETRÓLEO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'OUTRO DERIVADO DE PETRÓLEO'
);

INSERT INTO EMP_PRODUTO_TIPO (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'MEDICAMENTO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_TIPO WHERE TIPO_DESCRICAO = 'MEDICAMENTO'
);

----------- FIM DO TRECHO QUE INSERE O TIPO DO CADASTRO-------------------------------------------------------------

----------- INICIO DO TRECHO QUE INSERE O SUBTIPO DO CADASTRO-------------------------------------------------------------


INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'MERCADORIA PARA REVENDA', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'MERCADORIA PARA REVENDA'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'MATÉRIA-PRIMA', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'MATÉRIA-PRIMA'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'EMBALAGEM', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'EMBALAGEM'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'PRODUTO EM PROCESSO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'PRODUTO EM PROCESSO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'PRODUTO ACABADO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'PRODUTO ACABADO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'SUBPRODUTO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'SUBPRODUTO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'PRODUTO INTERMEDIÁRIO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'PRODUTO INTERMEDIÁRIO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'MATERIAL DE USO E CONSUMO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'MATERIAL DE USO E CONSUMO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'ATIVO IMOBILIZADO', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'ATIVO IMOBILIZADO'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'OUTROS INSUMOS', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'OUTROS INSUMOS'
);

INSERT INTO EMP_PRODUTO_SUBTIPO (SUBTIPO_DESCRICAO, SUBTIPO_FKSIT_ID)
SELECT 'OUTRAS', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_PRODUTO_SUBTIPO WHERE SUBTIPO_DESCRICAO = 'OUTRAS'
);

----------- FIM DO TRECHO QUE INSERE O SUBTIPO DO CADASTRO-------------------------------------------------------------


-----------INICIO DO TRECHO QUE ATUALIZA O TIPO DE PRODUTO DEFAULT PARA OS NOVOS CAMPOS DE REVENDA-----------------------
SET TERM ^ ;
UPDATE EMP_PRODUTO E
SET
    E.prd_fktipo_id = 1,
    E.prd_fksubtipo_id = 1,
    E.prd_lktipo_nome = 'PRODUTO',
    E.prd_lksubtipo_nome = 'MERCADORIA PARA REVENDA'
WHERE

    E.prd_fktipo_id IS NULL AND
    E.prd_fksubtipo_id IS NULL AND
    E.prd_lktipo_nome IS NULL AND
    E.prd_lksubtipo_nome IS NULL

^
SET TERM; ^

COMMIT WORK;

-----------FIM DO TRECHO QUE ATUALIZA O TIPO DE PRODUTO DEFAULT PARA OS NOVOS CAMPOS DE REVENDA-----------------------

----------- ATUALIZAR NOVO CAMPO DE MOVIMENTA ESTOQUE NA SAÍDA-------------------------------------------
update emp_nfsi i
set i.nfsi_movimenta_estoque = 'T'
where i.nfsi_movimenta_estoque is null;

----------- FIM ATUALIZAR NOVO CAMPO DE MOVIMENTA ESTOQUE NA SAÍDA-------------------------------------------

----------- ATUALIZAR NOVO CAMPO DE MOVIMENTA ESTOQUE NA ENTRADA-------------------------------------------
update emp_entradai i
set i.nfei_movimenta_estoque = 'T'
where i.nfei_movimenta_estoque is null;
----------- FIM ATUALIZAR NOVO CAMPO DE MOVIMENTA ESTOQUE NA ENTRADA-------------------------------------------

------------INICIO DO INSERT QUE POPULA A NOVA TABELA DE AUTORIZADOS A OBTER O XML----------------------
-- Insere o CNPJ/CPF da contabilidade
INSERT INTO EMP_AUTXML (AUT_CNPJCPF, AUT_DTCAD, AUT_FKSIT_ID)
SELECT 
  e.CTD_CNPJCPF, 
  CURRENT_DATE, 
  1
FROM ENT_CONTADOR e
WHERE 
  e.CTD_CNPJCPF IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 
    FROM EMP_AUTXML 
    WHERE AUT_CNPJCPF = e.CTD_CNPJCPF
  );

-- Insere o CNPJ/CPF do contador
INSERT INTO EMP_AUTXML (AUT_CNPJCPF, AUT_DTCAD, AUT_FKSIT_ID)
SELECT 
  e.CTD_CONTAB_CNPJCPF, 
  CURRENT_DATE, 
  1
FROM ENT_CONTADOR e
WHERE 
  e.CTD_CONTAB_CNPJCPF IS NOT NULL
  AND NOT EXISTS (
    SELECT 1 
    FROM EMP_AUTXML 
    WHERE AUT_CNPJCPF = e.CTD_CONTAB_CNPJCPF
  );

  ------------FIM DO INSERT QUE POPULA A NOVA TABELA DE AUTORIZADOS A OBTER O XML----------------------

  update emp_conf_nfe E
  SET E.conf_nfe_serie = '001'
  WHERE E.conf_nfe_serie IS NULL  ;

------------INICIO PADRONIZAÇÃO CNPJ --------------------------------------------------------
SET TERM ^ ;
-- 1. Atualiza Pessoas Físicas (CPF - 11 dígitos)
UPDATE ent_doc c
SET
    c.entdj_conicm = 'N',    -- Não é contribuinte
    c.entdj_eme = 'N',       -- Não é Simples/ME
    c.entdj_isentoicm = 'N'  -- Não é isento
WHERE
    EXISTS (
        SELECT 1
        FROM ent e
        WHERE
            e.ent_id = c.entd_fkent_id AND
            CHAR_LENGTH(TRIM(e.ent_cnpjcpf)) = 11
    );
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
-- 2. Atualiza Pessoas Jurídicas (CNPJ - 14 dígitos) COM Inscrição Estadual
-- Define como contribuinte, não Simples e não isento.
UPDATE ent_doc c
SET
    c.entdj_conicm = 'S',    -- É contribuinte
    c.entdj_eme = 'N',       -- Não é Simples/ME
    c.entdj_isentoicm = 'N'  -- Não é isento
WHERE
    c.entdj_insce IS NOT NULL AND
    EXISTS (
        SELECT 1
        FROM ent e
        WHERE
            e.ent_id = c.entd_fkent_id AND
            CHAR_LENGTH(TRIM(e.ent_cnpjcpf)) = 14
    );
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
-- 3. Atualiza Pessoas Jurídicas (CNPJ - 14 dígitos) SEM Inscrição Estadual
-- Define como contribuinte, Simples/ME e não isento.
UPDATE ent_doc c
SET
    c.entdj_conicm = 'N',    -- É contribuinte
    c.entdj_eme = 'N',       -- É Simples/ME
    c.entdj_isentoicm = 'N'  -- Não é isento
WHERE
    c.entdj_insce IS NULL or c.entdj_insce = '' AND
    EXISTS (
        SELECT 1
        FROM ent e
        WHERE
            e.ent_id = c.entd_fkent_id AND
            CHAR_LENGTH(TRIM(e.ent_cnpjcpf)) = 14
    );
^
SET TERM; ^

COMMIT WORK;

------------FIM PADRONIZAÇÃO CNPJ --------------------------------------------------------


----------------------inicio insert cst reforma tributaria----------------------------------

/* INSERTS para CST 000 (CCLASSTRIB_IBSCBS_CODIGO = '000') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '000001', 'Situações tributadas integralmente pelo IBS e CBS.', 'NOW', '000', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '000001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '000002', 'Exploração de via, observado o art. 11 da Lei Complementar nº 214, de 2025.', 'NOW', '000', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '000002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '000003', 'Regime automotivo - projetos incentivados, observado o art. 311 da Lei Complementar nº 214, de 2025.', 'NOW', '000', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '000003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '000004', 'Regime automotivo - projetos incentivados, observado o art. 312 da Lei Complementar nº 214, de 2025.', 'NOW', '000', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '000004');

/* INSERTS para CST 010 (CCLASSTRIB_IBSCBS_CODIGO = '010') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '010001', 'Operações do FGTS não realizadas pela Caixa Econômica Federal, observado o art. 212 da Lei Complementar nº 214, de 2025.', 'NOW', '010', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '010001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '010002', 'Operações do serviço financeiro', 'NOW', '010', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '010002');

/* INSERTS para CST 011 (CCLASSTRIB_IBSCBS_CODIGO = '011') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '011001', 'Planos de assistência funerária, observado o art. 236 da Lei Complementar nº 214, de 2025.', 'NOW', '011', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '011001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '011002', 'Planos de assistência à saúde, observado o art. 237 da Lei Complementar nº 214, de 2025.', 'NOW', '011', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '011002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '011003', 'Intermediação de planos de assistência à saúde, observado o art. 240 da Lei Complementar nº 214, de 2025.', 'NOW', '011', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '011003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '011004', 'Concursos e prognósticos, observado o art. 246 da Lei Complementar nº 214, de 2025.', 'NOW', '011', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '011004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '011005', 'Planos de assistência à saúde de animais domésticos, observado o art. 243 da Lei Complementar nº 214, de 2025.', 'NOW', '011', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '011005');

/* INSERTS para CST 200 (CCLASSTRIB_IBSCBS_CODIGO = '200') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200001', 'Aquisições de máquinas, de aparelhos, de instrumentos, de equipamentos, de matérias-primas, de produtos intermediários e de materiais de embalagem realizadas entre empresas autorizadas a operar em zonas de processamento de exportação, observado o art. 103 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200002', 'Fornecimento ou importação de tratores, máquinas e implementos agrícolas, destinados a produtor rural não contribuinte, e de veículos de transporte de carga destinados a transportador autônomo de carga pessoa física não contribuinte, observado o art. 110 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200003', 'Vendas de produtos destinados à alimentação humana relacionados no Anexo I da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, que compõem a Cesta Básica Nacional de Alimentos, criada nos termos do art. 8º da Emenda Constitucional nº 132, de 20 de dezembro de 2023, observado o art. 125 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200004', 'Venda de dispositivos médicos com a especificação das respectivas classificações da NCM/SH previstas no Anexo XII da Lei Complementar nº 214, de 2025, observado o art. 144 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200005', 'Venda de dispositivos médicos com a especificação das respectivas classificações da NCM/SH previstas no Anexo IV da Lei Complementar nº 214, de 2025, quando adquiridos por órgãos da administração pública direta, autarquias e fundações públicas, observado o art. 144 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200005');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200006', 'Situação de emergência de saúde pública reconhecida pelo Poder Legislativo federal, estadual, distrital ou municipal competente, ato conjunto do Ministro da Fazenda e do Comitê Gestor do IBS poderá ser editado, a qualquer momento, para incluir dispositivos não listados no Anexo XII da Lei Complementar nº 214, de 2025, limitada a vigência do benefício ao período e à localidade da emergência de saúde pública, observado o art. 144 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200006');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200007', 'Fornecimento dos dispositivos de acessibilidade próprios para pessoas com deficiência relacionados no Anexo XIII da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 145 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200007');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200008', 'Fornecimento dos dispositivos de acessibilidade próprios para pessoas com deficiência relacionados no Anexo V da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, quando adquiridos por órgãos da administração pública direta, autarquias, fundações públicas e entidades imunes, observado o art. 145 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200008');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200009', 'Fornecimento dos medicamentos relacionados no Anexo XIV da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 146 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200009');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200010', 'Fornecimento dos medicamentos registrados na Anvisa, quando adquiridos por órgãos da administração pública direta, autarquias, fundações públicas e entidades imunes, observado o art. 146 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200010');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200011', 'Fornecimento das composições para nutrição enteral e parenteral, composições especiais e fórmulas nutricionais destinadas às pessoas com erros inatos do metabolismo relacionadas no Anexo VI da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, quando adquiridas por órgãos da administração pública direta, autarquias e fundações públicas, observado o art. 146 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200011');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200012', 'Situação de emergência de saúde pública reconhecida pelo Poder Legislativo federal, estadual, distrital ou municipal competente, ato conjunto do Ministro da Fazenda e do Comitê Gestor do IBS poderá ser editado, a qualquer momento, para incluir dispositivos não listados no Anexo XIV da Lei Complementar nº 214, de 2025, limitada a vigência do benefício ao período e à localidade da emergência de saúde pública, observado o art. 146 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200012');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200013', 'Fornecimento de tampões higiênicos, absorventes higiênicos internos ou externos, descartáveis ou reutilizáveis, calcinhas absorventes e coletores menstruais, observado o art. 147 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200013');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200014', 'Fornecimento dos produtos hortícolas, frutas e ovos, relacionados no Anexo XV da Lei Complementar nº 214 , de 2025, com a especificação das respectivas classificações da NCM/SH e desde que não cozidos, observado o art. 148 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200014');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200015', '"Venda de automóveis de passageiros de fabricação nacional de, no mínimo, 4 (quatro) portas, inclusive a de acesso ao bagageiro, quando adquiridos por motoristas profissionais que exerçam, comprovadamente, em automóvel de sua propriedade, atividade de condutor autônomo de passageiros, na condição de titular de autorização, permissão ou concessão do poder público, e que destinem o automóvel à utilização na categoria de aluguel (táxi), ou por pessoas com deficiência física, visual, auditiva, deficiência mental severa ou profunda, transtorno do espectro autista, com prejuízos na comunicação social e em padrões restritos ou repetitivos de comportamento de nível moderado ou grave, nos termos da legislação relativa à matéria, observado o disposto no art. 149 da Lei Complementar nº 214, de 2025."', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200015');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200016', 'Prestação de serviços de pesquisa e desenvolvimento por Instituição Científica, Tecnológica e de Inovação (ICT) sem fins lucrativos para a administração pública direta, autarquias e fundações públicas ou para o contribuinte sujeito ao regime regular do IBS e da CBS, observado o disposto no art. 156 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200016');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200017', 'Operações relacionadas ao FGTS, considerando aquelas necessárias à aplicação da Lei nº 8.036, de 1990, realizadas pelo Conselho Curador ou Secretaria Executiva do FGTS, observado o art. 212 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200017');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200018', 'Operações de resseguro e retrocessão ficam sujeitas à incidência à alíquota zero, inclusive quando os prêmios de resseguro e retrocessão forem cedidos ao exterior, observado o art. 223 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200018');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200019', 'Importador dos serviços financeiros seja contribuinte que realize as operações de que tratam os incisos I a V do caput do art. 182, será aplicada alíquota zero na importação, sem prejuízo da manutenção do direito de dedução dessas despesas da base de cálculo do IBS e da CBS, segundo, observado o art. 231 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200019');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200020', 'Operação praticada por sociedades cooperativas optantes por regime específico do IBS e CBS, quando o associado destinar bem ou serviço à cooperativa de que participa, e a cooperativa fornecer bem ou serviço ao associado sujeito ao regime regular do IBS e da CBS, observado o art. 271 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200020');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200021', 'Serviços de transporte público coletivo de passageiros ferroviário e hidroviário urbanos, semiurbanos e metropolitanos, observado o art. 285 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200021');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200022', 'Operação originada fora da Zona Franca de Manaus que destine bem material industrializado de origem nacional a contribuinte estabelecido na Zona Franca de Manaus que seja habilitado nos termos do art. 442 da Lei Complementar nº 214, de 2025, e sujeito ao regime regular do IBS e da CBS ou optante pelo regime do Simples Nacional de que trata o art. 12 da Lei Complementar nº 123, de 2006, observado o art. 445 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200022');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200023', 'Operação realizada por indústria incentivada que destine bem material intermediário para outra indústria incentivada na Zona Franca de Manaus, desde que a entrega ou disponibilização dos bens ocorra dentro da referida área, observado o art. 448 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200023');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200024', 'Operação originada fora das Áreas de Livre Comércio que destine bem material industrializado de origem nacional a contribuinte estabelecido nas Áreas de Livre Comércio que seja habilitado nos termos do art. 456 da Lei Complementar nº 214, de 2025, e sujeito ao regime regular do IBS e da CBS ou optante pelo regime do Simples Nacional de que trata o art. 12 da Lei Complementar nº 123, de 2006, observado o art. 463 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200024');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200025', 'Fornecimento dos serviços de educação relacionados ao Programa Universidade para Todos (Prouni), instituído pela Lei nº 11.096, de 13 de janeiro de 2005, observado o art. 308 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200025');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200026', 'Locação de imóveis localizados nas zonas reabilitadas, pelo prazo de 5 (cinco) anos, contado da data de expedição do habite-se, e relacionados a projetos de reabilitação urbana de zonas históricas e de áreas críticas de recuperação e reconversão urbanística dos Municípios ou do Distrito Federal, a serem delimitadas por lei municipal ou distrital, observado o art. 158 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200026');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200027', 'Operações de locação, cessão onerosa e arrendamento de bens imóveis, observado o art. 261 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200027');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200028', 'Fornecimento dos serviços de educação relacionados no Anexo II da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da Nomenclatura Brasileira de Serviços, Intangíveis e Outras Operações que Produzam Variações no Patrimônio (NBS), observado o art. 129 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200028');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200029', 'Fornecimento dos serviços de saúde humana relacionados no Anexo III da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NBS, observado o art. 130 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200029');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200030', 'Venda dos dispositivos médicos relacionados no Anexo IV da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 131 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200030');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200031', 'Fornecimento dos dispositivos de acessibilidade próprios para pessoas com deficiência relacionados no Anexo V da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 132 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200031');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200032', 'Fornecimento dos medicamentos registrados na Anvisa ou produzidos por farmácias de manipulação, ressalvados os medicamentos sujeitos à alíquota zero de que trata o art. 141 da Lei Complementar nº 214, de 2025, observado o art. 133 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200032');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200033', 'Fornecimento das composições para nutrição enteral e parenteral, composições especiais e fórmulas nutricionais destinadas às pessoas com erros inatos do metabolismo relacionadas no Anexo VI da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 133 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200033');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200034', 'Fornecimento dos alimentos destinados ao consumo humano relacionados no Anexo VII da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 135 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200034');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200035', 'Fornecimento dos produtos de higiene pessoal e limpeza relacionados no Anexo VIII da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH, observado o art. 136 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200035');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200036', 'Fornecimento de produtos agropecuários, aquícolas, pesqueiros, florestais e extrativistas vegetais in natura, observado o art. 137 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200036');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200037', 'Fornecimento de serviços ambientais de conservação ou recuperação da vegetação nativa, mesmo que fornecidos sob a forma de manejo sustentável de sistemas agrícolas, agroflorestais e agrossilvopastoris, em conformidade com as definições e requisitos da legislação específica, observado o art. 137 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200037');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200038', 'Fornecimento dos insumos agropecuários e aquícolas relacionados no Anexo IX da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NCM/SH e da NBS, observado o art. 138 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200038');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200039', 'Fornecimento dos serviços e o licenciamento ou cessão dos direitos relacionados no Anexo X da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NBS, quando destinados às seguintes produções nacionais artísticas, culturais, de eventos, jornalísticas e audiovisuais: espetáculos teatrais, circenses e de dança, shows musicais, desfiles carnavalescos ou folclóricos, eventos acadêmicos e científicos, como congressos, conferências e simpósios, feiras de negócios, exposições, feiras e mostras culturais, artísticas e literárias; programas de auditório ou jornalísticos, filmes, documentários, séries, novelas, entrevistas e clipes musicais, observado o art. 139 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200039');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200040', 'Fornecimento dos seguintes serviços de comunicação institucional à administração pública direta, autarquias e fundações públicas: serviços direcionados ao planejamento, criação, programação e manutenção de páginas eletrônicas da administração pública, ao monitoramento e gestão de suas redes sociais e à otimização de páginas e canais digitais para mecanismos de buscas e produção de mensagens, infográficos, painéis interativos e conteúdo institucional, serviços de relações com a imprensa, que reúnem estratégias organizacionais para promover e reforçar a comunicação dos órgãos e das entidades contratantes com seus públicos de interesse, por meio da interação com profissionais da imprensa, e serviços de relações públicas, que compreendem o esforço de comunicação planejado, coeso e contínuo que tem por objetivo estabelecer adequada percepção da atuação e dos objetivos institucionais, a partir do estímulo à compreensão mútua e da manutenção de padrões de relacionamento e fluxos de informação entre os órgãos e as entidades contratantes e seus públicos de interesse, no País e no exterior, observado o art. 140 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200040');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200041', 'Operações relacionadas às seguintes atividades desportivas: fornecimento de serviço de educação desportiva, classificado no código 1.2205.12.00 da NBS, observado o art. 141 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200041');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200042', 'Operações relacionadas às seguintes atividades desportivas: operações e prestações de serviços de segurança da informação e segurança cibernética, observado o art. 141 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200042');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200043', 'Fornecimento à administração pública direta, autarquias e fundações púbicas dos serviços e dos bens relativos à soberania e à segurança nacional, à segurança da informação e à segurança cibernética relacionados no Anexo XI da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NBS e da NCM/SH, observado o art. 142 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200043');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200044', 'Operações e prestações de serviços de segurança da informação e segurança cibernética desenvolvidos por sociedade que tenha sócio brasileiro com o mínimo de 20% (vinte por cento) do seu capital social, relacionados no Anexo XI da Lei Complementar nº 214, de 2025, com a especificação das respectivas classificações da NBS e da NCM/SH, observado o art. 142 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200044');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200045', 'Operações relacionadas a projetos de reabilitação urbana de zonas históricas e de áreas críticas de recuperação e reconversão urbanística dos Municípios ou do Distrito Federal, a serem delimitadas por lei municipal ou distrital, observado o art. 158 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200045');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200046', 'Operações com bens imóveis, observado o art. 261 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200046');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200047', 'Bares e Restaurantes, observado o art. 275 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200047');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200048', 'Hotelaria, Parques de Diversão e Parques Temáticos, observado o art. 281 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200048');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200049', 'Transporte coletivo de passageiros rodoviário, ferroviário e hidroviário intermunicipais e interestaduais, observado o art. 286 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200049');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200050', 'Serviços de transporte aéreo regional coletivo de passageiros ou de carga, observado o art. 287 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200050');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200051', 'Agências de Turismo, observado o art. 289 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200051');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '200052', 'Prestação de serviços das seguintes profissões intelectuais de natureza científica, literária ou artística, submetidas à fiscalização por conselho profissional: administradores, advogados, arquitetos e urbanistas, assistentes sociais, bibliotecários, biólogos, contabilistas, economistas, economistas domésticos, profissionais de educação física, engenheiros e agrônomos, estatísticos, médicos veterinários e zootecnistas, museólogos, químicos, profissionais de relações públicas, técnicos industriais e técnicos agrícolas, observado o art. 127 da Lei Complementar nº 214, de 2025.', 'NOW', '200', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '200052');

/* INSERTS para CST 210 (CCLASSTRIB_IBSCBS_CODIGO = '210') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '210001', 'Redutor social aplicado uma única vez na alienação de bem imóvel residencial novo, observado o art. 259 da Lei Complementar nº 214, de 2025.', 'NOW', '210', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '210001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '210002', 'Redutor social aplicado uma única vez na alienação de lote residencial, observado o art. 259 da Lei Complementar nº 214, de 2025.', 'NOW', '210', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '210002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '210003', 'Redutor social em operações de locação, cessão onerosa e arrendamento de bens imóveis de uso residencial, observado o art. 260 da Lei Complementar nº 214, de 2025.', 'NOW', '210', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '210003');

/* INSERTS para CST 220 (CCLASSTRIB_IBSCBS_CODIGO = '220') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '220001', 'Incorporação imobiliária submetida ao regime especial de tributação, observado o art. 485 da Lei Complementar nº 214, de 2025.', 'NOW', '220', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '220001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '220002', 'Incorporação imobiliária submetida ao regime especial de tributação, observado o art. 485 da Lei Complementar nº 214, de 2025.', 'NOW', '220', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '220002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '220003', 'Alienação de imóvel decorrente de parcelamento do solo, observado o art. 486 da Lei Complementar nº 214, de 2025.', 'NOW', '220', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '220003');

/* INSERTS para CST 221 (CCLASSTRIB_IBSCBS_CODIGO = '221') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '221001', 'Locação, cessão onerosa ou arrendamento de bem imóvel com alíquota sobre a receita bruta, observado o art. 487 da Lei Complementar nº 214, de 2025.', 'NOW', '221', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '221001');

/* INSERTS para CST 222 (CCLASSTRIB_IBSCBS_CODIGO = '222') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '222001', 'Transporte internacional de passageiros, caso os trechos de ida e volta sejam vendidos em conjunto, a base de cálculo será a metade do valor cobrado, observado o Art. 12 § 8º da Lei Complementar nº 214, de 2025.', 'NOW', '222', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '222001');

/* INSERTS para CST 400 (CCLASSTRIB_IBSCBS_CODIGO = '400') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '400001', 'Fornecimento de serviços de transporte público coletivo de passageiros rodoviário e metroviário de caráter urbano, semiurbano e metropolitano, sob regime de autorização, permissão ou concessão pública, observado o art. 157 da Lei Complementar nº 214, de 2025.', 'NOW', '400', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '400001');

/* INSERTS para CST 410 (CCLASSTRIB_IBSCBS_CODIGO = '410') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410001', 'Fornecimento de bonificações quando constem do respectivo documento fiscal e que não dependam de evento posterior, observado o art. 5º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410002', 'Transferências entre estabelecimentos pertencentes ao mesmo contribuinte, observado o art. 6º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410003', 'Doações que não tenham por objeto bens ou serviços que tenham permitido a apropriação de créditos pelo doador, observado o art. 6º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410004', 'Exportações de bens e serviços, observado o art. 8º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410005', 'Fornecimentos realizados pela União, pelos Estados, pelo Distrito Federal e pelos Municípios, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410005');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410006', 'Fornecimentos realizados por entidades religiosas e templos de qualquer culto, inclusive suas organizações assistenciais e beneficentes, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410006');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410007', 'Fornecimentos realizados por partidos políticos, inclusive suas fundações, entidades sindicais dos trabalhadores e instituições de educação e de assistência social, sem fins lucrativos, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410007');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410008', 'Fornecimentos de livros, jornais, periódicos e do papel destinado a sua impressão, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410008');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410009', 'Fornecimentos de fonogramas e videofonogramas musicais produzidos no Brasil contendo obras musicais ou literomusicais de autores brasileiros e/ou obras em geral interpretadas por artistas brasileiros, bem como os suportes materiais ou arquivos digitais que os contenham, salvo na etapa de replicação industrial de mídias ópticas de leitura a laser, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410009');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410010', '"Fornecimentos de serviço de comunicação nas modalidades de radiodifusão sonora e de sons e imagens de recepção livre e gratuita, observado o art. 9º da Lei Complementar nº 214, de 2025."', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410010');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410011', 'Fornecimentos de ouro, quando definido em lei como ativo financeiro ou instrumento cambial, observado o art. 9º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410011');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410012', 'Fornecimento de condomínio edilício não optante pelo regime regular, observado o art. 26 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410012');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410013', 'Exportações de combustíveis, observado o art. 98 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410013');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410014', 'Fornecimento de produtor rural não contribuinte, observado o art. 164 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410014');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410015', 'Fornecimento por transportador autônomo não contribuinte, observado o art. 169 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410015');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410016', 'Fornecimento ou aquisição de resíduos sólidos, observado o art. 170 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410016');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410017', 'Aquisição de bem móvel com crédito presumido sob condição de revenda realizada, observado o art. 171 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410017');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410018', 'Operações relacionadas aos fundos garantidores e executores de políticas públicas, inclusive de habitação, previstos em lei, assim entendidas os serviços prestados ao fundo pelo seu agente operador e por entidade encarregada da sua administração, observado o art. 213 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410018');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410019', 'Exclusão da gorjeta na base de cálculo no fornecimento de alimentação, observado o art. 274 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410019');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410020', 'Exclusão do valor de intermediação na base de cálculo no fornecimento de alimentação, observado o art. 274 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410020');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410021', 'Contribuição de que trata o art. 149-A da Constituição Federal, observado o art. 12 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410021');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410022', 'Consolidação da propriedade pelo credor de bens móveis ou imóveis que tenham sido objeto de garantia, observado o art. 200 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410022');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410023', 'Alienação de bens móveis ou imóveis que tenham sido objeto de garantia constituída em favor de credor em que o prestador da garantia não seja contribuinte, observado o art. 200 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410023');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410024', 'Consolidação da propriedade pelo grupo de consórcio de bem que tenha sido objeto de garantia, observado o art. 204 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410024');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410025', 'Alienação de bem que tenha sido objeto de garantia constituída em favor do grupo de consórcio em que o prestador da garantia não seja contribuinte, observado o art. 204 da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410025');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410026', 'Doações sem contraprestação em benefício do doador, com anulação de crédito apropriados pelo doador referente ao fornecimento doado, observado o art. 6º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410026');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '410999', 'Operações não onerosas sem previsão de tributação, não especificadas anteriormente, observado o art. 4º da Lei Complementar nº 214, de 2025.', 'NOW', '410', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '410999');

/* INSERTS para CST 510 (CCLASSTRIB_IBSCBS_CODIGO = '510') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '510002', 'Operações, sujeitas a diferimento, com insumos agropecuários e aquícolas destinados a produtor rural não contribuinte, observado o art. 138 da Lei Complementar nº 214, de 2025.', 'NOW', '510', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '510002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '510001', 'Operações, sujeitas a diferimento, com energia elétrica ou com direitos a ela relacionados, relativas à geração, comercialização, distribuição e transmissão, observado o art. 28 da Lei Complementar nº 214, de 2025.', 'NOW', '510', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '510001');

/* INSERTS para CST 515 (CCLASSTRIB_IBSCBS_CODIGO = '515') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '515001', 'Operações, sujeitas a diferimento, com insumos agropecuários e aquícolas destinados a produtor rural não contribuinte, observado o art. 138 da Lei Complementar nº 214, de 2025.', 'NOW', '515', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '515001');

/* INSERTS para CST 550 (CCLASSTRIB_IBSCBS_CODIGO = '550') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550001', 'Exportações de bens materiais, observado o art. 82 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550002', 'Regime de Trânsito, observado o art. 84 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550003', 'Regimes de Depósito, observado o art. 85 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550004', 'Regimes de Depósito, observado o art. 87 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550005', 'Regimes de Depósito, observado o art. 87 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550005');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550006', 'Regimes de Permanência Temporária, observado o art. 88 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550006');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550007', 'Regimes de Aperfeiçoamento, observado o art. 90 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550007');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550008', 'Importação de bens para o Regime de Repetro-Temporário, de que tratam o inciso I do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550008');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550009', 'GNL-Temporário, de que trata o inciso II do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550009');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550010', 'Repetro-Permanente, de que trata o inciso III do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550010');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550011', 'Repetro-Industrialização, de que trata o inciso IV do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550011');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550012', 'Repetro-Nacional, de que trata o inciso V do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550012');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550013', 'Repetro-Entreposto, de que trata o inciso VI do art. 93 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550013');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550014', 'Zona de Processamento de Exportação, observado os arts. 99, 100 e 102 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550014');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550015', 'Regime Tributário para Incentivo à Modernização e à Ampliação da Estrutura Portuária - Reporto, observado o art. 105 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550015');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550016', 'Regime Especial de Incentivos para o Desenvolvimento da Infraestrutura - Reidi, observado o art. 106 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550016');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550017', 'Regime Tributário para Incentivo à Atividade Econômica Naval – Renaval, observado o art. 107 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550017');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550018', 'Desoneração da aquisição de bens de capital, observado o art. 109 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550018');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550019', 'Importação de bem material por indústria incentivada para utilização na Zona Franca de Manaus, observado o art. 443 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550019');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550020', 'Áreas de livre comércio, observado o art. 461 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550020');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '550021', 'Fornecimento de produtos agropecuários in natura para contribuinte do regime regular que promova industrialização destinada a exportação, observado o art. 82 da Lei Complementar nº 214, de 2025.', 'NOW', '550', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '550021');

/* INSERTS para CST 620 (CCLASSTRIB_IBSCBS_CODIGO = '620') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620001', 'Tributação monofásica sobre combustíveis, observados os art. 172 e art. 179 I da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620002', 'Tributação monofásica com responsabilidade pela retenção sobre combustíveis, observado o art. 178 da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620003', 'Tributação monofásica com tributos retidos por responsabilidade sobre combustíveis, observado o art. 178 da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620004', 'Tributação monofásica sobre mistura de EAC com gasolina A em percentual superior ou inferior ao obrigatório, observado o art. 179 da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620005', 'Tributação monofásica sobre mistura de EAC com gasolina A em percentual superior ou inferior ao obrigatório, observado o art. 179 da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620005');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '620006', 'Tributação monofásica sobre combustíveis cobrada anteriormente, observador o art. 180 da Lei Complementar nº 214, de 2025.', 'NOW', '620', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '620006');

/* INSERTS para CST 800 (CCLASSTRIB_IBSCBS_CODIGO = '800') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '800001', 'Fusão, cisão ou incorporação, observado o art. 55 da Lei Complementar nº 214, de 2025.', 'NOW', '800', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '800001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '800002', 'Transferência de crédito do associado, inclusive as cooperativas singulares, para cooperativa de que participa das operações antecedentes às operações em que fornece bens e serviços e os créditos presumidos, observado o art. 272 da Lei Complementar nº 214, de 2025.', 'NOW', '800', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '800002');

/* INSERTS para CST 810 (CCLASSTRIB_IBSCBS_CODIGO = '810') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '810001', 'Crédito presumido de IBS sobre o valor apurado nos fornecimentos a partir da Zona Franca de Manaus, observado o art. 450 da Lei Complementar nº 214, de 2025.', 'NOW', '810', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '810001');

/* INSERTS para CST 811 (CCLASSTRIB_IBSCBS_CODIGO = '811') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '811001', 'Anulação de crédito proporcional ao valor das operações imunes e isentas, observado o art. 51 da Lei Complementar nº 214, de 2025.', 'NOW', '811', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '811001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '811002', 'Débitos de notas fiscais não processadas na apuração, observado o art. 45 da Lei Complementar nº 214, de 2025.', 'NOW', '811', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '811002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '811003', 'Débitos apurados após o desenquadramento do regime Simples Nacional, observado o art. 41 da Lei Complementar nº 214, de 2025.', 'NOW', '811', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '811003');

/* INSERTS para CST 820 (CCLASSTRIB_IBSCBS_CODIGO = '820') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820001', 'Documento com informações de fornecimento de serviços de planos de assinstência à saúde, mas com tributação realizada por outro meio, observado o art. 235 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820001');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820002', 'Documento com informações de fornecimento de serviços de planos de assinstência funerária, mas com tributação realizada por outro meio, observado o art. 236 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820002');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820003', 'Documento com informações de fornecimento de serviços de planos de assinstência à saúde de animais domésticos, mas com tributação realizada por outro meio, observado o art. 243 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820003');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820004', 'Documento com informações de prestação de serviços de consursos de prognósticos, mas com tributação realizada por outro meio, observado o art. 248 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820004');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820005', 'Documento com informações de alienação de bens imóveis, mas com tributação realizada por outro meio, observado o art. 254 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820005');

INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '820006', 'Documento com informações de fornecimento de serviços de exploração de via, mas com tributação realizada por outro meio, observado o art. 11 da Lei Complementar nº 214, de 2025.', 'NOW', '820', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '820006');

/* INSERTS para CST 830 (CCLASSTRIB_IBSCBS_CODIGO = '830') */
INSERT INTO EMP_CLASS_IBSCBS (CCLASSTRIB, CCLASSTRIB_DESCRICAO, IBCCLASS_DTCAD, CCLASSTRIB_IBSCBS_CODIGO, FK_SIT)
SELECT '830001', 'Documento com exclusão da base de cálculo da CBS e do IBS refrente à energia elétrica fornecida pela distribuidora à unidade consumidora, conforme Art 28, parágrafos 3° e 4°.', 'NOW', '830', 1 FROM RDB$DATABASE WHERE NOT EXISTS (SELECT 1 FROM EMP_CLASS_IBSCBS WHERE CCLASSTRIB = '830001');

COMMIT;

----------------------fim insert cclasstrib reforma tributaria----------------------------------

-----------------------inicio cst reforma tributaria----------------------------------------------

/* CST 000: Tributação integral */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '000', 'Tributação integral', 'Situações tributadas integralmente pelo IBS e CBS.', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '000');

/* CST 010: Tributação com alíquotas uniformes - operações setor financeiro */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '010', 'Tributação com alíquotas uniformes - operações setor financeiro', 'Operações do serviço financeiro', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '010');

/* CST 011: Tributação com alíquotas uniformes reduzidas em 60% */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '011', 'Tributação com alíquotas uniformes reduzidas em 60%', 'Planos de assistência funerária.', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '011');

/* CST 200: Alíquota zero */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '200', 'Alíquota Reduzida', 'Situação de emergência de saúde pública reconhecida pelo Poder público (Anexo XIV)', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '200');

/* CST 210: Alíquota reduzida em 50% com redutor de base de cálculo */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '210', 'Alíquota reduzida em 50% com redutor de base de cálculo', 'Redutor social aplicado uma única vez na alienação de bem imóvel residencial novo', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '210');

/* CST 220: Alíquota fixa */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '220', 'Alíquota fixa', 'Incorporação imobiliária submetida ao regime especial de tributação', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '220');

/* CST 221: Alíquota fixa proporcional */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '221', 'Alíquota fixa proporcional', 'Locação, cessão onerosa ou arrendamento de bem imóvel com alíquota sobre a receita bruta', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '221');

/* CST 222: Redução de Base de Cálculo */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '222', 'Redução de Base de Cálculo', 'Transporte internacional de passageiros, caso os trechos de ida e volta sejam vendidos em conjunto', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '222');

/* CST 400: Isenção */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '400', 'Isenção', 'Fornecimento de serviços de transporte público coletivo de passageiros rodoviário e metroviário', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '400');

/* CST 410: Imunidade e não incidência */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '410', 'Imunidade e não incidência', 'Fornecimento de bonificações quando constem no documento fiscal e que não dependam de evento posterior', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '410');

/* CST 510: Diferimento com redução de alíquota */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '510', 'Diferimento com redução de alíquota', 'Operações, sujeitas a diferimento, com insumos agropecuários e aquícolas destinados a produtor rural não contribuinte (Anexo IX)', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '510');

/* CST 515: Diferimento com redução de alíquota */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '515', 'Diferimento com redução de alíquota', 'Operações, sujeitas a diferimento, com insumos agropecuários e aquícolas destinados a produtor rural não contribuinte (Anexo IX)', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '515');

/* CST 550: Suspensão */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '550', 'Suspensão', 'Exportações de bens materiais', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '550');

/* CST 620: Tributação monofásica */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '620', 'Tributação monofásica', 'Tributação monofásica sobre combustíveis', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '620');

/* CST 800: Transferência de crédito */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '800', 'Transferência de crédito', 'Fusão, cisão ou incorporação', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '800');

/* CST 810: Ajuste de IBS na ZFM */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '810', 'Ajuste de IBS na ZFM', 'Crédito presumido de IBS sobre o valor apurado nos fornecimentos a partir da ZFM', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '810');

/* CST 811: Ajustes */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '811', 'Ajustes', 'Anulação de Crédito por Saídas Imunes/Isentas', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '811');

/* CST 820: Tributação em declaração de regime específico */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '820', 'Tributação em declaração de regime específico', 'Documento com informações de fornecimento de serviços de planos de assistência à saúde', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '820');

/* CST 830: Exclusão de base de cálculo */
INSERT INTO EMP_CST_IBSCBS (IBSCBS_CODIGO, IBSCBS_NOME, IBSCBS_FINALIDADE, IBSCBS_DTCAD, CST_IBSCBS_FKSIT_ID)
SELECT '830', 'Exclusão de base de cálculo', 'Documento com exclusão da BC da CBS e do IBS de energia elétrica fornecida pela distribuidora à UC', 'NOW', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CST_IBSCBS WHERE IBSCBS_CODIGO = '830');

COMMIT;


----------------------------- fim cst reforma tributaria-------------------------------------------------
----------------------------- INICIO INSERT TIPOS DE CLIENTES-------------------------------------------

/* PADRÃO DE INSERT: Verifica se o registro já existe antes de inserir, evitando duplicidade.
   Assume: TIPO_FKSIT_ID = 1 (Situação Ativa). O TIPO_ID e TIPO_DTCAD serão preenchidos pelo TRIGGER.
*/

-- Não Contribuinte
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Não Contribuinte', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Não Contribuinte');

-- Contribuinte
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Contribuinte', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Contribuinte');

-- Contribuinte Simples Nacional
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Contribuinte Simples Nacional', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Contribuinte Simples Nacional');

-- Indústria
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Indústria', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Indústria');

-- Indústria Simples Nacional
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Indústria Simples Nacional', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Indústria Simples Nacional');

-- Público
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Público', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Público');

-- Produtor rural pessoa física
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Produtor rural pessoa física', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Produtor rural pessoa física');

-- Produtor rural pessoa jurídica
INSERT INTO ENT_TIPO_CONTRIBUINTE (TIPO_DESCRICAO, TIPO_FKSIT_ID)
SELECT 'Produtor rural pessoa jurídica', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM ENT_TIPO_CONTRIBUINTE WHERE TIPO_DESCRICAO = 'Produtor rural pessoa jurídica');

COMMIT;

----------------------------------- FIM INSERT DE TIPOS CLIENTES-----------------------------------------------


--------------------------------------- INICIO INSERT CCREDPRES-------------------------------------

-- 1. Crédito presumido produtor rural (Art. 168)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    1, 
    'Crédito presumido da aquisição de bens e serviços de produtor rural e produtor rural integrado não contribuinte, observado o art. 168 da Lei Complementar nº 214, de 2025.',
    'Art. 168. O contribuinte de IBS e de CBS sujeito ao regime regular poderá apropriar créditos presumidos dos referidos tributos relativos às aquisições de bens e serviços de produtor rural ou de produtor rural integrado, não contribuintes, de que trata o art. 164 desta Lei Complementar.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 1);

-- 2. Crédito presumido transportador autônomo (Art. 169)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    2, 
    'Crédito presumido da aquisição de serviço de transportador autônomo de carga pessoa física não contribuinte, observado o art. 169 da Lei Complementar nº 214, de 2025.', 
    'Art. 169. O contribuinte de IBS e de CBS sujeito ao regime regular poderá apropriar créditos presumidos dos referidos tributos relativos às aquisições de serviço de transporte de carga de transportador autônomo pessoa física que não seja contribuinte dos referidos tributos ou que seja inscrito como MEI.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 2);

-- 3. Crédito presumido aquisição de resíduos (Art. 170)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    3, 
    'Crédito presumido da aquisição de resíduos e demais materiais destinados à reciclagem, reutilização ou logística reversa adquiridos de pessoa física, cooperativa ou outra forma de organização popular, observado o art. 170 da Lei Complementar nº 214, de 2025.', 
    'Art. 170. O contribuinte de IBS e de CBS sujeito ao regime regular poderá apropriar créditos presumidos dos referidos tributos relativos às aquisições de resíduos sólidos de coletores incentivados para utilização em processo de destinação final ambientalmente adequada.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 3);

-- 4. Crédito presumido aquisição de bens móveis usados (Art. 171)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    4, 
    'Crédito presumido da aquisição de bens móveis usados de pessoa física não contribuinte para revenda, observado o art. 171 da Lei Complementar nº 214, de 2025.', 
    'Art. 171. O contribuinte de IBS e de CBS sujeito ao regime regular poderá apropriar créditos presumidos dos referidos tributos relativos às aquisições, para revenda, de bem móvel usado de pessoa física que não seja contribuinte dos referidos tributos ou que seja inscrita como MEI.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 4);

-- 5. Crédito presumido regime automotivo (Art. 311)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    5, 
    'Crédito presumido no regime automotivo, observado o art. 311 da Lei Complementar nº 214, de 2025.', 
    'Art. 311. Em relação aos projetos habilitados à fruição dos benefícios estabelecidos pelo art. 11-C da Lei nº 9.440, de 14 de março de 1997, o crédito presumido de que trata o art. 309 desta Lei Complementar será calculado mediante a aplicação dos seguintes percentuais sobre o valor das vendas no mercado interno, em cada mês, dos produtos constantes nos projetos de que trata o art. 309, fabricados ou montados nos estabelecimentos incentivados:
I - 11,60% (onze inteiros e sessenta centésimos por cento) até o 12º (décimo segundo) mês de fruição do benefício;
II - 10% (dez inteiros por cento) do 13º (décimo terceiro) ao 48º (quadragésimo oitavo) mês de fruição do benefício;
III - 8,70% (oito inteiros e setenta centésimos por cento) do 49º (quadragésimo nono) ao 60º (sexagésimo) mês de fruição do benefício.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 5);

-- 6. Crédito presumido regime automotivo (Art. 312)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    6, 
    'Crédito presumido no regime automotivo, observado o art. 312 da Lei Complementar nº 214, de 2025.', 
    'Art. 312. Em relação aos projetos habilitados à fruição dos benefícios estabelecidos pelos arts. 1º a 4º da Lei nº 9.826, de 23 de agosto de 1999, o crédito presumido de que trata o art. 309 desta Lei Complementar corresponderá ao produto da multiplicação dos seguintes fatores:
I - valor das vendas no mercado interno, em cada mês, dos produtos constantes nos projetos de que trata o art. 309 desta Lei Complementar, fabricados ou montados nos estabelecimentos incentivados;
II - alíquotas do Imposto sobre Produtos Industrializados - IPI vigentes em 31 de dezembro de 2025, conforme a Tabela de Incidência do Imposto sobre Produtos Industrializados - Tipi, inclusive Notas Complementares, referentes aos produtos classificados nas posições 8702 a 8704;
III - fator de eficiência, que será o resultado do cálculo de 1 (um inteiro) diminuído da alíquota referida no inciso II, para cada posição na Tipi; e
IV - fator multiplicador, que será de:
a) 32,00% (trinta e dois por cento) nos anos de 2027 e 2028;
b) 25,60% (vinte e cinco inteiros e sessenta centésimos por cento) no ano de 2029;
c) 19,20% (dezenove inteiros e vinte centésimos por cento) no ano de 2030;
d) 12,80% (doze inteiros e oitenta centésimos por cento) no ano de 2031; e
e) 6,40 % (seis inteiros e quarenta centésimos por cento) no ano de 2032.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 6);

-- 7. Crédito presumido ZFM (Art. 444)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    7, 
    'Crédito presumido na aquisição por contribuinte na Zona Franca de Manaus, observado o art. 444 da Lei Complementar nº 214, de 2025.', 
    'Art. 444. Fica concedido ao contribuinte habilitado na forma do art. 442 e sujeito ao regime regular ou ao Simples Nacional crédito presumido de IBS relativo à importação de bem material para revenda presencial na Zona Franca de Manaus.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 7);

-- 8. Crédito presumido ZFM (Art. 447)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    8, 
    'Crédito presumido na aquisição por contribuinte na Zona Franca de Manaus, observado o art. 447 da Lei Complementar nº 214, de 2025.', 
    'Art. 447. Fica concedido ao contribuinte sujeito ao regime regular do IBS e habilitado nos termos do art. 442 desta Lei Complementar crédito presumido de IBS relativo à aquisição de bem material industrializado de origem nacional contemplado pela redução a zero da alíquota do IBS nos termos do art. 445 desta Lei Complementar.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 8);

-- 9. Crédito presumido ZFM (Art. 449)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    9, 
    'Crédito presumido na aquisição por contribuinte na Zona Franca de Manaus, observado o art. 449 da Lei Complementar nº 214, de 2025.', 
    'Art. 449. Fica concedido à indústria incentivada na Zona Franca de Manaus, sujeita ao regime regular do IBS e da CBS, crédito presumido de IBS relativo à aquisição de bem intermediário produzido na referida área, desde que o bem esteja contemplado pela redução a zero de alíquota estabelecida pelo art. 448 desta Lei Complementar e seja utilizado para incorporação ou consumo na produção de bens finais.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 9);

-- 10. Crédito presumido ZFM (Art. 450)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    10, 
    'Crédito presumido na aquisição por contribuinte na Zona Franca de Manaus, observado o art. 450 da Lei Complementar nº 214, de 2025.', 
    'Art. 450. Ficam concedidos à indústria incentivada na Zona Franca de Manaus créditos presumidos de IBS e de CBS relativos à operação que destine ao território nacional, inclusive para a própria Zona Franca de Manaus, bem material produzido pela própria indústria incentivada na referida área nos termos do projeto econômico aprovado, exceto em relação às operações previstas no art. 447 desta Lei Complementar.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 10);

-- 11. Crédito presumido ALC (Art. 462)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    11, 
    'Crédito presumido na aquisição por contribuinte na Área de Livre Comércio, observado o art. 462 da Lei Complementar nº 214, de 2025.', 
    'Art. 462. Fica concedido ao contribuinte habilitado na forma do art. 460 e sujeito ao regime regular ou ao Simples Nacional crédito presumido de IBS relativo à importação de bem material para revenda presencial na Área de Livre Comércio.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 11);

-- 12. Crédito presumido ALC (Art. 465)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    12, 
    'Crédito presumido na aquisição por contribuinte na Área de Livre Comércio, observado o art. 465 da Lei Complementar nº 214, de 2025.', 
    'Art. 465. Fica concedido ao contribuinte sujeito ao regime regular do IBS e da CBS e habilitado na forma do art. 460 desta Lei Complementar crédito presumido de IBS relativo à aquisição de bem material industrializado de origem nacional contemplado pela redução a zero da alíquota do IBS nos termos do art. 463 desta Lei Complementar.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 12);

-- 13. Crédito presumido ALC Indústria (Art. 467)
INSERT INTO EMP_CCREDPRES (CCREDPRES_CODIGO, CCREDPRES_DESCRICAO, CCREDPRES_DECRETO, CCREDPRES_DTCAD, CCREDPRES_FKSIT)
SELECT 
    13, 
    'Crédito presumido na aquisição pela indústria na Área de Livre Comércio, observado o art. 467 da Lei Complementar nº 214, de 2025.', 
    'Art. 467. Fica concedido à indústria sujeita ao regime regular de IBS e de CBS e habilitada na forma do inciso II do caput do art. 460 desta Lei Complementar créditos presumidos de CBS relativo à operação que destine ao território nacional bem material produzido pela própria indústria na referida área nos termos do projeto econômico aprovado.', -- BLOB CONTENT
    CURRENT_DATE, 
    1
FROM RDB$DATABASE
WHERE NOT EXISTS (SELECT 1 FROM EMP_CCREDPRES WHERE CCREDPRES_CODIGO = 13);

--------------------------------------- FIM INSERT CCREDPRES-------------------------------------

-------------- INICIO ALIMENTAR ALTERAÇÃO DE HISTORICO DO NOME DO PRODUTO REGISTRO 205 SPED -----------------------

INSERT INTO EMP_PRODUTO_HIST (
    PRDHIST_PRD_ID,
    PRDHIST_NOME_ANTERIOR,
    PRDHIST_PRD_ID_ANTERIOR,
    PRD_DTINICIO,
    PRD_DTFIM
)
SELECT
    e.PRD_ID,
    e.PRD_NOMECOMP,
    E.prd_prd_id_anterior,
    E.PRD_DTCAD,
    NULL               
FROM 
    EMP_PRODUTO e
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM EMP_PRODUTO_HIST h
        WHERE h.PRDHIST_PRD_ID = e.PRD_ID
    );

-------------- FIM ALIMENTAR ALTERAÇÃO DE HISTORICO DO NOME DO PRODUTO REGISTRO 205 SPED -----------------------

-------------- INICIO INSERÇÃO DA TRIBUTAÇÃO PADRÃO DO IBS E CBS--------------------------------------------------
INSERT INTO EMP_PRODUTO_CLASSFISCAL_IBSCBS (
    CLFIBSCBS_DTCAD, 
    CLFIBSCBS_NOME
)
SELECT 
    current_date,
    'CST 000 | 5102 | 000001 | 0,1 IBS | 0,9 CBS'
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 
    FROM EMP_PRODUTO_CLASSFISCAL_IBSCBS 
    WHERE CLFIBSCBS_ID = 1
);

COMMIT WORK;

INSERT INTO PARAM_UF2 (
    PUF2_DTCAD, PUF2_FKOF_ID, PUF2_FKCST_IBSCBS, PUF2_FKCLASTRIB_IBSCBS, 
    PUF2_OBSERVACAO, PUF2_ALIQ_IBS_UF, PUF2_ALIQ_IBS_MUNICIPIO, PUF2_ALIQ_CBS, 
    PUF2_RED_ALIQ_IBS_UF, PUF2_RED_ALIQ_IBS_MUNICIPIO, PUF2_RED_ALIQ_CBS, 
    PUF2_RED_BASE_CALC_IBS, PUF2_RED_BASE_CALC_CBS, PUF2_PERC_DIFERIMENTO_IBS_UF, 
    PUF2_PERC_DIFERIM_IBS_MUNIC, PUF2_PERC_DIFERIMENTO_CBS, PUF2_PERC_CRED_PRESUMIDO_IBS, 
    PUF2_PERC_CRED_PRESUMIDO_CBS, PUF2_ALIQ_ADREM_IBS, PUF2_ALIQ_ADREM_CBS, 
    PUF2_ALIQ_ADREM_IBS_RETENCAO, PUF2_ALIQ_ADREM_CBS_RETENCAO, PUF2_ALIQ_ADREM_IBS_RET_ANT, 
    PUF2_ALIQ_ADREM_CBS_RET_ANT, PUF2_PERC_DIF_MONO_IBS, PUF2_PERC_DIF_MONO_CBS, 
    PUF2_LKOF_CODIGO, PUF2_LKOF_NOME, PUF2_LKCST_IBSCBS_CODIGO, PUF2_LKCST_IBSCBS_NOME, 
    PUF2_LKCLASSTRIB_IBSCBS_NOME, PUF2_FKCST_IBSCBS_REGULAR, PUF2_LKCST_IBSCBS_REG_CODIGO, 
    PUF2_LKCST_IBSCBS_REG_NOME, PUF2_FKUF_ID, PUF2_LKUF_APELIDO, PUF2_LKUF_NOME, 
    PUF2_FKCRED_PRESUMIDO, PUF2_LKDESC_CRED_PRESUMIDO, PUF2_LKCLASSTRIB_IBSCBS_CODIGO, 
    PUF2_ALIQ_IBS_UF_REGULAR, PUF2_ALIQ_IBS_MUN_REGULAR, PUF2_ALIQ_CBS_REGULAR, 
    PUF2_FKCLASSTRIB_REGULAR, PUF2_LKCLASSTRIB_COD_REGULAR, PUF2_LKCLASSTRIB_NOME_REGULAR, 
    PUF2_LKCOD_CRED_PRESUMIDO, PUF2_FKCLFIBSCBS_ID
)
SELECT 
    current_date, 88, 1, 143, NULL, 0.1, 0, 0.9, NULL, NULL, NULL, NULL, NULL,
    NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 
    '51021', 'VENDA DE MERCADORIA DE TERC. DENTRO DO ESTADO', '000', 
    'Tributação integral', 'Situações tributadas integralmente pelo IBS e CBS.', 
    NULL, NULL, NULL, 29, 'BA', 'BAHIA', NULL, NULL, '000001', NULL, NULL, 
    NULL, NULL, NULL, NULL, NULL, 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM PARAM_UF2 
    WHERE PUF2_FKCLFIBSCBS_ID = 1
);
COMMIT WORK;

SET TERM ^ ;
update emp_produto e
set e.prd_fkclfibscbs_id = 1
where e.prd_fkclfibscbs_id is null

^
SET TERM; ^

COMMIT WORK;

-------------- FIM INSERÇÃO DA TRIBUTAÇÃO PADRÃO DO IBS E CBS--------------------------------------------------

SET TERM ^ ;
update param_emp_tributos_encargos e
set e.ptbe_ativar_reforma = 'T'
where e.ptbe_ativar_reforma IS NULL
^
SET TERM; ^

COMMIT WORK;


