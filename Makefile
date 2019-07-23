.PHONY: build run
build: 
	docker build . --tag="apt-cache"

run: build
	./run_cache.sh apt-caching apt-cache 8000 /var/cache/squid-deb-proxy
