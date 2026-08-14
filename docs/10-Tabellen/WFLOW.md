---
type: Entität
title: WFLOW
description: Aufgaben der Nutzer (Aufgabenverwaltung), zugeordnet über ein Projekt; darüber auch dem Kunden zurechenbar.
tags: [tabelle, aufgabenverwaltung, workflow]
timestamp: 2026-08-02
---

Tabelle `dbo.WFLOW` — enthält die Aufgaben der Nutzer, inklusive Bearbeitungsstatus.
Die Zuordnung einer Aufgabe erfolgt immer über ein Projekt; das Projekt referenziert
seinerseits den betroffenen Kunden. Über die Kette Aufgabe → Projekt → Kunde lässt
sich ermitteln, auf welchen Kunden sich eine Aufgabe bezieht.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `ID` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| ID | uniqueidentifier | no | PK |
| Title | nvarchar(150) | yes | |
| Message | nvarchar(2000) | yes | |
| Receiver | nvarchar(50) | yes | Zuständiger Nutzer; Verweis auf Benutzertabelle noch nicht dokumentiert |
| CreationTime | datetime | yes | |
| RestrictionTime | datetime | yes | Bedeutung ungeklärt (Sperrfrist? Fälligkeit?) |
| IsNew | bit | yes | |
| Reference | nvarchar(200) | yes | Bedeutung ungeklärt |
| Priority | int | yes | |
| Fixtermin | bit | yes | Kennzeichnet festen Termin |
| Folder | nvarchar(15) | yes | FK auf [WFLOW_FOLDERS](<WFLOW_FOLDERS.md>).`Folder` |
| FinishedTime | datetime | yes | Abschlusszeitpunkt; dient laut Fachquelle zugleich als Abrechnungsdatum |
| Invoicingunit | nvarchar(3) | yes | FK auf [WFLOW_INVOICINGUNIT](<WFLOW_INVOICINGUNIT.md>).`Unit` — Art der Abrechnungseinheit |
| InvoicingUnitCount | decimal | yes | Anzahl der Abrechnungseinheiten |
| Projektnr | nvarchar(200) | yes | FK auf [PROJEKT](<PROJEKT.md>).`Projektnr` |
| Sender | nvarchar(50) | yes | Ersteller/Absender der Aufgabe; Verhältnis zu `Receiver` und zur (noch nicht dokumentierten) Benutzertabelle ungeklärt |
| ProcessingTime | datetime | yes | Vermutlich Zeitpunkt des Bearbeitungsbeginns |
| Wrkstate | nvarchar(5) | yes | Vermutlich der in der Fachquelle erwähnte Bearbeitungsstatus der Aufgabe |

# Zuordnung zu Projekt und Kunde

```
WFLOW.Projektnr ──▶ PROJEKT.Projektnr ──▶ PROJEKT.Kundennr ──▶ KUNDE.Kundennr
     (registriert)              (registriert)
```

Eine Aufgabe kennt keinen direkten Kundenbezug — der läuft ausschließlich über das
zugeordnete Projekt. Beide Schritte sind mittlerweile als DAB-Relation deklariert.

# Abrechnung

Die abrechnungsrelevanten Daten liegen direkt in `WFLOW`, nicht in
[WFLOW_INVOICINGUNIT](<WFLOW_INVOICINGUNIT.md>): Abrechnungsdatum = `FinishedTime`,
Anzahl = `InvoicingUnitCount`, Art = `Invoicingunit` (Verweis auf die Code-Tabelle
`WFLOW_INVOICINGUNIT`, die nur die lesbaren Bezeichnungen der Einheiten hält).

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| WFLOW_WFLOW_INVOICINGUNIT_Invoicingunit | one | [WFLOW_INVOICINGUNIT](<WFLOW_INVOICINGUNIT.md>) | `Invoicingunit : Unit` |
| WFLOW_PROJEKT_Projektnr | one | [PROJEKT](<PROJEKT.md>) | `Projektnr : Projektnr` |
| WFLOW_WFLOW_FOLDERS_Folder | one | [WFLOW_FOLDERS](<WFLOW_FOLDERS.md>) | `Folder : Folder` |

Alle drei Verweise sind inzwischen als DAB-Relation registriert (zuvor nur fachlich
vermutet).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Tabellen der Aufgabenverwaltung W.md`
