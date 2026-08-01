---
type: Referenz
title: Datenbank-Überblick
description: Kurzüberblick zur Kontor Datenbank, aktuell im Wiki dokumentierter Ausschnitt.
tags: [datenbank, ueberblick]
timestamp: 2026-08-01
---

Die **Kontor Datenbank** ist die SQL-Datenbank hinter dem ERP **Kontor.MED**
(codegarden software GmbH). Sie liegt im Standard-Schema `dbo` einer
SQL-Server-Instanz.

# Aktueller Wiki-Ausschnitt

Dokumentiert sind bislang 16 Tabellen, die über den
[Kontor API Service](<kontor-api-service.md>) freigegeben sind. Die Datenbank enthält
darüber hinaus zahlreiche weitere Tabellen und Views; sie werden hier aufgenommen,
sobald Quellen dazu vorliegen.

## Kernentitäten

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ADRESSEN](../10-Tabellen/ADRESSEN.md) | Adressdatensätze (Rechnungs-, Liefer-, Ansprechpartner), gruppiert über `Firmenadressid` |
| [ARTIK](../10-Tabellen/ARTIK.md) | Artikelstamm |
| [BUCH_UMSATZ](../10-Tabellen/BUCH_UMSATZ.md) | Umsatzbuchungen je Belegposition |
| [KUNDE](../10-Tabellen/KUNDE.md) | Kundenstamm |
| [PROJEKT](../10-Tabellen/PROJEKT.md) | Projektstamm mit Kundenbezug |

## Codetabellen und Klassifikationen

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ARTIK_WG1](../10-Tabellen/ARTIK_WG1.md), [ARTIK_WG2](../10-Tabellen/ARTIK_WG2.md) | Warengruppen Ebene 1/2 (WG2 → WG1 über `RefWg1`) |
| [ARTIK_KATWERTE](../10-Tabellen/ARTIK_KATWERTE.md) | Hierarchische Kategoriewerte (Katalog/Shop) |
| [KUNDE_GRP1](../10-Tabellen/KUNDE_GRP1.md), [KUNDE_GRP2](../10-Tabellen/KUNDE_GRP2.md) | Kundengruppen Ebene 1/2 (voneinander unabhängig) |
| [VERTR](../10-Tabellen/VERTR.md) | Vertreterstamm |

## CRM

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [CRM_LEAD](../10-Tabellen/CRM_LEAD.md) | Lead-/Interessentendatensatz |
| [CRM_ACTIVITIES](../10-Tabellen/CRM_ACTIVITIES.md) | Aktivitäten-/Verlaufsprotokoll, polymorph verknüpft |
| [CRM_LEAD_CONFIG](../10-Tabellen/CRM_LEAD_CONFIG.md) | Konfigurationsprofile für Lead-Verarbeitung |
| [CRM_PROMPT_TEMPLATE](../10-Tabellen/CRM_PROMPT_TEMPLATE.md) | Prompt-Vorlagen je Profil |

Der CRM-Bereich ist neu und schließt fachlich nicht an die übrigen Tabellen an — in
der Registry sind keine Beziehungen dorthin deklariert, weder zu `ADRESSEN`/`KUNDE`
noch untereinander.

## Notizen

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [KONTAKTE](../10-Tabellen/KONTAKTE.md) | Zentrale Notizsammlung, polymorph über `Src`/`Srcvalue` verknüpft |

Verwendet das gleiche Diskriminator-Muster wie `CRM_ACTIVITIES`
(`ParentType`/`ParentId`) — beide ohne registrierte Beziehungen.

# Beziehungen im dokumentierten Ausschnitt

`BUCH_UMSATZ` liegt im Zentrum der Bewegungsdaten und verweist auf `ARTIK` und
`KUNDE`. `KUNDE` verweist seinerseits auf zwei Adressen in `ADRESSEN`
(Rechnungs- und Lieferadresse) sowie auf `VERTR` und die beiden Kundengruppen.
`ARTIK` verweist auf seine Warengruppen.

```
       ARTIK_WG1 ─── ARTIK_WG2 (RefWg1, fachlich)
            ▲             ▲
            │             │
            └──── ARTIK ──┘
                    │  │
                    │  └──▶ ARTIK_KATWERTE (Selbstref. über Katidparent, fachlich)
                    ▼
               BUCH_UMSATZ  ◀── KUNDE ──▶ ADRESSEN (Rg + Liefer)
                                  │
                                  ├──▶ VERTR
                                  ├──▶ KUNDE_GRP1
                                  └──▶ KUNDE_GRP2
```

`BUCH_UMSATZ.Vertreter` verweist fachlich auf `VERTR`, ist aber nicht als DAB-Relation
registriert. `PROJEKT.Kundennr` verweist vermutlich auf `KUNDE`, ebenfalls ohne
registrierte Relation; `PROJEKT.Rgadrid`/`Lieferadrid` sind auffällig als `bigint`
typisiert statt `uniqueidentifier` wie in `ADRESSEN`/`KUNDE` (siehe [PROJEKT](../10-Tabellen/PROJEKT.md)).

Der CRM-Bereich (`CRM_LEAD`, `CRM_ACTIVITIES`, `CRM_LEAD_CONFIG`,
`CRM_PROMPT_TEMPLATE`) steht separat und ohne registrierte Verbindung zum übrigen
Schema.

# Citations

- `../../raw/dab_registry.md` — DAB-Registry-Export vom 2026-08-01 (16 Entitäten)
- `../../raw/Informationen_Tabelle_Kontakte.md`
