---
type: Entität
title: CRM_LEAD
description: Lead-/Interessentendatensatz im CRM; am 2026-08-14 stark verschlankt — mehrere zuvor dokumentierte Felder existieren nicht mehr in der Registry.
tags: [tabelle, crm, lead, vertrieb]
timestamp: 2026-08-14
---

Tabelle `dbo.CRM_LEAD` — ein Datensatz je Lead/Interessent: Kontaktdaten,
Klassifizierung und Statusfelder.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

**Schema-Historie:** Am 2026-08-14 ist die Tabelle von 33 auf 20 Felder
geschrumpft. Entfallen sind u. a. `Adressid`/`Ansprechid` (die vermuteten
FK-Kandidaten auf [ADRESSEN](<ADRESSEN.md>)), `Kampid`, `Finished`, `Ergebnis`,
`Label`, `Branche`, `Webshop`, `Geodata` sowie alle Aktions-/Wiedervorlagefelder
(`Aktionen`, `AktionAktiv`, `AktionLastdate`, `AktionNextdate`, `Prio`). Neu
hinzugekommen ist `Str`. Ob die Felder aus der Tabelle selbst entfernt wurden oder
nur nicht mehr über den API Service registriert sind, ist aus der Registry allein
nicht ersichtlich.

# Schema

**Primärschlüssel:** `Leadid` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Leadid | uniqueidentifier | no | PK |
| Datum | datetime | yes | |
| Userid | nvarchar(3) | yes | Kürzel des zuständigen Benutzers |
| Bez | nvarchar(200) | yes | Bezeichnung/Firmenname |
| FinishedTime | datetime | yes | |
| Statusinfo | nvarchar(100) | yes | |
| Metadata | nvarchar | yes | Vermutlich JSON |
| Kurzprofil | nvarchar | yes | Vermutlich generiertes Kurzprofil (z. B. KI-gestützt, siehe [CRM_PROMPT_TEMPLATE](<CRM_PROMPT_TEMPLATE.md>)) |
| Quelle | nvarchar(50) | yes | Herkunft des Leads |
| Url | nvarchar(500) | yes | |
| Ansprechpartner | nvarchar(100) | yes | Freitext-Name |
| Emails | nvarchar(500) | yes | |
| Plz | nvarchar(10) | yes | |
| Bundesland | nvarchar(25) | yes | |
| Landcode | nvarchar(3) | yes | |
| Ort | nvarchar(50) | yes | |
| KlassifizierungAbc | nvarchar(3) | yes | ABC-Klassifizierung |
| Bemerkungen | nvarchar | yes | |
| Leadstatus | nvarchar(25) | yes | |
| Str | nvarchar(50) | yes | Straße (neu seit 2026-08-14) |

**Ungeklärt:** Zieltabelle eines Kampagnenbezugs ist mit dem Wegfall von `Kampid`
hinfällig geworden; ob Adress-/Ansprechpartnerdaten jetzt ausschließlich als
Freitext (`Ansprechpartner`, `Str`, `Plz`, `Ort`, …) statt über FK geführt werden.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert.

[CRM_ACTIVITIES](<CRM_ACTIVITIES.md>) referenziert vermutlich Leads über die
polymorphe Verknüpfung `ParentType`/`ParentId`.

# Citations

- `../../raw/dab_registry.md`
