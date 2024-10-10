# Simulação de Banco de Dados SQL Server para Sistema Comercial

Este projeto simula um banco de dados em SQL Server, modelado para uma empresa que trabalha com vendas. O objetivo principal é demonstrar o funcionamento de um sistema comercial que registra as vendas diárias, permitindo ajustes até o fechamento do dia e aplicação de regras configuráveis, como aumento de vendas em fins de semana.

## Funcionalidades Principais

- **Cadastro de Produtos e Clientes:** O banco permite o cadastro completo de produtos e clientes, essenciais para o funcionamento das vendas diárias.
- **Registro de Vendas Diárias:** As vendas realizadas ao longo do dia são registradas em uma tabela de vendas gerais e podem ser modificadas até o fechamento do dia.
- **Fechamento Diário:** O fechamento das vendas diárias é realizado através de uma procedure específica, que consolida as vendas do dia e prepara o banco para o próximo.
- **Configurações de Sistema:** O sistema conta com uma tabela de configuração que permite:
  - Operar em dias úteis ou todos os dias.
  - Aplicar um acréscimo de 50% no valor das vendas durante os finais de semana (caso a opção de operar todos os dias esteja ativada).
- **Regras de Negócio Customizáveis:** O sistema está preparado para implementar diferentes regras, como o aumento de vendas em fins de semana, dependendo das necessidades da empresa.

## Estrutura do Banco de Dados

O banco de dados está estruturado com as seguintes tabelas principais:
- **Produtos:** Armazena os dados dos produtos vendidos.
- **Clientes:** Armazena os dados dos clientes da empresa.
- **Configuração do Sistema:** Define as regras de operação do sistema, como dias úteis e ajustes de preços no fim de semana.
- **Vendas:** Tabela onde as vendas diárias são registradas e armazenadas.
  
## Processos de Fechamento Diário

- As vendas podem ser registradas e modificadas ao longo do dia.
- No final do expediente, o fechamento diário é executado via uma procedure, consolidando todas as vendas do dia.
- Se o sistema estiver configurado para operar em todos os dias e for um fim de semana, o valor das vendas é automaticamente aumentado em 50%.

## Como Configurar e Utilizar

1. **Instalação do SQL Server:** Certifique-se de ter um servidor SQL Server rodando em sua máquina.
2. **Scripts de Criação:** Utilize os scripts SQL fornecidos no repositório para criar as tabelas, procedures e dados de exemplo.
3. **Configuração do Sistema:** Defina as preferências de operação na tabela de configuração (dias úteis ou todos os dias).
4. **Simulação de Vendas:** Registre as vendas diárias na tabela de vendas.
5. **Fechamento:** Execute a procedure de fechamento ao final do dia para consolidar as vendas.

## Próximos Passos

- Implementar novas regras de negócios baseadas nas necessidades específicas de uma empresa.
- Automatizar o processo de fechamento e envio de relatórios diários.
- Expandir o sistema para lidar com múltiplos pontos de venda simultaneamente.
