USE ecommerce1;

-- Inserindo dados na tabela clients
INSERT INTO clients (Fname, Minit, Lname, CPF, Address) VALUES
('João', 'M', 'Silva', '12345678901', 'Rua A, 123'),
('Maria', 'C', 'Souza', '98765432100', 'Rua B, 456'),
('Ana', 'L', 'Oliveira', '45678912345', 'Avenida Central, 789');

-- Inserindo dados na tabela product
INSERT INTO product (Pname, Classification_Kids, Category, Avaliation, Size) VALUES
('Smartphone', false, 'Eletronico', 4.5, '15x8x0.7 cm'),
('Camiseta', false, 'Vestuario', 4.0, 'M'),
('Boneca Barbie', true, 'Brinquedos', 4.8, '20x5x5 cm'),
('Mesa de Jantar', false, 'Móveis', 4.2, '120x75x90 cm'),
('Livro de Ficção', false, 'Livros', 4.9, '21x15x3 cm');

-- Inserindo dados na tabela payments
INSERT INTO payments (idClient, typePayment, limitAvailable) VALUES
(1, 'Cartão', 5000.00),
(2, 'PIX', 1500.00),
(3, 'Boleto', 2000.00);

-- Inserindo dados na tabela orders
INSERT INTO orders (idOrderClient, orderStatus, orderDescription, sendValue, paymentCash, idPayment) VALUES
(1, 'Confirmado', 'Pedido com 2 itens', 20.00, false, 1),
(2, 'Em processamento', 'Pedido urgente com 1 item', 15.00, true, 2),
(3, 'Cancelado', 'Pedido cancelado pelo cliente', 0.00, false, 3);

-- Inserindo dados na tabela inventory
INSERT INTO inventory (storageLocation, quantity) VALUES
('Armazém Central', 100),
('Armazém Secundário', 50),
('Loja Física', 20);

-- Inserindo dados na tabela supplier
INSERT INTO supplier (SocialName, CNPJ, contact) VALUES
('Fornecedor Eletrônicos Ltda', '12345678000199', 'contato@fornecedoreletronicos.com'),
('Roupas e Estilo S/A', '98765432000199', 'vendas@roupasesilo.com'),
('Brinquedos Infantis ME', '11222333000111', 'atendimento@brinquedosinfantis.com');

-- Inserindo dados na tabela seller
INSERT INTO seller (SocialName, AbbrName, CNPJ, CPF, location, contact) VALUES
('Vendas Online LTDA', 'VendasOnline', '33445566000188', NULL, 'E-Commerce Online', 'vendas@vendaonline.com'),
('Loja Física X', NULL, NULL, '12345678912', 'Rua das Lojas, 100', 'contato@lojafisicax.com');

-- Inserindo dados na tabela productSeller
INSERT INTO productSeller (idSeller, idProduct, prodQuantity) VALUES
(1, 1, 10),
(1, 2, 5),
(2, 3, 15);

-- Inserindo dados na tabela productOrder
INSERT INTO productOrder (idProduct, idOrder, poQuantity, poStatus) VALUES
(1, 1, 2, 'Disponivel'),
(3, 2, 1, 'Sem estoque'),
(5, 1, 1, 'Disponivel');

-- Inserindo dados na tabela storageLocation
INSERT INTO storageLocation (idProduct, idInventory, location) VALUES
(1, 1, 'Armazém Central'),
(2, 2, 'Armazém Secundário'),
(3, 3, 'Loja Física');

-- Inserindo dados na tabela productSupplier
INSERT INTO productSupplier (idSupplier, idProduct, quantity) VALUES
(1, 1, 50),
(2, 2, 30),
(3, 3, 40);





