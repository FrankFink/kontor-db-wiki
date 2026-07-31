---
type: Entität
title: ARTIK_WG2
description: Warengruppe Ebene 2 — Codetabelle für ARTIK.Wg2, mit Rückverweis auf Ebene 1.
tags: [tabelle, artikel, warengruppe, lookup]
timestamp: 2026-07-31
---

Tabelle `dbo.ARTIK_WG2` — Codetabelle für die **Warengruppen Ebene 2** des
Artikelstamms. Ein Datensatz pro Warengruppencode; `RefWg1` verweist auf die
zugehörige Warengruppe der Ebene 1.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Wg2` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Wg2 | nvarchar(15) | no | Warengruppencode Ebene 2, PK |
| Bez | nvarchar(200) | yes | Bezeichnung |
| RefWg1 | nvarchar(15) | yes | Verweist fachlich auf [ARTIK_WG1](<ARTIK_WG1.md>).`Wg1` |
| Steuerung | nvarchar(200) | yes | Steuerparameter, Bedeutung ungeklärt |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.
Der Verweis über `RefWg1` auf [ARTIK_WG1](<ARTIK_WG1.md>) ist fachlich vorhanden, aber
nicht als DAB-Relation registriert.

[ARTIK](<ARTIK.md>) verweist eingehend über `Wg2 : Wg2` hierher (Relation
`ARTIK_ARTIK_WG2_Wg2`).

# Citations

- `../../raw/dab_registry.md`
