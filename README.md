# r4r

**This repository is fully AI-generated.**

Mark a GitHub pull request ready for review: add the `ready for review` label, then either create a Slack draft with real `@`mentions or copy the title + link to the clipboard.

## What it does

- **`r4r <pr>`** — labels the PR and creates a Slack draft pinging manually requested reviewers (skips CODEOWNERS auto-requests).
- **`r4r --copy <pr>`** — labels the PR and copies `{title} {url}` to the clipboard. No mentions, no Slack draft.
- **Raycast ⌘⌥R** — grab the front browser tab URL and run the Slack-draft flow.
- **Raycast ⌘⌥⇧R** — same, but copy title + link (no mentions, no Slack draft).

Auth tokens, Slack cookies, and the GitHub→Slack user map are **not** in this repo. They stay on your machine.

## Setup

### PATH

```bash
export PATH="$HOME/dev/r4r:$PATH"
```

Use your clone path if it isn't `~/dev/r4r`.

### Dependencies

- [`gh`](https://cli.github.com/) (GitHub CLI), logged in
- `jq`, `curl`
- [`slackcli`](https://github.com/shaharia-lab/slackcli) for Slack drafts (not needed for `--copy`):

  ```bash
  brew tap shaharia-lab/tap && brew install slackcli
  slackcli auth parse-curl --login
  ```

  That writes `~/.config/slackcli/workspaces.json`. Do not commit it.

### GitHub → Slack map

Drafts resolve GitHub logins to Slack user IDs via `infrastructure/github-to-slack.json` in a local [clay-base](https://github.com/clay-run/clay-base) checkout (`~/dev/clay-base` by default). Override with `R4R_CLAY_BASE`.

### Raycast

Add this repo's `raycast/` folder as a Script Commands directory, **or** keep thin wrappers in `~/dev/raycast` that exec `$HOME/dev/r4r/r4r-from-browser`.

Grant Automation access when macOS prompts (System Events + your browser) so the front-tab URL can be read.

## Usage

```bash
r4r                         # live listen (paste a PR URL/number)
r4r 1234                    # one-shot against the default repo
r4r https://github.com/org/repo/pull/1234
r4r --copy <pr>             # clipboard only (no Slack draft)
r4r --dry-run <pr>          # preview; no label, no draft
r4r --channel C0123456789 <pr>
```

## Config

| Variable | Default | Purpose |
| --- | --- | --- |
| `R4R_SLACK_CHANNEL` | `C0A1HCU4PRB` | Slack channel id for drafts |
| `R4R_REPO` | `clay-run/clay-base` | GitHub repo when you pass a bare PR number |
| `R4R_CLAY_BASE` | `~/dev/clay-base` | Checkout that contains `github-to-slack.json` |
| `R4R_SLACKCLI_CONFIG` | `~/.config/slackcli/workspaces.json` | slackcli browser session |
| `R4R_LOG` | `~/Library/Logs/r4r.log` | Log file |
| `R4R_OPEN_SLACK` | `1` | Set `0` to skip opening Slack after drafting |
| `R4R_BIN` | this repo's `r4r` | Override the binary `r4r-from-browser` runs |

## What's not in this repo (on purpose)

- Slack `xoxc` / `xoxd` tokens and cookies
- `~/.config/slackcli/workspaces.json`
- `github-to-slack.json`
- Logs
