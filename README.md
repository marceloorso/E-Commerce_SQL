# E-Commerce Database Model

Este repositório contém o esquema refinado de banco de dados para um sistema de e-commerce. O modelo foi projetado com foco em integridade referencial, eficiência e flexibilidade para suportar as operações comuns de uma plataforma de comércio eletrônico.

---

## 🎯 **Objetivo do Projeto**
Criar e gerenciar um banco de dados relacional robusto que abrange:
- Gerenciamento de clientes, produtos, pedidos, vendedores e fornecedores.
- Controle de pagamentos, estoques e localizações.
- Conexões consistentes entre tabelas para garantir integridade e evitar duplicidades.

---

## 🔑 **Principais Modificações e Refinamentos**

### 1. **Ajuste nos Comprimentos e Tipos de Dados**
- **Campos otimizados:**
  - `VARCHAR` e `CHAR` ajustados para tamanhos adequados:
    - `Fname`, `Lname`, `Address`, `CNPJ`, `CPF`, e `Size`.
  - Uso de `FLOAT` com validações (`CHECK`) para valores positivos:
    - Avaliação (`Avaliation`) limitada entre `0` e `5`.
    - Valores como `sendValue`, `limitAvailable` e `quantity` não podem ser negativos.

---

### 2. **Constraints de Integridade**
- **Chaves estrangeiras:**
  - Garantida conexão entre tabelas:
    - `orders` ↔ `clients` por `idOrderClient`.
    - `payments` ↔ `clients` por `idClient`.
    - `orders` ↔ `payments` por `idPayment`.
    - Relacionamentos adicionais em tabelas intermediárias.

- **Unicidade:**
  - CPF único para clientes (`unique_CPF_client`).
  - CNPJ único para fornecedores e vendedores (`unique_supplier`, `unique_cnpj_seller`).

- **Validações:**
  - Quantidades (`quantity`, `prodQuantity`) e valores monetários (`sendValue`) não podem ser negativos.
  - Verificador de avaliações (`CHECK`) para limitar entre `0` e `5`.

---

### 3. **Tabelas de Relacionamento**
Foram criadas tabelas para organizar os relacionamentos:
- **`productOrder`:** Conecta produtos a pedidos.
- **`productSeller`:** Relaciona produtos aos vendedores.
- **`productSupplier`:** Associa produtos a fornecedores.
- **`storageLocation`:** Gerencia a localização dos produtos no estoque.

---

### 4. **Nomeação e Normalização**
- Padronização dos nomes das tabelas e colunas para clareza e consistência.
- Separação de métodos de pagamento em uma tabela dedicada (`payments`) conectada a pedidos.

---

### 5. **Integração de Pagamentos**
- Adicionado o campo `idPayment` em `orders` para associar pedidos a pagamentos específicos.
- Chave estrangeira conecta pedidos a métodos de pagamento.

---

### 6. **Otimização para Consultas**
- Índices em colunas como `CPF`, `CNPJ`, e chaves primárias para melhorar o desempenho de consultas.
- Integridade referencial garantida com regras de atualização e exclusão em cascata.

---

## 🛠 **Modelo Relacional Atualizado**

### **Entidades Principais**
- **`clients`**: Cadastro de clientes.
- **`product`**: Informações dos produtos.
- **`orders`**: Registro dos pedidos realizados.
- **`payments`**: Métodos de pagamento e limites disponíveis.
- **`inventory`**: Controle de estoque.
- **`supplier`**: Cadastro de fornecedores.
- **`seller`**: Cadastro de vendedores.

### **Relacionamentos Adicionados**
- **`orders` ↔ `payments`**: Associar métodos de pagamento aos pedidos.
- **`product` ↔ `seller`**: Produtos vendidos por cada vendedor.
- **`product` ↔ `supplier`**: Fornecedores de produtos.
- **`product` ↔ `inventory`**: Localização dos produtos no estoque.

---

## 🧩 **Estrutura do Banco de Dados**
- O arquivo **`ecommerce.sql`** contém o script SQL completo para criação do banco de dados e suas tabelas.
- Inclui:
  - Chaves primárias e estrangeiras.
  - Constraints de integridade e validações.
  - Relacionamentos entre tabelas.

---

## 📊 **Exemplo de Fluxo de Dados**

1. Um **cliente** realiza um pedido:
   - Associado a produtos (via `productOrder`).
   - Vinculado a um método de pagamento (via `payments`).

2. O sistema verifica:
   - Estoque disponível (`inventory`).
   - Fornecedores e vendedores do produto (`productSupplier`, `productSeller`).

3. A entrega é gerenciada:
   - Localização e quantidade no estoque (`storageLocation`).

---

## 🚀 **Benefícios das Modificações**
- **Maior consistência:** Garantida pela integridade referencial e validações.
- **Flexibilidade:** Suporte para futuras expansões, como novos métodos de pagamento ou categorias de produto.
- **Desempenho otimizado:** Índices e normalização melhoram consultas frequentes.
- **Redução de erros:** Constraints previnem duplicidades e dados inválidos.


