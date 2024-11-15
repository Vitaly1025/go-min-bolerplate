# Minimalistic Multiservice Boilerplate

A streamlined boilerplate for multiservice projects with essential presets and tools to kickstart your development process.

## Features

- **Husky Hooks**: Pre-configured Husky hooks ensure adherence to commit standards and rules.
- **GolangCI Configuration**: Includes a preset `golangci` configuration file with commonly used linting settings.
- **Makefile Commands**: Simplifies project management with custom commands:
    - `create_project`: Creates a new service or component within the project.
    - `delete_project`: Removes an existing service or component.

### Makefile Command Usage

To **create a new project**:
```bash
make create_project PROJECT_NAME=NAME_OF_YOUR_NEW_PROJECT
```

To **delete existing project**:
```bash
make delete_project PROJECT_NAME=NAME_OF_YOUR_NEW_PROJECT
```
## Project structure
A well-organized structure to maintain clarity and scalability:

    .
    ├── cmd                       # Main entry points for applications/services
    ├── configs                   # Configuration files for different services or environments
    ├── internal                  # Internal packages (private to the project)
    ├── pkg                       # Reusable packages across multiple projects
    ├── scripts                   # Utility scripts (e.g., pre-commit hooks, deployment helpers)
    ├── tests                     # Test files and folders for unit and integration tests
    ├── Makefile                  # Automation commands for building, testing, and project management
    └── README.md                 # Project documentation
