readme_robot = """# 🤖 Robot Framework + Browser Library (Playwright) BDD Framework

[![Robot Framework CI](https://github.com/bfsouza/robot-framework-bdd-sdet/actions/workflows/robot-ci.yml/badge.svg)](https://github.com/bfsouza/robot-framework-bdd-sdet/actions)
![Robot Framework](https://img.shields.io/badge/Robot%20Framework-6.x-000000?style=flat&logo=robot-framework)
![Python](https://img.shields.io/badge/Python-3.10%2B-3776AB?style=flat&logo=python)
![Playwright](https://img.shields.io/badge/Browser%20Library-Playwright-45BA4B?style=flat&logo=playwright)
![Docker](https://img.shields.io/badge/Docker-Supported-2496ED?style=flat&logo=docker)

> End-to-End (E2E) web automation testing framework built with **Robot Framework** and the modern **Browser Library** (powered by Playwright). Demonstrates BDD/Gherkin test design, modular keyword-driven Page Object architecture, dynamic data management, and CI/CD integration.

---

## 🎯 Target Application

Tests are executed against the **[ServeRest](https://serverest.dev/)** front-end application:
* **Web UI:** `https://front.serverest.dev`

---

## 🏗️ Architecture & Best Practices

This framework adopts a clean Keyword-Driven Page Object Model architecture:

* **Browser Library Engine:** Uses Playwright under the hood for blazing-fast, reliable execution without flakiness or manual sleep waits.
* **BDD/Gherkin Style:** High-level human-readable scenarios business stakeholders can easily audit.
* **Page Object Design (Resource-based):** Clear separation between element locators, page actions (keywords), and test specifications.
* **Built-in HTML Reporting:** Generates native Robot Framework `log.html` and `report.html` execution reports containing embedded screenshots for failed steps.

```text
├── .github/workflows/   # CI/CD pipeline (GitHub Actions)
├── resources/
│   ├── base.resource    # Global variables, setup, and teardown keywords
│   ├── pages/           # Encapsulated Page Objects and Locators
│   │   ├── login_page.resource
│   │   └── home_page.resource
│   └── fixtures/        # Test data and dynamic payload generators
├── tests/               # BDD Test Suites
│   ├── login.robot
│   └── usuarios.robot
├── .gitignore
├── requirements.txt     # Python dependencies
└── README.md
