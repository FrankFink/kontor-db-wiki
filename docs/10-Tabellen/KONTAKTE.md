---
type: Entität
title: KONTAKTE
description: Zentrale Notizsammlung (z. B. Telefongesprächsnotizen), polymorph über Src/Srcvalue mit beliebigen Objekten verknüpft.
tags: [tabelle, notizen, kontakte]
timestamp: 2026-08-01
---

Tabelle `dbo.KONTAKTE` — zentrale Sammlung von Notizen (z. B. Telefongesprächsnotizen).
Einträge können sich auf unterschiedliche Objekte und Module in Kontor.MED beziehen.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK |
| Betreff | nvarchar(500) | yes | |
| Erfasser | nvarchar(20) | yes | Kürzel des Erfassers |
| Datum | datetime | yes | |
| Bemerkungen | nvarchar | yes | Notiztext |
| Src | nvarchar(50) | yes | Bezeichnung der Quelltabelle bzw. des Objekttyps, z. B. `Kunde` |
| Srcvalue | nvarchar(50) | yes | Zugehöriger Schlüsselwert, z. B. die Kundennummer |

# Zuordnung einer Notiz

Die Verknüpfung zum Bezugsobjekt läuft polymorph: `Src` benennt den Objekttyp
(„Quelltabelle"), `Srcvalue` trägt dessen Schlüsselwert. Damit lassen sich Notizen aus
unterschiedlichen Modulen einheitlich ablegen, ohne eine feste Fremdschlüsselspalte je
Zieltabelle zu benötigen.

Typische Verwendung laut Fachquelle: Notizen zu Kunden (vermutlich `Src = "Kunde"` →
[KUNDE](<KUNDE.md>).`Kundennr` als `Srcvalue`), zu Aufträgen und zu Lieferanten.

Das gleiche Verknüpfungsmuster (Diskriminator + Fremdschlüssel-Wert statt fester FK)
findet sich auch bei [CRM_ACTIVITIES](<CRM_ACTIVITIES.md>) (`ParentType`/`ParentId`).
Ob `KONTAKTE` und `CRM_ACTIVITIES` zwei getrennte Systeme sind oder historisch
zusammenhängen, ist ungeklärt.

# Beziehungen

In der Registry sind an dieser Tabelle **keine Beziehungen** deklariert — die
polymorphe Verknüpfung über `Src`/`Srcvalue` ist rein fachlich und zeigt je nach
`Src`-Wert auf unterschiedliche Zieltabellen (u. a. vermutlich [KUNDE](<KUNDE.md>)).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/Informationen_Tabelle_Kontakte.md`
