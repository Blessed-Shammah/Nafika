---
name: nafika-ui-builder
description: >-
  Use this skill when building Flutter UI for the Nafika app autonomously. It contains guidelines for preventing UI overflows, structuring code, and acting as a "superclaude" to do one-off comprehensive implementation runs without requiring constant user approval.
---

# Nafika UI Builder

This skill provides instructions for autonomously building the Nafika app's user interface in Flutter.

## Core Directives (Superclaude Mode)

1. **Autonomous Execution:** Do not stop to ask for the user's approval on every small UI decision. Make informed, professional design choices and implement them completely.
2. **Subagents for Parallel Work:** If building multiple screens, use the `invoke_subagent` tool to delegate tasks (e.g., have one subagent build the Home Screen while another builds the Virtual Queue Screen).

## UI & Design Guidelines

To avoid UI issues like overflows and to ensure a polished look:

* **Prevent Overflows:** 
  * Always wrap scrollable content in `SingleChildScrollView`, `ListView`, or `CustomScrollView`.
  * Use `Expanded` or `Flexible` when placing widgets inside a `Column` or `Row` that might exceed the screen bounds.
  * Always wrap your main scaffold body with `SafeArea` to avoid overlaps with the notch and system bars.
* **Responsive Design:** Use `MediaQuery` or `LayoutBuilder` to adapt sizing for different screen sizes, especially for small mobile devices.
* **Theming:** Create a dedicated `theme.dart` or use `ThemeData` in `main.dart` to define consistent colors (e.g., a dark theme suited for a night transit app) and text styles. Do not hardcode colors in every widget.
* **Componentization:** Break down complex screens into smaller, reusable widgets inside a `lib/widgets/` directory.

## Steps for Implementation

1. **Setup Theme & Main App:** Update `lib/main.dart` with the Nafika theme and routing.
2. **Implement Screens:** Create a `lib/screens/` directory and add `home_screen.dart`, `queue_screen.dart`, etc.
3. **Run Code Validation:** Use `flutter analyze` to ensure there are no syntax or typing errors before concluding the task.

Remember: Build thoroughly and autonomously.
