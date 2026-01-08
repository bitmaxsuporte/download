------------------ INICO DO SCRIPT QUE INSERE DBVER--------------------------
UPDATE DBVER
SET DBVER_VERSAO = '202601051130EMP' ;

COMMIT WORK;

------------------ FIM DO SCRIPT QUE INSERE DBVER--------------------------
INSERT INTO FIN_DOCTIPO (DOC_ID, DOC_DTCAD, DOC_NOME, DOC_APELIDO, DOC_FKSIT_ID)
SELECT 30, CURRENT_DATE, 'PAGAMENTO POSTERIOR', 'PST', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
  SELECT 1 FROM FIN_DOCTIPO WHERE DOC_ID = 30
);

----------- INICIO DO TRECHO QUE INSERE O ENQUANDRAMENTO DO IPI-------------------------------------------------------------

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '001', 'Imunidade', 'Livros, jornais, periódicos e o papel destinado à sua impressão - Art. 18 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '001'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '002', 'Imunidade', 'Produtos industrializados destinados ao exterior - Art. 18 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '002'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '003', 'Imunidade', 'Ouro,  definido  em  lei como  ativo  financeiro  ou  instrumento  cambial  - Art.  18 Inciso  III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '003'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '004', 'Imunidade', 'Energia elétrica, derivados de petróleo, combustíveis e minerais do País - Art. 18 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '004'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '005', 'Imunidade', 'Exportação de produtos nacionais - sem saída do territõrio brasileiro - venda para empresa sediada no exterior - atividades de pesquisa ou lavra de jazidas de petróleo e de gás natural - Art. 19 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '005'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '006', 'Imunidade', 'Exportação de produtos nacionais - sem saída do territõrio brasileiro - venda para empresa sediada no exterior - incorporados a produto final exportado para o Brasil - Art. 19 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '006'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '007', 'Imunidade', 'Exportação de produtos nacionais - sem saida do território brasileiro - venda para órgão ou entidade de governo estrangeiro  ou organismo  internacional  de que o Brasil seja membro, para ser entregue, no País, à ordem do comprador - Art. 19 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '007'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '101', 'Suspensão', 'Oleo de menta em bruto, produzido por lavradores - Art. 43 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '101'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '102', 'Suspensão', 'Produtos remetidos  à exposição em feiras de amostras e promoções semelhantes  - Art. 43 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '102'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '103', 'Suspensão', 'Produtos   remetidos   a   depósitos   fechados   ou   armazéns-gerais,   bem   assim   aqueles devolvidos ao remetente - Art. 43 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '103'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '104', 'Suspensão', 'Produtos  industrializados,  que  com  matérias-primas  (MP),  produtos  intermediários  (PI)  e material de embalagem (ME) importados submetidos a regime aduaneiro especial (drawback - suspensão/isenção), remetidos diretamente a empresas industriais  exportadoras  - Art. 43 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '104'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '105', 'Suspensão', 'Produtos, destinados à exportação, que saiam do estabelecimento industrial para empresas comerciais exportadoras, com o fim específico de exportação - Art. 43, Inciso V, alínea "a" do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '105'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '106', 'Suspensão', 'Produtos,  destinados  à exportação,  que saiam  do estabelecimento industrial  para recintos alfandegados  onde  se processe  o  despacho  aduaneiro  de exportação  - Art.  43, Inciso  V, alíneas "b" do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '106'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '107', 'Suspensão', 'Produtos,  destinados  à  exportação,  que  saiam  do  estabelecimento  industrial  para  outros locais onde se processe o despacho aduaneiro de exportação - Art. 43, Inciso V, alíneas "c'' do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '107'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '108', 'Suspensão', 'Matérias-primas (MP), produtos intermediários (PI) e material de embalagem (ME) destinados ao executor de industrialização por encomenda - Art. 43 Inciso VI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '108'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '109', 'Suspensão', 'Produtos industrializados por encomenda remetidos ao estabelecimento de origem - Art. 43 Inciso VII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '109'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '110', 'Suspensão', 'Matérias-primas ou produtos intermediãrios remetidos para emprego em operação industrial realizada pelo remetente fora do estabelecimento - Art. 43 Inciso VIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '110'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '111', 'Suspensão', 'Veículo,  aeronave  ou  embarcação  destinados  a  emprego  em  provas  de  engenharia  pelo fabricante - Art. 43 Inciso IX do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '111'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '112', 'Suspensão', 'Produtos remetidos, para industrialização ou comércio, de um para outro estabelecimento da mesma firma - Art. 43 Inciso X do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '112'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '113', 'Suspensão', 'Bens do ativo permanente remetidos a outro estabelecimento da mesma firma, para serem utilizados no processo industrial do recebedor - Art. 43 Inciso XI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '113'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '114', 'Suspensão', 'Bens  do  ativo  permanente  remetidos  a  outro  estabelecimento,  para  serem  utilizados  no processo industrial de produtos encomendados pelo remetente - Art. 43 Inciso XII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '114'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '115', 'Suspensão', 'Partes  e  peças  destinadas  ao  reparo  de  produtos  com  defeito  de  fabricação,  quando  a operação for executada gratuitamente, em virtude de garantia - Art. 43 Inciso XIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '115'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '116', 'Suspensão', 'Matérias-primas  (MP),  produtos  intermediãrios  (PI)  e  material  de  embalagem  (ME)  de fabricação nacional, vendidos a estabelecimento industrial, para industrialização de produtos destinados  à  exportação  ou  a  estabelecimento  comercial,  para  industrialização  em  outro estabelecimento da mesma firma ou de terceiro, de produto destinado à exportação - Art. 43 Inciso XIV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '116'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '117', 'Suspensão', 'Produtos  para  emprego  ou consumo  na  industrialização ou  elaboração  de  produto  a ser exportado,  adquiridos  no  mercado  interno  ou importados  - Art.  43 Inciso  XV  do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '117'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '118', 'Suspensão', 'Bebidas alcõolicas e demais produtos de produção nacional acondicionados em recipientes de capacidade superior ao limite mãximo permitido para venda a varejo - Art. 44 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '118'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '119', 'Suspensão', 'Produtos classificados NCM 21.06.90.10 Ex 02, 22.01, 22.02, exceto os Ex 01 e Ex 02 do Cõdigo  22.02.90.00  e  22.03  saídos  de  estabelecimento  industrial  destinado  a  comercial equiparado a industrial - Art. 45 Inciso I do Decreto7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '119'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '120', 'Suspensão', 'Produtos classificados NCM 21.06.90.10 Ex 02, 22.01, 22.02, exceto os Ex 01 e Ex 02 do Código  22.02.90.00  e 22.03  saídos  de estabelecimento comercial  equiparado  a industrial destinado a equiparado a industrial - Art. 45 Inciso ll do Decreto7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '120'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '121', 'Suspensão', 'Produtos classificados  NCM 21.06.90.10  Ex 02, 22.01, 22.02, exceto os Ex 01 e Ex 02 do Código 22.02.90.00 e 22.03 saídos de importador destinado a equiparado a industrial  - Art. 45 Inciso III do Decreto7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '121'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '122', 'Suspensão', 'Matérias-primas (MP), produtos intermediãrios (PI) e material de embalagem (ME) destinados a  estabelecimento  que  se  dedique  à  elaboração  de  produtos  classificados  nos  cõdigos previstos no art. 25 da Lei 10.684/2003 - Art. 46 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '122'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '123', 'Suspensão', 'Matérias-primas (MP), produtos intermediãrios (PI) e material de embalagem (ME) adquiridos por estabelecimentos industriais fabricantes de partes e peças destinadas a estabelecimento industrial fabricante de produto classificado no Capítulo 88 da Tipi - Art. 46 Inciso ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '123'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '124', 'Suspensão', 'Matérias-primas (MP), produtos intermediários (PI) e material de embalagem (ME) adquiridos por  pessoas  jurídicas  preponderantemente  exportadoras  -  Art.  46  Inciso  III  do  Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '124'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '125', 'Suspensão', 'Materiais  e  equipamentos  destinados  a  embarcações  pré-registradas  ou  registradas  no Registro Especial Brasileira - REB quando adquiridos por estaleiros navais brasileiros - Art. 46 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '125'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '126', 'Suspensão', 'Aquisição   por  beneficiário   de  regime  aduaneiro   suspensivo   do  imposto,  destinado  a industrialização para exportação - Art. 47 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '126'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '127', 'Suspensão', 'Desembaraço de produtos de procedência estrangeira importados por lojas francas - Art. 48 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '127'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '128', 'Suspensão', 'Desembaraço de maquinas,  equipamentos,  veiculos, aparelhos e instrumentos  sem similar nacional importados por empresas nacionais de engenharia, destinados à execução de obras no exterior - Art. 48 Inciso ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '128'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '129', 'Suspensão', 'Desembaraço de produtos de procedência estrangeira com saída de repartições aduaneiras com suspensão do Imposto de Importação - Art. 48 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '129'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '130', 'Suspensão', 'Desembaraço  de  matérias-primas,  produtos  intermediãrios  e  materiais  de  embalagem, importados  diretamente  por estabelecimento de que tratam  os incisos  I  a III do caput  do Decreto 7.212/2010 - Art. 48 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '130'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '131', 'Suspensão', 'Remessa  de  produtos  para  a  ZFM  destinados  ao  seu  consumo  interno,  utilização  ou industrialização - Art. 84 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '131'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '132', 'Suspensão', 'Remessa  de produtos  para  a ZFM  destinados  à exportação  - Art. 85 Inciso I  do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '132'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '133', 'Suspensão', 'Produtos  que,  antes de sua remessa  à ZFM, forem  enviados  pelo seu fabricante  a  outro estabelecimento, para industrialização adicional, por conta e ordem do destinatário - Art. 85 Inciso ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '133'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '134', 'Suspensão', 'Desembaraço  de  produtos  de  procedência  estrangeira  importados  pela  ZFM  quando  ali consumidos ou utilizados, exceto armas, munições, fumo, bebidas alcoõlicas e automõveis de passageiros. - Art. 86 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '134'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '135', 'Suspensão', 'Remessa  de produtos para a Amazônia  Ocidental destinados  ao seu consumo  interno ou utilização - Art. 96 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '135'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '136', 'Suspensão', 'Entrada de produtos estrangeiros na Area de Livre Comércio de Tabatinga - ALCT destinados ao seu consumo interno ou utilização - Art. 106 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '136'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '137', 'Suspensão', 'Entrada  de produtos  estrangeiros  na Area de Livre Comércio  de Guajará-Mirim  - ALCGM destinados ao seu consumo interno ou utilização - Art. 109 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '137'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '138', 'Suspensão', 'Entrada  de produtos  estrangeiros  nas  Areas  de Livre Comércio  de Boa Vista  - ALCBV  e Bomfim  -  ALCB  destinados  a  seu  consumo  interno  ou  utilização  -  Art.  112  do  Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '138'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '139', 'Suspensão', 'Entrada de produtos estrangeiros na Area de Livre Comércio de Macapã e Santana - ALCMS destinados a seu consumo interno ou utilização - Art. 116 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '139'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '140', 'Suspensão', 'Entrada  de produtos  estrangeiros  nas Areas de Livre Comércio  de Brasiléia  - ALCB  e de Cruzeiro do Sul - ALCCS destinados a seu consumo interno ou utilização - Art. 119 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '140'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '141', 'Suspensão', 'Remessa  para  Zona  de  Processamento   de  Exportação  -  ZPE  -  Art.  121  do  Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '141'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '142', 'Suspensão', 'Setor Automotivo - Desembaraço  aduaneiro, chassis e outros - regime aduaneiro especial - industrialização 87.01 a 87.05 - Art. 136, I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '142'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '143', 'Suspensão', 'Setor Automotivo - Do estabelecimento industõal produtos 87.01 a 87.05 da TIPI - mercado interno - empresa  comercial  atacadista  controlada  por PJ encomendante  do exterior.  - Art. 136, II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '143'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '144', 'Suspensão', 'Setor  Automotivo  -  Do  estabelecimento  industrial  -  chassis  e  outros  classificados  nas posições  84.29,  84.32,  84.33,  87.01  a  87.06  e  87.11  da  TIPI.  -  Art.  136,  III  do  Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '144'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '145', 'Suspensão', 'Setor  Automotivo  - Desembaraço  aduaneiro,  chassis  e outros  classificados  nas  posições 84.29,  84.32,  84.33,  87.01  a  87.06  e  87.11  da  TIPI  quando  importados  diretamente  por estabelecimento industrial - Art. 136, IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '145'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '146', 'Suspensão', 'Setor Automotivo - do estabelecimento industrial matérias-primas, os produtos intermediãrios e   os   materiais   de   embalagem,   adquiridos   por   fabricantes,   preponderantemente,   de componentes,  chassis  e outros  classificados  nos Códigos  84.29,  8432.40.00,  8432.80.00, 8433.20,  8433.30.00,  8433.40.00,  8433.5 e 87.01 a 87.06 da TIPI - Art. 136, V do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '146'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '147', 'Suspensão', 'Setor Automotivo - Desembaraço aduaneiro, as matérias-primas, os produtos intermediários e os materiais de embalagem, importados diretamente por fabricantes, preponderantemente, de componentes, chassis e outros classificados nos Códigos 84.29, 8432.40.00, 8432.80.00, 8433.20, 8433.30.00,  8433.40.00, 8433.5 e 87.01 a 87.06 da TIPI - Art. 136, VI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '147'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '148', 'Suspensão', 'Bens  de  Informática  e  Automação  -  matérias-primas,  os  produtos  intermediários  e  os materiais de embalagem, quando adquiridos por estabelecimentos industriais fabricantes dos referidos bens. - Art. 148 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '148'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '149', 'Suspensão', 'Reporto   -  Saida   de   Estabelecimento  de   máquinas   e  outros   quando   adquiridos   por beneficiários do REPORTO - Art. 166, I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '149'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '150', 'Suspensão', 'Reporto - Desembaraço aduaneiro de máquinas e outros quando adquiridos por beneficiários do REPORTO - Art. 166, II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '150'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '151', 'Suspensão', 'Repes - Desembaraço aduaneiro - bens sem similar nacional importados por beneficiários do REPES - Art. 171 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '151'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '152', 'Suspensão', 'Recine - Saida para beneficiário do reqime - Art. 14, III da Lei 12.599/2012', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '152'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '153', 'Suspensão', 'Recine - Desembaraço aduaneiro por beneficiário do regime - Art. 14, IV da Lei 12.599/2012', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '153'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '154', 'Suspensão', 'Reif - Saida para beneficiário do regime - Lei 12.794/1013, art. 8, III', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '154'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '155', 'Suspensão', 'Reif - Desembaraso aduaneiro por beneficiário do regime - Lei 12.794/1013, art. 8, IV', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '155'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '156', 'Suspensão', 'Repnbl-Redes - Saída para beneficiãrio do regime - Lei n° 12.715/2012, art. 30, II', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '156'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '157', 'Suspensão', 'Recompe - Saida de matérias-primas e produtos intermediários para beneficiãrios do regime - Decreto n• 7.243/2010, art. 5•, I', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '157'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '158', 'Suspensão', 'Recompe - Saida de matérias-primas e produtos intermediários destinados a industrialização de equipamentos - Programa Estimulo Universidade-Empresa - Apoio à Inovação - Decreto n° 7.243/2010, art. 5º, III', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '158'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '159', 'Suspensão', 'Rio  2016  -  Produtos  nacionais,  duráveis,  uso  e  consumo  dos  eventos,  adquiridos  pelas pessoas juridicas mencionadas no § 2o do art. 4o da Lei n° 12.780/2013 - Lei n° 12.780/2013, Art. 13', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '159'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '160', 'Suspensão', 'Regime Especial de Admissão Temporãria nos Termos do Art. 2o da IN 1361/2013', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '160'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '161', 'Suspensão', 'Regime Especial de  Admissão Temporária nos termos do art. 5o da IN 1361/2013', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '161'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '162', 'Suspensão', 'Regime  Especial   de  Admissão   Temporãrìa   nos  termos   do  art.  7o  da  IN  1361/2013 (Suspensão com pagamento de tributos diferidos até a duração do regime, limitado a 100% do valor original)', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '162'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '301', 'Isenção', 'Produtos industrializados por instituições de educação ou de assistência social, destinados a uso próprio ou a distribuição  gratuita a seus  educandos  ou assistidos  - Art. 54 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '301'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '302', 'Isenção', 'Produtos   industrializados  por  estabelecimentos  públicos  e  autárquicos   da  União,  dos Estados, do Distrito Federal e dos Municípios, não destinados a comércio - Art. 54 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '302'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '303', 'Isenção', 'Amostras de produtos para distribuição gratuita, de diminuto ou nenhum valor comercial - Art 54 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '303'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '304', 'Isenção', 'Amostras de tecidos sem valor comercial - Art. 54 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '304'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '305', 'Isenção', 'Pés isolados de calçados - Art. 54 Inciso V do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '305'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '306', 'Isenção', 'Aeronaves  de uso  militar  e suas  partes  e peças,  vendidas  à União  - Art. 54 Inciso  VI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '306'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '307', 'Isenção', 'Caixões funerários - Art. 54 Inciso VII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '307'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '308', 'Isenção', 'Papel destinado à impressão de músicas - Art. 54 Inciso VIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '308'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '309', 'Isenção', 'Panelas e outros artefatos semelhantes,  de uso doméstico,  de fabricação rústica, de pedra ou barro bruto - Art. 54 Inciso IX do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '309'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '310', 'Isenção', 'Chapéus, roupas e proteção, de couro, próprios para tropeiros - Art. 54 Inciso X do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '310'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '311', 'Isenção', 'Material bélico, de uso privativo das Forças Armadas, vendido à União - Art. 54 Inciso XI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '311'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '312', 'Isenção', 'Automóvel   adquirido  diretamente  a  fabricante  nacional,   pelas  missões  diplomáticas   e repartições  consulares  de  caráter  permanente,  ou  seus  integrantes,  bem  assim  pelas representações internacionais ou regionais de que o Brasil seja membro, e seus funcionários, peritos,  técnicos  e  consultores,  de  nacionalidade  estrangeira,  que  exerçam  funções  de caráter permanente - Art. 54 Inciso XII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '312'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '313', 'Isenção', 'Veículo   de   fabricação   nacional   adquirido   por   funcionário   das   missões   diplomáticas acreditadas tunto ao Governo Brasileiro - Art. 54 Inciso XIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '313'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '314', 'Isenção', 'Produtos  nacionais saídos diretamente  para Lojas Francas  - Art. 54 Inciso XIV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '314'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '315', 'Isenção', 'Materiais  e  equipamentos  destinados  a  Itaipu  Binacional  -  Art.  54  Inciso  XV  do  Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '315'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '316', 'Isenção', 'Produtos Importados por missões diplomáticas, consulados ou organismo internacional - Art. 54 Inciso XVI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '316'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '317', 'Isenção', 'Bagagem de passageiros desembaraçada com isenção do II. - Art. 54 Inciso XVII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '317'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '318', 'Isenção', 'Bagagem  de passageiros  desembaraçada  com  pagamento  do II. - Art. 54 Inciso  XVIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '318'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '319', 'Isenção', 'Remessas  postais internacionais sujeitas  a tributação  simplificada.  - Art. 54 Inciso XIX do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '319'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '320', 'Isenção', 'Máquinas  e  outros  destinados  à  pesquisa  científica  e  tecnológica  - Art.  54  Inciso  XX  do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '320'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '321', 'Isenção', 'Produtos de procedência estrangeira, isentos do II conforme Lei n° 8032/1990. - Art. 54 Inciso XXI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '321'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '322', 'Isenção', 'Produtos de procedência estrangeira utilizados em eventos esportivos - Art. 54 Inciso XXII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '322'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '323', 'Isenção', 'Veículos automotores, máquinas, equipamentos, bem assim suas partes e peças separadas, destinadas  à utilização  nas atividades  dos  Corpos  de Bombeiros  - Art. 54 Inciso  XXIII  do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '323'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '324', 'Isenção', 'Produtos importados para consumo em congressos, feiras e exposições - Art. 54 Inciso XXIV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '324'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '325', 'Isenção', 'Bens  de  informática,  Matéria  Prima,  produtos  intermediários  e  embalagem  destinados  a Umas eletrônicas - TSE - Art. 54 Inciso XXV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '325'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '326', 'Isenção', 'Materiais,  equipamentos,  máquinas,  aparelhos  e instrumentos,  bem  assim  os  respectivos acessórios, sobressalentes e ferramentas, que os acompanhem, destinados à construção do Gasoduto Brasil - Bolívia - Art. 54 Inciso XXVI do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '326'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '327', 'Isenção', 'Partes,  peças  e componentes,  adquiridos  por  estaleiros  navais  brasileiros,  destinados  ao emprego na conservação, modernização,  conversão ou reparo de embarcações registradas no Registro Especial Brasileiro - REB - Art. 54 Inciso XXVII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '327'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '328', 'Isenção', 'Aparelhos  transmissores  e  receptores  de  radiotelefonia  e  radiotelegrafia;  veículos  para patrulhamento  policial;  armas  e munições,  destinados  a  órgãos  de  segurança  pública  da União, dos Estados e do Distrito Federal - Art. 54 Inciso XXVIII do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '328'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '329', 'Isenção', 'Automóveis  de  passageiros   de  fabricação  nacional  destinados  à  utilização   como  táxi adquiridos por motoristas profissionais - Art. 55 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '329'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '330', 'Isenção', 'Automõveis  de  passageiros  de  fabricação  nacional  destinados  à  utilização  como  tãxi  por impedidos  de  exercer  atividade  por  destruição,  furto  ou  roubo  do  veículo  adquiridos  por motoristas profissionais. - Art. 55 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '330'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '331', 'Isenção', 'Automõveis   de  passageiros   de  fabricação  nacional  destinados  à  utilização   como  tãxi adquiridos por cooperativas de trabalho. - Art. 55 Inciso II do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '331'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '332', 'Isenção', 'Automóveis  de  passageiros  de fabricação  nacional,  destinados  a pessoas  portadoras  de deficiência física, visual, mental severa ou profunda, ou autistas - Art. 55 Inciso IV do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '332'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '333', 'Isenção', 'Produtos estrangeiros,  recebidos  em doação  de representações diplomãticas  estrangeiras sediadas  no  País,  vendidos  em  feiras,  bazares  e  eventos  semelhantes  por  entidades beneficentes - Art. 67 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '333'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '334', 'Isenção', 'Produtos industrializados na Zona Franca de Manaus  - ZFM, destinados  ao seu consumo interno - Art. 81 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '334'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '335', 'Isenção', 'Produtos  industrializados  na  ZFM,  por  estabelecimentos  com  projetos  aprovados  pela SUFRAMA,  destinados a comercialização em qualquer outro ponto do Território Nacional - Art. 81 Inciso ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '335'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '336', 'Isenção', 'Produtos nacionais destinados  à entrada na ZFM, para seu consumo interno, utilização ou industrialização,  ou  ainda,  para  serem  remetidos,  por  intermédio  de  seus  entrepostos,  à Amazônia Ocidental - Art. 81 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '336'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '337', 'Isenção', 'Produtos  industrializados  por estabelecimentos  com  projetos  aprovados  pela  SUFRAMA, consumidos ou utilizados na Amazônia Ocidental, ou adquiridos através da ZFM ou de seus entrepostos na referida região - Art. 95 Inciso I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '337'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '338', 'Isenção', 'Produtos  de procedência  estrangeira,  relacionados  na legislação,  oriundos  da ZFM e que derem entrada  na Amazônia  Ocidental  para  ali serem  consumidos  ou utilizados:  - Art. 95 Inciso ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '338'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '339', 'Isenção', 'Produtos  elaborados  com  matérias-primas  agrícolas  e  extrativas  vegetais  de  produção regional, por estabelecimentos industriais localizados na Amazônia Ocidental, com projetos aprovados pela SUFRAMA - Art. 95 Inciso III do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '339'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '340', 'Isenção', 'Produtos industrializados em Area de Livre Comércio - Art. 105 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '340'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '341', 'Isenção', 'Produtos nacionais ou nacionalizados, destinados à entrada na Area de Livre Comércio de Tabatinga - ALCT - Art. 107 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '341'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '342', 'Isenção', 'Produtos nacionais  ou nacionalizados, destinados à entrada na Area de Livre Comércio de Guaiará-Mirim- ALCGM - Art. 110 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '342'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '343', 'Isenção', 'Produtos nacionais ou nacionalizados, destinados à entrada nas Areas de Livre Comércio de Boa Vista - ALCBV e Bonfim - ALCB - Art. 113 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '343'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '344', 'Isenção', 'Produtos nacionais ou nacionalizados, destinados à entrada na Area de Livre Comércio de Macapá e Santana - ALCMS - Art. 117 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '344'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '345', 'Isenção', 'Produtos nacionais ou nacionalizados, destinados à entrada nas Areas de Livre Comércio de Brasiléia - ALCB e de Cruzeiro do Sul - ALCCS - Art. 120 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '345'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '346', 'Isenção', 'Recompe - equipamentos de informática - de beneficiário do regime para escolas das redes públicas de ensino federal, estadual, distrital, municipal ou nas escolas sem fins lucrativos de atendimento a pessoas com deficiência - Decreto n° 7.243/2010, art. 7º', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '346'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '347', 'Isenção', 'Rio 2016 - Importação de materiais para os jogos (medalhas,  troféus, impressos, bens não duráveis, etc.) - Lei n° 12.780/2013, Art. 4º, §1°, I', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '347'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '348', 'Isenção', 'Rio 2016 - Suspensão convertida em Isenção - Lei n° 12.780/2013, Art. 6º, I', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '348'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '349', 'Isenção', 'Rio 2016 - Empresas vinculadas ao CIO - Lei n° 12.780/2013, Art. 9º, I, d', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '349'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '350', 'Isenção', 'Rio 2016 - Saida de produtos importados pelo RIO 2016 - Lei n° 12.780/2013, Art. 10, I, d', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '350'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '351', 'Isenção', 'Rio 2016 - Produtos nacionais, não duráveis, uso e consumo dos eventos, adquiridos pelas pessoas jurídicas mencionadas no § 2o do art. 4o da Lei n° 12.780/2013 - Lei n° 12.780/2013, Art. 12', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '351'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '601', 'Redução', 'Equipamentos e outros destinados à pesquisa e ao desenvolvimento tecnológico - Art. 72 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '601'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '602', 'Redução', 'Equipamentos  e outros destinados  à empresas  habilitadas  no PDTI e PDTA utilizados  em pesquisa e ao desenvolvimento tecnológico - Art. 73 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '602'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '603', 'Redução', 'Microcomputadores  e  outros   de  até  R$11.000,00,   unidades   de  disco,  circuitos,   etc, destinados a bens de informãtica ou automação. Centro-Oeste SUDAM SUDENE - Art. 142, I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '603'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '604', 'Redução', 'Microcomputadores  e  outros  de  até  R$11.000,00,   unidades   de  disco,  circuitos,   etc, destinados a bens de informática ou automação. - Art. 142, I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '604'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '605', 'Redução', 'Bens de informática não incluídos no art. 142 do Decreto 7.212/2010 - Produzidos no Centro- Oeste, SUDAM, SUDENE - Art. 143, I do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '605'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '606', 'Redução', 'Bens de informática não incluídos no art. 142 do Decreto 7.212/2010 - Art. 143, ll do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '606'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '607', 'Redução', 'Padis - Art. 150 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '607'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '608', 'Redução', 'Patvd - Art. 158 do Decreto 7.212/2010', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '608'
);

