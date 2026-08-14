---
type: Referenz
title: SYS_DAB_METADATA
description: Metadaten-Tabelle je Feld einer DAB-Entität — Label, Pflichtfeld, Lookup-Ziel, Prüfroutine; treibt vermutlich UI und Validierung des Kontor API Service.
tags: [tabelle, dab, metadaten, api]
timestamp: 2026-08-10
---

Tabelle `dbo.SYS_DAB_METADATA` — beschreibt, anders als die übrigen dokumentierten
Tabellen, nicht Fachdaten, sondern **Metadaten zu den Feldern anderer DAB-Entitäten**
(erkennbar an `Entityname`/`Fieldname`). Sie ist Teil der Infrastruktur des
[Kontor API Service](<kontor-api-service.md>), nicht des Fachschemas.

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK |
| Entityname | nvarchar(25) | no | Name der beschriebenen Entität, z. B. `KUNDE` |
| Fieldname | nvarchar(50) | yes | Name des beschriebenen Felds innerhalb der Entität |
| Label | nvarchar(50) | yes | Anzeigetext für das Feld, vermutlich UI-Beschriftung |
| Description | nvarchar | yes | Beschreibungstext |
| Ismandatory | bit | yes | Pflichtfeld-Kennzeichnung |
| Lookupentity | nvarchar(25) | yes | Zielentität, falls das Feld ein Lookup ist |
| Islookupfixed | bit | yes | Kennzeichnet einen Lookup mit fester Werteliste |
| Hasproccheck | bit | yes | Kennzeichnet, dass der Wert serverseitig per Prozedur geprüft wird — vermutlich Verweis auf [kon_dab_checkentityvalue](<kon_dab_checkentityvalue.md>) |
| Jsparams | nvarchar | yes | Vermutlich JSON-Parameter für UI oder Prüfroutine |

**Ungeklärt:** ob `Entityname`/`Fieldname` frei Text oder gegen die tatsächliche
Registry validiert sind; genaues Format von `Jsparams`.

# Zusammenhang mit der Prüfroutine

`Hasproccheck = 1` deutet darauf hin, dass für dieses Feld beim Schreiben eine
serverseitige Prüfung ausgelöst wird. Der einzige passende Kandidat in der Registry
ist die gespeicherte Prozedur [kon_dab_checkentityvalue](<kon_dab_checkentityvalue.md>)
(Name legt „Prüfe Entitätswert" nahe). Der genaue Aufrufmechanismus (löst DAB die
Prozedur automatisch aus, oder muss der Client sie separat aufrufen?) ist aus der
Registry allein nicht ersichtlich.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert. Der Bezug zu
anderen Entitäten läuft über die Textfelder `Entityname`/`Fieldname`, nicht über
einen klassischen Fremdschlüssel.

# Citations

- `../../raw/dab_registry.md`
