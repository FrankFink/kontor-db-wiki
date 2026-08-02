---
type: Entität
title: WFLOW_INVOICINGUNIT
description: Code-Tabelle für Abrechnungseinheiten-Arten; die eigentlichen Abrechnungsdaten liegen in WFLOW.
tags: [tabelle, aufgabenverwaltung, workflow, abrechnung, lookup]
timestamp: 2026-08-02
---

Tabelle `dbo.WFLOW_INVOICINGUNIT` — Code-Tabelle für die **Art** der
Abrechnungseinheit (z. B. Stunden, Pauschale). Sie hält nur Code und Bezeichnung;
Abrechnungsdatum, Anzahl und die konkrete Art-Zuordnung einer Aufgabe liegen in
[WFLOW](<WFLOW.md>) selbst (`FinishedTime`, `InvoicingUnitCount`, `Invoicingunit`).

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Unit` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Unit | nvarchar(15) | no | Code der Abrechnungseinheit, PK |
| Name | nvarchar(50) | yes | Bezeichnung |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[WFLOW](<WFLOW.md>) referenziert diese Tabelle über die registrierte Relation
`WFLOW_WFLOW_INVOICINGUNIT_Invoicingunit` (`Invoicingunit : Unit`).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Tabellen der Aufgabenverwaltung W.md`
