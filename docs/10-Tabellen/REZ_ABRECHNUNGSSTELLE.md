---
type: Entität
title: REZ_ABRECHNUNGSSTELLE
description: Code-Tabelle der Abrechnungsstellen (Clearingstellen) für die Rezeptabrechnung; REZ_ABRECH.Abrechnungsstelleid verweist hierher.
tags: [tabelle, rezeptabrechnung, plugin, lookup]
timestamp: 2026-08-15
---

Tabelle `dbo.REZ_ABRECHNUNGSSTELLE` — Code-Tabelle der Abrechnungsstellen
(Clearingstellen), über die Rezeptabrechnungen abgewickelt werden. Neu in der
Registry seit dem Export vom 2026-08-14 (11:47), zusammen mit der Erweiterung von
[REZ_ABRECH](<REZ_ABRECH.md>) um das Feld `Abrechnungsstelleid`.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK |
| Kuerzel | nvarchar(15) | no | Kurzkennung, Pflichtfeld |
| Bez | nvarchar(200) | yes | Bezeichnung |
| Email | nvarchar(200) | yes | Kontakt-E-Mail der Abrechnungsstelle |
| Ik | nvarchar(15) | yes | Institutionskennzeichen (IK) |
| Csvprofil | nvarchar | yes | Vermutlich Kennung/Konfiguration für ein CSV-Exportformat je Abrechnungsstelle |
| Aktiv | bit | no | Aktiv-Kennzeichen, Pflichtfeld |

# Beziehungen

An dieser Tabelle selbst sind keine ausgehenden Beziehungen deklariert.

[REZ_ABRECH](<REZ_ABRECH.md>) referenziert diese Tabelle über die registrierte
Relation `REZ_ABRECH_REZ_ABRECHNUNGSSTELLE_Abrechnungsstelleid`
(`Abrechnungsstelleid : Id`, seit dem Registry-Export vom 2026-08-15).

# Citations

- `../../raw/dab_registry.md`
