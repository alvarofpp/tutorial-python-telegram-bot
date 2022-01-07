FROM python:3.9-alpine3.15
# FROM python:3.10.1

# Set environment variables
ENV WORKDIR=/app
ENV CRYPTOGRAPHY_DONT_BUILD_RUST=1

# Install programs
RUN apk add --update --no-cache \
    gcc \
    libc-dev \
    libffi-dev

# Install requirements
RUN pip3 install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

# Workdir
WORKDIR ${WORKDIR}
