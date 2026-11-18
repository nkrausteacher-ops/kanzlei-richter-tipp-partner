# Richter Tipp & Partner – Schülerantworten und Lehrer-Dashboard

## GitHub-Upload
Nur `index.html` hochladen, wenn die bisherigen drei Dateien (`lisa-fuchs.jpg`, `arbeitsblatt-pension-adler.pdf`, `merkblatt-versorgungsbezuege.pdf`) bereits im gleichen Repository-Ordner liegen. Sonst die vier Website-Dateien hochladen. Die SQL-Datei NICHT bei GitHub hochladen.

## Einmalige Supabase-Einrichtung
1. Supabase → SQL Editor → New query.
2. Inhalt von `supabase_lehrerzugriff_fix.sql` einfügen → Run.
3. Danach die neue `index.html` bei GitHub hochladen und Commit changes.
4. Auf der Homepage: Posteingang → Nachricht lesen / antworten → Testnachricht absenden.
5. Lehrer-Dashboard → mit dem zuvor angelegten Lehreraccount anmelden → Aktualisieren.

## Wichtige Hinweise
- Die Project URL wurde aus der mitgeteilten REST-URL auf `https://cyzomvlvpyqbezfxwwjh.supabase.co` korrigiert.
- Der Publishable Key ist öffentlich und darf im Browser stehen. Niemals einen Secret- oder Service-Role-Key in HTML verwenden.
- Schüler brauchen zum Senden kein Konto. Deshalb kann die Identität nicht verifiziert werden; Schüler könnten einen fremden Namen angeben.
- Das Lehrer-Dashboard liest Nachrichten, markiert sie als erledigt und aktualisiert die Liste. Es sendet noch keine Rückantwort an Schüler.
- Daten sind serverseitig in Supabase gespeichert; Fristenkontrollbuch und ESt-Eingaben bleiben lokal im Browser.
- Vor Nutzung mit echten Schülernamen schulischen Datenschutz prüfen (AV-Vertrag, Zugriffsberechtigungen, Aufbewahrungsdauer, ggf. Einwilligungen/Schulvorgaben).
- Für öffentliche produktive Nutzung zusätzlich Bot-/Spam-Schutz und Rate-Limits einrichten.
