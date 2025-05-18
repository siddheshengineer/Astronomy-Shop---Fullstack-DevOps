# Copyright The OpenTelemetry Authors
# SPDX-License-Identifier: Apache-2.0
# Modifications copyright (c) 2025 Siddhesh Nikam
#
# Arguments
ARG PYTHON_VERSION=3.12-slim-bookworm

# Build stage
FROM python:${PYTHON_VERSION} AS base

# Build time
FROM base AS builder
RUN apt-get -qq update \
    && apt-get install -y --no-install-recommends g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app/

COPY ./src/recommendation/requirements.txt ./

RUN pip install --upgrade pip && pip install --prefix="/reqs" -r requirements.txt


# Runtime
FROM base AS runtime
LABEL org.opencontainers.image.description="Project: Astronomy shop"

# runtime variables
ENV USER_NAME=secuser
ENV GROUP_NAME=secgroup
ENV USER_ID=8754
ENV GROUP_ID=4876

# Custom user
RUN addgroup --gid ${GROUP_ID} --system ${GROUP_NAME} && \
    adduser --system --uid ${USER_ID} --ingroup ${GROUP_NAME} ${USER_NAME} 

WORKDIR /usr/src/app/

COPY --from=builder /reqs /usr/local
COPY ./src/recommendation/ ./

# Change ownership
RUN chown -R ${USER_NAME}:${GROUP_NAME} /usr/src/app/

RUN opentelemetry-bootstrap -a install

USER ${USER_NAME}

EXPOSE ${RECOMMENDATION_PORT}
ENTRYPOINT [ "opentelemetry-instrument", "python", "recommendation_server.py" ]
