FROM python:3.13.11-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:0.9.1 /uv /bin/uv
WORKDIR /app
ENV UV_COMPILE_BYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_PYTHON_DOWNLOADS=0 \
    PATH="/app/.venv/bin:$PATH" \
    PYTHONUNBUFFERED=1
COPY pyproject.toml uv.lock ./
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --locked --no-dev --no-install-project
COPY inspect_source.py ingest.py ingest_months.py ingest_hashed.py load_zones.py ./
COPY sql ./sql
COPY tests ./tests
RUN useradd --create-home student
USER student
ENTRYPOINT ["python"]
CMD ["ingest.py"]
