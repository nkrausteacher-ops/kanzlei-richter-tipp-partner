-- Einmalig im Supabase SQL Editor ausführen.
-- Ergänzt die bereits eingerichteten Tabellen und Richtlinien.
-- Wichtig: nur mit fiktiven Unterrichtsdaten testen.

create or replace function public.kanzlei_ist_lehrkraft()
returns boolean
language sql
stable
security definer
set search_path = ''
as $$
  select exists (
    select 1 from public.kanzlei_lehrkraefte l
    where l.user_id = (select auth.uid())
  );
$$;

revoke all on function public.kanzlei_ist_lehrkraft() from public;
grant execute on function public.kanzlei_ist_lehrkraft() to authenticated;

-- Alte Richtlinien ersetzen, da eine direkte Unterabfrage auf
-- kanzlei_lehrkraefte ohne SELECT-Berechtigung fehlschlagen kann.
drop policy if exists "Lehrkraefte lesen Nachrichten" on public.kanzlei_nachrichten;
drop policy if exists "Lehrkraefte bearbeiten Nachrichten" on public.kanzlei_nachrichten;

create policy "Lehrkraefte lesen Nachrichten"
on public.kanzlei_nachrichten for select to authenticated
using ((select public.kanzlei_ist_lehrkraft()));

create policy "Lehrkraefte bearbeiten Nachrichten"
on public.kanzlei_nachrichten for update to authenticated
using ((select public.kanzlei_ist_lehrkraft()))
with check ((select public.kanzlei_ist_lehrkraft()));

-- Die anonymen Nutzer dürfen keine Nachrichten lesen, ändern oder löschen.
revoke select, update, delete on public.kanzlei_nachrichten from anon;
grant insert on public.kanzlei_nachrichten to anon;
grant select, update on public.kanzlei_nachrichten to authenticated;
