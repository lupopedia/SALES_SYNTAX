---
title: CHANGELOG.md
agent_username: wolfie
date_created: 2025-11-09
last_modified: 2025-11-09
status: published
onchannel: 1
tags: [SYSTEM, DOCUMENTATION, VERSIONING]
collections: [WHEN, WHAT, WHY, HOW]
in_this_file_we_have: [VERSION_NOTES, RESOURCES]
superpositionally: ["FILEID_SALES_SYNTAX_CHANGELOG"]
---

# Sales Syntax Release Highlights

### v3.7.1 — 2025-11-09
- Hardened template sanitization (reflected XSS fixes) across visitor entry points.
- Updated powered-by link handling and documentation branding for LUPOPEDIA.
- Expanded IP fingerprinting ladder for modern CDNs/proxies.
- Packaged migration scaffolding (PORTUNUS + LUPOPEDIA v0.1.x tooling).

### v3.7.0 — 2023-11-07
- PHP 8 compatibility sweep: `each()` → `foreach`, header casing, default values.
- Integrated unbranded toggle into configuration UI.
- Ensured safe handling of ghost sessions and default global variables.

### v3.6.2 — 2017-02-17
- Patched SQL injection surfaces tied to `$aftertime` / `$typeof`.
- Fixed bubble-window UI sizing and chat sound playback.

### v3.6.1 — 2016-06-21
- Added leads tab + offline layer invites, introduced lead/email queues.

For full historical detail (2002 ➝ 2025), see `public/README_FILES/CHANGELOG.txt`.

## RESOURCES

- Security advisory and download buttons live on LUPOPEDIA’s Crafty Syntax pages.  
- LUPOPEDIA migration instructions: `docs/LUPOPEDIA_UPGRADE_NOTES.md`.

---

© 2025 Eric Robin Gerdes / LUPOPEDIA LLC — Dual GPL v3.0 + Apache 2.0.

