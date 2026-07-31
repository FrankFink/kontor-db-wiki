---
type: Entität
title: ARTIK_WG1
description: Warengruppe Ebene 1 — Codetabelle für ARTIK.Wg1.
tags: [tabelle, artikel, warengruppe, lookup]
timestamp: 2026-07-31
---

Tabelle `dbo.ARTIK_WG1` — Codetabelle für die **Warengruppen Ebene 1** des
Artikelstamms. Ein Datensatz pro Warengruppencode.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Wg1` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Wg1 | nvarchar(15) | no | Warengruppencode, PK |
| Bez | nvarchar(100) | yes | Bezeichnung |
| Steuerung | nvarchar(200) | yes | Steuerparameter, Bedeutung ungeklärt |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[ARTIK](<ARTIK.md>) verweist eingehend über `Wg1 : Wg1` hierher (Relation
`ARTIK_ARTIK_WG1_Wg1`); [ARTIK_WG2](<ARTIK_WG2.md>) trägt das Feld `RefWg1`, das
fachlich auf `ARTIK_WG1.Wg1` verweist — die inverse Beziehung ist in der Registry
allerdings nicht deklariert.

# Citations

- `../../raw/dab_registry.md`
