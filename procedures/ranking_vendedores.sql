-- ranking de vendedores 

DELIMITER //

CREATE PROCEDURE relatorio_ranking_vendedores_top(IN limite INT)
BEGIN
	SELECT	
	ven.idVendedor,
    ven.nome,
    count(v.idVendas) as total_vendas,
    sum(pag.valorPagamento) as total_faturamento
	FROM vendas v
	JOIN vendedor ven on v.idVendedor = ven.idVendedor
	JOIN pagamento pag on v.idVendas = pag.idVenda
	GROUP BY ven.idVendedor, ven.nome
	ORDER BY total_faturamento DESC
    LIMIT limite;

END //

DELIMITER ;

call relatorio_ranking_vendedores_top(5);