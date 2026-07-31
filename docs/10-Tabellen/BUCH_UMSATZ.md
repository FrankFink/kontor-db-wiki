---
type: Entität
title: BUCH_UMSATZ
description: Umsatzbuchungen — je Belegposition ein Datensatz mit Bezug auf Artikel, Kunde, Beleg und Bearbeiter.
tags: [tabelle, umsatz, bewegungsdaten]
timestamp: 2026-07-30
---

Tabelle `dbo.BUCH_UMSATZ` — Bewegungsdaten: eine Zeile je gebuchter Belegposition mit
Bezug auf Artikel, Kunde, Beleg, Bearbeiter, Lager, Vertreter sowie Preis- und
Rohertragsangaben.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | technischer PK |
| Belegid | uniqueidentifier | yes | Beleg-Klammer |
| Belegnr | bigint | yes | Belegnummer |
| Posguid | uniqueidentifier | yes | Positions-GUID innerhalb des Belegs |
| Datum | datetime | yes | Buchungsdatum |
| Auftrnr | nvarchar(15) | yes | zugehörige Auftragsnummer |
| Bearbeiter | nvarchar(3) | yes | Kürzel des Bearbeiters |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>) |
| Artnr | nvarchar(15) | yes | FK auf [ARTIK](<ARTIK.md>) |
| Lager | bigint | yes | Lagernummer |
| Gesamtpreis | money | yes | |
| Rohertrag | money | yes | |
| Vertreter | nvarchar(15) | yes | Verweist fachlich auf [VERTR](<VERTR.md>).`Vertrnr` (nicht als DAB-Relation deklariert) |

**Anmerkung:** Die Anmerkungsspalte enthält Interpretationen aus den Feldnamen und ist
zu bestätigen. Die fachliche Zuordnung Position → Beleg läuft vermutlich über
`Belegid` + `Posguid`; `Id` ist der technische Datensatzschlüssel.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| BUCH_UMSATZ_ARTIK_Artnr | one | [ARTIK](<ARTIK.md>) | `Artnr : Artnr` |
| BUCH_UMSATZ_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |

# Citations

- `../../raw/dab_registry.md`
