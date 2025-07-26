# Contributing to Human Readable Formats

Thank you for your interest in contributing to Human Readable Formats! We welcome contributions from the community to help improve this package.

## Code of Conduct

This project and everyone participating in it is governed by our [Code of Conduct](CODE_OF_CONDUCT.md). By participating, you are expected to uphold this code.

## How to Contribute

### Reporting Issues

If you find a bug or have a feature request, please [open an issue](https://github.com/sdkwala/human-readable-formats-flutter/issues/new/choose) on GitHub. When reporting a bug, please include:

- A clear description of the issue
- Steps to reproduce the problem
- Expected vs. actual behavior
- Version of the package you're using
- Any relevant code or error messages

### Making Changes

1. **Fork the repository** on GitHub
2. **Clone your fork** to your local machine
   ```bash
   git clone https://github.com/your-username/human-readable-formats-flutter.git
   cd human-readable-formats-flutter
   ```
3. **Create a new branch** for your changes
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b bugfix/issue-number-short-description
   ```
4. **Make your changes** following the coding style of the project
5. **Run the tests** to ensure everything works
   ```bash
   dart test
   ```
6. **Commit your changes** with a clear and descriptive commit message
   ```bash
   git commit -m "Add feature: short description of changes"
   ```
7. **Push your changes** to your fork
   ```bash
   git push origin your-branch-name
   ```
8. **Open a Pull Request** on the original repository

### Code Style

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` to format your code
- Write tests for new features and bug fixes
- Update documentation when adding new features or changing behavior

### Testing

- Ensure all tests pass before submitting a pull request
- Add tests for any new functionality
- Update tests if you're fixing a bug

## Development Setup

1. Ensure you have the latest stable version of the Dart SDK installed
2. Get the dependencies:
   ```bash
   dart pub get
   ```
3. Run the tests:
   ```bash
   dart test
   ```

## Pull Request Process

1. Ensure your code follows the project's style and passes all tests
2. Update the CHANGELOG.md with details of your changes
3. Update the README.md if you're adding new features or changing existing behavior
4. Your pull request should target the `main` branch
5. The project maintainers will review your pull request and provide feedback

## License

By contributing to this project, you agree that your contributions will be licensed under the project's [MIT License](LICENSE).
