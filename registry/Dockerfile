FROM samalba/docker-registry:lastest

ADD config.yml docker-registry/config/config.yml

CMD cd /docker-registry && ./setup-configs.sh && ./run.sh
