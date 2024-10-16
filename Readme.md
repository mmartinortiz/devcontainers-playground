# Devcontainers playground

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
