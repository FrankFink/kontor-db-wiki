---
type: Entität
title: REZ_ABRECH_POS
description: Zuordnungstabelle zwischen einer Abrechnung (REZ_ABRECH) und den darin enthaltenen Rezeptpositionen (REZ_POS).
tags: [tabelle, rezeptabrechnung, plugin, zuordnung]
timestamp: 2026-08-15
---

Tabelle `dbo.REZ_ABRECH_POS` — reine Zuordnungstabelle zwischen einer Abrechnung aus
[REZ_ABRECH](<REZ_ABRECH.md>) und den darin enthaltenen Rezeptpositionen aus
[REZ_POS](<REZ_POS.md>). Für jede zugeordnete Position ein eigener Datensatz.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK; Default vermutlich `newid()` |
| Posguid | uniqueidentifier | yes | FK auf [REZ_POS](<REZ_POS.md>).`Id` (registriert) |
| Abrechnungsid | uniqueidentifier | yes | FK auf [REZ_ABRECH](<REZ_ABRECH.md>).`Abrechnungsid` (registriert) |

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_ABRECH_POS_REZ_POS_Posguid | one | [REZ_POS](<REZ_POS.md>) | `Posguid : Id` |
| REZ_ABRECH_POS_REZ_ABRECH_Abrechnungsid | one | [REZ_ABRECH](<REZ_ABRECH.md>) | `Abrechnungsid : Abrechnungsid` |

Beide fachlich zentralen Verknüpfungen dieser reinen Zuordnungstabelle sind
registriert. Historie: Am 2026-08-14 schwankte die `Posguid`-Relation mehrfach
(registriert → verschwunden), und der Relationsname zu `REZ_ABRECH` trug bis dahin
den Tippfehler `Abrechungsid`. Seit dem Registry-Export vom 2026-08-15 (15:41)
sind beide Relationen stabil und einheitlich als `Abrechnungsid` benannt.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
