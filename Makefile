.PHONY: build run
build: 
	docker build . --tag="nobodyxu/apt-cache"

run:
	./run_cache.sh apt-caching nobodyxu/apt-cache 8000 /var/cache/squid-deb-proxy apt-cache
