# Publishing a VS Code Theme to the Marketplace

## 1. Prerequisites

- A theme extension folder with:
  - `package.json`
  - `themes/<name>-color-theme.json`
  - `README.md`
  - `CHANGELOG.md`
  - `LICENSE`
  - Icon (128×128 PNG, recommended)
- Node.js installed

## 2. Install the Publishing CLI

```bash
npm install -g @vscode/vsce
```

## 3. Create a Publisher

1. Sign in to https://dev.azure.com and create an organization (free).
2. Go to **User Settings → Personal Access Tokens** and create a PAT with:
   - **Organization:** All accessible organizations
   - **Scopes:** Marketplace → Manage
3. Create a publisher at https://marketplace.visualstudio.com/manage and note the publisher ID.

## 4. Update `package.json`

Required fields:

```json
{
  "name": "your-theme",
  "displayName": "Your Theme",
  "description": "A VS Code theme inspired by Cloud",
  "version": "0.0.1",
  "publisher": "your-publisher-id",
  "engines": { "vscode": "^1.70.0" },
  "categories": ["Themes"],
  "icon": "icon.png",
  "repository": {
    "type": "git",
    "url": "https://github.com/you/your-theme"
  },
  "contributes": {
    "themes": [
      {
        "label": "Your Theme",
        "uiTheme": "vs-dark",
        "path": "./themes/your-theme-color-theme.json"
      }
    ]
  }
}
```

> `uiTheme` values:
> - `vs` — light
> - `vs-dark` — dark
> - `hc-black` / `hc-light` — high contrast

## 5. Test Locally Before Publishing

```bash
vsce package                                  # creates .vsix
code --install-extension your-theme-0.0.1.vsix
```

Reload VS Code → **Preferences: Color Theme** → pick your theme.

## 6. Login & Publish

```bash
vsce login your-publisher-id   # paste your PAT
vsce publish                   # ships to Marketplace
```

To bump version and publish in one step:

```bash
vsce publish patch   # 0.0.1 → 0.0.2
vsce publish minor   # 0.0.1 → 0.1.0
vsce publish major   # 0.0.1 → 1.0.0
```

## 7. Optional — Publish to Open VSX

For VSCodium, Cursor, Gitpod, and other forks:

```bash
npm install -g ovsx
ovsx create-namespace your-publisher-id -p <openvsx-token>
ovsx publish -p <openvsx-token>
```

Get an Open VSX token at https://open-vsx.org/user-settings/tokens.

## 8. Tips

- Add screenshots to your README — they render on the Marketplace listing.
- Use a clear `displayName` and tags/keywords in `package.json` for discoverability.
- Listings appear in a few minutes; first-time publishers may take longer to verify.
- Use `.vscodeignore` to exclude dev files from the published package.
- Bump `version` for every publish — the Marketplace rejects duplicates.

## 9. Useful Links

- VS Code theme docs: https://code.visualstudio.com/api/extension-guides/color-theme
- Publishing docs: https://code.visualstudio.com/api/working-with-extensions/publishing-extension
- Marketplace manage: https://marketplace.visualstudio.com/manage
- Open VSX registry: https://open-vsx.org
