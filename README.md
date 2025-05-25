## 📦 Sistema de Vendas - Projeto SQL
Este projeto simula um sistema completo de banco de dados para gerenciamento de vendas, incluindo clientes, produtos, vendedores, vendas, itens de venda e pagamentos. O objetivo é demonstrar habilidades em modelagem de dados, consultas SQL, views e stored procedures.

## 🛠️ Tecnologias Utilizadas
- MySQL Server

- MySQL Workbench

- Python (para geração de dados simulados)

- SQL (Structured Query Language)

## ✅ Funcionalidades
### 📊 Consultas
- Produtos mais vendidos: identifica os produtos com maior volume de vendas.

- Faturamento por mês: calcula o total de vendas mês a mês.

- Ranking de vendedores: classifica os vendedores com maior faturamento.

### 👓 Views
- produtos_mais_vendidos: facilita consultas rápidas sobre os produtos mais vendidos.

- faturamento_mensal: simplifica relatórios mensais de faturamento.

- ranking_vendedores: exibe o desempenho de cada vendedor.

### ⚙️ Stored Procedures
- relatorio_produtos_mais_vendidos(limite INT): automatiza o relatório dos produtos mais vendidos.

- faturamento_por_mes(ano_mes VARCHAR(7)): consulta o faturamento de um mês específico.

- ranking_vendedores_top(limite INT): exibe os melhores vendedores de forma parametrizada.

## 🚀 Como Utilizar
1 . Clone o repositório:


git clone https://github.com/seuusuario/projeto-sistema-vendas-sql.git

2 . No MySQL Workbench:

- Execute o modelo_fisico.sql para criar todas as tabelas.

- Popule as tabelas executando os scripts contidos na pasta /inserts.

3 . Execute as consultas SQL disponíveis na pasta /consultas.

4 . Crie as views executando os scripts da pasta /views.

5 . Crie e utilize as stored procedures da pasta /stored_procedures.

## 🖼️ Exemplos Visuais
- Modelo Entidade-Relacionamento (ER):

- Prints das consultas realizadas:


## 📚 Aprendizados
- Modelagem conceitual e física de bancos de dados relacionais.

- Criação de consultas complexas utilizando agregações e joins.

- Utilização de views e stored procedures para automatização de relatórios.

- Geração automatizada de dados fictícios com Python.
