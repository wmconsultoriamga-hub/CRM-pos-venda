# CRM Pos-Venda WM Energia Solar

Versao funcional inicial do CRM de pos-venda da WM Energia Solar.

## O que tem aqui

- Painel de fila de atendimentos de pos-venda
- Cards de metricas calculados pelos tickets
- Busca por cliente, telefone, cidade, assunto e mensagem
- Filtro por status
- Criacao manual de novo atendimento
- Edicao de status, prioridade, responsavel, resumo da IA e proxima acao
- Historico resumido de eventos por atendimento
- Botao para abrir WhatsApp quando o telefone esta cadastrado
- Exportacao CSV
- Persistencia local via `localStorage` do navegador

## Como publicar no Vercel

1. Acesse o Vercel.
2. Clique em **Add New > Project**.
3. Importe este repositorio do GitHub.
4. Framework: **Other** ou **Static**.
5. Build command: deixe vazio.
6. Output directory: deixe vazio.
7. Clique em **Deploy**.

## Observacao importante

Nesta fase, os dados ficam salvos no navegador de quem usa o CRM. Isso ja permite operar e testar o fluxo, mas ainda nao e banco compartilhado entre operadores.

## Proxima fase

Transformar em app multiusuario com:

- Next.js
- Supabase/Postgres
- Login de operadores
- API para o agente de WhatsApp criar tickets
- Historico de atendimento
