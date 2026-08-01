---
type: Entität
title: CRM_LEAD_CONFIG
description: Konfigurationsprofile für die Lead-Verarbeitung, JSON-Settings je Profil.
tags: [tabelle, crm, lead, konfiguration]
timestamp: 2026-08-01
---

Tabelle `dbo.CRM_LEAD_CONFIG` — ein Konfigurationsdatensatz je Profil, mit den
Einstellungen als JSON in `SettingsJson`.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Profile` (`nvarchar(15)`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Profile | nvarchar(15) | no | Profilname, PK |
| SettingsJson | nvarchar | yes | Konfiguration als JSON |

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert.
`Profile` ist vermutlich der fachliche Verweisschlüssel zu
[CRM_PROMPT_TEMPLATE](<CRM_PROMPT_TEMPLATE.md>).`Profile`.

# Citations

- `../../raw/dab_registry.md`
