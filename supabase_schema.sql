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

create table if not exists public.crm_users (
  id uuid primary key default gen_random_uuid(),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  login text not null unique,
  name text not null,
  role text not null default 'operador',
  permissions text[] not null default array['fila']::text[],
  active boolean not null default true
);

alter table public.crm_users enable row level security;

create policy "crm_users_select_authenticated"
  on public.crm_users for select
  using (auth.role() = 'authenticated');

create policy "crm_users_admin_write"
  on public.crm_users for all
  using (
    exists (
      select 1
      from public.crm_users admin_user
      where admin_user.login = auth.jwt() ->> 'email'
        and admin_user.role = 'admin'
        and admin_user.active = true
    )
  )
  with check (
    exists (
      select 1
      from public.crm_users admin_user
      where admin_user.login = auth.jwt() ->> 'email'
        and admin_user.role = 'admin'
        and admin_user.active = true
    )
  );
