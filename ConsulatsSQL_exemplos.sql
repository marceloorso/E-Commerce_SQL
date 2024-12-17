use ecommerce1;
-- Recupera todos os dados da tabela 'clients'
SELECT * FROM clients;

-- Recupera todos os dados da tabela 'product'
SELECT * FROM product;

-- Recupera os produtos da categoria 'Eletronico'
SELECT * FROM product
WHERE Category = 'Eletronico';

-- Cria um atributo derivado chamado 'full_name' concatenando o nome e sobrenome
SELECT CONCAT(Fname, ' ', Lname) AS full_name, CPF FROM clients;

-- Ordena os clientes pelo sobrenome em ordem alfabética
SELECT * FROM clients
ORDER BY Lname ASC;

-- Ordena os produtos pela avaliação de forma decrescente
SELECT * FROM product
ORDER BY Avaliation DESC;

-- Ordena os pedidos pelo valor do envio em ordem crescente
SELECT * FROM orders
ORDER BY sendValue ASC;

-- Conta quantos pedidos cada cliente fez e filtra apenas os clientes com mais de 1 pedido
SELECT idOrderClient, COUNT(idOrder) AS num_orders
FROM orders
GROUP BY idOrderClient
HAVING COUNT(idOrder) > 1;

-- Conta o número de produtos por categoria e filtra as categorias com mais de 5 produtos
SELECT Category, COUNT(idProduct) AS product_count
FROM product
GROUP BY Category
HAVING COUNT(idProduct) > 5;

-- Junta a tabela 'clients' com a tabela 'orders' para mostrar quais clientes fizeram pedidos
SELECT clients.Fname, clients.Lname, orders.idOrder, orders.orderStatus
FROM clients
INNER JOIN orders ON clients.idClient = orders.idOrderClient;

-- Junta 'clients' com 'payments' para mostrar todos os clientes e seus pagamentos (mesmo que não tenham pagamento)
SELECT clients.Fname, clients.Lname, payments.typePayment
FROM clients
LEFT JOIN payments ON clients.idClient = payments.idClient;

-- Simula um FULL OUTER JOIN usando LEFT JOIN e RIGHT JOIN
SELECT clients.Fname, payments.typePayment
FROM clients
LEFT JOIN payments ON clients.idClient = payments.idClient
UNION
SELECT clients.Fname, payments.typePayment
FROM clients
RIGHT JOIN payments ON clients.idClient = payments.idClient;






