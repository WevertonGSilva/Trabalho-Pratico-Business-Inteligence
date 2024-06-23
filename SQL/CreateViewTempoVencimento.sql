CREATE VIEW ProdutosComTempoRestante AS
SELECT *,
       ("validade" - CURRENT_DATE) AS TempoRestanteDias
FROM produto;

