# Vulture

**Vulture** is a powerful CLI tool designed to automate the process of visual regression testing by comparing screenshots of web pages. Inspired by BBC's Wraith, Vulture captures screenshots of two URLs at multiple resolutions and generates a "diff" image that highlights visual differences between the pages. It's ideal for developers, testers, and designers who want to ensure consistency across different versions of a website or between different environments.

**Key Features:**
- **Cross-Platform:** Works seamlessly on Windows, Linux, and macOS.
- **Flexible Comparison:** Allows comparing two URLs side-by-side or monitoring changes over time.
- **Customizable Resolutions:** Supports multiple screen resolutions for responsive testing.
- **Integration-Ready:** Easily integrates with CI/CD pipelines, ensuring automated visual testing for every deployment.
- **Comprehensive Reporting:** Generates an HTML report to visually display differences, making it easy to share results with your team.

## Installation Instructions

### 1. Clone the Repository

Open a terminal or command prompt and run:

```sh
git clone https://github.com/zeusssz/vulture.git
cd vulture
```

### 2. Install Dependencies

#### **For Windows:**

1. **Install Ruby:**
   - Download the Ruby installer from [RubyInstaller for Windows](https://rubyinstaller.org/).
   - Run the installer and ensure "Add Ruby to PATH" is checked.

2. **Install ImageMagick:**
   - Download the installer from [ImageMagick Download](https://imagemagick.org/script/download.php#windows).
   - Install and ensure "Install legacy utilities (e.g., convert)" is selected.

3. **Install ChromeDriver:**
   - Download the version matching your installed Chrome browser from [ChromeDriver Downloads](https://sites.google.com/chromium.org/driver/).
   - Extract the `chromedriver.exe` and add it to your system `PATH`.

4. **Install Selenium WebDriver:**
   
   Open the Command Prompt and run:

   ```sh
   gem install selenium-webdriver
   ```

#### **For Linux:**

1. **Install Ruby:**

   On Debian/Ubuntu-based distributions:

   ```sh
   sudo apt update
   sudo apt install ruby-full
   ```

   On Red Hat-based distributions (Fedora, CentOS):

   ```sh
   sudo dnf install ruby
   ```

2. **Install ImageMagick:**

   On Debian/Ubuntu:

   ```sh
   sudo apt install imagemagick
   ```

   On Red Hat/Fedora:

   ```sh
   sudo dnf install ImageMagick
   ```

3. **Install Google Chrome and ChromeDriver:**

   For Debian/Ubuntu:

   ```sh
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt --fix-broken install
   ```

   For Red Hat/Fedora:

   ```sh
   sudo dnf install google-chrome-stable
   ```

4. **Install Selenium WebDriver:**

   ```sh
   gem install selenium-webdriver
   ```

#### **For macOS:**

1. **Install Homebrew** (if not already installed):

   ```sh
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Ruby, ImageMagick, and ChromeDriver:**

   ```sh
   brew install ruby imagemagick chromedriver
   ```

3. **Install Selenium WebDriver:**

   ```sh
   gem install selenium-webdriver
   ```

### 3. Make the Script Executable

Make the script executable by running:

```sh
chmod +x vulture.rb
```

### 4. Move to a Directory in Your PATH

Move the script to a directory in your `PATH` to make it globally accessible:

- **macOS/Linux:**

  ```sh
  sudo mv vulture.rb /usr/local/bin/vulture
  ```

- **Windows:**

  Add the path to `vulture.rb` to the system `PATH` variable.

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
