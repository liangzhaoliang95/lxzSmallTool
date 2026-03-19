# Lxz Small Tool

> A cross-platform desktop utility suite for Windows and macOS (x86/ARM).

[中文](./README.md)

---

## Download

Visit the [Releases](https://github.com/liangzhaoliang95/lxzSmallTool/releases) page to download the latest version:

| Platform | File |
|----------|------|
| macOS (arm64 / x86_64) | `lxzSmallTool_macos_arm64.dmg` |
| Windows x64 | `lxzSmallTool_setup.exe` |

## Screenshots

![DNS Tool](./docs/image/dnsTool.png)

## Features

### DNS Tool
- Detect current system DNS configuration
- One-click switch to popular public DNS servers (Alibaba, Tencent, Google, Cloudflare, 114)
- Restore automatic DNS (DHCP)
- Manage multiple network interfaces

## Tech Stack

| Library | Purpose |
|---------|---------|
| Flutter 3.x | Cross-platform UI framework |
| flutter_riverpod | State management |
| go_router | Routing |
| sidebarx | Sidebar navigation |
| window_manager | Window management |
| url_launcher | Open external links |

## Permissions

### macOS
- App Sandbox is disabled to allow system command execution
- A system authorization dialog (admin password required) appears when changing DNS
- Cannot be distributed via Mac App Store — direct distribution only

### Windows
- Must be run as Administrator
- UAC prompt appears on launch

## Development

### Prerequisites

- Flutter 3.x
- **macOS**: Xcode required — run `sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer`
- **macOS**: CocoaPods required — run `sudo gem install cocoapods`

### Run

```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows
```

### Build

```bash
# macOS Universal Binary (arm64 + x86_64)
flutter build macos --release

# Windows
flutter build windows --release
```

### Verify macOS Universal Binary

```bash
lipo -info build/macos/Build/Products/Release/lxzSmallTool.app/Contents/MacOS/lxzSmallTool
# Expected: Architectures in the fat file: arm64 x86_64
```

## Project Structure

```
lib/
├── core/
│   ├── constants/        # App constants and DNS presets
│   └── theme/            # Material 3 theme
├── features/
│   ├── dns/
│   │   ├── data/         # DNS service abstraction and platform implementations
│   │   ├── models/       # Data models
│   │   ├── providers/    # Riverpod providers
│   │   └── ui/           # UI components
│   └── about/
│       └── ui/           # About page
└── shared/
    ├── layout/           # App layout (sidebar)
    └── widgets/          # Shared widgets
```

## Adding New Features

1. Create a new feature directory under `lib/features/`
2. Add a sidebar item in `lib/shared/layout/app_shell.dart`
3. Register the route in `lib/app.dart`

## License

[MIT](./LICENSE)
