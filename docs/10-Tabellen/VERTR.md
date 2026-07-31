---
type: Entität
title: VERTR
description: Vertreterstamm mit Provisionsschema und -satz.
tags: [tabelle, vertreter, provision, stammdaten]
timestamp: 2026-07-31
---

Tabelle `dbo.VERTR` — Vertreterstamm. Ein Datensatz pro Vertreternummer, mit
zugeordnetem Provisionsschema und Provisionssatz.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Vertrnr` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Vertrnr | nvarchar(15) | no | Vertreternummer, PK |
| Suchbegriff | nvarchar(150) | yes | |
| Provschema | nvarchar(15) | yes | Kürzel des Provisionsschemas |
| Prov | decimal | yes | Provisionssatz |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[KUNDE](<KUNDE.md>) verweist eingehend über `Vertrnr : Vertrnr` hierher (Relation
`KUNDE_VERTR_Vertrnr`).

Zusätzlich enthält [BUCH_UMSATZ](<BUCH_UMSATZ.md>) das Feld `Vertreter`, das fachlich
auf `VERTR.Vertrnr` zeigt — als DAB-Relation ist das nicht deklariert.

# Citations

- `../../raw/dab_registry.md`