INSERT INTO EMP_ENQUADRAMENTO_IPI (IPI_COD, IPI_GRUPOCST, IPI_DESCRICAO, IPI_FKSIT_ID)
SELECT '999', 'Outros', 'Tributação normal IPI; Outros;', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_ENQUADRAMENTO_IPI WHERE IPI_COD = '999'
);

----------- FIM DO TRECHO QUE INSERE O ENQUANDRAMENTO DO IPI-------------------------------------------------------------

----------- INICIO DO TRECHO QUE INSERE AS CST DO PIS E DA COFINS-------------------------------------------------------------

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '01', 'Saída', 'Operação Tributável com Alíquota Básica', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '01'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '02', 'Saída', 'Operação Tributável com Alíquota Diferenciada', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '02'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '03', 'Saída', 'Operação Tributável com Alíquota por Unidade de Medida de Produto', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '03'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '04', 'Saída', 'Operação Tributável Monofásica – Revenda a Alíquota Zero', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '04'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '05', 'Saída', 'Operação Tributável por Substituição Tributária', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '05'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '06', 'Saída', 'Operação Tributável a Alíquota Zero', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '06'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '07', 'Saída', 'Operação Isenta da Contribuição', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '07'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '08', 'Saída', 'Operação sem Incidência da Contribuição', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '08'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '09', 'Saída', 'Operação com Suspensão da Contribuição', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '09'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '49', 'Saída', 'Outras Operações de Saída', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '49'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '99', 'Saída', 'Outras Operações', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '99' AND PISCOFINS_TIPO = 'Saída'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '50', 'Entrada', 'Operação com Direito a Crédito – Vinculado Exclusivamente a Receita Tributada no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '50'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '51', 'Entrada', 'Operação com Direito a Crédito – Vinculado Exclusivamente a Receita Não Tributada no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '51'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '52', 'Entrada', 'Operação com Direito a Crédito – Vinculado Exclusivamente a Receita de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '52'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '53', 'Entrada', 'Operação com Direito a Crédito – Vinculado a Receitas Tributadas e Não-Tributadas no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '53'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '54', 'Entrada', 'Operação com Direito a Crédito – Vinculado a Receitas Tributadas no Mercado Interno e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '54'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '55', 'Entrada', 'Operação com Direito a Crédito – Vinculado a Receitas Não-Tributadas no Mercado Interno e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '55'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '56', 'Entrada', 'Operação com Direito a Crédito – Vinculado a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '56'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '60', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita Tributada no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '60'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '61', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita Não-Tributada no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '61'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '62', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada Exclusivamente a Receita de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '62'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '63', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '63'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '64', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas no Mercado Interno e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '64'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '65', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Não-Tributadas no Mercado Interno e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '65'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '66', 'Entrada', 'Crédito Presumido – Operação de Aquisição Vinculada a Receitas Tributadas e Não-Tributadas no Mercado Interno, e de Exportação', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '66'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '67', 'Entrada', 'Crédito Presumido – Outras Operações', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '67'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '70', 'Entrada', 'Operação de Aquisição sem Direito a Crédito', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '70'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '71', 'Entrada', 'Operação de Aquisição com Isenção', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '71'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '72', 'Entrada', 'Operação de Aquisição com Suspensão', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '72'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '73', 'Entrada', 'Operação de Aquisição a Alíquota Zero', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '73'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '74', 'Entrada', 'Operação de Aquisição sem Incidência da Contribuição', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '74'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '75', 'Entrada', 'Operação de Aquisição por Substituição Tributária', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '75'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '98', 'Entrada', 'Outras Operações de Entrada', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '98'
);

