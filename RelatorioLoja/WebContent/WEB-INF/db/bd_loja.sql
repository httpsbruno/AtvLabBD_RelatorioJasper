CREATE DATABASE bd_loja
GO
USE bd_loja

CREATE TABLE cliente(
codigo          INT NOT NULL,
nome            VARCHAR(100),
endereco        VARCHAR(150),
numero_porta    INT,
telefone        VARCHAR(11),
data_nascimento DATE
PRIMARY KEY(codigo)
)

CREATE TABLE fornecedores(
codigo    INT NOT NULL,
nome      VARCHAR(100),
atividade VARCHAR(100),
telefone  VARCHAR(11)
PRIMARY KEY(codigo)
)

CREATE TABLE produto(
codigo             INT NOT NULL,
nome               VARCHAR(100),
valor_unitario     DECIMAL(7,2),
quantidade_estoque INT,
descricao          VARCHAR(150),
codigo_fornecedor  INT
PRIMARY KEY(codigo)
FOREIGN KEY(codigo_fornecedor) REFERENCES fornecedores(codigo)
)

CREATE TABLE pedido(
codigo_pedido INT,
codigo_cliente INT,
codigo_produto INT,
quantidade INT,
previsao_entrega DATE
PRIMARY KEY(codigo_pedido,codigo_cliente,codigo_produto)
FOREIGN KEY(codigo_cliente) REFERENCES cliente(codigo),
FOREIGN KEY(codigo_produto) REFERENCES produto(codigo)
)

SELECT * FROM cliente
SELECT * FROM fornecedores
SELECT * FROM produto
SELECT * FROM pedido
--codigo_pedido, codigo_cliente,nome_cliente,endereco_cliente, numero_cliente, telefone_clente
--codigo_produto, nome_produto, valor_unitário, quantidate, valor total

SELECT pedido.codigo_pedido, cliente.codigo, cliente.nome, cliente.endereco,cliente.numero_porta, cliente.telefone,
	produto.codigo, produto.nome, produto.valor_unitario, produto.quantidade_estoque, 
	(produto.valor_unitario * produto.quantidade_estoque) AS valor_total
	FROM produto INNER JOIN pedido
	ON produto.codigo = pedido.codigo_produto
	INNER JOIN cliente
	ON pedido.codigo_cliente = cliente.codigo
	WHERE codigo_cliente = 33605

