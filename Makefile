#!make

SHELL := /bin/sh -x
DOT_ENV ?= ./.env

all: build dgoss-validate
all-ci: build dgoss-validate-ci

build:
	@set -a; . $(DOT_ENV); \
	cekit --verbose build docker --tag $$IMAGE_BROKER_KUBERNETES

# prepare-validate-metadata:
# 	@set -a; . $(DOT_ENV); \
# 	tests/scripts/prepare.sh $$IMAGE_BROKER_KUBERNETES

# goss-validate-metadata: clean prepare-validate-metadata
# 	@set -a; . $(DOT_ENV); \
# 	goss --gossfile metadata-validate.goss.yaml validate

dgoss-validate:
	@set -a; . $(DOT_ENV); \
	dgoss run --hostname artemis-broker --env-file $(DOT_ENV) $$IMAGE_BROKER_KUBERNETES

dgoss-validate-ci: dgoss-validate
	@set -a; . $(DOT_ENV); \
	GOSS_OPTS="--format junit --format-options verbose" dgoss run --hostname artemis-broker --env-file $(DOT_ENV) $$IMAGE_BROKER_KUBERNETES > validate_results.junit.xml

dgoss-validate-existing:
	@set -a; . $(DOT_ENV); \
	dgoss run --hostname artemis-broker --env-file $(DOT_ENV) $(IMAGE)

clean:
	@rm -rf tests/verify
