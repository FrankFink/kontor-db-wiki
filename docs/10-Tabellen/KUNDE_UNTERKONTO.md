---
type: Entität
title: KUNDE_UNTERKONTO
description: Unterkonten eines Kunden für Praxen mit mehreren Ärzten (unterschiedliche LANR/BSNR-Kombinationen); Registry-Schema war zunächst unvollständiger als die Fachquelle, PK-Feld Id inzwischen nachregistriert.
tags: [tabelle, rezeptabrechnung, plugin, kunde]
timestamp: 2026-08-14
---

Tabelle `dbo.KUNDE_UNTERKONTO` — bildet Unterkonten eines Kunden ab. Relevant, wenn
eine Praxis bzw. ein Kunde mehrere Ärzte mit unterschiedlichen Kombinationen aus
**LANR** und **BSNR** hat: über Unterkonten lassen sich diese arzt- bzw.
betriebsstättenbezogenen Daten innerhalb einer gemeinsamen Kundennummer
unterscheiden. Damit ist die Tabelle für die korrekte Zuordnung von Rezepten und
Rezeptpositionen zum jeweiligen Arzt bzw. zur jeweiligen Betriebsstätte relevant.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Abweichung zwischen Registry und Fachquelle — teilweise behoben.** Die
DAB-Registry listete zunächst (Export bis 2026-08-14 10:06) nur 5 Felder ohne
Primärschlüssel. Im Export vom selben Tag, 10:46 Uhr, ist `Id` als sechstes Feld
und PK hinzugekommen — deckt sich jetzt mit der Fachquelle. Fünf von der
Fachquelle beschriebene Felder fehlen aber weiterhin in der Registry.

**Primärschlüssel:** `Id` (`uniqueidentifier`, seit 2026-08-14 10:46 registriert)

## Über die Registry abrufbare Felder

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Id | uniqueidentifier | no | PK — seit 2026-08-14 (10:46) registriert, vorher fehlte sie in der Registry |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — übergeordneter Kunde/Praxis (registriert) |
| Nr | int | yes | Nummer des Unterkontos |
| Bez | nvarchar(200) | yes | Bezeichnung des Unterkontos |
| Betriebsnummer | nvarchar(15) | yes | BSNR des Unterkontos |
| Lanr | nvarchar(35) | yes | LANR des zugeordneten Arztes |

## Weiterhin fehlende Felder laut Fachquelle

| Feld | Bedeutung laut Fachquelle |
|------|---------------------------|
| `Verwendung` | Kennung für die Verwendung des Unterkontos |
| `Adressid` | ID einer dem Unterkonto zugeordneten Adresse (vermutlich [ADRESSEN](<ADRESSEN.md>).`Id`) |
| `Kundennrkk` | Kundennummer der zugeordneten Krankenkasse |
| `Deaktiviert` | Kennzeichen, ob das Unterkonto deaktiviert ist |
| `Info` | Zusätzliches Informationsfeld |

# Bedeutung für die Rezeptabrechnung

Reicht die allgemeine Kundennummer allein nicht aus, um ein Rezept eindeutig dem
richtigen Arzt bzw. der richtigen Betriebsstätte zuzuordnen (mehrere Ärzte je
Praxis), greifen die Unterkonten. Relevant sind dabei laut Fachquelle:

- `Kundennr` — Zuordnung zur Praxis/zum Hauptkunden
- `Lanr` — Zuordnung des jeweiligen Arztes
- `Betriebsnummer` — Zuordnung der jeweiligen Betriebsstätte
- `Kundennrkk` — Zuordnung der Krankenkasse

Im einfachen Fall (nur ein Arzt/eine Betriebsstätte) genügen vermutlich die direkt
auf [KUNDE](<KUNDE.md>) liegenden Felder `Lanr`/`Betriebsnummer` — Unterkonten
kommen erst bei mehreren Kombinationen je Kunde zum Einsatz. Diese Lesart ist eine
Interpretation, keine belegte Tatsache.

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| KUNDE_UNTERKONTO_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |

Seit dem Registry-Export vom 2026-08-14 (10:46) registriert.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