INSERT INTO EMP_CST_PISCOFINS (PISCOFINS_CST, PISCOFINS_TIPO, PISCOFINS_DESCRICAO, PISCOFINS_FKSIT_ID)
SELECT '99', 'Entrada', 'Outras Operações', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_CST_PISCOFINS WHERE PISCOFINS_CST = '99' AND PISCOFINS_TIPO = 'Entrada'
);

----------- FIM DO TRECHO QUE INSERE AS CST DO PIS E DA COFINS-------------------------------------------------------------

--------------- INICIO APAGAR CST A MAIS QUE FOI COM ERRO EM VERSÕES ANTIGAS--------------------------
DELETE
FROM emp_cst_piscofins E
WHERE E.piscofins_id > 34;

--------------- FIM APAGAR CST A MAIS QUE FOI COM ERRO EM VERSÕES ANTIGAS--------------------------


----------- INICIO DO TRECHO QUE INSERE A NATUREZA DA RECEITA DA PIS E DA COFINS-------------------------------------------------------------

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '1', 'Revenda de combustíveis – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '1' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '2', 'Revenda de fármacos e perfumarias – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '2' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '3', 'Revenda de veículos, maquinas e autopeças – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '3' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '4', 'Revenda de bebidas frias – Alíquota zero. ', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '4' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Gasolinas, Exceto Gasolina de Aviação', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Óleo Diesel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '103', 'Gás Liqüefeito de Petróleo – GLP', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '103' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '104', 'Querosene de Aviação', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '104' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '105', 'Correntes Destinadas à Formulação de Gasolinas', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '105' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '106', 'Correntes Destinadas à Formulação de Óleo Diesel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '106' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '107', 'Nafta Petroquímica Destinada à Formulação de Gasolina ou de Óleo Diesel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '107' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '108', 'Nafta Petroquímica Destinada à Formulação Exclusivamente de Óleo Diesel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '108' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '109', 'Biodiesel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '109' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '112', 'Álcool, Inclusive para Fins Carburantes – Venda por Produtor ou Importador.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '112' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '113', 'Álcool, Inclusive para Fins Carburantes – Venda por Distribuidor ou Comerciante Não Varejista.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '113' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '117', 'Álcool, Inclusive para Fins Carburantes – Venda efetuada diretamente do produtor ou do importador para as pessoas jurídicas de que tratam os incisos II e III do caput do art. 68-B da Lei nº 9.478, de 6 de agosto de 1997 ', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '117' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '150', 'Nafta Petroquímica Destinada às Centrais Petroquímicas', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '150' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '151', 'Etano, Propano, Butano e Correntes Gasosas de Refinaria - HLR - Hidrocarbonetos Leves de Refino Destinados à Produção de Eteno, Propeno, buteno, butadieno, orto-xileno, benzeno, tolueno, isopreno e paraxileno', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '151' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '152', 'Eteno, propeno, buteno, butadieno, orto-xileno, benzeno, tolueno, isopreno e paraxileno para indústrias químicas para serem utilizados como insumo produtivo', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '152' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '199', 'Revenda de combustíveis – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '199' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Produtos Farmacêuticos', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '202', 'Produtos de Perfumaria, de Toucador ou de Higiene Pessoal.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '202' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '299', 'Revenda de fármacos e perfumarias – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '299' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Veículos Automotores e Máquinas Agrícolas Autopropulsadas (*) Relativamente aos produtos classificados no Capítulo 84 da TIPI, aplica-se exclusivamente aos produtos autopropulsados.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '302', 'Autopeças - Vendas para Atacadistas, Varejistas e Consumidores', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '302' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '303', 'Autopeças - Vendas para Fabricantes de Veículos e Máquinas e de Autopeças', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '303' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '304', 'Pneumáticos (Pneus Novos e Câmaras-de-Ar)', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '304' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '399', 'Revenda de veículos, maquinas e autopeças – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '399' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Águas Minerais Artificiais e Águas Gaseificadas Artificiais', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Águas Minerais Naturais, Incluídas as Naturalmente Gaseificadas', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Refrigerantes', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'Refrescos, Isotônicos e Energéticos', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'Cervejas de Malte e Cervejas Sem Álcool', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Chope e Cervejas de Malte Quando Vendidas a Granel', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '411', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem até 500 ml. Vendas a PJ varejista ou consumidor final', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '411' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '412', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem acima de 500 ml. Vendas a PJ varejista ou consumidor final', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '412' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '413', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem até 500 ml. Vendas às demais pessoas jurídicas ', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '413' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '414', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem acima de 500 ml. Vendas às demais pessoas jurídicas', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '414' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '415', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem até 500 ml. Vendas a PJ varejista ou consumidor final', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '415' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '416', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem acima de 500 ml. Vendas a PJ varejista ou consumidor final', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '416' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '417', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem até 500 ml. Vendas às demais pessoas jurídicas', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '417' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '418', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem acima de 500 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '418' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '419', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem até 500 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '419' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '420', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem acima de 500 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '420' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '421', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem até 500 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '421' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '422', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem acima de 500 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '422' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '423', 'Cervejas de malte – Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '423' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '424', 'Cervejas de malte – Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '424' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '425', 'Cervejas de malte – Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '425' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '426', 'Cervejas de malte – Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '426' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '427', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '427' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '428', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '428' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '429', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '429' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '430', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '430' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '431', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '431' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '432', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '432' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '433', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '433' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '434', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '434' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '499', 'Revenda de bebidas frias – Alíquota zero', '2', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '499' AND NATUREZA_FKPISCOFINS_ID = '2'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '1', 'Revenda de combustíveis – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '1' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '2', 'Revenda de fármacos e perfumarias – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '2' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '3', 'Revenda de veículos, maquinas e autopeças – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '3' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '4', 'Revenda de bebidas frias – Alíquota zero. ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '4' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Gasolinas, Exceto Gasolina de Aviação', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '103', 'Gás Liqüefeito de Petróleo – GLP', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '103' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '104', 'Querosene de Aviação', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '104' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '105', 'Correntes Destinadas à Formulação de Gasolinas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '105' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '106', 'Correntes Destinadas Exclusivamente à Formulação de Óleo Diesel', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '106' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '107', 'Nafta Petroquímica Destinada à Formulação de Gasolina ou de Óleo Diesel', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '107' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '108', 'Nafta Petroquímica Destinada à Formulação Exclusivamente de Óleo Diesel', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '108' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '109', 'Biodiesel ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '109' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '110', 'Biodiesel de Matérias-Primas Produzidas nas Regiões Norte, Nordeste e Semi-Árido', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '110' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '111', 'Biodiesel de Matérias-Primas Adquiridas de Agricultor Familiar Enquadrado no PRONAF', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '111' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '112', 'Álcool, Inclusive para Fins Carburantes – Venda por Produtor ou Importador', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '112' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '113', 'Álcool, Inclusive para Fins Carburantes – Venda por Distribuidor', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '113' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '114', 'Crédito referente à aquisição de álcool anidro para adição à gasolina, no caso de venda realizada por produtor ou importador', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '114' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '115', 'Crédito referente à aquisição de álcool anidro para adição à gasolina, no caso de venda realizada por distribuidor', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '115' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '116', 'Crédito presumido por metro cúbico de álcool comercializado no mercado interno, por pessoa jurídica importadora ou produtora de álcool, inclusive para fins carburantes, sujeita ao regime de apuração não cumulativa.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '116' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '117', 'Álcool, Inclusive para Fins Carburantes – Venda efetuada diretamente do produtor ou do importador para as pessoas jurídicas de que tratam os incisos II e III do caput do art. 68-B da Lei nº 9.478, de 6 de agosto de 1997 ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '117' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '118', 'Operações realizadas com álcool, inclusive para fins carburantes, efetuada diretamente de cooperativa para as pessoas jurídicas comerciantes varejistas r ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '118' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '150', 'Nafta Petroquímica Destinada às Centrais Petroquímicas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '150' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '151', 'Etano, Propano, Butano e Correntes Gasosas de Refinaria - HLR - Hidrocarbonetos Leves de Refino Destinados à Produção de Eteno, Propeno, buteno, butadieno, orto-xileno, benzeno, tolueno, isopreno e paraxileno', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '151' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '152', 'Eteno, propeno, buteno, butadieno, orto-xileno, benzeno, tolueno, isopreno e paraxileno para indústrias químicas para serem utilizados como insumo produtivo', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '152' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '199', 'Revenda de combustíveis – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '199' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Produtos Farmacêuticos', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '202', 'Produtos de Perfumaria, de Toucador ou de Higiene Pessoal.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '202' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '299', 'Revenda de fármacos e perfumarias – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '299' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Veículos Automotores e Máquinas Agrícolas Autopropulsadas (*) Relativamente aos produtos classificados no Capítulo 84 da TIPI, aplica-se exclusivamente aos produtos autopropulsados.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '302', 'Autopeças - Vendas para Atacadistas, Varejistas e Consumidores', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '302' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '303', 'Autopeças - Vendas para Fabricantes de Veículos e Máquinas e de Autopeças', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '303' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '304', 'Pneumáticos (Pneus Novos e Câmaras-de-Ar)', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '304' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '399', 'Revenda de veículos, maquinas e autopeças – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '399' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Águas Minerais Artificiais e Águas Gaseificadas Artificiais', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Águas Minerais Naturais, Incluídas as Naturalmente Gaseificadas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Refrigerantes', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'Refrescos, Isotônicos e Energéticos', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'Cervejas de Malte e Cervejas Sem Álcool', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Chope e Cervejas de Malte Quando Vendidas a Granel', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '411', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem até 500 ml. Vendas a PJ varejista ou consumidor final', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '411' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '412', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem acima de 500 ml. Vendas a PJ varejista ou consumidor final', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '412' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '413', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem até 500 ml. Vendas às demais pessoas jurídicas ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '413' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '414', 'Preparações compostas, não alcoólicas (extratos concentrados ou sabores concentrados), para elaboração de bebida refrigerante do Capítulo 22, com capacidade de diluição de até 10 partes da bebida para cada parte do concentrado – Volume de embalagem acima de 500 ml. Vendas às demais pessoas jurídicas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '414' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '415', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem até 500 ml. Vendas a PJ varejista ou consumidor final', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '415' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '416', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem acima de 500 ml. Vendas a PJ varejista ou consumidor final', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '416' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '417', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem até 500 ml. Vendas às demais pessoas jurídicas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '417' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '418', 'Águas, incluindo as águas minerais, naturais ou artificiais, e as águas gaseificadas, não adicionadas de açúcar ou de outros edulcorantes nem aromatizadas – Volume de embalagem acima de 500 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '418' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '419', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem até 500 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '419' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '420', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem acima de 500 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '420' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '421', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem até 500 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '421' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '422', 'Águas, incluindo as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas e outras bebidas não alcoólicas, exceto sucos (sumos) de frutas ou de produtos hortícolas, da posição 20.09 – Volume de embalagem acima de 500 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '422' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '423', 'Cervejas de malte – Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '423' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '424', 'Cervejas de malte – Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '424' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '425', 'Cervejas de malte – Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '425' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '426', 'Cervejas de malte – Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '426' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '427', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '427' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '428', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '428' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '429', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '429' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '430', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '430' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '431', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '431' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '432', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção até 5.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '432' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '433', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem até 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '433' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '434', 'Cervejas e chopes especiais classificados nos códigos 22.02.90.00 Ex 03 e 22.03 da TIPI (pessoa jurídica com volume total de produção acima de 5.000.000 e até 10.000.000 de litros, no ano-calendário anterior) - Volume de embalagem acima de 400 ml.', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '434' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '499', 'Revenda de bebidas frias – Alíquota zero', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '499' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '611', 'Refrigerantes  PET Descartável Até 350 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '611' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '612', 'Refrigerantes De 351 a 600 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '612' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '613', 'Refrigerantes De 601 a 1.000 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '613' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '614', 'Refrigerantes De 1.001 a 1.500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '614' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '615', 'Refrigerantes De 1.501 a 2.200 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '615' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '616', 'Refrigerantes Acima de 2.200 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '616' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '617', 'Refrigerantes  PET Retornável', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '617' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '618', 'Refrigerantes ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '618' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '619', 'Refrigerantes ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '619' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '620', 'Refrigerantes ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '620' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '621', 'Refrigerantes ', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '621' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '631', 'Chá Até 350 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '631' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '632', 'Chá Até 500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '632' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '633', 'Chá Acima de 500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '633' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '641', 'Refrescos', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '641' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '651', 'Isotônico', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '651' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '661', 'Energético Até 350 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '661' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '662', 'Energético De 351 a 600 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '662' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '663', 'Energético De 601 a 1.000 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '663' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '664', 'Energético De 1.001 a 1.500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '664' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '665', 'Energético Acima de 1.500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '665' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '666', 'Energético Até 350 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '666' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '667', 'Energético De 351 a 500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '667' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '668', 'Energético Acima de 500 ml', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '668' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '671', 'Cerveja Retornável', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '671' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '672', 'Cerveja Descartável', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '672' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '681', 'Chopp', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '681' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '701', 'Embalagens de Vidro não Retornáveis para Refrigerantes ou Cervejas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '701' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '702', 'Embalagens de Vidro Retornáveis para Refrigerantes ou Cervejas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '702' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '703', 'Garrafas e Garrafões com Capacidade Nominal de Envasamento Inferior a 10 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '703' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '704', 'Garrafas e Garrafões com Capacidade Nominal de Envasamento Igual ou Superior a 10 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '704' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '705', 'Lata de Aço para Refrigerantes, Cervejas sem Álcool ou Água', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '705' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '706', 'Lata de Aço para Cervejas de Malte', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '706' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '707', 'Lata de Alumínio para Refrigerantes, Cervejas sem Álcool ou Água', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '707' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '708', 'Lata de Alumínio para Cervejas de Malte', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '708' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '709', 'Pré-Formas de Embalagens com Faixa de Gramatura de até 30 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '709' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '710', 'Pré-Formas de Embalagens com Faixa de Gramatura Acima de 30 até 42 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '710' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '712', 'Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '712' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '751', 'Embalagens de Vidro não Retornáveis para Refrigerantes ou Cervejas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '751' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '752', 'Embalagens de Vidro Retornáveis para Refrigerantes ou Cervejas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '752' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '753', 'Garrafas e Garrafões com Capacidade Nominal de Envasamento Inferior a 10 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '753' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '754', 'Garrafas e Garrafões com Capacidade Nominal de Envasamento Igual ou Superior a 10 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '754' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '755', 'Lata de Aço para Refrigerantes, Cervejas sem Álcool ou Água', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '755' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '756', 'Lata de Aço para Cervejas de Malte', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '756' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '757', 'Lata de Alumínio para Refrigerantes, Cervejas sem Álcool ou Água', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '757' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '758', 'Lata de Alumínio para Cervejas de Malte', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '758' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '759', 'Pré-Formas de Embalagens com Faixa de Gramatura de até 30 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '759' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '760', 'Pré-Formas de Embalagens com Faixa de Gramatura Acima de 30 até 42 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '760' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '762', 'Pré-Formas de Embalagens com Faixa de Gramatura Acima de 42 g', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '762' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '811', 'Águas Minerais Artificiais - Todas as Embalagens', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '811' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '812', 'Águas Gaseificadas Artificiais – Todas as Embalagens', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '812' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '821', 'Águas Minerais Naturais Envasadas em Embalagens de Capacidade até 9,999 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '821' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '822', 'Águas Minerais Naturais Envasadas em Embalagens de Capacidade Igual ou Superior a 10 Litros', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '822' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '831', 'Águas e Refrigerantes, em PET/Plástico - Grupo 1', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '831' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '832', 'Águas e Refrigerantes, em PET/Plástico - Grupo 2', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '832' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '833', 'Águas e Refrigerantes, em PET/Plástico - Grupo 3', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '833' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '834', 'Águas e Refrigerantes, em PET/Plástico - Grupo 4', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '834' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '835', 'Águas e Refrigerantes, em PET/Plástico - Grupo 5', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '835' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '836', 'Águas e Refrigerantes, em PET/Plástico - Grupo 6', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '836' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '837', 'Águas e Refrigerantes, em PET/Plástico - Grupo 7', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '837' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '838', 'Águas e Refrigerantes, em PET/Plástico - Grupo 8', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '838' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '839', 'Águas e Refrigerantes, em PET/Plástico - Grupo 9', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '839' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '840', 'Águas e Refrigerantes, em PET/Plástico - Grupo 10', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '840' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '841', 'Águas e Refrigerantes, em PET/Plástico - Grupo 11', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '841' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '842', 'Águas e Refrigerantes, em PET/Plástico - Grupo 12', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '842' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '843', 'Águas e Refrigerantes, em PET/Plástico - Grupo 13', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '843' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '844', 'Águas e Refrigerantes, em PET/Plástico - Grupo 14', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '844' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '845', 'Águas e Refrigerantes, em PET/Plástico - Grupo 16', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '845' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '846', 'Águas e Refrigerantes, em PET/Plástico - Grupo 18', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '846' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '847', 'Águas e Refrigerantes, em PET/Plástico - Grupo 20', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '847' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '848', 'Águas e Refrigerantes, em PET/Plástico - Grupo 23', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '848' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '849', 'Águas e Refrigerantes, em PET/Plástico - Grupo 25', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '849' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '850', 'Águas e Refrigerantes, em PET/Plástico - Grupo 29', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '850' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '861', 'Águas e Refrigerantes, em Lata - Grupo 1', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '861' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '862', 'Águas e Refrigerantes, em Lata - Grupo 2', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '862' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '863', 'Águas e Refrigerantes, em Lata - Grupo 3', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '863' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '864', 'Águas e Refrigerantes, em Lata - Grupo 4', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '864' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '865', 'Águas e Refrigerantes, em Lata - Grupo 5', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '865' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '866', 'Águas e Refrigerantes, em Lata - Grupo 6', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '866' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '867', 'Águas e Refrigerantes, em Lata - Grupo 7', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '867' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '868', 'Águas e Refrigerantes, em Lata - Grupo 8', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '868' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '869', 'Águas e Refrigerantes, em Lata - Grupo 9', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '869' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '870', 'Águas e Refrigerantes, em Lata - Grupo 10', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '870' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '871', 'Águas e Refrigerantes, em Lata - Grupo 11', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '871' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '872', 'Águas e Refrigerantes, em Lata - Grupo 14', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '872' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '881', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 1', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '881' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '882', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 2', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '882' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '883', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 3', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '883' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '884', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 4', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '884' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '885', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 5', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '885' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '886', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 6', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '886' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '888', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 8', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '888' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '889', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 9', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '889' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '890', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 10', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '890' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '891', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 11', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '891' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '892', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 12', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '892' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '893', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 13', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '893' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '894', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 14', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '894' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '895', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 15', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '895' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '896', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas - Grupo 16', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '896' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '900', 'Cervejas de Malte e Cervejas Sem Álcool, em Lata', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '900' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '910', 'Cervejas de Malte e Cervejas Sem Álcool, em Vidro Descartável e Outras Embalagens Não Especificadas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '910' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '920', 'Chope e Cervejas de Malte Quando Vendidas a Granel', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '920' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '930', 'Águas e Refrigerantes, em PET/Plástico', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '930' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '940', 'Águas e Refrigerantes, em Lata', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '940' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '950', 'Águas e Refrigerantes, em Vidro e Outras Embalagens Não Especificadas', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '950' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '960', 'Águas e Refrigerantes, em PET/Plástico Retornável (Águas, incluídas as águas minerais e as águas gaseificadas, adicionadas de açúcar ou de outros edulcorantes ou aromatizadas)', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '960' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '961', 'Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante – Tipo Post Mix – Todas as Embalagens', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '961' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '962', 'Preparações Compostas, não Alcoólicas, para Elaboração de Bebida Refrigerante – Tipo Pre Mix – Todas as Embalagens', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '962' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '970', 'Refrescos, Isotônicos e Energéticos – em PET/Plástico, Copos e Cartonados', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '970' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '980', 'Refrescos, Isotônicos e Energéticos, em Lata e Vidro', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '980' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '990', 'Cervejas de Malte e Cervejas Sem Álcool, em Vidro Retornável', '4', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '990' AND NATUREZA_FKPISCOFINS_ID = '4'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Cigarros, de fumo (tabaco) ou dos seus sucedâneos', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Cigarrilhas', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Motocicletas (incluídos os ciclomotores) e outros ciclos equipados com motor auxiliar, mesmo com carro lateral; carros laterais', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Semeadores, plantadores e transplantadores dos códigos 8432.30 da TIPI', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Álcool, inclusive para fins carburantes – Vendas por Produtor/Importador', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Álcool, inclusive para fins carburantes – Vendas por Distribuidor', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Gasolinas, Óleo Dieses e GLP', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Veiculos', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'Autopeças', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'Pneus', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Bebidas Frias', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '408', 'Embalagens para bebidas Frias', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '408' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '409', 'Artigos de Perfumaria', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '409' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '999', 'Revenda de Produtos sujeitos à Substituição Tributária', '5', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '999' AND NATUREZA_FKPISCOFINS_ID = '5'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Adubos ou fertilizantes classificados no Capítulo 31, exceto os produtos de uso veterinário, da TIPI, e suas matérias-primas', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Defensivos agropecuários classificados na posição 38.08 da TIPI e suas matérias-primas', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '103', 'Sementes e mudas destinadas à semeadura e plantio, em conformidade com o disposto na Lei no 10.711/03, e produtos de natureza biológica utilizados em sua produção', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '103' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '104', 'Corretivo de solo de origem mineral classificado no Capítulo 25 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '104' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '105', 'Legumes de vagem, secos, em grão, mesmo pelados ou partidos; arroz; farinhas e sêmolas', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '105' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '106', 'Inoculantes agrícolas produzidos a partir de bactérias fixadoras de nitrogênio, classificados no código 3002.90.99 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '106' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '107', 'Vacinas para medicina veterinária', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '107' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '108', 'Farinha, grumos e sêmolas, grãos esmagados ou em flocos, de milho, classificados, respectivamente, nos códigos 1102.20, 1103.13 e 1104.19, todos da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '108' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '109', 'Pintos de 1 (um) dia', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '109' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '110', 'Leite fluido pasteurizado ou industrializado, na forma de ultrapasteurizado, leite em pó, integral, semidesnatado ou desnatado, leite fermentado, bebidas e compostos lácteos e fórmulas infantis, assim definidas conforme previsão legal específica, destinados ao consumo humano ou utilizados na industrialização de produtos que se destinam ao consumo humano', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '110' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '111', 'Queijos tipo mozarela, minas, prato, queijo de coalho, ricota, requeijão, queijo provolone, queijo parmesão e queijo fresco não maturado.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '111' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '112', 'Soro de leite fluido a ser empregado na industrialização de produtos destinados ao consumo humano', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '112' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '113', 'Farinha de trigo', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '113' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '114', 'Trigo', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '114' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '115', 'Pré-misturas próprias para fabricação de pão comum e pão comum', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '115' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '116', 'Produtos hortícolas e frutas', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '116' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '117', 'Ovos', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '117' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '118', 'Venda de semens e embriões ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '118' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '119', 'Massas alimentícias classificadas na posição 19.02 da TIPI.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '119' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '120', 'Queijo do reino', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '120' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '121', 'Carnes bovina, suína, ovina, caprina e de aves e produtos de origem animal classificados nos seguintes códigos da TIPI: a) 02.01, 02.02, 0206.10.00, 0206.2, 0210.20.00, 0506.90.00, 0510.00.10 e 1502.10.1; b) 02.03, 0206.30.00, 0206.4, 02.07, 02.09 e 0210.1 e carne de frango classificada no código 0210.99.00; e c) 02.04 e miudezas comestíveis de ovinos e caprinos classificadas no código 0206.80.00;', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '121' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '122', 'Peixes e outros produtos classificados nos seguintes códigos da TIPI:', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '122' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '123', 'Café classificado nos códigos 09.01 e 2101.1 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '123' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '124', 'Açúcar classificado nos códigos 1701.14.00 e 1701.99.00 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '124' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '125', 'Óleo de soja classificado na posição 15.07 da TIPI e outros óleos vegetais classificados nas posições 15.08 a 15.14 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '125' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '126', 'Manteiga classificada no código 0405.10.00 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '126' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '127', 'Margarina classificada no código 1517.10.00', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '127' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '128', 'Sabões de toucador classificados no código 3401.11.90 Ex 01 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '128' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '129', 'Produtos para higiene bucal ou dentária classificados na posição 33.06 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '129' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '130', 'Papel higiênico classificado no código 4818.10.00 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '130' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Aeronaves classificadas na posição 88.02 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '202', 'Partes, peças, ferramentais, componentes, insumos, fluidos hidráulicos, tintas, anticorrosivos, lubrificantes, equipamentos, serviços e matérias-primas a serem empregados na manutenção, conservação, modernização, reparo, revisão, conversão e industrialização das aeronaves, seus motores, partes, componentes, ferramentais e equipamentos das aeronaves referidas no código 201', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '202' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '203', 'Álcool anidro adicionado à gasolina, por distribuidores ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '203' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '204', 'Álcool, inclusive para fins carburantes, em operações realizadas em bolsa de mercadorias e futuros, exceto quando ocorra a liquidação física do contrato ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '204' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '205', 'Carvão mineral destinado à geração de energia elétrica', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '205' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '206', 'Biodiesel fabricado a partir de matérias-primas produzidas nas regiões norte, nordeste e no semi-árido, por agricultor familiar enquadrado no PRONAF', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '206' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '207', 'Valores recebidos pelos concessionários de que trata a Lei nº 6.729/1979, pela intermediação ou entrega dos veículos classificados nas posições 87.03 e 87.04 da TIPI, vendidos diretamente ao consumidor final ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '207' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '208', 'Veículos novos montados sobre chassis, com capacidade para vinte e três a quarenta e quatro passageiros, classificados no código 8702.10.00 Ex. 02 e 8702.90.90 Ex 02, da TIPI, destinados ao transporte escolar para a educação básica na zona rural das redes estadual, municipal e distrital, quando adquiridos pelos Estados, Municípios e pelo Distrito Federal', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '208' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '209', 'Embarcações novas, com capacidade para vinte a trinta e cinco passageiros, classificadas no código 8901.90.00 da TIPI, destinadas ao transporte escolar para a educação básica na zona rural das redes estadual, municipal e distrital, quando adquiridos pelos Estados, Municípios e pelo Distrito Federal', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '209' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '210', 'Materiais e equipamentos, inclusive partes, peças e componentes, destinados ao emprego na construção, conservação, modernização, conversão ou reparo de embarcações registradas ou pré-registradas no Registro Especial Brasileiro ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '210' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '211', 'Veículos e carros blindados de combate, novos, armados ou não, e suas partes, produzidos no Brasil, com peso bruto total até 30 (trinta) toneladas, classificados na posição 8710.00.00 da TIPI, destinados ao uso das Forças Armadas ou órgãos de segurança pública brasileiros, quando adquiridos por órgãos e entidades da administração pública direta', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '211' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '212', 'Gás natural canalizado, destinado à produção de energia elétrica pelas usinas integrantes do Programa Prioritário de Termoeletricidade, nos termos e condições estabelecidos em ato conjunto dos Ministros de Estado de Minas Energia e da Fazenda', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '212' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '213', 'Serviços de transporte ferroviário em sistema de trens de alta velocidade (TAV), assim entendido como a composição utilizada para efetuar a prestação do serviço público de transporte ferroviário que consiga atingir velocidade igual ou superior a 250 km/h (duzentos e cinquenta quilômetros por hora).', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '213' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '214', 'Receitas decorrentes da prestação de serviços regulares de transporte coletivo municipal rodoviário, metroviário e ferroviário de passageiros, inclusive as decorrentes da prestação dos referidos serviços no território de região metropolitana regularmente constituída.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '214' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '215', 'Receita decorrente da prestação de serviços regulares de transporte coletivo municipal rodoviário, metroviário, ferroviário e aquaviário de passageiros, alcançando as receitas decorrentes da prestação dos referidos serviços: -no território de região metropolitana regularmente constituída; e -conforme definidos nos incisos XI a XIII do art. 4o da Lei no 12.587/2012.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '215' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '216', 'Álcool, Inclusive para Fins Carburantes - Venda por Distribuidor', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '216' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '217', 'Óleo Diesel', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '217' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '218', 'Correntes Destinadas Exclusivamente à Formulação de Óleo Diesel', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '218' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '219', 'GLP* quando destinado ao uso doméstico e envasado em recipientes de até treze quilogramas. ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '219' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '220', 'Biodiesel – As operações no mercado interno ou sobre importação', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '220' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '221', 'Querosene de Aviação', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '221' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '222', 'Gás Liquefeito de Petróleo – GLP derivado de petróleo e de gás natural.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '222' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '223', 'Receitas decorrentes da venda de produtos classificados no Ex 01 do código 8503.00.90 da Tipi, exceto pás eólicas. utilizados exclusiva ou principalmente em aerogeradores classificados no código 8502.31.00 da Tipi.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '223' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '224', 'Receita ou o faturamento na venda ou sobre a importação de gás natural veicular – GNV classificado nos códigos 2711.11.00 ou 2711.21.00 da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '224' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '225', 'As operações no mercado interno ou sobre importação que envolvam gasolina e suas correntes, exceto de aviação.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '225' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '226', 'As operações no mercado interno e importação que envolvam etanol, inclusive para fins carburantes.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '226' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '227', ' As receitas decorrentes da atividade de transporte aéreo regular de passageiros. (Art. 2º, § 2º, da MP nº 1.147/22)', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '227' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '228', 'Programa Mover - As receitas e ganhos líquidos do Fundo Nacional de Desenvolvimento Industrial e Tecnológico (FNDIT).', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '228' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Produtos classificados na posição 87.13 da NCM (cadeiras de rodas e outros veículos) ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '302', 'Artigos e aparelhos ortopédicos ou para fraturas classificados no código 90.21.10 da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '302' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '303', 'Artigos e aparelhos de próteses classificados no código 90.21.3 da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '303' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '304', 'Almofadas antiescaras classificadas nos Capítulos 39, 40, 63 e 94 da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '304' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '305', 'Bens relacionados em ato do Poder Executivo para aplicação nas Unidades Modulares de Saúde de que trata o Convênio ICMS no 114/2009 quando vendidos a órgãos da administração pública direta federal, estadual, distrital e municipal ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '305' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '306', 'Produtos químicosclassificados no Capítulo 29 da Nomenclatura Comum do Mercosul – NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '306' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '307', 'Produtos químicos intermediários de síntese, classificados no Capítulo 29 da NCM ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '307' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '308', 'Produtos destinados ao uso em hospitais, clínicas e consultórios médicos e odontológicos, campanhas de saúde realizadas pelo poder público, laboratório de anatomia patológica, citológica ou de análises clínicas, classificados nas posições 30.02, 30.06, 39.26, 40.15 e 90.18, da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '308' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '309', 'Produtos classificados nos códigos 8443.32.22, 8469.00.39 Ex 01, 8714.20.00, e 9021.40.00, todos da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '309' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '310', 'Calculadoras equipadas com sintetizador de voz classificadas no código 8470.10.00 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '310' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '311', 'Teclados com colmeia classificados no código 8471.60.52 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '311' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '312', 'Indicadores ou apontadores - mouses - com entrada para acionador classificados no código 8471.60.53 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '312' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '313', 'Linhas braile classificadas no código 8471.60.90 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '313' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '314', 'Digitalizadores de imagens - scanners - equipados com sintetizador de voz classificados no código 8471.90.14 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '314' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '315', 'Duplicadores braile classificados no código 8472.10.00 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '315' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '316', 'Acionadores de pressão classificados no código 8471.60.53 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '316' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '317', 'Lupas eletrônicas do tipo utilizado por pessoas com deficiência visual classificadas no código 8525.80.19 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '317' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '318', 'Implantes cocleares classificados no código 9021.90.19 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '318' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '319', 'Próteses oculares classificadas no código 9021.39.80 da TIPI', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '319' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '320', 'Programas - softwares - de leitores de tela que convertem texto em voz sintetizada para auxílio de pessoas com deficiência visual.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '320' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '321', 'Aparelhos contendo programas - softwares - de leitores de tela que convertem texto em caracteres braile, para utilização de surdos-cegos.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '321' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '322', 'Neuroestimuladores para tremor essencial/Parkinson, classificados no código 9021.90.19, e seus acessórios, classificados nos códigos 9018.90.99, 9021.90.91 e 9021.90.99, todos da Tipi.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '322' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '323', 'Equipamentos ou materiais destinados a uso médico, hospitalar, clínico ou laboratorial, conforme ato editado pelo Poder Executivo, quando adquiridos: I - pela União, Estados, Distrito Federal ou Municípios, bem como pelas suas autarquias e fundações instituídas e mantidas pelo poder público; ou II - por entidades beneficentes de assistência social que atendam ao disposto na Lei nº 12.101/2009. ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '323' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '324', 'Venda no mercado interno e sobre a operação de importação de sulfato de zinco para medicamentos utilizados em nutrição parenteral, classificado nos seguintes códigos: I - 3003.90.99 da Tabela de Incidência do Imposto sobre Produtos Industrializados - TIPI - medicamento a granel; e II - 3004.90.99 da TIPI - medicamento em doses.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '324' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Venda a varejo de unidades de processamento digital classificadas no código 8471.50.10 da TIPI, desde que o preço de venda de cada unidade não exceda a R$ 2.000,00', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Venda a varejo de máquinas automáticas para processamento de dados, digitais, portáteis, de peso inferior a 3,5Kg (três quilos e meio), com tela (écran) de área superior a 140cm2 (cento e quarenta centímetros quadrados), classificadas nos códigos 8471.30.12, 8471.30.19 ou 8471.30.90 da TIPI, desde que o preço de venda de cada máquina não exceda a R$ 4.000,00 ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Venda a varejo de máquinas automáticas de processamento de dados, apresentadas sob a forma de sistemas, do código 8471.49 da TIPI, contendo exclusivamente 1 (uma) unidade de processamento digital, 1 (uma) unidade de saída por vídeo (monitor), 1 (um) teclado (unidade de entrada), 1 (um) mouse (unidade de entrada), classificados, respectivamente, nos códigos 8471.50.10, 8471.60.7, 8471.60.52 e 8471.60.53 da TIPI, desde que o preço de venda de cada sistema não exceda a R$ 4.000,00 (dois mil e quinhentos reais)', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Venda a varejo de teclado (unidade de entrada) e de mouse (unidade de entrada) classificados, respectivamente, nos códigos 8471.60.52 e 8471.60.53 da TIPI, quando acompanharem a unidade de processamento digital classificada no código 8471.50.10 da TIPI, desde que o preço de venda de cada conjunto não exceda a R$ 2.100,00 (dois mil e cem reais). ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'PADIS - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Semicondutores - Venda, no mercado interno para PJ habilitada no PADIS, de máquinas, aparelhos, instrumentos, equipamentos, para incorporação ao ativo imobilizado da adquirente - Venda, no mercado interno para PJ habilitada no PADIS, de ferramentas computacionais (softwares) - Venda, no mercado interno para PJ habilitada no PADIS, de insumos - Vendas dos dispositivos eletrônicos semicondutores e mostradores de informação (displays) por PJ habilitada no PADIS - Venda de projeto (design), por PJ habilitada no PADIS', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'PATVD - Programa de Apoio ao Desenvolvimento Tecnológico da Indústria de Equipamentos para a TV Digital - Venda, no mercado interno para PJ habilitada no PATVD, de máquinas, aparelhos, instrumentos, equipamentos, para incorporação ao ativo imobilizado da adquirente- Venda, no mercado interno para PJ habilitada no PATVD, de ferramentas computacionais (softwares) - Venda, no mercado interno para PJ habilitada no PATVD, de insumos - Vendas dos equipamentos transmissores por PJ habilitada no PATVD  ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Venda a varejo de máquinas automáticas de processamento de dados, portáteis, sem teclado, que tenham uma unidade central de processamento com entrada e saída de dados por meio de uma tela sensível ao toque de área superior a 140 cm2 e inferior a 600 cm2, e que não possuam função de comando remoto (Tablet PC), classificadas na subposição 8471.41 da Tipi, produzidas no País conforme processo produtivo básico estabelecido pelo Poder Executivo, desde que o preço de venda não exceda R$ 2.500,00 (dois mil e quinhentos reais).', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '408', 'Venda, a varejo de modems, classificados nas posições 8517.62.55, 8517.62.62 ou 8517.62.72 da TIPI, desde que o preço de venda não exceda R$ 150,00 (cento e cinquenta reais).', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '408' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '409', 'Venda a varejo de telefones portáteis de redes celulares que possibilitem o acesso à internet em alta velocidade do tipo smartphone classificados na posição 8517.12.31 da Tipi, produzidos no País conforme processo produtivo básico estabelecido pelo Poder Executivo.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '409' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '410', 'Venda a varejo de equipamentos terminais de clientes (roteadores digitais) classificados nas posições 8517.62.41 e 8517.62.77 da Tipi, desenvolvidos no País conforme processo produtivo básico estabelecido pelo Poder Executivo. ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '410' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '411', 'Venda dos produtos relacionados nos códigos 401, 402, 403, 404, 407, 408, 409 e 410 desta tabela, a pessoas jurídicas de direito privado ou por órgãos e entidades da Administração Pública Federal, Estadual ou Municipal e do Distrito Federal, direta ou indireta, às fundações instituídas e mantidas pelo Poder Público e às demais organizações sob o controle direto ou indireto da União, dos Estados, dos Municípios ou do Distrito Federal.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '411' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '412', 'Venda dos produtos relacionados nos códigos 401, 402, 403, 404, 407, 408, 409 e 410 desta tabela, a sociedades de arrendamento mercantil leasing.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '412' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '413', 'Receita decorrente da venda de bens de defesa nacional definidos em ato do Poder Executivo efetuada por pessoa jurídica beneficiária do RETID à União, para uso privativo das Forças Armadas, exceto para uso pessoal e administrativo', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '413' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '414', 'Receita decorrente da prestação de serviços de tecnologia industrial básica, projetos, pesquisa, desenvolvimento e inovação tecnológica, assistência técnica e transferência de tecnologia por pessoa jurídica beneficiária do RETID à União, para uso privativo das Forças Armadas, exceto para uso pessoal e administrativo', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '414' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '901', 'Papel destinado à impressão de jornais', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '901' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '902', 'Papéis classificados nos códigos 4801.00.10, 4801.00.90, 4802.61.91, 4802.61.99, 4810.19.89 e 4810.22.90, todos da TIPI, destinados à impressão de periódicos', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '902' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '903', 'Livros, conforme definido no art. 2o da Lei no 10.753/03', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '903' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '904', 'Preparações compostas não-alcoólicas, classificadas no código 2106.90.10 Ex 01 da TIPI, destinadas à elaboração de bebidas pelas pessoas jurídicas industriais dos produtos referidos no art. 58-A da Lei no 10.833/2003 ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '904' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '905', 'Material de defesa, classificado nas posições 87.10.00.00 e 89.06.10.00 da TIPI, além de partes, peças, componentes, ferramentais, insumos, equipamentos e matérias-primas a serem empregados na sua industrialização, montagem, manutenção, modernização e conversão ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '905' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '906', 'Equipamentos de controle de produção, inclusive medidores de vazão, condutivímetros, aparelhos para controle, registro, gravação e transmissão dos quantitativos medidos, quando adquiridos por pessoas jurídicas legalmente obrigadas à sua utilização ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '906' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '907', 'Valores pagos ou creditados pelos Estados, Distrito Federal e Municípios relativos ao ICMS e ao ISS, no âmbito de programas de concessão de crédito voltados ao estímulo à solicitação de documento fiscal na aquisição de mercadorias e serviços', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '907' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '908', 'Vendas de mercadorias destinadas ao consumo ou à industrialização na Zona Franca de Manaus – ZFM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '908' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '909', 'Vendas de mercadorias destinadas ao consumo ou à industrialização nas Áreas de Livre Comércio – ALC, exceto quando tiver como destinatárias pessoas jurídicas atacadistas e varejistas, sujeitas ao regime de apuração não cumulativa da Contribuição para o PIS/Pasep e da Cofins', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '909' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '910', 'Vendas de matérias-primas, produtos intermediários e materiais de embalagem, produzidos na Zona Franca de Manaus para emprego em processo de industrialização por estabelecimentos industriais ali instalados e consoante projetos aprovados pelo SUFRAMA ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '910' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '911', 'Receitas financeiras, inclusive decorrentes de operações realizadas para fins de hedge, auferidas pelas pessoas jurídicas sujeitas ao regime de incidência não-cumulativa', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '911' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '912', 'Aquisição no mercado interno ou a importação, de forma combinada ou não, de mercadoria equivalente à empregada ou consumida na industrialização de produto exportado (Drawback Reposição de Estoque), inclusive: I – à empregada em reparo, criação, cultivo ou atividade extrativista de produto já exportado; e II – para industrialização de produto intermediário fornecido diretamente a empresa industrial-exportadora e empregado ou consumido na industrialização de produto final já exportado.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '912' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '913', 'Projetores para exibição cinematográfica, classificados no código 9007.2 da NCM, e suas partes e acessórios, classificados no código 9007.9 da NCM', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '913' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '914', 'Receita decorrente da venda de águas minerais naturais comercializadas em recipientes com capacidade nominal inferior a 10 (dez) litros ou igual ou superior a 10 (dez) litros classificadas no código 2201.10.00 Ex 01 e Ex 02 da Tipi, aprovada pelo Decreto no 7.660, de 23 de dezembro de 2011.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '914' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '915', 'Concessões de geração, transmissão e distribuição de energia elétrica - Valor da indenização correspondente às parcelas dos investimentos vinculados a bens reversíveis, ainda não amortizados ou não depreciados, conforme art. 8º, § 4º, da Lº 12.783/2013.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '915' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '916', 'Concessões de geração, transmissão e distribuição de energia elétrica - Valor da indenização correspondente às parcelas dos investimentos vinculados a bens reversíveis, ainda não amortizados ou não depreciados, conforme art. 15, § 9º, da Lei nº 12.783/2013.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '916' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '917', 'Valores efetivamente recebidos exclusivamente a título da subvenção extraordinária aos produtores fornecedores independentes de cana-de-açúcar afetados por condições climáticas adversas referentes à safra 2011/2012 na Região Nordeste.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '917' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '918', 'Receita decorrente da venda de bebidas frias, classificadas nos códigos 2106.90.10 Ex02; 22.01 (exceto os Ex 01 e Ex 02 do código 2201.10.00); 22.02 (exceto os Ex 01, Ex 02 e Ex 03 do código 2202.90.00); e 22.02.90.00 Ex 03 e 22.03 da TIPI, quando auferida pela pessoa jurídica varejista, assim considerada, a pessoa jurídica cuja receita decorrente de venda de bens e serviços a consumidor final no ano-calendário imediatamente anterior ao da operação houver sido igual ou superior a 75% (setenta e cinco por cento) de sua receita total de venda de bens e serviços no mesmo período, depois de excluídos os impostos e contribuições incidentes sobre a venda.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '918' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '919', 'Receita auferida na venda de pneumáticos e câmaras de ar de borracha para bicicletas classificados nos códigos 4011.50.00 e 4013.20.00 da Tipi, quando efetuada por PJ fabricante que utilizar no processo de industrialização, em estabelecimentos implantados na ZFM, de acordo com o processo produtivo básico fixado em legislação específica, borracha natural produzida por extrativismo não madeireiro na Região Norte', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '919' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '920', 'Perse – Programa Emergencial de Retomado do Setor de Eventos.  - Resultado auferido pelas pessoas jurídicas de que trata o art. 2º da Lei 14.148, de 3 da maio de 2021, atualizada pelos artigos vetados pelo Presidente da República, mantido pelo Congresso Nacional e publicado na Edição Extra B do DOU de 18/3/2022.', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '920' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '999', 'Código genérico – Operações tributáveis a alíquota zero ', '6', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '999' AND NATUREZA_FKPISCOFINS_ID = '6'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Fornecimento de mercadorias ou serviços para uso ou consumo de bordo em embarcações e aeronaves em tráfego internacional, quando o pagamento for efetuado em moeda conversível (exceto querosene de aviação)', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Transporte internacional de cargas ou passageiros', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '103', 'Receitas auferidas pelos estaleiros navais brasileiros nas atividades de construção, conservação, modernização, conversão e reparo de embarcações pré-registradas ou registradas no Registro Especial Brasileiro (REB), instituído pela Lei nº 9.432, de 8 de janeiro de 1997', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '103' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '104', 'Frete de mercadorias transportadas entre o País e o exterior pelas embarcações registradas no REB, de que trata o art. 11 da Lei nº 9.432, de 1997', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '104' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Receitas relativas às atividades próprias dos templos de qualquer culto; partidos políticos; instituições de educação e de assistência social que preencham as condições e requisitos do art. 12 da Lei nº 9.532, de 10 de dezembro de 1997; instituições de caráter filantrópico, recreativo, cultural, científico e as associações, que preencham as condições e requisitos do art. 15 da Lei nº 9.532, de 1997; sindicatos, federações e confederações; serviços sociais autônomos, criados ou autorizados por lei; conselhos de fiscalização de profissões regulamentadas; fundações de direito privado; condomínios de proprietários de imóveis residenciais ou comerciais; e Organização das Cooperativas Brasileiras (OCB) e as Organizações Estaduais de Cooperativas previstas no art. 105 e seu § 1º da Lei nº 5.764, de 16 de dezembro de 1971.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '202', 'Receitas das entidades beneficentes de assistência social com a finalidade de prestação de serviços nas áreas de assistência social, saúde ou educação, que atendam aos requisitos do art. 29 da Lei nº 12.101, de 27 de novembro de 2009.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '202' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Venda de energia elétrica pela Itaipu Binacional', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Importação de bens ou mercadorias para uso ou consumo exclusivo na organização e realização dos referidos eventos, promovida pela Fifa, Subsidiária Fifa no Brasil, Confederações Fifa, Associações estrangeiras membros da Fifa, Parceiros Comerciais da Fifa domiciliados no exterior, Emissora Fonte da Fifa e Prestadores de Serviço da Fifa domiciliados no exterior, ou por intermédio de pessoa jurídica por eles contratada para representá-los', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Receita auferida por Subsidiária Fifa no Brasil, decorrente das atividades próprias e diretamente vinculadas à organização ou realização dos referidos eventos, exceto as receitas decorrentes da venda de ingressos e de pacotes de hospedagem.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Receita das atividades próprias, auferida pelos Prestadores de Serviços da FIFA, estabelecidos no País sob a forma de sociedade com finalidade específica para o desenvolvimento de atividades diretamente relacionadas à realização dos eventos.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Importações de bens, mercadorias ou serviços para uso ou consumo exclusivo em atividades próprias e diretamente vinculadas à organização ou realização dos Eventos Olímpicos de 2016, realizadas pelas entidades referidas no § 2º do art. 4º, da Lei nº 12.780/2013.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'Rendimentos, remessas e operações de câmbio e seguros, decorrentes das atividades próprias e diretamente vinculadas à organização ou realização dos eventos olímpicos de 2016, envolvendo o CIO e as empresas a ele vinculadas.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'Receitas e rendimentos auferidos pelas empresas vinculadas ao CIO, e domiciliadas no Brasil, em relação aos fatos geradores decorrentes das atividades próprias e diretamente vinculadas à organização ou realização dos Eventos Olímpicos de 2016.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Receitas, lucros e rendimentos auferidos pelo RIO 2016, em relação aos fatos geradores decorrentes das atividades próprias e diretamente vinculadas à organização ou realização do evento.', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '901', 'Recursos recebidos a título de repasse, oriundos do Orçamento Geral da União, dos Estados, do Distrito Federal e dos Municípios, pelas empresas públicas e sociedades de economia mista', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '901' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '902', 'Receita da instituição privada de ensino superior, com fins lucrativos ou sem fins lucrativos não beneficente, que aderir ao Programa Universidade para Todos (Prouni), no período de vigência do termo de adesão, decorrentes da realização de atividades de ensino superior, proveniente de cursos de graduação ou cursos seqüenciais de formação específica', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '902' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '903', 'Receita bruta de venda a varejo dos componentes e equipamentos de rede, terminais e transceptores definidos em regulamento que sejam dedicados aos serviços de telecomunicações prestados por meio das subfaixas de radiofrequência de 451 MHz a 458 MHz e de 461 MHz a 468 MHz, assim como por meio de estações terrenas satelitais de pequeno porte que contribuam com os objetivos de implantação do PNBL', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '903' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '999', 'Código genérico – Operações com Isenção', '7', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '999' AND NATUREZA_FKPISCOFINS_ID = '7'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Venda de querosene de aviação por pessoa jurídica não enquadrada na condição de importadora ou produtora', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Venda de querosene de aviação por produtora ou importadora a distribuidora, quando o produto for destinado ao consumo por aeronave em tráfego internacional', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Vendas de biodiesel por pessoas não enquadradas como produtor ou importador', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'Vendas de materiais e equipamentos, bem assim da prestação de serviços decorrentes dessas operações, efetuadas diretamente a Itaipu Binacional ', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Exportação de mercadorias para o exterior', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Serviços prestados a pessoas físicas ou jurídicas residentes ou domiciliadas no exterior, cujo pagamento represente ingresso de divisas', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Vendas, com o fim específico de exportação, a empresa comercial exportadora constituída nos termos do Decreto-Lei nº 1.248, de 29 de novembro de 1972, ou simplesmente registrada na Secretaria de Comércio Exterior (Secex) do Ministério do Desenvolvimento, Indústria e Comércio Exterior', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '901', 'Regime Cumulativo - Demais receitas não classificadas como faturamento, não enquadradas como receita bruta nos termos do art. 3º da Lei nº 9.718, de 1998', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '901' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '999', 'Outras receitas sem incidência', '8', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '999' AND NATUREZA_FKPISCOFINS_ID = '8'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '101', 'Vendas a pessoa jurídica preponderantemente exportadora', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '101' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '102', 'Vendas a fabricante de veículos e carros blindados de combate, (NCM 8710.00.00) para uso pelas forças armadas ou órgãos de segurança pública brasileiros.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '102' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '103', 'Aquisição no mercado interno ou a importação, de forma combinada ou não, de mercadoria para emprego ou consumo na industrialização de produto a ser exportado, por pessoa jurídica previamente habilitada pela Secretaria de Comércio Exterior (Drawback Integrado)', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '103' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '104', 'Aquisição no mercado interno ou à importação de mercadorias para emprego em reparo, criação, cultivo ou atividade extrativista de produto a ser exportado.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '104' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '105', 'Aquisição no mercado interno ou importações de empresas denominadas fabricantes-intermediários, para industrialização de produto intermediário a ser diretamente fornecido a empresas industriais-exportadoras, para emprego ou consumo na industrialização de produto final destinado à exportação (Drawback Intermediário)', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '105' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '106', ' A aquisição no mercado interno ou a importação, de forma combinada ou não, de serviço direta e exclusivamente vinculado à exportação ou entrega no exterior de produto resultante da utilização do regime de que trata o art. 12 desta Lei 11.945/2009.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '106' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '201', 'Insumos de origem animal, utilizados na fabricação de produtos destinados à alimentação humana ou animal, classificados na NCM capítulos 2 (exceto os códigos 02.01, 02.02, 02.03, 0206.10.00, 0206.20, 0206.21, 0206.29, 0206.30.00, 0206.4, 02.07, 0210.1), 3 (exceto os produtos vivos desse capítulo), 4, 8 a 12, 15 (exceto o código 1502.00.1), 16 e 23 (exceto o código 23.09.90) e nos códigos 0504.00, 0701.90.00, 0702.00.00, 0706.10.00, 07.08, 0709.90, 07.10, 07.12 a 07.14 (exceto os códigos 0713.33.19, 0713.33.29 e 0713.33.99), 1701.11.00, 1701.99.00, 1702.90.00, 18.01, 18.03, 1804.00.00, 1805.00.00, 20.09, 2101.11.10 e 2209.00.00.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '201' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '202', 'Insumos de origem vegetal, utilizados na fabricação de produtos destinados à alimentação humana ou animal, classificados na NCM capítulos 2 (exceto os códigos 02.01, 02.02, 02.03, 0206.10.00, 0206.20, 0206.21, 0206.29, 0206.30.00, 0206.4, 02.07, 0210.1), 3 (exceto os produtos vivos desse capítulo), 4, 8 a 12 (exceto os produtos classificados nos códigos 12.01 e 1208.10.00), 15 (exceto o código 0901.1, 1502.00.1), 16 e 23 (exceto os produtos classificados nos códigos 2304.00 e 2309.10.00, bem como as preparações dos tipos utilizados na alimentação de animais vivos classificados nas posições 01.03 e 01.05, classificadas no código 2309.90) e nos códigos 0504.00, 0701.90.00, 0702.00.00, 0706.10.00, 07.08, 0709.90, 07.10, 07.12 a 07.14 (exceto os códigos 0713.33.19, 0713.33.29 e 0713.33.99), 1701.11.00, 1701.99.00, 1702.90.00, 18.01, 18.03, 1804.00.00, 1805.00.00, 20.09 e 2209.00.00.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '202' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '203', 'Soja e seus derivados classificados nos Capítulos 12, 15 e 23, todos da TIPI', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '203' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '204', 'Venda de cerealista que exerça cumulativamente as atividades de limpar, padronizar, armazenar e comercializar os produtos in natura de origem vegetal, classificados nos códigos 09.01, 10.01 a 10.08, (exceto os dos códigos 1006.20 e 1006.30, 12.01 e 18.01) da NCM.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '204' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '205', 'Venda a granel de leite in natura, efetuada por pessoa jurídica que exerça cumulativamente as atividades de transporte e resfriamento deste produto', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '205' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '206', 'Venda por PJ que exerça atividade agropecuária ou por cooperativa de produção agropecuária de produto in natura de origem vegetal destinado à elaboração de mercadorias classificadas no código 22.04, da NCM', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '206' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '207', 'Venda de animais vivos classificados na posição 01.02, à pessoa jurídica que produza mercadoria classificada nas posições 02.01, 02.02, 02.06.10.00, 02.06.20, 02.06.21, 02.06.29, 0210.20.00,  05.06.90.00, 05.10.00.10 e 15.02.00.1 da NCM', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '207' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '208', 'Vendas de produtos classificados nas posições 02.01, 02.02, 0206.10.00, 0206.20, 0206.21, 0206.29, 0210.20.00, 0506.90.00, 0510.00.10 e 1502.00.1, quando efetuadas por pessoa jurídica que industrialize bens e produtos classificados nas posições 01.02, 02.01 e 02.02 da NCM', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '208' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '209', 'Receita bruta da venda, no mercado interno, de:I – insumos de origem vegetal, classificados nas posições 10.01 a 10.08, exceto os dos códigos 1006.20 e 1006.30, e nas posições 12.01, 23.04 e 23.06 da Nomenclatura Comum do Mercosul (NCM), quando efetuada por pessoa jurídica, inclusive cooperativa, vendidos: a) para pessoas jurídicas que produzam mercadorias classificadas nos códigos 02.03, 0206.30.00, 0206.4, 02.07 e 0210.1 da NCM; b) para pessoas jurídicas que produzam preparações dos tipos utilizados na alimentação de animais vivos classificados nas posições 01.03 e 01.05, classificadas no código 2309.90 da NCM; e c) para pessoas físicas;II – preparações dos tipos utilizados na alimentação de animais vivos classificados nas posições 01.03 e 01.05, classificadas no código 2309.90 da NCM; III – animais vivos classificados nas posições 01.03 e 01.05 da NCM, quando efetuada por pessoa jurídica, inclusive cooperativa, vendidos para pessoas jurídicas que produzam mercadorias classificadas nos códigos 02.03, 0206.30.00, 0206.4, 02.07 e 0210.1 da NCM; IV – produtos classificados nos códigos 02.03, 0206.30.00, 0206.4, 02.07 e 0210.1 da NCM, quando efetuada por pessoa jurídica que industrialize ou revenda bens e produtos classificados nas posições 01.03 e 01.05 da NCM.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '209' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '210', 'Receitas decorrentes da venda dos produtos classificados nos códigos 0901.1 e 0901.90.00 da TIPI, exceto na venda a consumidor final.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '210' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '211', 'Receitas decorrentes da venda de matéria-prima in natura de origem vegetal, destinada à produção de biodiesel, quando efetuada por pessoa jurídica que exerça atividade agropecuária, de cooperativa de produção agropecuária ou de cerealista que exerça cumulativamente as atividades de limpar, padronizar, armazenar e comercializar a matéria-prima destinada à produção de biodiesel.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '211' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '212', 'Receitas decorrentes da venda dos produtos classificados no código 0805.10.00 da TIPI, quando utilizados na industrialização dos produtos classificados no código 2009.1 da TIPI, e estes forem destinados à exportação.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '212' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '213', 'Soja classificada na posição 12.01 e dos produtos classificados nos códigos 1208.10.00 e 2304.00 da TIPI', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '213' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '301', 'REPES - Regime Especial de Tributação para a Plataforma de Exportação de Serviços de Tecnologia da Informação. - Venda e/ou importação de bens novos destinados ao desenvolvimento, no País, de software e de serviços de tecnologia da informação, para incorporação ao seu ativo imobilizado; - Venda e/ou importação de serviços destinados ao desenvolvimento, no País, de software e de serviços de tecnologia da informação e serviços', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '301' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '302', 'RECAP - Regime Especial de Aquisição de Bens de Capital para Empresas Exportadoras. - Venda e/ou importação de máquinas, aparelhos, instrumentos e equipamentos, para incorporação em seu ativo imobilizado', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '302' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '303', 'REIDI - Regime Especial de Incentivos para o Desenvolvimento da Infra-Estrutura. - Venda e/ou importação de máquinas, aparelhos, instrumentos e equipamentos, novos, de materiais de construção e de serviços para utilização ou incorporação em obras de infra-estrutura destinadas ao ativo imobilizado - Receitas de aluguel de máquinas, aparelhos, instrumentos e equipamentos para utilização em obras de infra-estrutura quando contratado por pessoa jurídica beneficiária do REIDI', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '303' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '304', 'REPENEC - Regime Especial de Incentivos para o Desenvolvimento de Infraestrutura da Indústria Petrolífera nas Regiões Norte, Nordeste e Centro-Oeste. - Venda/Importação de máquinas, aparelhos, instrumentos e equipamentos, novos, e de materiais de construção, bem como serviços para utilização ou incorporação nas obras de infraestrutura nas Regiões Norte, Nordeste e Centro-Oeste, nos setores petroquímico, de refino de petróleo e de produção de amônia e uréia a partir do gás natural, para incorporação ao seu ativo imobilizado. [', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '304' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '305', 'REPORTO - Regime Tributário para Incentivo à Modernização e à Ampliação da Estrutura Portuária. - Vendas de locomotivas, locotratores, tênderes e vagões, e de trilhos e demais elementos de vias férreas, para utilização na execução de serviços de transporte de mercadorias em ferrovias - Venda/Importação de máquinas, equipamentos, peças de reposição e outros bens, destinados ao seu ativo imobilizado para utilização exclusiva em portos na execução de serviços de carga, descarga e movimentação de mercadorias, bem como na execução dos serviços de dragagem, e nos Centros de Treinamento Profissional, na execução do treinamento e formação de trabalhadores', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '305' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '306', 'RECOMPE - Regime Especial de Aquisição de Computadores para Uso Educacional. Prestação de serviços e venda de matérias-primas e produtos intermediários destinados à industrialização dos equipamentos destinados ao PROUCA (Programa Um Computador por Aluno)', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '306' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '307', 'RETAERO - Regime Especial para a Indústria Aeronáutica Brasileira. - Partes, peças, ferramentais, componentes, equipamentos, sistemas, subsistemas, insumos e matérias-primas, ou serviços a serem empregados na manutenção, conservação, modernização, reparo, revisão, conversão e industrialização das aeronaves classificadas na posição 88.02 da NCM. - Venda ou importação de serviços de tecnologia industrial básica, desenvolvimento e inovação tecnológica, assistência técnica e transferência de tecnologia destinados a empresas beneficiárias ', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '307' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '308', 'RECOPA - Regime Especial de Tributação para Construção, Ampliação, Reforma ou Modernização de Estádios de Futebol. - Venda no mercado interno ou importação de máquinas, aparelhos, instrumentos e equipamentos, novos, materiais de construção, prestação de serviços, locação de máquinas, aparelhos, instrumentos e equipamentos para utilização ou incorporação nas obras de construção, ampliação, reforma ou modernização dos estádios de futebol com utilização prevista nas partidas oficiais da Copa das Confederações FIFA 2013 e da Copa do Mundo FIFA 2014', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '308' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '309', 'ZFM – Zona Franca de Manaus. - Importação de bens a serem empregados na elaboração de matérias-primas, produtos intermediários e materiais de embalagem destinados a emprego em processo de industrialização por estabelecimentos industriais instalados na ZFM. - Importação de matérias-primas, produtos intermediários e materiais de embalagem para emprego em processo de industrialização por estabelecimentos industriais instalados na ZFM.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '309' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '310', 'ZPE – Zonas de Processamento de Exportação. - Importações ou aquisições no mercado interno de bens e serviços por empresa autorizada a operar em ZPE.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '310' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '311', 'Vendas realizadas no mercado interno para a Fifa, para Subsidiária Fifa no Brasil ou para a Emissora Fonte da Fifa, de mercadorias destinadas a uso ou consumo exclusivo na organização e realização da Copa das Confederações Fifa 2013 e da Copa do Mundo Fifa 2014.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '311' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '312', 'RECOF -  Regime de Entreposto Industrial sob Controle Aduaneiro Informatizado Importação, com ou sem cobertura cambial, e com suspensão do pagamento de tributos, sob controle aduaneiro informatizado, de mercadorias que, depois de submetidas a operação de industrialização, sejam destinadas a exportação', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '312' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '313', 'RECOM - Regime Aduaneiro Especial de Importação de Insumos Destinados a Industrialização por Encomenda de Produtos Classificados nas Posições 8701 A 8705 da NCM Importação de insumos (chassis, carroçarias, peças, partes, componentes e acessórios), sem cobertura cambial, destinados a industrialização por encomenda de produtos classificados nas posições 8701 a 8705 da NCM', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '313' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '314', 'RECINE - Regime Especial de Tributação para Desenvolvimento da Atividade de Exibição Cinematográfica. Venda no mercado interno ou importação de máquinas, aparelhos, instrumentos e equipamentos, novos, para incorporação no ativo imobilizado e utilização em complexos de exibição ou cinemas itinerantes, bem como de materiais para sua construção', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '314' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '315', 'PROUCA - Programa Um Computador por Aluno.  REICOMP - Regime Especial de Incentivo a Computadores para Uso Educacional. Receita decorrente da: a) venda de matérias-primas e produtos intermediários destinados à industrialização dos equipamentos mencionados no art. 16 da MP (computadores portáteis classificados nos códigos 8471.30.12 e 8471.30.19 da NCM), quando adquiridos por pessoa jurídica habilitada ao regime; ou b) prestação de serviços por pessoa jurídica estabelecida no País a pessoa jurídica habilitada ao regime, quando destinados aos equipamentos mencionados no art. 16 da MP', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '315' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '316', 'REPNBL-Redes - Regime Especial de Tributação do Programa Nacional de Banda Larga para Implantação de Redes de Telecomunicações. Venda no mercado interno de máquinas, aparelhos, instrumentos e equipamentos novos e de materiais de construção para utilização ou incorporação nas obras civis abrangidas no projeto de implantação, ampliação ou modernização de redes de telecomunicações que suportam acesso à Internet em banda larga. Venda de serviços destinados às obras civis abrangidas no projeto acima referido.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '316' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '317', 'RETID - Regime Especial Tributário para a Indústria de Defesa Venda de bens de defesa nacional, quando a aquisição for efetuada por pessoa jurídica beneficiária do Retid Venda ou importação de serviços de tecnologia industrial básica, projetos, pesquisa, desenvolvimento e inovação tecnológica, assistência técnica e transferência de tecnologia, destinados a empresas beneficiárias do Retid', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '317' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '318', 'REIF - Regime Especial de Incentivo ao Desenvolvimento da Infraestrutura da Indústria de Fertilizantes Venda no mercado interno ou de importação de serviços, máquinas, aparelhos, instrumentos e equipamentos, novos, e de materiais de construção para utilização ou incorporação no projeto aprovado para implantação ou ampliação de infraestrutura para produção de fertilizantes e de seus insumos, para incorporação ao seu ativo imobilizado, bem como a receita decorrente da locação de máquinas, aparelhos, instrumentos e equipamentos a pessoa jurídica beneficiária do REIF, para utilização na execução do projeto', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '318' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '319', 'Vendas de mercadorias e a prestação de serviços ocorridas no mercado interno para as pessoas jurídicas mencionadas no § 2o do art. 4o da Lei nº 12.780/2013, destinadas exclusivamente à organização ou à realização dos Jogos Olímpicos de 2016 e dos Jogos Paraolímpicos de 2016.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '319' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '320', 'REPETRO-Industrialização Venda no mercado interno de matérias-primas, produtos intermediários e materiais de embalagem para serem utilizados integralmente no processo de industrialização de produto final destinado às atividades de exploração, de desenvolvimento e de produção de petróleo, de gás natural e de outros hidrocarbonetos fluidos à PJ habilitada no Repetro-Industrialização.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '320' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '321', 'REPETRO-SPED Venda dos produtos finais destinados às atividades de exploração, de desenvolvimento e de produção de petróleo, de gás natural e de outros hidrocarbonetos fluidos previstas na Lei nº 9.478, de 6 de agosto de 1997 , na Lei nº 12.276, de 30 de junho de 2010, e na Lei nº 12.351, de 22 de dezembro de 2010, por fabricantes desses, beneficiários do Repetro-Industrialização, quando diretamente adquiridos por pessoa jurídica habilitada no Repetro ou no Repetro-Sped.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '321' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '401', 'Receitas de Fretes e de transporte multimodal, contratadas por pessoa jurídica preponderantemente exportadora, para transporte no mercado interno de produtos com suspensão ou destinados a Exportação.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '401' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '402', 'Venda de cana-de-açúcar, classificada na posição 12.12 da Nomenclatura Comum do Mercosul – NCM, efetuada para pessoa jurídica produtora de álcool, inclusive para fins carburantes, tributada no regime de não cumulatividade.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '402' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '403', 'Venda de óleo combustível, tipo bunker, MF - Marine Fuel, classificado no código 2710.19.22, óleo combustível, tipo bunker, MGO - Marine Gás Oil, classificado no código 2710.19.21 e óleo combustível, tipo bunker, ODM - Óleo Diesel Marítimo, classificado no código 2710.19.21, quando destinados à navegação de cabotagem e de apoio portuário e marítimo, para a pessoa jurídica previamente habilitada', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '403' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '404', 'Acetona classificada no código 2914.11.00 da Tabela de Incidência do Imposto sobre Produtos Industrializados – Tipi, destinada à produção de monoisopropilamina (Mipa) utilizada na elaboração de defensivos agropecuários classificados na posição 38.08 da Tipi', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '404' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '405', 'Desperdícios, resíduos ou aparas de plástico, de papel ou cartão, de vidro, de ferro ou aço, de cobre, de níquel, de alumínio, de chumbo, de zinco e de estanho, e demais desperdícios e resíduos metálicos do Capítulo 81 da Tipi, quando vendidos para pessoa jurídica que apure o imposto de renda com base no lucro real.', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '405' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '406', 'Venda de produtos à pessoa jurídica sediada no exterior, com contrato de entrega no território nacional, de insumos destinados à industrialização, por conta e ordem da encomendante sediada no exterior, de máquinas e veículos classificados nas posições 87.01 a 87.05 da TIPI', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '406' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '407', 'Vendas a empresa sediada no exterior, para entrega em território nacional, de material de embalagem a ser totalmente utilizados no acondicionamento de mercadoria destinada à exportação para o exterior', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '407' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '408', 'Venda de máquinas e equipamentos classificados na posição 84.39, utilizados na fabricação de papéis destinados à impressão de jornais ou de papéis classificados nos códigos 4801.00.10, 4801.00.90, 4802.61.91, 4802.61.99, 4810.19.39 e 4810.22.90, todos da Tipi, destinados à impressão de periódicos, quando os referidos bens forem adquiridos por pessoa jurídica industrial para incorporação ao seu ativo imobilizado', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '408' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '409', 'As aquisições no mercado interno e nas importações de petróleo efetuadas por refinarias para a produção de combustíveis. LC 194/22', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '409' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '410', 'Aquisições dos insumos naftas, com Nomenclatura Comum do Mercosul/Sistema Harmonizado - NCM/SH 2710.12.49, outras misturas (aromáticos), NCM/SH 2707.99.90, óleo de petróleo parcialmente refinado, NCM 2710.19.99, outros óleos brutos de petróleo ou minerais (condensados), NCM 2709.00.10, e N-Metilanilina, NCM/SH 2921.42.90. LC 194/22', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '410' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '900', 'DEMAIS OPERAÇÕES COM SUSPENSÃO', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '900' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '901', 'Doações em espécie recebidas por instituições financeiras públicas controladas pela União e destinadas a ações de prevenção, monitoramento e combate ao desmatamento, inclusive programas de remuneração por serviços ambientais, e de promoção da conservação e do uso sustentável dos biomas brasileiros, na forma estabelecida pelo Decreto nº 6.565, de 15 de setembro de 2008', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '901' AND NATUREZA_FKPISCOFINS_ID = '9'
);

