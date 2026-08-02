---
type: Entität
title: WFLOW_FOLDERS
description: Ordner zur Strukturierung und Gruppierung von Aufgaben aus WFLOW.
tags: [tabelle, aufgabenverwaltung, workflow, lookup]
timestamp: 2026-08-02
---

Tabelle `dbo.WFLOW_FOLDERS` — Ordner, über die Aufgaben aus [WFLOW](<WFLOW.md>)
strukturiert und gruppiert werden.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Folder` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Folder | nvarchar(15) | no | Ordnerkürzel, PK |
| Foldername | nvarchar(50) | yes | Anzeigename |
| Beschreibung | nvarchar(200) | yes | |
| Icon | nvarchar(50) | yes | |
| Sortorder | nvarchar(5) | yes | |
| Displaygroup | nvarchar(5) | yes | Bedeutung ungeklärt |

# Beziehungen

In der Registry sind an dieser Tabelle **keine ausgehenden Beziehungen** deklariert.

[WFLOW](<WFLOW.md>) referenziert diese Tabelle über die registrierte Relation
`WFLOW_WFLOW_FOLDERS_Folder` (`Folder : Folder`).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Tabellen der Aufgabenverwaltung W.md`
