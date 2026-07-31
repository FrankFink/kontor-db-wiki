# 10 · Tabellen

Ein Konzeptdokument je Tabelle der Kontor Datenbank. Bis sich Muster zeigen, liegen
die Seiten flach in diesem Ordner.

# Kernentitäten

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [ADRESSEN](<ADRESSEN.md>) | Adressdatensätze (Rechnungs-, Liefer- und weitere Adressen) | `Id` |
| [ARTIK](<ARTIK.md>) | Artikelstamm | `Artnr` |
| [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | Umsatzbuchungen je Belegposition | `Id` |
| [KUNDE](<KUNDE.md>) | Kundenstamm | `Kundennr` |

# Codetabellen und Klassifikationen

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [ARTIK_WG1](<ARTIK_WG1.md>) | Warengruppe Ebene 1 (Lookup für `ARTIK.Wg1`) | `Wg1` |
| [ARTIK_WG2](<ARTIK_WG2.md>) | Warengruppe Ebene 2 (Lookup für `ARTIK.Wg2`, mit `RefWg1`) | `Wg2` |
| [ARTIK_KATWERTE](<ARTIK_KATWERTE.md>) | Hierarchische Kategoriewerte (Katalog/Shop) | `Katid` |
| [KUNDE_GRP1](<KUNDE_GRP1.md>) | Kundengruppe Ebene 1 (Lookup für `KUNDE.Grp1`) | `Grp1` |
| [KUNDE_GRP2](<KUNDE_GRP2.md>) | Kundengruppe Ebene 2 (Lookup für `KUNDE.Grp2`, kein `RefGrp1`) | `Grp2` |
| [VERTR](<VERTR.md>) | Vertreterstamm | `Vertrnr` |

Alle Tabellen sind über den [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>)
exponiert (Registry-Export in `../../raw/dab_registry.md`, Stand 2026-07-31,
10 Entitäten).
