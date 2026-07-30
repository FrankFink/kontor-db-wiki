# 10 · Tabellen

Ein Konzeptdokument je Tabelle der Kontor Datenbank. Bis sich Muster zeigen, liegen
die Seiten flach in diesem Ordner.

# Seiten

| Tabelle | Zweck (Kurz) | PK |
|---------|--------------|----|
| [ADRESSEN](<ADRESSEN.md>) | Adressdatensätze (Rechnungs-, Liefer- und weitere Adressen) | `Id` |
| [ARTIK](<ARTIK.md>) | Artikelstamm | `Artnr` |
| [BUCH_UMSATZ](<BUCH_UMSATZ.md>) | Umsatzbuchungen je Belegposition | `Id` |
| [KUNDE](<KUNDE.md>) | Kundenstamm | `Kundennr` |

Alle vier Tabellen sind über den [Kontor API Service](<../00-Allgemeines/kontor-api-service.md>)
exponiert (Registry-Export in `../../raw/dab_registry.md`).
