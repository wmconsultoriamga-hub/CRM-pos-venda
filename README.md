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
- Tela de login para operador
- Login exigido sempre que abrir ou recarregar o CRM
- Area Admin para cadastrar usuarios, senhas e permissoes por modulo
- Integracao preparada para Supabase Auth + tabela `tickets`
- Schema preparado para tabela `crm_users`

## Como publicar no Vercel

1. Acesse o Vercel.
2. Clique em **Add New > Project**.
3. Importe este repositorio do GitHub.
4. Framework: **Other** ou **Static**.
5. Build command: deixe vazio.
6. Output directory: deixe vazio.
7. Clique em **Deploy**.

## Observacao importante

Sem configurar Supabase, os dados ficam salvos no navegador de quem usa o CRM. Isso permite operar e testar o fluxo, mas ainda nao e banco compartilhado entre operadores.

Logins locais provisórios para teste:

- `admin` / `wm2026`
- `suporte` / `suporte2026`
- `financeiro` / `financeiro2026`

Esses logins locais nao sao seguranca real, porque o app ainda e HTML estatico. Para operacao com dados reais, use Supabase Auth.

O usuario `admin` consegue abrir o menu **Admin > Usuarios e permissoes** para criar operadores locais e limitar acesso por area.

## Como conectar Supabase

1. Crie um projeto no Supabase.
2. Rode o SQL de `supabase_schema.sql` no SQL Editor.
3. Em Authentication, crie os usuarios dos operadores com email e senha.
4. No `index.html`, preencha:

```js
const SUPABASE_URL = 'https://SEU-PROJETO.supabase.co';
const SUPABASE_ANON_KEY = 'SUA_ANON_KEY';
```

Depois disso, o login passa a usar Supabase Auth e os tickets passam a sincronizar na tabela `tickets`.

## Proxima fase

Transformar em app multiusuario com:

- Next.js
- API de backend para o agente criar tickets sem expor chave sensivel
- API para o agente de WhatsApp criar tickets
- Historico de atendimento
