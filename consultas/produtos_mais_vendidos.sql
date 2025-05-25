-- Consulta Produtos mais vendidos

SELECT
	p.idProdutos,
    p.nome,
    SUM(iv.quantidade) as total_vendido
FROM itensvendas iv
JOIN produtos p on iv.idProdutos = p.idProdutos
GROUP BY p.idProdutos, p.nome
ORDER BY total_vendido DESC
LIMIT 10;