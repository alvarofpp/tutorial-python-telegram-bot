# Variables
BOT_NAME=tutorial-telegram-bot
ROOT=$(shell pwd)

## Lint
DOCKER_IMAGE_LINTER=alvarofpp/python-linter:latest
LINT_COMMIT_TARGET_BRANCH=origin/main

# Commands
.PHONY: build
build:
	@docker build -t ${BOT_NAME} .

.PHONY: build-no-cache
build-no-cache:
	@docker build --no-cache -t ${BOT_NAME} .

.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-python"

.PHONY: run
run:
	@docker run --rm -v ${ROOT}:/app --network=host \
		${BOT_NAME} python3 main.py
