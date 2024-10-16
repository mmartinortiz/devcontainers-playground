FROM python:3.12-slim AS base

ENV VIRTUAL_ENV=/opt/venv
ENV PATH="${VIRTUAL_ENV}/bin:$PATH"

RUN <<EOT bash
  groupadd --system dst
  useradd --system --home-dir /home/dst --gid dst --no-user-group dst
EOT

# The trailing slash makes COPY create `/_lock/` automagically
COPY pyproject.toml /_lock/

# USER dst
RUN --mount=type=cache,target=/home/dst/.cache <<EOT bash
  cd /_lock
  python -m venv $VIRTUAL_ENV
  $VIRTUAL_ENV/bin/python -m pip install --editable=.
EOT

COPY app /app

FROM base AS devcontainer

COPY --from=base --chown=dst:dst /app/ /app/
COPY --from=base --chown=dst:dst /opt/venv/ /opt/venv/
COPY pyproject.toml /_lock/

RUN --mount=type=cache,target=/home/dst/.cache <<EOT bash
  cd /_lock
  $VIRTUAL_ENV/bin/python -m pip install --editable=.[dev,test]
EOT

FROM base AS production

COPY --from=base --chown=dst:dst /app/ /app/
COPY --from=base --chown=dst:dst /opt/venv/ /opt/venv/

USER dst

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]
