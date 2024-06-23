--DROPAR TABELAS
DROP TABLE IF EXISTS saida_estoque;
DROP TABLE IF EXISTS item_estoque;
DROP TABLE IF EXISTS estoque;
DROP TABLE IF EXISTS produto;

-- Criando a tabela de estoque
CREATE TABLE estoque (
    id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL, 
    localizacao VARCHAR(200) NOT NULL,
    categoria VARCHAR(200),
    descricao TEXT
);

-- Criando a tabela de produtos
CREATE TABLE produto (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco NUMERIC(10, 2) NOT NULL,
    validade DATE,
    lote VARCHAR(50),
    tipo VARCHAR(50)
);
 
-- Criando a tabela de itens de estoque
CREATE TABLE item_estoque (
    id SERIAL PRIMARY KEY,
    id_produto INT REFERENCES produto(id),
    id_estoque INT REFERENCES estoque(id),
    quantidade INT NOT NULL,
    unidade_medida VARCHAR(20),
    qtd_minima INT
);

-- Criando a tabela de saídas de estoque
CREATE TABLE saida_estoque (
    id SERIAL PRIMARY KEY,
    id_item_estoque INT REFERENCES item_estoque(id),
    quantidade INT NOT NULL,
    motivo_saida VARCHAR(100)
);