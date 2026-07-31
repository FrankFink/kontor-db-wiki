---
type: Entität
title: KUNDE_GRP1
description: Kundengruppe Ebene 1 — Codetabelle für KUNDE.Grp1.
tags: [tabelle, kunde, gruppe, lookup]
timestamp: 2026-07-31
---

Tabelle `dbo.KUNDE_GRP1` — Codetabelle für die **Kundengruppen Ebene 1**. Ein
Datensatz pro Gruppencode.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Grp1` (`nvarchar(3)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Grp1 | nvarchar(3) | no | Gruppencode, PK |
| Bez | nvarchar(40) | yes | Bezeichnung |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[KUNDE](<KUNDE.md>) verweist eingehend über `Grp1 : Grp1` hierher (Relation
`KUNDE_KUNDE_GRP1_Grp1`).

# Anmerkung

Auffällig: Es gibt keine Hierarchie zwischen `KUNDE_GRP1` und [KUNDE_GRP2](<KUNDE_GRP2.md>).
Anders als bei den Warengruppen ([ARTIK_WG2](<ARTIK_WG2.md>) enthält `RefWg1`) sind die
beiden Kundengruppenebenen offenbar zwei **unabhängige Klassifikationen**.

# Citations

- `../../raw/dab_registry.md`
