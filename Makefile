HOST_PATH ?= $(shell pwd)

REPO = docker-jupyter
TAG = develop
CONTAINER_NAME = docker-jupyter

GUEST_PATH = $(HOST_PATH)

CMD_JUPYTER = 'cd $(GUEST_PATH) && /bin/bash guest_run_notebook.sh'

ADB_PATH_HOST = $(shell which adb)
ADB_PATH_GUEST = '/usr/bin/adb'

SHARED_PATH_HOST = '/tmp/tt'
SHARED_PATH_GUEST = '/tmp/tt'

build: Dockerfile
	docker build \
	  --rm -t $(REPO):$(TAG) -f Dockerfile .

run_jupyter:
	docker run --rm \
	  --net host \
	  -v $(HOST_PATH):$(GUEST_PATH) \
	  -v $(ADB_PATH_HOST):$(ADB_PATH_GUEST) \
	  -v $(SHARED_PATH_HOST):$(SHARED_PATH_GUEST) \
	  -it \
	  --name $(CONTAINER_NAME) \
	  $(REPO):$(TAG) /bin/bash -c $(CMD_JUPYTER)
