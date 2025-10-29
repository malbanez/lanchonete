# Sistema de Gerenciamento de Pedidos - Lanchonete

Este é um sistema simples para gerenciar pedidos de uma lanchonete, desenvolvido em Delphi.

## 🚀 Como Instalar e Executar

A aplicação é **portátil e fácil de usar**. Siga estes passos:

### 1. Requisitos Mínimos

Para que a aplicação funcione em qualquer computador Windows (versões a partir do Windows 7):

* **Arquivos Necessários**:
    * `lanchonete.exe` (ou o nome do seu executável)
    * `dados.sqlite` (o arquivo do banco de dados)
    * `sqlite3.dll` (biblioteca de driver do SQLite)

    **Importante**: Todos esses três arquivos devem estar **na mesma pasta**.

### 2. Instalação

1.  Faça o download do arquivo instalacao.zip.
2.  Extraia todo o conteúdo para uma pasta de sua escolha (ex: `C:\LanchonetePedidos\`).

    Certifique-se de que os arquivos `lanchonete.exe`, `dados.sqlite` e `sqlite3.dll` estejam juntos na mesma pasta.

### 3. Execução

1.  Dentro da pasta onde você extraiu os arquivos, localize e execute o arquivo `lanchonete.exe`.

A aplicação deve iniciar imediatamente, conectando-se ao banco de dados `dados.sqlite` e exibindo a tela principal.

---

## 💡 Sobre o Desenvolvimento

### Tecnologias Principais

* **Delphi**: Para o desenvolvimento da interface e lógica de negócio.
* **FireDAC**: Framework de acesso a dados integrado ao Delphi.
* **SQLite**: Banco de dados leve e portátil, armazenado em um único arquivo (`dados.sqlite`).

### Funcionalidades e Regras de Negócio

O sistema gerencia pedidos de lanches com as seguintes lógicas automáticas:

* **Calcula Totais**: `ValorBruto`, `ValorDesconto` e `ValorTotal` do pedido são calculados e atualizados automaticamente com base nos itens.
* **Descontos Automáticos**:
    * 3% de desconto se o pedido for acima de R$50,00.
    * Adicional de 5% se o cliente for cadastrado há mais de 6 meses.
* **Brinde "Refrigerante Grátis"**: Adicionado automaticamente ao pedido se o cliente comprar "X-Salada" e "Batata Frita". O item de refrigerante entra com valor zero.
* **Preenchimento Automático**: `Data/Hora` do pedido e `Valor Unitário` dos itens são preenchidos automaticamente.

### Considerações de Design

* **Portabilidade**: A escolha do SQLite permite que a aplicação seja executada sem a necessidade de instalar um servidor de banco de dados separado.
* **Manutenção**: A lógica de negócio está centralizada no `Data Module`, separada da interface do usuário, facilitando futuras alterações.

---