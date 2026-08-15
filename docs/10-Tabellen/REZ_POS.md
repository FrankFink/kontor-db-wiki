---
type: Entität
title: REZ_POS
description: Erfassungstabelle einzelner Rezeptpositionen inkl. Preiskalkulation (Taxierung); über Rezeptid zu einem Rezept zusammengefasst, über Abrechnungsid einer Abrechnung zugeordnet.
tags: [tabelle, rezeptabrechnung, plugin]
timestamp: 2026-08-14
---

Tabelle `dbo.REZ_POS` — Erfassungstabelle für einzelne Positionen, die ein Kunde
erhalten hat. Auch wenn mehrere Positionen auf einem Rezept zusammengefasst werden
können, wird jede Bestellposition separat gespeichert; die `Rezeptid` führt sie
zusammen. Seit dem Export vom 2026-08-14 (11:47) um zehn Preiskalkulationsfelder
erweitert (15 → 25 Felder) — die Tabelle trägt jetzt die vollständige Taxierung
(Preisberechnung) je Position, nicht nur die Erfassung.

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
| Abrechnungsid | uniqueidentifier | yes | FK auf [REZ_ABRECH](<REZ_ABRECH.md>).`Abrechnungsid` (registriert) — gesetzt, sobald die Position abgerechnet wurde. Feldname seit 11:47 korrekt geschrieben (zuvor `Abrechungsid` ohne „n") |
| Stornodatum | datetime | yes | Datum der Stornierung |
| Stornogrund | nvarchar(50) | yes | Vom Benutzer eingegebener Storno-Grund |
| Rezeptbez | nvarchar(100) | yes | Bezeichnung der Position für den Rezeptdruck; vgl. [ARTIK](<ARTIK.md>).`Rezeptbez1`/`Rezeptbez2` |
| Preisbasis | nvarchar(15) | yes | Vermutlich Kennzeichen der Preisberechnungsgrundlage |
| Preisstichtag | date | yes | Stichtag, zu dem der Preis ermittelt wurde |
| Basispreis | money | yes | Ausgangspreis vor Faktor/Zuschlag |
| Faktor | decimal | yes | Preisfaktor; vgl. [ARTIK](<ARTIK.md>).`Abda_preisfaktor` |
| Zuschlag | money | yes | Zuschlag auf den Basispreis |
| Einzelpreis | money | yes | Berechneter Preis je Einheit |
| Gesamtpreis | money | yes | Berechneter Gesamtpreis der Position |
| Preisregelid | uniqueidentifier | yes | Vermutlich Verweis auf eine (noch nicht dokumentierte) Preisregel-Tabelle |
| Taxdatum | datetime | yes | Vermutlich Zeitpunkt der Taxierung (Preisberechnung), Fachbegriff aus der Apothekenabrechnung |

**Ungeklärt:** genaues Zusammenspiel von `Preisbasis`, `Basispreis`, `Faktor`,
`Zuschlag`, `Einzelpreis`, `Gesamtpreis` (Berechnungsreihenfolge); Zieltabelle von
`Preisregelid`.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_POS_ARTIK_Artnr | one | [ARTIK](<ARTIK.md>) | `Artnr : Artnr` |
| REZ_POS_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |
| REZ_POS_REZ_Rezeptid | one | [REZ](<REZ.md>) | `Rezeptid : Rezeptid` |
| REZ_POS_REZ_ABRECH_Abrechnungsid | one | [REZ_ABRECH](<REZ_ABRECH.md>) | `Abrechnungsid : Abrechnungsid` |

Alle vier seit dem Registry-Export vom 2026-08-14 (10:46) registriert; der Name
der letzten Relation wurde seit 11:47 korrekt geschrieben (zuvor
`REZ_POS_REZ_ABRECH_Abrechungsid`). `Lanr`/`Bsnr`/die neuen Preisfelder bleiben
ohne eigene Relation.

[REZ_ABRECH_POS](<REZ_ABRECH_POS.md>).`Posguid` zeigt fachlich auf `Id` dieser
Tabelle, ist aber im aktuellen Export (11:47) **nicht** als Relation registriert
(schwankte bereits zwischen den Exporten desselben Tages, siehe dort).

Siehe [REZ](<REZ.md>) für die Gesamtübersicht der Rezeptabrechnungs-Domäne.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
