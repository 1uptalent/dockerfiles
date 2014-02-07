
DOCKER_DIRS := haproxy-1.5 registry ruby-2.0 ruby-2.1
.PHONY: all $(DOCKER_DIRS)

all: $(DOCKER_DIRS)

$(DOCKER_DIRS):
	docker build -rm -t 1uptalent/$@ $@

