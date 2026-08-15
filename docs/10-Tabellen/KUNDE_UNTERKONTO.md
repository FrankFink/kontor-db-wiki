---
type: Entität
title: KUNDE_UNTERKONTO
description: Unterkonten eines Kunden für Praxen mit mehreren Ärzten (unterschiedliche LANR/BSNR-Kombinationen).
tags: [tabelle, rezeptabrechnung, plugin, kunde]
timestamp: 2026-08-15
---

Tabelle `dbo.KUNDE_UNTERKONTO` — bildet Unterkonten eines Kunden ab. Relevant, wenn
eine Praxis bzw. ein Kunde mehrere Ärzte mit unterschiedlichen Kombinationen aus
**LANR** und **BSNR** hat: über Unterkonten lassen sich diese arzt- bzw.
betriebsstättenbezogenen Daten innerhalb einer gemeinsamen Kundennummer
unterscheiden. Damit ist die Tabelle für die korrekte Zuordnung von Rezepten und
Rezeptpositionen zum jeweiligen Arzt bzw. zur jeweiligen Betriebsstätte relevant.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Id` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — übergeordneter Kunde/Praxis (registriert) |
| Nr | int | yes | Nummer des Unterkontos |
| Bez | nvarchar(200) | yes | Registriertes Feld; von der Fachquelle nicht (mehr) beschrieben — Bedeutung „Bezeichnung des Unterkontos" ist Vermutung aus dem Feldnamen |
| Betriebsnummer | nvarchar(15) | yes | BSNR des Unterkontos |
| Lanr | nvarchar(35) | yes | LANR des zugeordneten Arztes |

**Versionshinweis:** Frühere Registry-Exporte (bis 2026-08-14 10:06) hatten nur
5 Felder ohne Primärschlüssel; `Id` kam am 10:46 als PK hinzu. Die Fachquelle
beschrieb zwischenzeitlich zusätzlich `Verwendung`, `Adressid`, `Kundennrkk`,
`Deaktiviert` und `Info` — keines davon war je in der Registry enthalten. Mit
dem Quellenstand vom 2026-08-15 sind diese fünf Felder aus der Fachquelle wieder
entfernt worden; sie werden hier nicht mehr als offene Diskrepanz geführt, da
nicht mehr behauptet wird, dass sie existieren.

# Bedeutung für die Rezeptabrechnung

Reicht die allgemeine Kundennummer allein nicht aus, um ein Rezept eindeutig dem
richtigen Arzt bzw. der richtigen Betriebsstätte zuzuordnen (mehrere Ärzte je
Praxis), greifen die Unterkonten. Relevant sind dabei laut Fachquelle:

- `Kundennr` — Zuordnung zur Praxis/zum Hauptkunden
- `Lanr` — Zuordnung des jeweiligen Arztes
- `Betriebsnummer` — Zuordnung der jeweiligen Betriebsstätte

Die Krankenkassen-Zuordnung läuft für Rezepte direkt über [REZ](<REZ.md>).`Kundennrkk`
(FK auf `KUNDE`), nicht über ein Feld dieser Tabelle — die Fachquelle nannte
`Kundennrkk` hier in einer früheren Fassung, dieser Bezug wurde seither entfernt.

Im einfachen Fall (nur ein Arzt/eine Betriebsstätte) genügen vermutlich die direkt
auf [KUNDE](<KUNDE.md>) liegenden Felder `Lanr`/`Betriebsnummer` — Unterkonten
kommen erst bei mehreren Kombinationen je Kunde zum Einsatz. Diese Lesart ist eine
Interpretation, keine belegte Tatsache.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| KUNDE_UNTERKONTO_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |

Seit dem Registry-Export vom 2026-08-14 (10:46) registriert.

[REZ](<REZ.md>) referenziert diese Tabelle über die registrierte Relation
`REZ_KUNDE_UNTERKONTO_Unterkontoid` (`Unterkontoid : Id`, seit 2026-08-15) —
konkreter Arzt/Betriebsstätte je Rezept.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
