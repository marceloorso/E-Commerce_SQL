-- Criação do banco de dados para o cenário de E-Commerce
-- DROP DATABASE IF EXISTS ecommerce1;
CREATE DATABASE ecommerce1;
USE ecommerce1;

-- Tabela Clientes
CREATE TABLE clients (
    idClient INT AUTO_INCREMENT PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Minit CHAR(3),
    Lname VARCHAR(50) NOT NULL,
    CPF CHAR(14) NOT NULL,
    Address VARCHAR(100),
    CONSTRAINT unique_CPF_client UNIQUE (CPF)
);

-- Tabela Produtos
CREATE TABLE product (
    idProduct INT AUTO_INCREMENT PRIMARY KEY,
    Pname VARCHAR(50) NOT NULL,
    Classification_Kids BOOLEAN DEFAULT FALSE,
    Category ENUM('Eletronico', 'Vestuario', 'Brinquedos', 'Alimentos', 'Móveis', 'Livros') NOT NULL,
    Avaliation FLOAT DEFAULT 0 CHECK (Avaliation BETWEEN 0 AND 5),
    Size VARCHAR(50) -- dimensão do produto
);

-- Tabela Pagamentos
CREATE TABLE payments (
    idPayment INT AUTO_INCREMENT PRIMARY KEY,
    idClient INT NOT NULL,
    typePayment ENUM('Boleto', 'Cartão', 'Dois Cartões', 'PIX', 'Transferencia Bancaria') NOT NULL,
    limitAvailable FLOAT DEFAULT 0,
    CONSTRAINT fk_payment_client FOREIGN KEY (idClient) REFERENCES clients(idClient) ON DELETE CASCADE
);

-- Tabela Pedidos
CREATE TABLE orders (
    idOrder INT AUTO_INCREMENT PRIMARY KEY,
    idOrderClient INT NOT NULL,
    orderStatus ENUM('Cancelado', 'Confirmado', 'Em processamento') DEFAULT 'Em processamento',
    orderDescription VARCHAR(255),
    sendValue FLOAT DEFAULT 10 CHECK (sendValue >= 0),
    paymentCash BOOLEAN DEFAULT FALSE,
    idPayment INT,
    CONSTRAINT fk_orders_client FOREIGN KEY (idOrderClient) REFERENCES clients(idClient) ON UPDATE CASCADE,
    CONSTRAINT fk_orders_payment FOREIGN KEY (idPayment) REFERENCES payments(idPayment)
);

-- Tabela Estoque
CREATE TABLE inventory (
    idInventory INT AUTO_INCREMENT PRIMARY KEY,
    storageLocation VARCHAR(255),
    quantity INT DEFAULT 0 CHECK (quantity >= 0)
);

-- Tabela Fornecedores
CREATE TABLE supplier (
    idSupplier INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    CNPJ CHAR(18) NOT NULL,
    contact VARCHAR(20) NOT NULL,
    CONSTRAINT unique_supplier UNIQUE (CNPJ)
);

-- Tabela Vendedores
CREATE TABLE seller (
    idSeller INT AUTO_INCREMENT PRIMARY KEY,
    SocialName VARCHAR(255) NOT NULL,
    AbbrName VARCHAR(255),
    CNPJ CHAR(18),
    CPF CHAR(14),
    location VARCHAR(255) NOT NULL,
    contact VARCHAR(25),
    CONSTRAINT unique_cnpj_seller UNIQUE (CNPJ),
    CONSTRAINT unique_cpf_seller UNIQUE (CPF)
);

-- Relacionamento Produto-Vendedor
CREATE TABLE productSeller (
    idSeller INT,
    idProduct INT,
    prodQuantity INT DEFAULT 1 CHECK (prodQuantity > 0),
    PRIMARY KEY (idSeller, idProduct),
    CONSTRAINT fk_product_seller FOREIGN KEY (idSeller) REFERENCES seller(idSeller),
    CONSTRAINT fk_product_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);

-- Relacionamento Produto-Pedido
CREATE TABLE productOrder (
    idProduct INT,
    idOrder INT,
    poQuantity INT DEFAULT 1 CHECK (poQuantity > 0),
    poStatus ENUM('Disponivel', 'Sem estoque') DEFAULT 'Disponivel',
    PRIMARY KEY (idProduct, idOrder),
    CONSTRAINT fk_productorder_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_productorder_order FOREIGN KEY (idOrder) REFERENCES orders(idOrder)
);

-- Localização do Estoque
CREATE TABLE storageLocation (
    idProduct INT,
    idInventory INT,
    location VARCHAR(255) NOT NULL,
    PRIMARY KEY (idProduct, idInventory),
    CONSTRAINT fk_storage_location_product FOREIGN KEY (idProduct) REFERENCES product(idProduct),
    CONSTRAINT fk_storage_location_inventory FOREIGN KEY (idInventory) REFERENCES inventory(idInventory)
);

ALTER TABLE supplier MODIFY contact VARCHAR(50) NOT NULL;

-- Relacionamento Produto-Fornecedor
CREATE TABLE productSupplier (
    idSupplier INT,
    idProduct INT,
    quantity INT NOT NULL CHECK (quantity > 0),
    PRIMARY KEY (idSupplier, idProduct),
    CONSTRAINT fk_product_supplier_supplier FOREIGN KEY (idSupplier) REFERENCES supplier(idSupplier),
    CONSTRAINT fk_product_supplier_product FOREIGN KEY (idProduct) REFERENCES product(idProduct)
);
