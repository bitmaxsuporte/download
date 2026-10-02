SET TERM ^ ;
UPDATE EMP_PRODUTO Q
SET PRD_ESTOQUE_ENTRADAS = CASE   /*SE TIVER MARCADO NO GRUPO CONTROLA ESTOQUE NAO ENTAO NAO GERA ESTOQUE*/
                           WHEN (SELECT G.grp_controlestoque FROM EMP_PRODUTO_GRUPO G WHERE G.grp_id = Q.prd_fkgrp_id) = 'T' THEN
                           COALESCE((SELECT SUM(NEI.NFEI_PRDQTDEMOV)
                           FROM EMP_ENTRADAI NEI
                           WHERE NEI.NFEI_FKPRD_ID = Q.PRD_ID), 0)
                           ELSE 0
                           END,

    PRD_ESTOQUE_SAIDAS = CASE
                         WHEN (SELECT G.grp_controlestoque FROM EMP_PRODUTO_GRUPO G WHERE G.grp_id = Q.prd_fkgrp_id) = 'T' THEN
                         COALESCE((SELECT SUM(NSI.NFSI_PRD_QTD_MOV)
                         FROM EMP_NFSI NSI
                         WHERE NSI.NFSI_FKPRD_ID = Q.PRD_ID AND NSI.NFSI_LKCFOP_NOME != '59291'), 0)
                         ELSE 0
                         END,

    PRD_ESTOQUE_ATUAL = CASE
                        WHEN (SELECT G.grp_controlestoque FROM EMP_PRODUTO_GRUPO G WHERE G.grp_id = Q.prd_fkgrp_id) = 'T' THEN
                        (COALESCE((SELECT SUM(NEI.NFEI_PRDQTDEMOV)
                        FROM EMP_ENTRADAI NEI
                        WHERE NEI.NFEI_FKPRD_ID = Q.PRD_ID), 0) -
                        COALESCE((SELECT SUM(NSI.NFSI_PRD_QTD_MOV)
                        FROM EMP_NFSI NSI
                        WHERE NSI.NFSI_FKPRD_ID = Q.PRD_ID AND NSI.NFSI_LKCFOP_NOME != '59291'), 0)) + Q.PRD_ESTOQUE_ANTERIOR
                        ELSE 0
                        END
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_ENTRADAI EI2
SET EI2.NFEI_VLRCUSTOCONTABIL = (
                                 SELECT (EI.NFEI_PRDVLRUNITARIO -
                                         ((EI.NFEI_ICMSAL00 / 100) *
                                          EI.NFEI_PRDVLRUNITARIO)) AS CUSTO_CONTABIL
                                 FROM EMP_ENTRADAI EI
                                 WHERE EI.NFEI_ID = EI2.NFEI_ID
                                )
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_PRODUTO P1
SET PRD_CUSTOCONTABIL = CASE
                          WHEN COALESCE((SELECT NFEI_VLRCUSTOCONTABIL
                                         FROM EMP_ENTRADAI
                                         WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                               AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                              FROM EMP_ENTRADAI I1
                                                              INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                               AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                                 FROM EMP_ENTRADAI I2
                                                                 INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                                 WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                        ),0) > 0 THEN
                            COALESCE((SELECT NFEI_VLRCUSTOCONTABIL
                                      FROM EMP_ENTRADAI
                                      WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                            AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                           FROM EMP_ENTRADAI I1
                                                           INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                           WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                            AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                              FROM EMP_ENTRADAI I2
                                                              INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                     ),0)
                          ELSE
                            P1.PRD_CUSTOMEDIO
                          END
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_ENTRADAI EI2
SET EI2.NFEI_VLRCUSTOMEDIO = (
                              SELECT CASE
                                       WHEN (((
                                               SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                               FROM EMP_ENTRADAI EI2
                                               INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                               WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                               GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                              ) - (
                                                   SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                   FROM EMP_NFSI SI
                                                   WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                         AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                  )) + EI.NFEI_PRDQTDEMOV) > 0 THEN ((((
                                                                                        SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                                                                        FROM EMP_ENTRADAI EI2
                                                                                        INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                                                                        WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                        GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                                                                       ) - (
                                                                                            SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                                                            FROM EMP_NFSI SI
                                                                                            WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                                                                  AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                           )) * P.PRD_CUSTOCONTABIL) +
                                                                                     (EI.NFEI_PRDQTDEMOV * EI.NFEI_VLRCUSTOCONTABIL)) /
                                                                                     (((
                                                                                        SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                                                                        FROM EMP_ENTRADAI EI2
                                                                                        INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                                                                        WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                        GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                                                                       ) - (
                                                                                            SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                                                            FROM EMP_NFSI SI
                                                                                            WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                                                                  AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                           )) + EI.NFEI_PRDQTDEMOV)
                                       ELSE EI2.NFEI_VLRCUSTOMEDIO
                                     END AS CUSTO_MEDIO
                              FROM EMP_ENTRADAI EI
                              INNER JOIN EMP_ENTRADA E ON (EI.NFEI_NFE_ID = E.NFE_ID)
                              INNER JOIN EMP_PRODUTO P ON (EI.NFEI_FKPRD_ID = P.PRD_ID)
                              WHERE EI.NFEI_ID = EI2.NFEI_ID
                              ORDER BY E.NFE_DTMOVIMENTO
                             )
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_PRODUTO P1
SET P1.PRD_CUSTOMEDIO = CASE
                          WHEN COALESCE((SELECT NFEI_VLRCUSTOMEDIO
                                         FROM EMP_ENTRADAI
                                         WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                               AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                              FROM EMP_ENTRADAI I1
                                                              INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                               AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                                 FROM EMP_ENTRADAI I2
                                                                 INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                                 WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                        ),0) > 0 THEN
                            COALESCE((SELECT NFEI_VLRCUSTOMEDIO
                                      FROM EMP_ENTRADAI
                                      WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                            AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                           FROM EMP_ENTRADAI I1
                                                           INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                           WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                            AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                              FROM EMP_ENTRADAI I2
                                                              INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                     ),0)
                          ELSE
                            P1.PRD_CUSTOMEDIO
                          END
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_ENTRADAI EI2
SET EI2.NFEI_VLRCUSTOCONTABIL = (
                                 SELECT (EI.NFEI_PRDVLRUNITARIO -
                                         ((EI.NFEI_ICMSAL00 / 100) *
                                          EI.NFEI_PRDVLRUNITARIO)) AS CUSTO_CONTABIL
                                 FROM EMP_ENTRADAI EI
                                 WHERE EI.NFEI_ID = EI2.NFEI_ID
                                )
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_PRODUTO P1
SET PRD_CUSTOCONTABIL = CASE
                          WHEN COALESCE((SELECT NFEI_VLRCUSTOCONTABIL
                                         FROM EMP_ENTRADAI
                                         WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                               AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                              FROM EMP_ENTRADAI I1
                                                              INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                               AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                                 FROM EMP_ENTRADAI I2
                                                                 INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                                 WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                        ),0) > 0 THEN
                            COALESCE((SELECT NFEI_VLRCUSTOCONTABIL
                                      FROM EMP_ENTRADAI
                                      WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                            AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                           FROM EMP_ENTRADAI I1
                                                           INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                           WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                            AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                              FROM EMP_ENTRADAI I2
                                                              INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                     ),0)
                          ELSE
                            P1.PRD_CUSTOMEDIO
                          END
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_ENTRADAI EI2
SET EI2.NFEI_VLRCUSTOMEDIO = (
                              SELECT CASE
                                       WHEN (((
                                               SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                               FROM EMP_ENTRADAI EI2
                                               INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                               WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                               GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                              ) - (
                                                   SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                   FROM EMP_NFSI SI
                                                   WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                         AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                  )) + EI.NFEI_PRDQTDEMOV) > 0 THEN ((((
                                                                                        SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                                                                        FROM EMP_ENTRADAI EI2
                                                                                        INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                                                                        WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                        GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                                                                       ) - (
                                                                                            SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                                                            FROM EMP_NFSI SI
                                                                                            WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                                                                  AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                           )) * P.PRD_CUSTOCONTABIL) +
                                                                                     (EI.NFEI_PRDQTDEMOV * EI.NFEI_VLRCUSTOCONTABIL)) /
                                                                                     (((
                                                                                        SELECT SUM(EI2.NFEI_PRDQTDEMOV) + P.PRD_ESTOQUE_ANTERIOR
                                                                                        FROM EMP_ENTRADAI EI2
                                                                                        INNER JOIN EMP_PRODUTO P ON (EI2.NFEI_FKPRD_ID = P.PRD_ID)
                                                                                        WHERE EI2.NFEI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                        GROUP BY P.PRD_ESTOQUE_ANTERIOR
                                                                                       ) - (
                                                                                            SELECT SUM(SI.NFSI_PRD_QTD_MOV)
                                                                                            FROM EMP_NFSI SI
                                                                                            WHERE SI.NFSI_DTCAD <= E.NFE_DTMOVIMENTO
                                                                                                  AND SI.NFSI_FKPRD_ID = EI.NFEI_FKPRD_ID
                                                                                           )) + EI.NFEI_PRDQTDEMOV)
                                       ELSE EI2.NFEI_VLRCUSTOMEDIO
                                     END AS CUSTO_MEDIO
                              FROM EMP_ENTRADAI EI
                              INNER JOIN EMP_ENTRADA E ON (EI.NFEI_NFE_ID = E.NFE_ID)
                              INNER JOIN EMP_PRODUTO P ON (EI.NFEI_FKPRD_ID = P.PRD_ID)
                              WHERE EI.NFEI_ID = EI2.NFEI_ID
                              ORDER BY E.NFE_DTMOVIMENTO
                             )
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_PRODUTO P1
SET P1.PRD_CUSTOMEDIO = CASE
                          WHEN COALESCE((SELECT NFEI_VLRCUSTOMEDIO
                                         FROM EMP_ENTRADAI
                                         WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                               AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                              FROM EMP_ENTRADAI I1
                                                              INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                               AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                                 FROM EMP_ENTRADAI I2
                                                                 INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                                 WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                        ),0) > 0 THEN
                            COALESCE((SELECT NFEI_VLRCUSTOMEDIO
                                      FROM EMP_ENTRADAI
                                      WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                            AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                           FROM EMP_ENTRADAI I1
                                                           INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                           WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                            AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                              FROM EMP_ENTRADAI I2
                                                              INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                              WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                     ),0)
                          ELSE
                            P1.PRD_CUSTOMEDIO
                          END
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_ENTRADAI EI2
SET EI2.NFEI_VLRCUSTODECOMPRA = (
                                 SELECT ((EI.NFEI_PRDVLRUNITARIO +
                                          EI.NFEI_ICMSSUBVALORNF +
                                          EI.NFEI_IPIVALOR +
                                          EI.NFEI_VLRFRETENF +
                                          EI.NFEI_VLROUTRASDESPNF +
                                          EI.NFEI_VLR_SEGURO) - EI.NFEI_PRD_VLR_DESCONTO) AS CUSTO_COMPRA
                                 FROM EMP_ENTRADAI EI
                                 WHERE EI.NFEI_ID = EI2.NFEI_ID
                                )