INSERT INTO EMP_NATUREZA_PISCOFINS (NATUREZA_CODIGO, NATUREZA_DESCRICAO, NATUREZA_FKPISCOFINS_ID, NATUREZA_FKSIT_ID)
SELECT '999', 'Outras operações com suspensão', '9', 1
FROM RDB$DATABASE
WHERE NOT EXISTS (
    SELECT 1 FROM EMP_NATUREZA_PISCOFINS WHERE NATUREZA_CODIGO = '999' AND NATUREZA_FKPISCOFINS_ID = '9'
);



----------- FIM DO TRECHO QUE INSERE A NATUREZA DA RECEITA DA PIS E DA COFINS-------------------------------------------------------------


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
    SELECT 1 
    FROM PARAM_UF2
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

SET TERM ^ ;
update EMP_CST_IBSCBS
set IBSCBS_NOME = 'Alíquota Reduzida'
where IBSCBS_CODIGO = '200'
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE PARAM_UF2 
SET 
    PUF2_ALIQ_IBS_UF = COALESCE(PUF2_ALIQ_IBS_UF, 0),
    PUF2_ALIQ_IBS_MUNICIPIO = COALESCE(PUF2_ALIQ_IBS_MUNICIPIO, 0),
    PUF2_ALIQ_CBS = COALESCE(PUF2_ALIQ_CBS, 0),
    PUF2_RED_ALIQ_IBS_UF = COALESCE(PUF2_RED_ALIQ_IBS_UF, 0),
    PUF2_RED_ALIQ_IBS_MUNICIPIO = COALESCE(PUF2_RED_ALIQ_IBS_MUNICIPIO, 0),
    PUF2_RED_ALIQ_CBS = COALESCE(PUF2_RED_ALIQ_CBS, 0),
    PUF2_RED_BASE_CALC_IBS = COALESCE(PUF2_RED_BASE_CALC_IBS, 0),
    PUF2_RED_BASE_CALC_CBS = COALESCE(PUF2_RED_BASE_CALC_CBS, 0),
    PUF2_PERC_DIFERIMENTO_IBS_UF = COALESCE(PUF2_PERC_DIFERIMENTO_IBS_UF, 0),
    PUF2_PERC_DIFERIM_IBS_MUNIC = COALESCE(PUF2_PERC_DIFERIM_IBS_MUNIC, 0),
    PUF2_PERC_DIFERIMENTO_CBS = COALESCE(PUF2_PERC_DIFERIMENTO_CBS, 0),
    PUF2_PERC_CRED_PRESUMIDO_IBS = COALESCE(PUF2_PERC_CRED_PRESUMIDO_IBS, 0),
    PUF2_PERC_CRED_PRESUMIDO_CBS = COALESCE(PUF2_PERC_CRED_PRESUMIDO_CBS, 0),
    PUF2_ALIQ_ADREM_IBS = COALESCE(PUF2_ALIQ_ADREM_IBS, 0),
    PUF2_ALIQ_ADREM_CBS = COALESCE(PUF2_ALIQ_ADREM_CBS, 0),
    PUF2_ALIQ_ADREM_IBS_RETENCAO = COALESCE(PUF2_ALIQ_ADREM_IBS_RETENCAO, 0),
    PUF2_ALIQ_ADREM_CBS_RETENCAO = COALESCE(PUF2_ALIQ_ADREM_CBS_RETENCAO, 0),
    PUF2_ALIQ_ADREM_IBS_RET_ANT = COALESCE(PUF2_ALIQ_ADREM_IBS_RET_ANT, 0),
    PUF2_ALIQ_ADREM_CBS_RET_ANT = COALESCE(PUF2_ALIQ_ADREM_CBS_RET_ANT, 0),
    PUF2_PERC_DIF_MONO_IBS = COALESCE(PUF2_PERC_DIF_MONO_IBS, 0),
    PUF2_PERC_DIF_MONO_CBS = COALESCE(PUF2_PERC_DIF_MONO_CBS, 0),
    PUF2_ALIQ_IBS_UF_REGULAR = COALESCE(PUF2_ALIQ_IBS_UF_REGULAR, 0),
    PUF2_ALIQ_IBS_MUN_REGULAR = COALESCE(PUF2_ALIQ_IBS_MUN_REGULAR, 0),
    PUF2_ALIQ_CBS_REGULAR = COALESCE(PUF2_ALIQ_CBS_REGULAR, 0);
^
SET TERM; ^

COMMIT WORK;





