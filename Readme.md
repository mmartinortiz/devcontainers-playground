# Devcontainers playground

## Getting started

Before opening the project with VS Code, create a `.env` file with the following content:

```bash
SECRET=MySecret
```

The content of the `SECRET` variable is not really important, but it is used to illustrate how to pass environment variables to the container.

## Running tests

A playground to learn and experiment with [devcontainers](https://containers.dev/).

```bash
# Running tests
python -m pytest
```

## Image size

The importance of using `slim` images to build small images:

| Image                 | Size   |
|-----------------------|--------|
| pyfoo-dev-slim        | 235MB  |
| pyfoo-production-slim | 185MB  |
| pyfoo-dev             | 1.12GB |
| pyfoo-production      | 1.07GB |
