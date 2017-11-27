FROM ubuntu:trusty

RUN apt-get update -y && \
    apt-get install -y graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* debian/

ENTRYPOINT ["/usr/bin/dot"]
