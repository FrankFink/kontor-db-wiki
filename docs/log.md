# Log

Chronologisches Änderungsprotokoll des Wikis. Neueste Einträge zuerst.

## 2026-07-31

**Update** — Registry-Nachtrag (Export 2026-07-31T07:05): `ARTIK` bekommt Feld
`Katid nvarchar(50)` und die registrierte Relation `ARTIK_ARTIK_KATWERTE_Katid`
(one → `ARTIK_KATWERTE` über `Katid : Katid`). Jeder Artikel ist damit genau
einer Kategorie zugeordnet. Angepasst: `ARTIK.md` (neues Feld + Relation, Wegfall
der „nicht deklariert"-Anmerkung), `ARTIK_KATWERTE.md` (Isoliert-Note entfernt,
eingehender Verweis dokumentiert, Selbstreferenz `Katidparent` weiterhin nur
fachlich), `datenbank-ueberblick.md` (Beziehungsgrafik ergänzt).

**Update** — `raw/dab_registry.md` von 4 auf 10 Entitäten erweitert (Export 2026-07-31).

Neue Konzeptseiten unter `10-Tabellen/`: `ARTIK_WG1.md`, `ARTIK_WG2.md`,
`ARTIK_KATWERTE.md`, `KUNDE_GRP1.md`, `KUNDE_GRP2.md`, `VERTR.md`.

Bestehende Seiten nachgezogen: `ARTIK.md` (neue Relationen zu `ARTIK_WG1`/`ARTIK_WG2`,
Hinweis auf fehlende Verbindung zu `ARTIK_KATWERTE`), `KUNDE.md` (neues Feld
`Vertrnr`, drei neue Relationen zu `VERTR`/`KUNDE_GRP1`/`KUNDE_GRP2`),
`BUCH_UMSATZ.md` (Anmerkung, dass `Vertreter` fachlich auf `VERTR` zeigt, aber keine
DAB-Relation ist).

Übersichtsseiten aktualisiert: `wiki/index.md`, `00-Allgemeines/datenbank-ueberblick.md`
(neue Beziehungsgrafik, Trennung Kern- vs. Codetabellen), `00-Allgemeines/kontor-api-service.md`
(Registry-Aufzählung erweitert), `10-Tabellen/index.md` (zweigeteilte Übersicht).

## 2026-07-30

**Creation** — Erste Quelle `raw/dab_registry.md` eingelesen (DAB-Registry-Export,
Stand 2026-07-30). Neue Konzeptseiten:
`00-Allgemeines/datenbank-ueberblick.md`, `00-Allgemeines/kontor-api-service.md`,
`10-Tabellen/ADRESSEN.md`, `10-Tabellen/ARTIK.md`, `10-Tabellen/BUCH_UMSATZ.md`,
`10-Tabellen/KUNDE.md`. `wiki/index.md`, `00-Allgemeines/index.md` und
`10-Tabellen/index.md` nachgezogen.

**Decision** — Auf Nutzerwunsch keine Auth-Seite (`00-Allgemeines/authentifizierung.md`)
angelegt; in `struktur.md` bleibt sie als geplante Seite gelistet.

## 2026-07-29

**Creation** — Grundstruktur des Wikis nach Vorbild `Kontor MED v1` angelegt:
`wiki/index.md`, `log.md`, Bereiche `00-Allgemeines`, `10-Tabellen`, `20-Views`,
`90-Glossar` mit je eigener `index.md`. `struktur.md` und `CLAUDE.md` als
Schema-Grundlage ergänzt. Noch keine Konzeptseiten befüllt.
