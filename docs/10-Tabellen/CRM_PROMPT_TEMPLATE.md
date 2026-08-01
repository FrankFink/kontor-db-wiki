---
type: Entität
title: CRM_PROMPT_TEMPLATE
description: Vorlagen für (vermutlich KI-gestützte) Prompts im CRM, je Profil zuordenbar.
tags: [tabelle, crm, prompt, ki]
timestamp: 2026-08-01
---

Tabelle `dbo.CRM_PROMPT_TEMPLATE` — Prompt-Vorlagen, benannt und je Profil
zuordenbar. Der Name und das Zusammenspiel mit [CRM_LEAD](<CRM_LEAD.md>).`Kurzprofil`
deuten auf eine KI-gestützte Aufbereitung von Lead-Daten hin.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Name` (`nvarchar(50)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Name | nvarchar(50) | no | PK |
| Beschreibung | nvarchar(200) | yes | |
| Profile | nvarchar | yes | Vermutlich Verweis auf [CRM_LEAD_CONFIG](<CRM_LEAD_CONFIG.md>).`Profile` |

**Ungeklärt:** ob und wo der eigentliche Prompt-Text gespeichert ist — die Tabelle
enthält nur Name, Beschreibung und Profilzuordnung.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert.

# Citations

- `../../raw/dab_registry.md`
