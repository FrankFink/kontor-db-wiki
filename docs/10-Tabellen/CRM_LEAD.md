---
type: Entität
title: CRM_LEAD
description: Lead-/Interessentendatensatz im CRM mit Firmen-, Ansprechpartner-, Klassifizierungs- und Wiedervorlagedaten.
tags: [tabelle, crm, lead, vertrieb]
timestamp: 2026-08-01
---

Tabelle `dbo.CRM_LEAD` — ein Datensatz je Lead/Interessent: Firmen- und
Ansprechpartnerdaten, Kampagnenbezug, Klassifizierung und Aktions-/Wiedervorlagefelder.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Leadid` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Leadid | uniqueidentifier | no | PK |
| Datum | datetime | yes | |
| Userid | nvarchar(3) | yes | Kürzel des zuständigen Benutzers |
| Bez | nvarchar(200) | yes | Bezeichnung/Firmenname |
| Adressid | uniqueidentifier | yes | Vermutlich Verweis auf [ADRESSEN](<ADRESSEN.md>).`Id` |
| Ansprechid | uniqueidentifier | yes | Vermutlich Verweis auf [ADRESSEN](<ADRESSEN.md>).`Id` (Ansprechpartner-Datensatz) |
| Kampid | uniqueidentifier | yes | Kampagnenbezug; Zieltabelle noch nicht dokumentiert |
| Finished | bit | yes | |
| FinishedTime | datetime | yes | |
| Statusinfo | nvarchar(100) | yes | |
| Ergebnis | nvarchar(5) | yes | Ergebniscode |
| Label | nvarchar | yes | |
| Branche | nvarchar(50) | yes | |
| Webshop | nvarchar(50) | yes | |
| Metadata | nvarchar | yes | Vermutlich JSON |
| Kurzprofil | nvarchar | yes | Vermutlich generiertes Kurzprofil (z. B. KI-gestützt, siehe [CRM_PROMPT_TEMPLATE](<CRM_PROMPT_TEMPLATE.md>)) |
| Quelle | nvarchar(50) | yes | Herkunft des Leads |
| Url | nvarchar(500) | yes | |
| Ansprechpartner | nvarchar(100) | yes | Freitext-Name; Verhältnis zu `Ansprechid` ungeklärt |
| Emails | nvarchar(500) | yes | |
| Geodata | nvarchar(50) | yes | |
| Plz | nvarchar(10) | yes | |
| Bundesland | nvarchar(25) | yes | |
| Landcode | nvarchar(3) | yes | |
| Ort | nvarchar(50) | yes | |
| KlassifizierungAbc | nvarchar(3) | yes | ABC-Klassifizierung |
| Aktionen | int | yes | Anzahl/Zähler von Aktionen |
| Bemerkungen | nvarchar | yes | |
| AktionAktiv | bit | yes | |
| AktionLastdate | datetime | yes | |
| AktionNextdate | datetime | yes | Wiedervorlagedatum |
| Prio | bit | yes | Priorisierungsflag |
| Leadstatus | nvarchar(25) | yes | |

**Ungeklärt:** ob `Ansprechpartner` (Freitext) und `Ansprechid` (FK-Kandidat) denselben
Ansprechpartner redundant halten oder unterschiedliche Zwecke haben; Zieltabelle von
`Kampid`.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert — auch nicht
die naheliegenden Verweise `Adressid`/`Ansprechid` → [ADRESSEN](<ADRESSEN.md>).

[CRM_ACTIVITIES](<CRM_ACTIVITIES.md>) referenziert vermutlich Leads über die
polymorphe Verknüpfung `ParentType`/`ParentId`.

# Citations

- `../../raw/dab_registry.md`
