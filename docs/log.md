# Log

Chronologisches Änderungsprotokoll des Wikis. Neueste Einträge zuerst.

## 2026-08-01

**Update** — `raw/dab_registry.md` von 10 auf 15 Entitäten erweitert (Export
2026-08-01T09:08). Fünf neue Tabellen in zwei neuen Bereichen: CRM (`CRM_LEAD`,
`CRM_ACTIVITIES`, `CRM_LEAD_CONFIG`, `CRM_PROMPT_TEMPLATE`) und `PROJEKT`. Keine
der zehn bestehenden Tabellen hat sich inhaltlich verändert.

Neue Konzeptseiten unter `10-Tabellen/`: `CRM_LEAD.md`, `CRM_ACTIVITIES.md`,
`CRM_LEAD_CONFIG.md`, `CRM_PROMPT_TEMPLATE.md`, `PROJEKT.md`. Keine der vier
CRM-Tabellen hat in der Registry deklarierte Beziehungen — weder zu `ADRESSEN`/`KUNDE`
noch untereinander; naheliegende fachliche Verweise (`CRM_LEAD.Adressid/Ansprechid` →
`ADRESSEN`, `CRM_ACTIVITIES.ParentId` → vermutlich `CRM_LEAD`,
`CRM_PROMPT_TEMPLATE.Profile` → `CRM_LEAD_CONFIG.Profile`) sind auf den Seiten als
Vermutung markiert. Bei `PROJEKT` auffällig: `Rgadrid`/`Lieferadrid` sind dort
`bigint`, während dieselben Feldnamen in `KUNDE`/`ADRESSEN` `uniqueidentifier` sind —
als offene Typabweichung dokumentiert.

`10-Tabellen/index.md` um eine dritte Gruppe „CRM" ergänzt; `wiki/index.md`,
`00-Allgemeines/datenbank-ueberblick.md` (Beziehungsgrafik-Text, CRM als
unverbundener Bereich vermerkt) und `00-Allgemeines/kontor-api-service.md`
(Registry-Aufzählung) nachgezogen.

**Lint** — 15 Tabellen jetzt flach in `10-Tabellen/`; laut `struktur.md` ist eine
Gruppierung nach Fachbereich „ab einer gewissen Menge" vorgesehen. Der CRM-Bereich
ist ein guter Kandidat für einen eigenen Unterordner, falls weitere CRM-Tabellen
hinzukommen — noch nicht umgesetzt, da `struktur.md` das nicht vorgibt.

**Update** — Zwei neue Rohquellen verarbeitet: `raw/dab_registry.md` (Export
2026-08-01T07:14, `ADRESSEN` von 21 auf 26 Felder erweitert um `Isansprechpartner`,
`Firmenadressid`, `Hauptansprechpartner`, `Entscheider`, `Aktiv`) sowie
`raw/# Aufbau und Zuordnung von Adressen.md` (Fachtext zur Adresszuordnung).

`ADRESSEN.md` grundlegend überarbeitet: Schema um die fünf neuen Felder ergänzt,
neuer Abschnitt „Aufbau und Zuordnung von Adressen" (Firmenadressid als
vorrangiges Gruppierungskriterium vor `Kdliefnr`, Ansprechpartner-Kennzeichnung,
Aktiv-Flag). `datenbank-ueberblick.md` und `10-Tabellen/index.md`
(Kurzbeschreibung) nachgezogen.

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
