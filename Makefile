# Variables
DOCKER_IMAGE_LINTER=alvarofpp/python-linter:latest
ROOT=$(shell pwd)
LINT_COMMIT_TARGET_BRANCH=origin/main
DOCKER_COMMAND=docker run --rm -v ${ROOT}:/work ${DOCKER_IMAGE}

# Commands
.PHONY: lint
lint:
	@docker pull ${DOCKER_IMAGE_LINTER}
	@docker run --rm -v ${ROOT}:/app ${DOCKER_IMAGE_LINTER} " \
		lint-commit ${LINT_COMMIT_TARGET_BRANCH} \
		&& lint-markdown \
		&& lint-python"