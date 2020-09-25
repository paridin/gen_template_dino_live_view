.PHONY: help

VERSION := $(shell grep 'version:' mix.exs | cut -d '"' -f2)
IMAGE_NAME := $(shell grep -Eo 'app: :[a-z]+' mix.exs | grep -Eo ':[a-z]+' | cut -c 2-)
# AWS_REPO := <AWS_ID>.dkr.ecr.us-east-1.amazonaws.com/<AWS_REPO_NAME>

help:
	@echo "$(IMAGE_NAME):$(VERSION)"
	@perl -nle'print $& if m{^[a-zA-Z_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

run: ## run the latest tag image
	docker run \
		-e SECRET_KEY_BASE=$(shell mix phx.gen.secret) \
		-e HTTP_PORT=80 \
		-e URL_PORT=443 \
		-e HTTP_HOST=localhost \
		-e HTTP_ORIGINS="https://localhost" \
		-it -p 443:443 $(IMAGE_NAME):latest

sh: ## Boot to a shell prompt
	docker run \
		-e SECRET_KEY_BASE=$(shell mix phx.gen.secret) \
		-e HTTP_PORT=80 \
		-e URL_PORT=443 \
		-e HTTP_HOST=localhost \
		-e HTTP_ORIGINS="https://localhost" \
		--rm -it $(IMAGE_NAME):$(VERSION) /bin/bash

build: ## Build the Docker image, in case you need authenticate with private repos add the following args --build-arg HEX_ORG_NAME=$(HEX_ORG_NAME) --build-arg HEX_ORG_TOKEN=$(HEX_ORG_TOKEN) 
	# docker build --build-arg SECRET_KEY_BASE=$(shell mix phx.gen.secret) --build-arg COOKIE=$(shell mix phx.gen.secret) --force-rm -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest -t $(AWS_REPO):$(VERSION) -t $(AWS_REPO):latest -f Dockerfile .
	docker build --build-arg SECRET_KEY_BASE=$(shell mix phx.gen.secret) --build-arg COOKIE=$(shell mix phx.gen.secret) --force-rm -t $(IMAGE_NAME):$(VERSION) -t $(IMAGE_NAME):latest -f Dockerfile .

clean: ## Clean up generated images
	@docker rmi --force $(IMAGE_NAME):$(VERSION) $(IMAGE_NAME):latest $(AWS_REPO):$(VERSION) $(AWS_REPO):latest

rebuild: clean build ## Rebuild the Docker image

release: build ## Rebuild and release the Docker image to Docker Hub
	# docker push $(AWS_REPO):$(VERSION)
	# docker push $(AWS_REPO):latest
	docker push $(IMAGE_NAME):$(VERSION)
	docker push $(IMAGE_NAME):latest