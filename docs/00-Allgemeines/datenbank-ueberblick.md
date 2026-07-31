---
type: Referenz
title: Datenbank-Überblick
description: Kurzüberblick zur Kontor Datenbank, aktuell im Wiki dokumentierter Ausschnitt.
tags: [datenbank, ueberblick]
timestamp: 2026-07-31
---

Die **Kontor Datenbank** ist die SQL-Datenbank hinter dem ERP **Kontor.MED**
(codegarden software GmbH). Sie liegt im Standard-Schema `dbo` einer
SQL-Server-Instanz.

# Aktueller Wiki-Ausschnitt

Dokumentiert sind bislang zehn Tabellen, die über den
[Kontor API Service](<kontor-api-service.md>) freigegeben sind. Die Datenbank enthält
darüber hinaus zahlreiche weitere Tabellen und Views; sie werden hier aufgenommen,
sobald Quellen dazu vorliegen.

## Kernentitäten

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ADRESSEN](../10-Tabellen/ADRESSEN.md) | Adressdatensätze (Rechnungs- und Lieferadressen) |
| [ARTIK](../10-Tabellen/ARTIK.md) | Artikelstamm |
| [BUCH_UMSATZ](../10-Tabellen/BUCH_UMSATZ.md) | Umsatzbuchungen je Belegposition |
| [KUNDE](../10-Tabellen/KUNDE.md) | Kundenstamm |

## Codetabellen und Klassifikationen

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ARTIK_WG1](../10-Tabellen/ARTIK_WG1.md), [ARTIK_WG2](../10-Tabellen/ARTIK_WG2.md) | Warengruppen Ebene 1/2 (WG2 → WG1 über `RefWg1`) |
| [ARTIK_KATWERTE](../10-Tabellen/ARTIK_KATWERTE.md) | Hierarchische Kategoriewerte (Katalog/Shop) |
| [KUNDE_GRP1](../10-Tabellen/KUNDE_GRP1.md), [KUNDE_GRP2](../10-Tabellen/KUNDE_GRP2.md) | Kundengruppen Ebene 1/2 (voneinander unabhängig) |
| [VERTR](../10-Tabellen/VERTR.md) | Vertreterstamm |

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
registriert.

# Citations

- `../../raw/dab_registry.md` — DAB-Registry-Export vom 2026-07-31 (10 Entitäten)
