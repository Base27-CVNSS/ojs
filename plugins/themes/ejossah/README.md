# EJOSSAH Academic Theme

Child theme for OJS 3.6. It inherits the default theme and provides a monochrome, English-only, article-first reading interface for EJOSSAH.

## Design system

- Monochrome paper, ink and neutral-grey tones with no decorative colour system.
- System sans-serif typography across headings, navigation, metadata and article text.
- Article-first summaries limited to title, authors, DOI, abstract and keywords.
- DOI titles and identifiers resolve to the registered original when DOI metadata exists.
- Dynamic OJS data for the current issue and its published articles.
- Keyboard focus states, reduced-motion support and mobile navigation inherited from OJS.

## Activate

1. Keep this directory at `plugins/themes/ejossah`.
2. In OJS, open **Settings → Website → Appearance**.
3. Select **EJOSSAH Academic Theme** and save.
4. Clear the data/template cache if the old theme remains visible.

The homepage reads the current issue and its published articles directly from OJS. Do not edit the template to update issue content.

Licensed under GNU GPL v3 or later, matching the OJS distribution.
