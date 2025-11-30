<div align = "center">
  <h1> Sistema de Banco de Dados - VentusALL</h1>
<h2>Projeto Academico - Faculdade Cruzeiro do Suk</h2>
<body>
<h1>Projeto de Banco de Dados: VentusALL - Vendas de Jogos Digitais</h1>
<p>Este documento detalha o <strong>Minimundo</strong> modelado e o <strong>Código SQL</strong> desenvolvido para o projeto de Banco de Dados da <strong>Faculdade Cruzeiro do Sul</strong>.</p>
<h2>1. O Minimundo: VentusALL</h2>
<p>O <strong>Minimundo</strong> escolhido para este projeto é uma plataforma de <strong>e-commerce de jogos digitais</strong> chamada <strong>VentusALL</strong>. O objetivo é simular e gerenciar as operações essenciais de uma loja virtual que lida com clientes, catálogo de produtos (jogos), transações de compra e suporte pós-venda.</p>
<h3>Entidades e Processos Chave do Minimundo:</h3>
<ul>
<li><strong>Clientes:</strong> Pessoas que se cadastram na plataforma para comprar jogos. É fundamental registrar seus dados pessoais para identificação e contato.</li>
<li><strong>Jogos:</strong> Os produtos vendidos. Cada jogo possui um valor e é associado a uma plataforma (PC, PS4, XBOX, etc.).</li>
<li><strong>Carrinho de Compras:</strong> Um espaço temporário onde o cliente armazena os jogos que deseja comprar antes de finalizar a transação.</li>
<li><strong>Vendas:</strong> O registro final de uma transação bem-sucedida, que transforma o conteúdo do carrinho em um histórico de compra.</li>
<li><strong>Suporte:</strong> O canal de atendimento ao cliente, onde são registrados chamados que podem estar relacionados a uma venda específica (ex: problema com a chave do jogo) ou a dúvidas gerais.</li>
</ul>
<p>O modelo de dados relacional (DER) foi construído para refletir com precisão as interações e os requisitos de informação deste minimundo.</p>
<h2>2. O Código SQL Implementado</h2>
<p>O código SQL desenvolvido é a implementação prática do modelo de dados e está dividido em dois arquivos principais para organização: <strong><code>ventusall_table</code></strong> (DDL) e <strong><code>ventusall_insert</code></strong> (DML).</p>
<h3>2.1. Linguagem de Definição de Dados (DDL)</h3>
<p>O DDL (Data Definition Language) é responsável pela criação da estrutura do banco de dados <code>ventusall_db</code>.</p>
<ul>
<li><strong>Criação de Tabelas:</strong> Foram criadas 7 tabelas (<code>cliente</code>, <code>jogo</code>, <code>carrinho</code>, <code>itens_carrinho</code>, <code>vendas</code>, <code>itens_venda</code>, <code>suporte</code>).</li>
<li><strong>Integridade e Relacionamentos:</strong> O código define chaves primárias (<code>PRIMARY KEY</code>) e chaves estrangeiras (<code>FOREIGN KEY</code>) para garantir a integridade referencial. Por exemplo, um item de venda (<code>itens_venda</code>) só pode existir se a venda (<code>vendas</code>) e o jogo (<code>jogo</code>) aos quais ele se refere existirem.</li>
</ul>
<h3>2.2. Linguagem de Manipulação de Dados (DML)</h3>
<p>O DML (Data Manipulation Language) demonstra a interação com os dados dentro da estrutura criada.</p>
<table>
<thead>
<tr>
<th style="text-align: left;">Comando</th>
<th style="text-align: left;">Objetivo no Projeto</th>
<th style="text-align: left;">Exemplo de Aplicação</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align: left;"><strong><code>INSERT</code></strong></td>
<td style="text-align: left;">Popular todas as tabelas com dados de exemplo para simular o funcionamento da loja.</td>
<td style="text-align: left;">Inserção de novos clientes, jogos e registro de vendas.</td>
</tr>
<tr>
<td style="text-align: left;"><strong><code>SELECT</code></strong></td>
<td style="text-align: left;">Realizar consultas complexas para extrair informações gerenciais e operacionais.</td>
<td style="text-align: left;">Listar clientes que têm itens no carrinho (<code>JOIN</code>), calcular o total arrecadado por jogo (<code>GROUP BY</code>, <code>SUM</code>).</td>
</tr>
<tr>
<td style="text-align: left;"><strong><code>UPDATE</code></strong></td>
<td style="text-align: left;">Modificar dados existentes com base em condições específicas.</td>
<td style="text-align: left;">Aumentar o preço de jogos de uma plataforma, aplicar descontos em vendas.</td>
</tr>
<tr>
<td style="text-align: left;"><strong><code>DELETE</code></strong></td>
<td style="text-align: left;">Remover registros que não são mais necessários, respeitando as regras de negócio.</td>
<td style="text-align: left;">Remover itens de um carrinho, excluir chamados de suporte resolvidos.</td>
</tr>
</tbody>
</table>
<p>O script também inclui a manipulação do <strong>Safe Update Mode</strong> do MySQL (<code>SET SQL_SAFE_UPDATES = 0;</code>) para permitir a execução de comandos <code>UPDATE</code> e <code>DELETE</code> em massa, conforme exigido em ambientes de desenvolvimento.</p>
</body>
</html>
</div>
