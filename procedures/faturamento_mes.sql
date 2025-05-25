--  relatorio Faturamento de um mês específico

DELIMITER //

CREATE PROCEDURE relatorio_faturamento_por_mes(IN ano_mes VARCHAR(7))
BEGIN
	SELECT	
	date_format(v.dataVenda, '%y-%m') as mes,
    SUM(pag.valorPagamento) as faturamento
	FROM vendas v
	JOIN pagamento pag on v.idVendas = pag.idVenda
    WHERE DATE_FORMAT(v.dataVenda, '%Y-%m') = ano_mes
	GROUP BY mes;
	

END //

DELIMITER ;

CALL relatorio_faturamento_por_mes('2024-05');
