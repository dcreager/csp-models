.PHONY: all build-docker

all: build-docker

build-docker:
	docker build -t dcreager/fdr .
