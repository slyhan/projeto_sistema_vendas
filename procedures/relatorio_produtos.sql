-- Relatorio de produtos mais vendidos

DELIMITER //

CREATE PROCEDURE relatorio_produtos_mais_vendidos(IN limite INT)
BEGIN
	select
	p.idProdutos,
    p.nome,
    sum(iv.quantidade) as total_vendido
	from itensvendas iv
	join produtos p on iv.idProdutos = p.idProdutos
	group by p.idProdutos, p.nome
	order by total_vendido DESC
	LIMIT limite;
END //

DELIMITER ;

CALL relatorio_produtos_mais_vendidos(10);