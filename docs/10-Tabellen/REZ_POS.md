---
type: Entität
title: REZ_POS
description: Erfassungstabelle einzelner Rezeptpositionen; über Rezeptid zu einem Rezept zusammengefasst, über Abrechungsid einer Abrechnung zugeordnet.
tags: [tabelle, rezeptabrechnung, plugin]
timestamp: 2026-08-14
---

Tabelle `dbo.REZ_POS` — Erfassungstabelle für einzelne Positionen, die ein Kunde
erhalten hat. Auch wenn mehrere Positionen auf einem Rezept zusammengefasst werden
können, wird jede Bestellposition separat gespeichert; die `Rezeptid` führt sie
zusammen.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK; Default vermutlich `newid()` |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` (registriert) |
| Auftrnr | nvarchar(15) | yes | Auftragsnummer der zugehörigen Bestellung |
| Pos | nvarchar(25) | yes | Positionskennung innerhalb des Auftrags |
| Auftrdatum | datetime | yes | Datum des zugehörigen Auftrags |
| Artnr | nvarchar(15) | yes | FK auf [ARTIK](<ARTIK.md>).`Artnr` (registriert) |
| Pzn | nvarchar(8) | yes | Pharmazentralnummer des Artikels |
| Menge | int | yes | |
| Mwst | decimal | yes | Mehrwertsteuer der Position |
| Rezeptid | uniqueidentifier | yes | FK auf [REZ](<REZ.md>).`Rezeptid` (registriert) — fasst alle Positionen eines Rezepts zusammen |
| Lanr | nvarchar(15) | yes | Lebenslange Arztnummer, dem Kunden bzw. Unterkonto zugeordnet |
| Bsnr | nvarchar(15) | yes | Betriebsstättennummer, dem Kunden bzw. Unterkonto zugeordnet |
| Abrechungsid | uniqueidentifier | yes | FK auf [REZ_ABRECH](<REZ_ABRECH.md>).`Abrechnungsid` (registriert) — gesetzt, sobald die Position abgerechnet wurde |
| Stornodatum | datetime | yes | Datum der Stornierung |
| Stornogrund | nvarchar(50) | yes | Vom Benutzer eingegebener Storno-Grund |

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_POS_ARTIK_Artnr | one | [ARTIK](<ARTIK.md>) | `Artnr : Artnr` |
| REZ_POS_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |
| REZ_POS_REZ_Rezeptid | one | [REZ](<REZ.md>) | `Rezeptid : Rezeptid` |
| REZ_POS_REZ_ABRECH_Abrechungsid | one | [REZ_ABRECH](<REZ_ABRECH.md>) | `Abrechungsid : Abrechnungsid` |

Alle vier seit dem Registry-Export vom 2026-08-14 (10:46) registriert — zuvor
hatte diese Tabelle keine deklarierten Beziehungen. `Lanr`/`Bsnr` bleiben ohne
eigene Relation.

[REZ_ABRECH_POS](<REZ_ABRECH_POS.md>) referenziert diese Tabelle über die
registrierte Relation `REZ_ABRECH_POS_REZ_POS_Posguid` (`Posguid : Id`).

Siehe [REZ](<REZ.md>) für die Gesamtübersicht der Rezeptabrechnungs-Domäne.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
