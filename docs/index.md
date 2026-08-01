---
okf_version: "0.1"
---

# Kontor Datenbank Wiki

Persönliches Wissens-Wiki zur **Kontor Datenbank** — der SQL-Datenbank hinter dem ERP
**Kontor.MED** (Hersteller: codegarden software GmbH). Beschreibt die Datenbank aus
Entwickler- und Integrationssicht: Tabellen, Views und der Zugriff über den
**Kontor API Service**.

Für die Anwendersicht auf das ERP siehe das Schwesterwiki `Kontor MED v1`.

# Bereiche

| Bereich | Inhalt |
|---------|--------|
| [00 · Allgemeines](00-Allgemeines/index.md) | Datenbank-Überblick, Kontor API Service, Authentifizierung, Namenskonventionen |
| [10 · Tabellen](10-Tabellen/index.md) | Ein Konzeptdokument je Tabelle der Kontor Datenbank |
| [20 · Views](20-Views/index.md) | Ein Konzeptdokument je View der Kontor Datenbank |
| [90 · Glossar](90-Glossar/index.md) | Begriffe und Abkürzungen rund um DB und API |

# Einstieg

[Datenbank-Überblick](<00-Allgemeines/datenbank-ueberblick.md>) erklärt, was aktuell
dokumentiert ist. [Kontor API Service](<00-Allgemeines/kontor-api-service.md>) beschreibt
den HTTP-Zugriff (REST + GraphQL).

# Dokumentierter Ausschnitt

15 über den Kontor API Service exponierte Tabellen: fünf Kernentitäten mit
`BUCH_UMSATZ` als zentralem Bewegungsdatensatz, sechs Codetabellen für
Warengruppen, Kategorien, Kundengruppen und Vertreter, sowie ein neuer,
eigenständiger CRM-Bereich.

- Kernentitäten: [ADRESSEN](<10-Tabellen/ADRESSEN.md>) · [ARTIK](<10-Tabellen/ARTIK.md>) · [BUCH_UMSATZ](<10-Tabellen/BUCH_UMSATZ.md>) · [KUNDE](<10-Tabellen/KUNDE.md>) · [PROJEKT](<10-Tabellen/PROJEKT.md>)
- Codetabellen: [ARTIK_WG1](<10-Tabellen/ARTIK_WG1.md>) · [ARTIK_WG2](<10-Tabellen/ARTIK_WG2.md>) · [ARTIK_KATWERTE](<10-Tabellen/ARTIK_KATWERTE.md>) · [KUNDE_GRP1](<10-Tabellen/KUNDE_GRP1.md>) · [KUNDE_GRP2](<10-Tabellen/KUNDE_GRP2.md>) · [VERTR](<10-Tabellen/VERTR.md>)
- CRM: [CRM_LEAD](<10-Tabellen/CRM_LEAD.md>) · [CRM_ACTIVITIES](<10-Tabellen/CRM_ACTIVITIES.md>) · [CRM_LEAD_CONFIG](<10-Tabellen/CRM_LEAD_CONFIG.md>) · [CRM_PROMPT_TEMPLATE](<10-Tabellen/CRM_PROMPT_TEMPLATE.md>)

Beziehungsgrafik siehe [Datenbank-Überblick](<00-Allgemeines/datenbank-ueberblick.md>).

# Verwaltung

* [Log](log.md) — Chronologisches Änderungsprotokoll des Wikis
* [struktur.md](../struktur.md) — Verbindliche Zielstruktur
* [CLAUDE.md](../CLAUDE.md) — Konventionen und Workflows
