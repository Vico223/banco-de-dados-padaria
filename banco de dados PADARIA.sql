CREATE DATABASE PADARIA1;

CREATE TABLE padaria (
  PadariaID INT AUTO_INCREMENT PRIMARY KEY,
  Nome VARCHAR(30) NOT NULL,
  Email VARCHAR(40) NOT NULL,
  Telefone VARCHAR(20) NOT NULL,
  Endereco VARCHAR(40) NOT NULL
);

CREATE TABLE fornecedor (
	FornecedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(40) NOT NULL,
    Cnpj VARCHAR(30) NOT NULL,
    Telefone VARCHAR (20) NOT NULL,
    PadariaID INT, 
    FOREIGN KEY(PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE fornecimento (
	FornecimentoID INT AUTO_INCREMENT PRIMARY KEY,
    FornecedorID INT,
    Nome VARCHAR(30),
    Tipo VARCHAR(30),
    Data_Fornecimento DATETIME,
    FOREIGN KEY (FornecedorID) REFERENCES fornecedor(FornecedorID)
);

CREATE TABLE estoque (
	EstoqueID INT AUTO_INCREMENT PRIMARY KEY,
    FornecimentoID INT,
    Quantidade INT,
    Data_Atualizacao DATETIME,
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID)
);

CREATE TABLE insumo ( 
	InsumoID INT AUTO_INCREMENT PRIMARY KEY,
    FornecedorID INT,
    FornecimentoID INT,
    EstoqueID INT,
    Tipo VARCHAR(30),
    Valor FLOAT,
    FOREIGN KEY (FornecedorID) REFERENCES fornecedor(FornecedorID),
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID)
);

CREATE TABLE funcionario ( 
	FuncionarioID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(30),
    Endereco VARCHAR(50),
    Cpf VARCHAR(20),
    Cargo VARCHAR(20),
    PadariaID INT,
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE producao ( 
	ProducaoID INT AUTO_INCREMENT PRIMARY KEY,
    InsumoID INT,
    FuncionarioID INT,
    EstoqueID INT,
    Tipo VARCHAR(30),
    Data_Inicio DATETIME,
    Validade DATETIME,
    Nome VARCHAR(30),
    FOREIGN KEY (InsumoID) REFERENCES insumo(InsumoID),
    FOREIGN KEY (FuncionarioID) REFERENCES funcionario(FuncionarioID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID)
);

CREATE TABLE produto (
	ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    FuncionarioID INT,
    EstoqueID INT,
    FornecimentoID INT,
    ProducaoID INT,
    Nome VARCHAR(30),
    Preco DECIMAL(10,2),
    FOREIGN KEY (FuncionarioID) REFERENCES funcionario(FuncionarioID),
    FOREIGN KEY (EstoqueID) REFERENCES estoque(EstoqueID),
    FOREIGN KEY (FornecimentoID) REFERENCES fornecimento(FornecimentoID),
    FOREIGN KEY (ProducaoID) REFERENCES producao(ProducaoID)
);

CREATE TABLE cliente ( 
	ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    PadariaID INT,
    Nome VARCHAR(30),
    Cpf VARCHAR(20),
    Endereco VARCHAR(40),
    Telefone VARCHAR(30),
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);

CREATE TABLE pedido (
	PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    ProdutoID INT,
    PadariaID INT,
    Data_Pedido DATETIME,
    Valor DECIMAL(10,2),
    FOREIGN KEY (ClienteID) REFERENCES cliente(ClienteID),
    FOREIGN KEY (ProdutoID) REFERENCES produto(ProdutoID),
    FOREIGN KEY (PadariaID) REFERENCES padaria(PadariaID)
);









