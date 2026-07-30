---
type: Referenz
title: Datenbank-Überblick
description: Kurzüberblick zur Kontor Datenbank, aktuell im Wiki dokumentierter Ausschnitt.
tags: [datenbank, ueberblick]
timestamp: 2026-07-30
---

Die **Kontor Datenbank** ist die SQL-Datenbank hinter dem ERP **Kontor.MED**
(codegarden software GmbH). Sie liegt im Standard-Schema `dbo` einer
SQL-Server-Instanz.

# Aktueller Wiki-Ausschnitt

Dokumentiert sind bislang vier Tabellen, die über den [Kontor API Service](<kontor-api-service.md>)
freigegeben sind. Die Datenbank enthält darüber hinaus zahlreiche weitere Tabellen und
Views; sie werden hier aufgenommen, sobald Quellen dazu vorliegen.

| Tabelle | Zweck (Kurz) |
|---------|--------------|
| [ADRESSEN](../10-Tabellen/ADRESSEN.md) | Adressdatensätze (Rechnungs- und Lieferadressen) |
| [ARTIK](../10-Tabellen/ARTIK.md) | Artikelstamm |
| [BUCH_UMSATZ](../10-Tabellen/BUCH_UMSATZ.md) | Umsatzbuchungen je Belegposition |
| [KUNDE](../10-Tabellen/KUNDE.md) | Kundenstamm |

# Beziehungen im dokumentierten Ausschnitt

`BUCH_UMSATZ` liegt im Zentrum: jede Position verweist auf einen Artikel (`ARTIK`) und
einen Kunden (`KUNDE`). `KUNDE` verweist seinerseits auf zwei Adressen in `ADRESSEN`
(Rechnungs- und Lieferadresse).

```
ARTIK ──< BUCH_UMSATZ >── KUNDE ──< ADRESSEN
                                  (Rgadrid, Lieferadrid)
```

# Citations

- `../../raw/dab_registry.md` — DAB-Registry-Export vom 2026-07-30
