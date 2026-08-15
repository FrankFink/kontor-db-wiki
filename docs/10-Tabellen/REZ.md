---
type: Entität
title: REZ
description: Erfasstes Rezept — die Rezeptid entspricht zugleich der Dokumenten-ID des gespeicherten Rezeptscans.
tags: [tabelle, rezeptabrechnung, plugin]
timestamp: 2026-08-14
---

Tabelle `dbo.REZ` — enthält die Informationen zu einem erfassten Rezept. Zentrale
Tabelle des Kontor.MED-Plugins **„Rezeptabrechnung"**. Die `Rezeptid` entspricht
gleichzeitig der Dokumenten-ID, unter der der Scan des Rezepts gespeichert ist.

Registriert im [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>).

# Schema

**Primärschlüssel:** `Rezeptid` (`uniqueidentifier`)

| Feld | Typ | Nullable | Anmerkung |
|------|-----|----------|-----------|
| Rezeptid | uniqueidentifier | no | PK; identisch mit der Dokumenten-ID des Rezeptscans; Default vermutlich `newid()` |
| Kundennr | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Kunde, dem das Rezept zugeordnet ist (registriert) |
| Kundennrkk | nvarchar(15) | yes | FK auf [KUNDE](<KUNDE.md>).`Kundennr` — Krankenkasse (seit 2026-08-15 registriert; bestätigt endgültig das Muster: Krankenkassen als eigene `KUNDE`-Datensätze) |
| Datum | datetime | yes | Datum des Datensatzes |
| Lanr | nvarchar(15) | yes | Lebenslange Arztnummer, dem Rezept zugeordnet; vgl. [KUNDE](<KUNDE.md>).`Lanr` bzw. [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).`Lanr` bei mehreren Ärzten |
| Bsnr | nvarchar(15) | yes | Betriebsstättennummer, dem Rezept zugeordnet; vgl. [KUNDE](<KUNDE.md>).`Betriebsnummer` bzw. [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).`Betriebsnummer` |
| Rezeptdatum | datetime | yes | Datum des Rezepts selbst |
| Abgabedatum | datetime | yes | Abgabedatum des Rezepts |
| Rezeptformat | nvarchar(15) | yes | Kürzel für ein Template, das das Formular-Format beschreibt |
| Status | nvarchar(15) | yes | Bearbeitungsstatus des Rezepts (Werte ungeklärt) |
| Unterkontoid | uniqueidentifier | yes | FK auf [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).`Id` (seit 2026-08-15 registriert) — konkreter Arzt/Betriebsstätte bei Praxen mit mehreren Kombinationen |
| Formularid | uniqueidentifier | yes | Vermutlich Verweis auf eine (noch nicht dokumentierte) Formular-/Template-Tabelle, vgl. `Rezeptformat` |
| Erfasser | nvarchar(3) | yes | Kürzel des erfassenden Benutzers |
| Bemerkung | nvarchar(500) | yes | |
| Aenderungsdatum | datetime | yes | Datum der letzten Änderung |
| Reznr | bigint | yes | Vermutlich fortlaufende, lesbare Rezeptnummer, zusätzlich zur technischen `Rezeptid` (GUID) |

# Zuordnung

`REZ_POS.Rezeptid` ordnet einzelne Rezeptpositionen einem Rezept aus `REZ` zu —
mehrere Positionen können über dieselbe `Rezeptid` auf einem Rezept zusammengefasst
werden. Siehe [REZ_POS](<REZ_POS.md>) und die Gesamtübersicht in
[KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) (Abschnitt „Bedeutung für die
Rezeptabrechnung").

```
REZ ──▶ REZ_POS ──▶ REZ_ABRECH_POS ──▶ REZ_ABRECH
 (alle Pfeile registriert; seit 2026-08-15 zusätzlich REZ ──▶ REZ_POS direkt,
  REZ ──▶ KUNDE_UNTERKONTO und REZ ──▶ KUNDE (Kundennrkk))
```

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |
| REZ_REZ_POS_Rezeptid | many | [REZ_POS](<REZ_POS.md>) | `Rezeptid : Rezeptid` |
| REZ_KUNDE_UNTERKONTO_Unterkontoid | one | [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) | `Unterkontoid : Id` |
| REZ_KUNDE_Kundennrkk | one | [KUNDE](<KUNDE.md>) | `Kundennrkk : Kundennr` |

`Kundennr` seit 10:46 registriert; die übrigen drei Relationen seit dem
Registry-Export vom 2026-08-15 (15:41) neu — damit sind alle zuvor als
„fachlich vermutet" markierten Verweise dieser Tabelle jetzt registriert.
`Lanr`/`Bsnr`/`Formularid` bleiben ohne eigene Relation.

[REZ_POS](<REZ_POS.md>) referenziert diese Tabelle zusätzlich über die eigene
registrierte Relation `REZ_POS_REZ_Rezeptid` (`Rezeptid : Rezeptid`) — die
Beziehung ist damit von beiden Seiten deklariert.

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
