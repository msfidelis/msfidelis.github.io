-- ASSIM CRIAMOS NOSSO BANCO DE DADOS
CREATE DATABASE lojinha;
USE lojinha;

-- VAMOS COMEÇAR A MAGIA CRIANDO UMA TABELA PARA CADASTRAR PRODUTOS
CREATE TABLE produtos (
	id_produto INT(11) PRIMARY KEY AUTO_INCREMENT,
	nome_produto VARCHAR(50) UNIQUE
);

-- AGORA VAMOS MONTAR NOSSA TABELA DE ESTOQUE PRA COLOCAR OS PRODUTOS
CREATE TABLE estoque (
	id INT(11) PRIMARY KEY AUTO_INCREMENT, 
	id_produto INT(11),
	qtd FLOAT (10,2),
	tipo_movimentacao INT(1),
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- VAMOS INSERIR UNS REGISTROS 
INSERT INTO produtos (nome_produto) VALUES ('maça'), ('banana'), ('uva');

-- ASSIM PODEMOS VER O CONTEÚDO DA NOSSA TABELINHA
SELECT * FROM produtos;

-- AGORA PODEMOS DELETAR PRODUTOS PELO ID 
DELETE FROM produtos WHERE id_produto = 6;

-- VAMOS ALTERAR UM REGISTRO  
UPDATE produtos SET nome_produto = 'bolacha' WHERE nome_produto = 'banana';

-- DA UMA OLHADA AÍ AGORA
SELECT * FROM produtos;


-- VAMOS FAZER UMAS MOVIMENTAÇÕES 
INSERT INTO estoque (id_produto, qtd, tipo_movimentacao) 
VALUES (5, 12.0, 1), (4, 2.0, 1), (5, 6.5, 2), (4, 1.0, 2) ;

-- VEJA AGORA
SELECT * FROM estoque; 

-- VAMOS LISTAR TODAS AS ENTRADAS (tipo_movimentacao = 1)
SELECT * FROM estoque WHERE tipo_movimentacao = 1;

-- VAMOS LISTAR TODAS AS SAIDAS (tipo_movimentacao = 2)
SELECT * FROM estoque WHERE tipo_movimentacao = 2;

-- MAS FICOU ESTRANHO, NÃO? VAMOS RELACIONAR A MOVIMENTACAO COM O PRODUTO
SELECT * FROM estoque LEFT JOIN produtos ON produtos.id_produto = estoque.id_produto;
