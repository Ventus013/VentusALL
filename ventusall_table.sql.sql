CREATE DATABASE ventusall_db;

use ventusall_db;

CREATE TABLE cliente (
    id_cliente INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    telefone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE,
    data_nascimento DATE,
    PRIMARY KEY (id_cliente)
);
CREATE TABLE jogo (
	id_jogo INT AUTO_INCREMENT,
    nome_jogo VARCHAR(100) NOT NULL,
    valor_jogo DECIMAL(10,2),
    plataforma_jogo VARCHAR(100),
    PRIMARY KEY (id_jogo)
);
CREATE TABLE carrinho (
	id_carrinho INT AUTO_INCREMENT,
    id_cliente INT UNIQUE,
    data_criacao TIMESTAMP,
    PRIMARY KEY (id_carrinho),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);
CREATE TABLE itens_carrinho (
	id_carrinho INT NOT NULL,
    id_jogo INT NOT NULL,
    qtd_jogo INT,
    PRIMARY KEY (id_carrinho,id_jogo),
	FOREIGN KEY (id_carrinho) REFERENCES carrinho (id_carrinho),
    FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);
CREATE TABLE vendas (
	id_venda INT AUTO_INCREMENT,
    id_cliente INT,
    data_compra TIMESTAMP,
    valor_compra DECIMAL(10,2),
    PRIMARY KEY (id_venda),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente)
);
CREATE TABLE itens_venda (
	id_venda INT,
    id_jogo INT,
    valor_pago_item DECIMAL(10,2),
    key_jogo VARCHAR(100),
    PRIMARY KEY (id_venda,id_jogo),
    FOREIGN KEY (id_venda) REFERENCES vendas (id_venda),
    FOREIGN KEY (id_jogo) REFERENCES jogo (id_jogo)
);
CREATE TABLE suporte (
	id_suporte INT AUTO_INCREMENT,
    id_cliente INT,
    id_venda INT,
    url_documento VARCHAR(255),
    tipo_intecao VARCHAR(200),
    PRIMARY KEY (id_suporte),
    FOREIGN KEY (id_cliente) REFERENCES cliente (id_cliente),
    FOREIGN KEY (id_venda) REFERENCES vendas (id_venda)
);