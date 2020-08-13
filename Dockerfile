FROM alpine:latest
RUN apk --no-cache add ca-certificates

ENV KUBEVAL_RELEASE kubeval-linux-amd64.tar.gz
ENV KUBEVAL_RELEASE_CHECKSUMS checksums.txt
ENV KUBEVAL_VERSION 0.15.0
ENV KUBEVAL_SHA256 6fcf70aae5bc64870c358fac153cdfdc93f55d8bae010741ecce06bb14c083ea

RUN wget -O ${KUBEVAL_RELEASE} https://github.com/instrumenta/kubeval/releases/download/${KUBEVAL_VERSION}/${KUBEVAL_RELEASE} \
 && wget -O ${KUBEVAL_RELEASE_CHECKSUMS} https://github.com/instrumenta/kubeval/releases/download/0.15.0/${KUBEVAL_RELEASE_CHECKSUMS} \
 && grep "$(sha256sum ${KUBEVAL_RELEASE})" ${KUBEVAL_RELEASE_CHECKSUMS} \
 && tar -xzvf ${KUBEVAL_RELEASE} \
 && mv kubeval /usr/local/bin \
 && rm -rf ${KUBEVAL_RELEASE} ${KUBEVAL_RELEASE_CHECKSUMS}

ENTRYPOINT ["kubeval"]
CMD ["--help"]
