-- Criar views para ranking vendedores

create view ranking_vendedores as
SELECT	
	ven.idVendedor,
    ven.nome,
    count(v.idVendas) as total_vendas,
    sum(pag.valorPagamento) as total_faturamento
FROM vendas v
JOIN vendedor ven on v.idVendedor = ven.idVendedor
JOIN pagamento pag on v.idVendas = pag.idVenda
GROUP BY ven.idVendedor, ven.nome
ORDER BY total_faturamento DESC;