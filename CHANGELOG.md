---
title: SALESSYNTAX_CHANGELOG.md
agent_username: wolfie
date_created: 2025-11-09
last_modified: 2025-11-09
status: published
onchannel: 1
tags: [SYSTEM, DOCUMENTATION, LEGACY, CHANGELOG]
collections: [WHAT, WHEN, WHY, HOW]
in_this_file_we_have: [OVERVIEW, VERSION_3_7_1, VERSION_3_7_0, REFERENCES]
---

# Sales Syntax Changelog (Legacy Live Help Program)

This file tracks the GPL Sales Syntax lineage that now ships inside LUPOPEDIA. The livehelp module (Crafty Syntax → Sales Syntax → LUPOPEDIA) remains open source and fully documented so customers know which fixes landed in each release.

**License**: GPL v3.0 + Apache 2.0 dual licensing under LUPOPEDIA LLC  
**Program Scope**: Human operator live help with layered popups, channel routing, canned replies, and visitor tracking.

## VERSION_3_7_3 — 2025-11-10 (Timezone Offset & Hardening Sweep)

### Highlights

- Removed the legacy `offset` column from fresh installs so `setup.php` no longer creates or references the misspelled field that broke MySQL import checks.
- Added a tolerant loader for existing databases: if a config row still exposes `offest`, the runtime maps it to `offset` on the fly and falls back to PHP’s active timezone when neither value is present.
- Replaced the admin “time offset” dropdown with a read-only notice that shows either the preserved legacy value or the resolved timezone identifier, avoiding undefined-index warnings during upgrades.
- Mirrored the fixes into the redistributed `/public/salessyntax` snapshot so hosted customers and LUPOPEDIA deployments stay aligned.
- Tightened the HTML embed generator (`htmltags.php`) to display a same-domain placement notice, preventing remote-site integration issues uncovered during shared-host testing.
- Sanitized mobile/iPhone settings updates (`cellphone`, `sessiontimeout`) with `filter_sql` so chat operators cannot inject SQL through the quick settings forms.
- Escaped the `see` parameter in `admin_connect.php` before injecting it into the XMLHTTP redirect URL, closing the reflected XSS the legacy admin widget relied on.
- Hardened `setup.php` redisplays by wrapping installer inputs in `cslh_escape`/`rawurlencode` and swapping the column-existence checks over to shared-host-friendly `SHOW COLUMNS` queries.
- Added `scripts/security_sweep.py` so maintainers can automatically flag risky patterns (`eval`, dynamic includes, raw `$_REQUEST`, unescaped `$UNTRUSTED` output) before shipping future patches.
- Completed fresh-install and upgrade validation on Windows (XAMPP) and Linux shared hosts to confirm timezone fallbacks, security fixes, and language loader updates behave consistently.
- Restored operator desktop cues: `admin_users_refresh.php` now escalates focus through nested frames (window.parent.bottomof → parent → top → self) before falling back to an alert, and wraps HTML5/EMBED chat sounds with autoplay-promise catches so operators hear the bell even when browsers block background playback.
- Standardized all “powered by” links to `https://lupopedia.com/?utm_source=poweredby&utm_campaign=poweredby`, removing obfuscation and legacy domains so embeds point at the LUPOPEDIA hub.
- Fixed `leavemessage.php` mail delivery: corrected the status update query, ensured department contact emails are honored, and fall back to `owner_email` so contact alerts always send when visitors leave a message.

---

## Deployment Status (Completed)

- Shared-hosting verification completed on Windows and Linux environments; 3.7.3 is cleared for packaging and distribution to hosted customers.

### Status

- **Patch released**: Tagged as 3.7.3 within 48 hours to unblock installers seeing the `offest` typo and shore up shared-host security.
- **Packaging**: Prepare and distribute the refreshed ZIP bundle to partners; continue monitoring support tickets for any residual timezone edge cases ahead of the planned timezone-schema audit during LUPOPEDIA rollout.
- **Verification**: Final security_sweep.py run, admin console debug regression tests, and fresh install/upgrade retests all pass with no new findings; package is ready for delivery.

---


## VERSION_3_7_2 — 2025-11-10 (Installatron Compliance & Branding Refresh)

### Highlights

