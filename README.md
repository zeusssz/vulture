# ![VultSmall](https://github.com/user-attachments/assets/8788f26e-76d8-471f-b341-5de48dfcc088) Vulture

**Vulture** is a powerful CLI tool designed to automate visual regression testing by comparing screenshots of web pages. Vulture captures screenshots of two URLs at multiple resolutions and generates a "diff" image highlighting visual differences. It's ideal for developers, testers, and designers who want to ensure consistency across different versions of a website or between different environments.

## Key Features

- **Cross-Platform:** Works seamlessly on Windows, Linux, and macOS.
- **Flexible Comparison:** Compare two URLs side-by-side or monitor changes over time.
- **Customizable Resolutions:** Supports multiple screen resolutions for responsive testing.
- **Integration-Ready:** Easily integrates with CI/CD pipelines for automated visual testing.
- **Comprehensive Reporting:** Generates an HTML report to visually display differences.

## Installation

You can install **Vulture** from [RubyGems](https://rubygems.org/gems/vulture) or GitHub Packages.

### 1. Install from RubyGems

To install the latest version from RubyGems, run:

```sh
gem install vulture
```

### 2. Install from GitHub Packages

To install **Vulture** from GitHub Packages, you'll need to authenticate with GitHub and add GitHub Packages as a source. Add the following to your `.gemrc` file:

```sh
---
:backtrace: false
:bulk_threshold: 1000
:sources:
- https://rubygems.org/
- https://rubygems.pkg.github.com/zeusssz
:update_sources: true
:verbose: true
```

Then, run:

```sh
gem install vulture --source=https://rubygems.pkg.github.com/zeusssz
```

## Usage

Run **Vulture** by providing two URLs for comparison:

```sh
vulture <url1> <url2>
```

### Example

To compare the homepage and the "About" page of a website:

```sh
vulture https://example.com https://example.com/about
```

## License

**Vulture** is released under the MIT License. See the [LICENSE](LICENSE) file for details.
