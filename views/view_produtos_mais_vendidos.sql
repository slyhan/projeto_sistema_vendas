-- Criar Views para produtos mais vendidos

create view produtos_mais_vendidos as
select
	p.idProdutos,
    p.nome,
    sum(iv.quantidade) as total_vendido
from itensvendas iv
join produtos p on iv.idProdutos = p.idProdutos
group by p.idProdutos, p.nome
order by total_vendido DESC;