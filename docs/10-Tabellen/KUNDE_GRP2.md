---
type: Entität
title: KUNDE_GRP2
description: Kundengruppe Ebene 2 — Codetabelle für KUNDE.Grp2, unabhängig von KUNDE_GRP1.
tags: [tabelle, kunde, gruppe, lookup]
timestamp: 2026-07-31
---

Tabelle `dbo.KUNDE_GRP2` — Codetabelle für die **Kundengruppen Ebene 2**. Ein
Datensatz pro Gruppencode. Ohne Rückverweis auf Ebene 1, also eine eigenständige
Klassifikation (siehe Anmerkung in [KUNDE_GRP1](<KUNDE_GRP1.md>)).

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Grp2` (`nvarchar(9)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Grp2 | nvarchar(9) | no | Gruppencode, PK |
| Bez | nvarchar(40) | yes | Bezeichnung |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[KUNDE](<KUNDE.md>) verweist eingehend über `Grp2 : Grp2` hierher (Relation
`KUNDE_KUNDE_GRP2_Grp2`).

# Citations

- `../../raw/dab_registry.md`
