# Claude Plugins

A marketplace of custom plugins for Claude Code.

## Installation

### 1. Add Marketplace (Terminal)

```bash
claude plugin marketplace add zettalyst/claude-plugins
```

### 2. Update Marketplace (Terminal)

```bash
claude plugin marketplace update
```

### 3. Install Plugin (Terminal)

```bash
claude plugin install clarify-ralph@zettalyst-plugins
```

### 4. Restart Claude Code

Restart Claude Code to load the new plugin.

## Available Plugins

### [clarify-ralph](./plugins/clarify-ralph)

Iterative requirement clarification using AskUserQuestion in a Ralph Wiggum-style loop.

**Usage (inside Claude Code):**
```
/clarify-ralph "Add a login feature" --max-iterations 10
```

Transform vague requirements into precise specifications through structured questioning.

**Features:**
- One question at a time using AskUserQuestion
- User-controlled completion via "Clarification complete" option
- Max iterations safety limit
- Before/After requirement summary output

## Quick Reference

### Terminal Commands (CLI)

| Command | Description |
|---------|-------------|
| `claude plugin marketplace add zettalyst/claude-plugins` | Add this marketplace |
| `claude plugin marketplace update` | Update marketplace cache |
| `claude plugin install clarify-ralph@zettalyst-plugins` | Install clarify-ralph |
| `claude plugin uninstall clarify-ralph` | Uninstall plugin |

### Slash Commands (inside Claude Code)

| Command | Description |
|---------|-------------|
| `/clarify-ralph "<requirement>"` | Start clarification loop |
| `/cancel-clarify` | Cancel active loop |
| `/help` | Show plugin help |

## Marketplace Structure

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json    # Marketplace manifest
├── plugins/
│   └── clarify-ralph/      # Plugin directory
│       ├── .claude-plugin/
│       │   └── plugin.json
│       ├── commands/
│       ├── hooks/
│       ├── scripts/
│       └── README.md
└── README.md
```

## Contributing

1. Fork this repository
2. Create your plugin in `plugins/<your-plugin-name>/`
3. Add entry to `.claude-plugin/marketplace.json`
4. Submit a pull request

## License

MIT
