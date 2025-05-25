-- Consulta Faturamento por mês

SELECT	
	date_format(v.dataVenda, '%y-%m') as mes,
    SUM(pag.valorPagamento) as faturamento
FROM vendas v
JOIN pagamento pag on v.idVendas = pag.idVenda
GROUP BY mes
ORDER BY mes;