# Deploy - CRM Pos-Venda WM Energia Solar

## Objetivo

Colocar o CRM de pos-venda no ar e depois conectar com o agente de WhatsApp.

## Fase 1 - Demo online rapida

Essa fase serve para validar visual e fluxo com a equipe.

### Opcao recomendada

Subir o HTML atual no Vercel como site estatico.

Arquivo:

`crm-pos-venda-wm.html`

Passos:

1. Criar um repositorio no GitHub, exemplo: `wm-crm-pos-venda`.
2. Colocar o arquivo `crm-pos-venda-wm.html` como `index.html`.
3. Entrar no Vercel.
4. Importar o repositorio do GitHub.
5. Deploy sem framework, como projeto estatico.
6. Abrir a URL gerada pelo Vercel e testar no celular/computador.

Resultado:

- CRM visual no ar.
- Ainda sem login, banco ou integracao real.
- Bom para aprovar layout e fluxo.

## Fase 2 - MVP funcional

Essa fase transforma o painel em sistema real.

### Stack recomendada

- Frontend: Next.js
- Deploy: Vercel
- Banco: Supabase Postgres
- Autenticacao: Supabase Auth ou login simples por senha no MVP
- API WhatsApp/agente: OpenClaw ou gateway conectado ao numero de teste

### Estrutura de banco

Tabela: `tickets`

Campos:

- `id`
- `created_at`
- `updated_at`
- `status`
- `priority`
- `customer_name`
- `phone`
- `city`
- `state`
- `document_masked`
- `system_power`
- `panels`
- `inverter`
- `roof_type`
- `subject`
- `customer_message`
- `ai_summary`
- `next_action`
- `assigned_to`
- `evidence_urls`
- `whatsapp_chat_id`

Tabela: `ticket_events`

Campos:

- `id`
- `ticket_id`
- `created_at`
- `type`
- `message`
- `author`

## Fluxo com WhatsApp

1. Cliente chama no numero de teste.
2. Agente IA atende e consulta a planilha.
3. Se resolver sozinho, finaliza.
4. Se precisar humano, cria ticket no CRM.
5. Operador abre o CRM, ve resumo e clica em abrir WhatsApp.
6. Operador assume a conversa.
7. Operador muda status no CRM ate resolver.

## Endpoints necessarios

### Criar ticket

`POST /api/tickets`

Payload:

```json
{
  "customer_name": "Ronaldo Pereira da Silva",
  "phone": "44999187937",
  "city": "Sarandi",
  "state": "PR",
  "document_masked": "***9865",
  "system_power": "5,85 kWp",
  "panels": "10",
  "inverter": "Sofar 5kW monofasico 220V",
  "roof_type": "Fibrocimento",
  "subject": "Aplicativo / internet",
  "customer_message": "Mudei minha internet e nao tenho acesso ao app.",
  "ai_summary": "Cliente mudou internet e precisa reconectar inversor ao Wi-Fi.",
  "next_action": "Suporte orientar reconexao segura.",
  "priority": "alta",
  "whatsapp_chat_id": ""
}
```

### Listar tickets

`GET /api/tickets?status=novo`

### Atualizar ticket

`PATCH /api/tickets/:id`

Payload:

```json
{
  "status": "em_atendimento",
  "assigned_to": "Operador"
}
```

## Regras de seguranca

- Nao salvar senha de cliente no CRM.
- Nao mostrar CPF/CNPJ completo.
- Nao expor planilha inteira no frontend.
- Toda consulta de cliente deve passar pela API.
- O operador pode ver apenas dados necessarios para atendimento.

## Caminho recomendado

1. Subir demo estatica no Vercel.
2. Aprovar visual e campos.
3. Criar projeto Next.js.
4. Criar Supabase.
5. Implementar tabela `tickets`.
6. Conectar bot para criar ticket.
7. Testar com numero de WhatsApp de teste.
8. Depois decidir se entra em producao.

## Decisao pendente

Para eu montar a versao funcional, precisamos definir:

1. Nome do projeto/repositorio.
2. Se vamos usar Supabase.
3. Quem tera acesso ao CRM.
4. Qual numero de WhatsApp sera usado no teste.
5. Se o operador continua pelo WhatsApp Web ou se teremos botao direto para abrir conversa.

