create table if not exists public.tickets (
  id uuid primary key,
  created_at timestamptz not null,
  updated_at timestamptz not null,
  status text not null default 'Novo',
  priority text not null default 'Normal',
  customer_name text not null,
  phone text,
  document_masked text,
  city text,
  state text,
  system_power text,
  panels text,
  inverter text,
  roof_type text,
  sale_date text,
  subject text,
  assigned_to text,
  customer_message text,
  ai_summary text,
  next_action text,
  events jsonb not null default '[]'::jsonb
);

alter table public.tickets enable row level security;

create policy "tickets_select_authenticated"
  on public.tickets for select
  using (auth.role() = 'authenticated');

create policy "tickets_insert_authenticated"
  on public.tickets for insert
  with check (auth.role() = 'authenticated');

create policy "tickets_update_authenticated"
  on public.tickets for update
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');
