---
title: README.md
agent_username: wolfie
date_created: 2025-11-09
last_modified: 2025-11-10
status: published
onchannel: 1
tags: [SYSTEM, DOCUMENTATION]
collections: [WHO, WHAT, WHY, HOW, HELP]
in_this_file_we_have: [OVERVIEW, RELEASE_STATUS, WHAT_IS_INCLUDED, GETTING_STARTED, SUPPORT]
superpositionally: ["FILEID_SALES_SYNTAX_README"]
---

# Sales Syntax Live Help (Legacy GPL Release)

## OVERVIEW

Sales Syntax is the GPL live help platform derived from Crafty Syntax (2002) and now bundled inside LUPOPEDIA as the human-operator-first channel layer. This repository packages the final GPL build (v3.7.2) plus historical documentation so legacy operators have a clear upgrade path.

## RELEASE_STATUS

- **Latest GPL release**: v3.7.3 (2025-11-10) – timezone-offset repair, shared-host security hardening, powered-by link standardisation  
- **Legacy baseline**: v3.7.0 (2023-11-07) – PHP 8 compatibility sweep (requires patching)  
- **License**: Dual GPL v3.0 + Apache 2.0 (choose what fits your deployment)

## WHAT_IS_INCLUDED

- `public/` – downloadable package (`salessyntax-3.7.3.zip`) and the original `README_FILES/` set from the release bundle.  
- `docs/` – changelog summary and upgrade notes for the LUPOPEDIA migration path.  
- `LICENSE` – dual-license statement matching LUPOPEDIA standards.
- Crafty Syntax legacy narrative: [https://www.lupopedia.com/what_was_crafty_syntax.php](https://www.lupopedia.com/what_was_crafty_syntax.php) — chronicles the 22-year arc from Crafty Syntax to Sales Syntax to LUPOPEDIA, explaining the “always works” philosophy, layered invite system, and why LUPOPEDIA preserves human-operator-first workflows.

## GETTING_STARTED

1. Review `CHANGELOG.md` for highlights between 3.7.2 and 3.7.3.  
2. Unzip `public/salessyntax-3.7.3.zip` into your web root (e.g., `/public/salessyntax/`).  
3. Follow `README_FILES/INSTALL.txt` and `README_FILES/UPGRADE.txt` for classic deployment steps.  
4. If migrating into LUPOPEDIA v0.1.x, read `docs/LUPOPEDIA_UPGRADE_NOTES.md` for PORTUNUS guidance.

## SUPPORT

- Security questions? Apply the 3.7.1 patch before going live (ref. `CHANGELOG.md`).  
- LUPOPEDIA migration help via PORTUNUS (see LUPOPEDIA docs).  
- Contact WOLFIE through Patreon, Facebook, or X for invite-only BETA access.

---

© 2025 Eric Robin Gerdes / LUPOPEDIA LLC — Licensed under GPL v3.0 + Apache 2.0.

