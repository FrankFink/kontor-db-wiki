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
| Kundennrkk | nvarchar(15) | yes | Kundennummer der zugeordneten Krankenkasse. Für diese Tabelle **nicht** als eigene Relation registriert (anders als bei [REZ_ABRECH](<REZ_ABRECH.md>).`Kundennrkk`, das explizit auf `KUNDE` verweist) — vermutlich dennoch dasselbe Muster: Krankenkassen als eigene `KUNDE`-Datensätze geführt |
| Datum | datetime | yes | Datum des Datensatzes |
| Lanr | nvarchar(15) | yes | Lebenslange Arztnummer, dem Rezept zugeordnet; vgl. [KUNDE](<KUNDE.md>).`Lanr` bzw. [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).`Lanr` bei mehreren Ärzten |
| Bsnr | nvarchar(15) | yes | Betriebsstättennummer, dem Rezept zugeordnet; vgl. [KUNDE](<KUNDE.md>).`Betriebsnummer` bzw. [KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>).`Betriebsnummer` |
| Rezeptdatum | datetime | yes | Datum des Rezepts selbst |
| Abgabedatum | datetime | yes | Abgabedatum des Rezepts |
| Rezeptformat | nvarchar(15) | yes | Kürzel für ein Template, das das Formular-Format beschreibt |

# Zuordnung

`REZ_POS.Rezeptid` ordnet einzelne Rezeptpositionen einem Rezept aus `REZ` zu —
mehrere Positionen können über dieselbe `Rezeptid` auf einem Rezept zusammengefasst
werden. Siehe [REZ_POS](<REZ_POS.md>) und die Gesamtübersicht in
[KUNDE_UNTERKONTO](<KUNDE_UNTERKONTO.md>) (Abschnitt „Bedeutung für die
Rezeptabrechnung").

```
REZ ──▶ REZ_POS ──▶ REZ_ABRECH_POS ──▶ REZ_ABRECH
 (alle vier Pfeile registriert, Stand 2026-08-14 10:52 — die letzte Lücke,
  REZ_ABRECH_POS→REZ_ABRECH, wurde um 10:52 geschlossen)
```

# Beziehungen

| Name | Kardinalität | Ziel | Mapping |
|------|--------------|------|---------|
| REZ_KUNDE_Kundennr | one | [KUNDE](<KUNDE.md>) | `Kundennr : Kundennr` |

Seit dem Registry-Export vom 2026-08-14 (10:46) registriert — zuvor hatte diese
Tabelle keine deklarierten Beziehungen. `Lanr`/`Bsnr`/`Kundennrkk` bleiben ohne
eigene Relation.

[REZ_POS](<REZ_POS.md>) referenziert diese Tabelle über die registrierte Relation
`REZ_POS_REZ_Rezeptid` (`Rezeptid : Rezeptid`).

# Citations

- `../../raw/dab_registry.md`
- `../../raw/# Wichtige Datenbanktabellen rezeptabrechnungs-plugin.md`
