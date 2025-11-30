use ventusall_db;

-- CLIENTE -- 
INSERT INTO cliente (nome, cpf, email)
VALUES 
('Guilherme', '12345678910', 'guiventura123@gmail.com'),
('Guilherme A', '12345678911', 'guiventura456@gmail.com'),
('Guilherme B', '12345678912', 'guiventura333@gmail.com'),
('Guilherme C', '12345678913', 'guiventura222@gmail.com');

UPDATE cliente
SET data_nascimento = '2004-11-20'
WHERE id_cliente= 1;

UPDATE cliente
SET data_nascimento = '2000-12-02'
WHERE id_cliente= 2;

UPDATE cliente
SET data_nascimento = '2000-05-06'
WHERE id_cliente= 3;

UPDATE cliente
SET data_nascimento = '99-99-99' -- Exemplo de erro no cod
WHERE id_cliente= 4;

-- JOGO --
INSERT INTO jogo (nome_jogo, valor_jogo, plataforma_jogo)
VALUES 
('God of War', 299.99, 'PS4'),
('Hollow Knight', 39.99, 'PC'),
('Gear of war', 499.75, 'XBOX');

INSERT INTO vendas (id_cliente, valor_compra)
VALUES 
(1, 339.98), -- Venda para Guilherme (God of War + Hollow Knight)
(3, 499.75); -- Venda para Guilherme B (Gear of war)

-- ITENS_VENDA 
INSERT INTO itens_venda (id_venda, id_jogo, valor_pago_item, key_jogo)
VALUES 
(1, 1, 299.99, 'GOW-KEY-12345'),
(1, 2, 39.99, 'HK-KEY-67890'),
(2, 3, 499.75, 'GOW-XBOX-ABCDE');

-- SUPORTE 
INSERT INTO suporte (id_cliente, id_venda, tipo_intecao)
VALUES 
(1, 1, 'Problema com a chave do jogo'),
(3, NULL, 'Dúvida sobre formas de pagamento'),
(4, 1, 'Reembolso solicitado');

-- CONSULTA 1 -- Clientes que possuem itens no carrinho, ordenados pelo nome do jogo
SELECT 
    c.nome AS Nome_Cliente,
    j.nome_jogo AS Jogo_no_Carrinho,
    ic.qtd_jogo AS Quantidade
FROM 
    cliente c
JOIN 
    carrinho ca ON c.id_cliente = ca.id_cliente
JOIN 
    itens_carrinho ic ON ca.id_carrinho = ic.id_carrinho
JOIN 
    jogo j ON ic.id_jogo = j.id_jogo
ORDER BY 
    c.nome, j.nome_jogo;

-- CONSULTA 2 -- Detalhes das vendas, incluindo nome do cliente e valor total da compra
SELECT 
    v.id_venda AS ID_Venda,
    c.nome AS Nome_Cliente,
    v.data_compra AS Data_Compra,
    v.valor_compra AS Valor_Total
FROM 
    vendas v
JOIN 
    cliente c ON v.id_cliente = c.id_cliente
ORDER BY 
    v.data_compra DESC
LIMIT 10; -- Limita a 10 resultados

-- CONSULTA 3 -- Jogos vendidos e o valor pago por item, agrupados por jogo
SELECT 
    j.nome_jogo AS Jogo_Vendido,
    SUM(iv.valor_pago_item) AS Total_Arrecadado,
    COUNT(iv.id_jogo) AS Unidades_Vendidas
FROM 
    itens_venda iv
JOIN 
    jogo j ON iv.id_jogo = j.id_jogo
GROUP BY 
    j.nome_jogo
HAVING 
    COUNT(iv.id_jogo) > 0
ORDER BY 
    Total_Arrecadado DESC;

-- CONSULTA 4 -- Clientes que abriram chamado de suporte, e o tipo de intenção
SELECT 
    c.nome AS Nome_Cliente,
    s.tipo_intecao AS Tipo_Suporte,
    s.id_venda AS ID_Venda_Relacionada
FROM 
    suporte s
JOIN 
    cliente c ON s.id_cliente = c.id_cliente
WHERE 
    s.tipo_intecao LIKE '%chave%' OR s.tipo_intecao LIKE '%reembolso%'
ORDER BY 
    c.nome;

-- UPDATE 1 -- Atualizar o número de telefone do cliete 1
UPDATE cliente
SET telefone = '11987654321'
WHERE id_cliente = 1;

-- UPDATE 2 -- Aplicar um desconto de 10% na venda de ID 2
UPDATE vendas
SET valor_compra = ROUND(valor_compra * 0.90, 2) -- Garante que o valor seja arredondado para duas casas decimais
WHERE id_venda = 2;

-- UPDATE 3 -- Marcar um chamado de suporte como resolvido (adicionando um URL de documento de resolução fictício)
UPDATE suporte
SET url_documento = 'http://ventusall.com/resolucao/1'
WHERE id_suporte = 1 AND id_venda = 1;

-- DELETE 1 -- Remover um item específico do carrinho de um cliente
DELETE FROM itens_carrinho
WHERE id_carrinho = 2 AND id_jogo = 3; -- Remove Gear of War do carrinho 2

-- DELETE 2 -- Remover chamados de suporte que não estão relacionados a uma venda
DELETE FROM suporte
WHERE id_venda IS NULL AND tipo_intecao = 'Dúvida sobre formas de pagamento';

-- DELETE 3 -- Teste de delete em cliente
INSERT INTO cliente (nome, cpf, email)
VALUES ('Cliente Teste', '99999999999', 'teste@email.com');

DELETE FROM cliente
WHERE nome = 'Cliente Teste' AND id_cliente > 4; -- Remove o cliente de teste (assumindo que o ID é maior que 4)