^
SET TERM; ^

COMMIT WORK;

SET TERM ^ ;
UPDATE EMP_PRODUTO P1
SET P1.PRD_CUSTOCOMPRA = CASE
                           WHEN COALESCE((SELECT NFEI_VLRCUSTODECOMPRA
                                          FROM EMP_ENTRADAI
                                          WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                                AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                               FROM EMP_ENTRADAI I1
                                                               INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                               WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                                AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                                  FROM EMP_ENTRADAI I2
                                                                  INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                                  WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                         ),0) > 0 THEN
                             COALESCE((SELECT NFEI_VLRCUSTODECOMPRA
                                       FROM EMP_ENTRADAI
                                       WHERE NFEI_FKPRD_ID = P1.PRD_ID
                                             AND NFEI_ID = (SELECT MAX(NFEI_ID)
                                                            FROM EMP_ENTRADAI I1
                                                            INNER JOIN EMP_ENTRADA NE ON (I1.NFEI_NFE_ID = NE.NFE_ID)
                                                            WHERE I1.NFEI_FKPRD_ID = P1.PRD_ID)
                                             AND NFEI_DTCAD = (SELECT MAX(NFEI_DTCAD)
                                                               FROM EMP_ENTRADAI I2
                                                               INNER JOIN EMP_ENTRADA NE ON (I2.NFEI_NFE_ID = NE.NFE_ID)
                                                               WHERE I2.NFEI_FKPRD_ID = P1.PRD_ID)
                                                               ),0)
                           ELSE
                             P1.PRD_CUSTOMEDIO
                           END
^
SET TERM; ^

COMMIT WORK;

