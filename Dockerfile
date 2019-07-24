FROM debian:buster AS base

RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y --no-install-recommends apt-utils squid-deb-proxy avahi-utils
RUN apt-get remove -y apt-utils
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /var/cache/squid-deb-proxy
RUN ln -s /dev/stderr /var/log/squid/access.log
RUN ln -s /dev/stderr /var/log/squid/cache.log

COPY start_squid.sh /root/

# Workaround the problem that multi-stage build cannot copy files between stages when 
# usernamespace is enabled.
RUN chown -R root:root $(ls / | grep -v -e "dev" -e "sys" -e "tmp" -e "proc") || echo

FROM debian:buster
COPY --from=base / /
CMD ["/root/start_squid.sh"]
EXPOSE 8000
