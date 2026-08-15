---
type: Entität
title: REZ_ABRECH
description: Erzeugte Abrechnungen der Rezeptabrechnung — ein Datensatz je Abrechnung; am 2026-08-14 (11:47) von 6 auf 19 Felder erweitert um Zeitraum-, Versand- und Storno-Angaben.
tags: [tabelle, rezeptabrechnung, plugin]
timestamp: 2026-08-14
---

Tabelle `dbo.REZ_ABRECH` — enthält die erzeugten Abrechnungen. Für jede Abrechnung
wird ein eigener Datensatz mit eindeutiger `Abrechnungsid` angelegt. Seit dem
Export vom 2026-08-14 (11:47) deutlich erweitert: neben Kunden-/Krankenkassenbezug
jetzt auch Zeitraum, Positions-/Rezeptzähler, Rechnungsbetrag sowie Versand- und
Storno-Angaben — die Tabelle bildet damit einen vollständigen Abrechnungslauf ab,
nicht mehr nur einen Grunddatensatz.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Abrechnungsid` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Abrechnungsid | uniqueidentifier | no | PK; Default vermutlich `newid()` |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Kunde, für den abgerechnet wurde (registriert) |
| Kundennrkk | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Krankenkasse (registriert). Bestätigt, dass Krankenkassen als eigene `KUNDE`-Datensätze geführt werden; [REZ](<REZ.md>).`Kundennrkk` hat seit 2026-08-15 dieselbe Relation |
| Datum | datetime | yes | Erstellungsdatum der Abrechnung |
| Userid | nvarchar(3) | yes | Benutzer-ID des Erstellers |
| Abrechnungsstelle | — | yes | **Typ von der Registry nicht ermittelbar** (zeigt „—"); vermutlich Altfeld, abgelöst durch `Abrechnungsstelleid` |
| Nummer | int | yes | Laufende Nummer der Abrechnung |
| Abrechnungsstelleid | uniqueidentifier | yes | FK auf [REZ_ABRECHNUNGSSTELLE](<REZ_ABRECHNUNGSSTELLE.md>).`Id` (seit 2026-08-15 registriert) |
| Zeitraumvon | date | yes | Beginn des Abrechnungszeitraums |
| Zeitraumbis | date | yes | Ende des Abrechnungszeitraums |
| Anzahlrezepte | int | yes | Anzahl der in dieser Abrechnung enthaltenen Rezepte |
| Anzahlpositionen | int | yes | Anzahl der enthaltenen Rezeptpositionen |
| Betrag | money | yes | Abrechnungsbetrag gesamt |
| Dateiname | nvarchar(200) | yes | Name der erzeugten Abrechnungsdatei |
| Versanddatum | datetime | yes | Datum des Versands an die Abrechnungsstelle |
| Versandempfaenger | nvarchar(200) | yes | Empfänger des Versands |
| Stornodatum | datetime | yes | Datum einer Stornierung |
| Stornogrund | nvarchar(200) | yes | Grund der Stornierung |
| Stornouserid | nvarchar(3) | yes | Benutzer-ID, der storniert hat |

**Auffällig:** `Abrechnungsstelle` (Alt) und `Abrechnungsstelleid` (neu) existieren
parallel. Vermutlich Migration von einem freien Textfeld zu einem FK auf die neue
Code-Tabelle [REZ_ABRECHNUNGSSTELLE](<REZ_ABRECHNUNGSSTELLE.md>) — der neue
Verweis ist seit 2026-08-15 auch als DAB-Relation registriert (siehe unten).

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_ABRECH_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |
| REZ_ABRECH_KUNDE_Kundennrkk | one | [KUNDE](<KUNDE.md>) | `Kundennrkk : Kundennr` |
| REZ_ABRECH_REZ_ABRECHNUNGSSTELLE_Abrechnungsstelleid | one | [REZ_ABRECHNUNGSSTELLE](<REZ_ABRECHNUNGSSTELLE.md>) | `Abrechnungsstelleid : Id` |

Die ersten beiden seit dem Registry-Export vom 2026-08-14 (10:46), die dritte
seit dem Export vom 2026-08-15 (15:41) registriert.

[REZ_POS](<REZ_POS.md>) referenziert diese Tabelle über die registrierte Relation
`REZ_POS_REZ_ABRECH_Abrechnungsid` (`Abrechnungsid : Abrechnungsid`).
[REZ_ABRECH_POS](<REZ_ABRECH_POS.md>) referenziert diese Tabelle ebenfalls —
seit 2026-08-15 durchgehend korrekt als `Abrechnungsid` geschrieben, die
vorherige Tippfehler-Inkonsistenz (`Abrechungsid`) ist behoben.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
