# Claude Plugins

A collection of plugins for Claude Code.

## Plugins

### [clarify-ralph](./plugins/clarify-ralph)

Iterative requirement clarification using AskUserQuestion in a Ralph Wiggum-style loop.

**Install:**
```bash
claude plugin add yuhogyun/claude-plugins --subdir plugins/clarify-ralph
```

**Usage:**
```bash
/clarify-ralph "Add a login feature" --max-iterations 10
```

Transform vague requirements into precise specifications through structured questioning.

## Installation

### From GitHub

```bash
claude plugin add yuhogyun/claude-plugins --subdir plugins/<plugin-name>
```

### From Local Directory

```bash
git clone https://github.com/yuhogyun/claude-plugins.git
claude plugin add ./claude-plugins/plugins/<plugin-name>
```

## Plugin Structure

Each plugin follows this structure:

```
plugins/<plugin-name>/
├── .claude-plugin/
│   └── plugin.json      # Plugin metadata
├── commands/            # Slash commands
├── hooks/               # Event hooks
├── scripts/             # Shell scripts
└── README.md            # Documentation
```

## Contributing

1. Fork this repository
2. Create your plugin in `plugins/<your-plugin-name>/`
3. Follow the plugin structure above
4. Submit a pull request

## License

MIT