- Rebased the working tree on the original 3.7.1 payload (`public/salessyntax/`) so all new fixes start from the shipped, unmodified theme.
- Retired the legacy `filter_html()` sanitizer and swapped every call site to native escaping helpers (`cslh_escape`, `htmlspecialchars`, `rawurlencode`) to eliminate double-sanitization flags raised by Installatron.
- Modernized the visitor typing beacon in `livehelp.php` (and mirrored scripts) to prefer `fetch`/`XMLHttpRequest` while keeping the `<img>`/`GETForm` fallbacks for browsers stuck in 2005.
- Removed obsolete upgrade prompts (`pp.gif`, `gopro.png`, “Go Pro” copy) now that unbranded features ship by default.
- Updated footer credits across operator/admin pages to read: `Sales Syntax Live Help 2003 - 2025 ( a product of Lupopedia LLC )`.
- Added an opt-in `2025_modern` theme (responsive layout, flex-based header/footer, refreshed offline/connecting screens) without disturbing existing templates.
- Mobile and iPhone operator consoles now submit chats through modern `fetch` with `GETForm2` fallback, keeping the `postmessage` workflow intact for legacy browsers.
- Logged the remediation plan in `plan_for_sales_syntax_3_7_2.md` so future patches stay aligned with Installatron requirements.
- Introduced hosted documentation stubs (`howto`, `qa`, `updates`) and new public landing pages (`account.php`, `support.php`, `directory.php`, `members.php`). Added an operator-facing notice on `scratch.php` explaining why the 3.7.2 release preserves the 2012-era UI (to keep diff baselines intact) and how LUPOPEDIA 1.0.0 will layer in modern tooling plus AI-driven migration of community customizations.
- Refreshed `javascript/xmlhttp.js` to use a shared `fetch` wrapper with automatic fallbacks to the legacy `GETForm` helpers, keeping polling/typing scripts functional on older browsers while modern installs run via `fetch`.
- Packaging/testing: preparing the clean 3.7.2 ZIP and verifying shared-host installs with the modernized AJAX pathways.
- Updated configuration helpers so generated URLs drop the domain entirely (always relative paths). This avoids mixed-content issues—legacy installs that were `http://` now call AJAX endpoints over the current scheme (`https://` when needed) without breaking.

### Status

- **Release in preparation**: Regression testing and packaging still pending before tagging 3.7.2.
- **Next steps**: Mirror the modern typing helpers into mobile/iPhone/external clients, refresh shared `xmlhttp.js`, and produce Installatron-ready ZIP + changelog.

---

## VERSION_3_7_1 — 2025-11-09 (Security Patch & LUPOPEDIA Integration)

### Highlights

- Hardened every public visitor entry point (`livehelp.php`, `user_connect.php`, `user_chat_*`, `user_top.php`, `user_qa.php`) to reuse already-sanitized department/tab/offset integers before building redirects, query strings, or embedded JavaScript.
- Sanitized visitor-supplied hidden fields in lost-password and chat-color forms so remote widgets and password-reset flows cannot inject markup when rendered off-site.
- Refreshed the powered-by link in `livehelp_js.php`, allowing brand swaps to point directly to LUPOPEDIA while preserving the optional creditline toggle.
- Expanded the session fingerprinting ladder (`get_ipaddress`) to honor modern proxy/CDN headers, preferring public IPs and falling back safely so legacy installs maintain tracking accuracy.
- Packaged the release as the LUPOPEDIA migration baseline: the core now ships with the full Sales Syntax codebase, layered-pop-up heritage, and 3.7.1 security posture.
- Added LUPOPEDIA-side scaffolding: `livehelps` parent table (Migration 1071), CSV export guidance, and updated public docs (`public/crafty_syntax_evolved.php`, `public/what_was_crafty_syntax.php`) so operators understand the upgrade path.

### Recommended Action

- Apply 3.7.1 (latest GPL release) before migrating. PORTUNUS and LUPO warn or block imports when `livehelps.version = '3.7.0'`.
- After patching, regenerate CSV snapshots so `livehelps_rows.csv` reflects the sanitized schema and `version,3.7.1`.

---

## VERSION_3_7_0 — 2023-11-07 (PHP 8 Compatibility Sweep)

### Highlights

- Baked the previously “pro/unbranded” option into core so powered-by links can be removed directly from the HTML generator or department settings.
- Completed a PHP 8 readiness pass: converted all `each()` loops to `foreach`, normalized `Header()` → `header()`, supplied missing response-code parameters, ensured `mktime()` casts, and added default values for undefined variables encountered in empty result sets.
- Hardened runtime safety by checking for ghost sessions before dereferencing arrays, assigning defaults for `$hide`, and replacing the legacy `browser_info` class with the newer `Browser` helper.
- Moved `CTabBox` include calls into `data.php`, repaired department HTML generation to use the correct ordered arrays, and refreshed the hour parameter handling to avoid null notices under PHP 8.
- File footprint: essentially every PHP asset was touched (`FILES CHANGED: ALL OF THEM`), with no schema alterations (`DATABASE ALTERATIONS: NONE`).

### Status

- **Legacy baseline**: Still functional but missing the minor reflected XSS fixes and documentation polish delivered in 3.7.1.
- **Upgrade path**: Apply 3.7.1 (latest GPL release) before migrating into LUPOPEDIA; see `md_files/1_wolfie/livehelp_module.md` and `public/crafty_syntax_evolved.php` for patch workflow.

---


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


