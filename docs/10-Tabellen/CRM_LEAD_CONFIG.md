---
type: Entität
title: CRM_LEAD_CONFIG
description: "DEPRECATED (seit 2026-08-14 nicht mehr registriert): Konfigurationsprofile für die Lead-Verarbeitung, JSON-Settings je Profil."
tags: [tabelle, crm, lead, konfiguration, deprecated]
timestamp: 2026-08-14
---

> **Nicht mehr in der DAB-Registry.** Diese Tabelle war bis zum Export vom
> 2026-08-02 registriert und ist im Export vom 2026-08-14 nicht mehr enthalten.
> Ob die Tabelle in der Datenbank noch existiert und nur nicht mehr über den
> Kontor API Service exponiert wird, oder ob sie entfernt wurde, ist unklar. Seite
> als historische Referenz erhalten; siehe `log.md` (2026-08-14).

Tabelle `dbo.CRM_LEAD_CONFIG` — ein Konfigurationsdatensatz je Profil, mit den
Einstellungen als JSON in `SettingsJson`.

War registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

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
