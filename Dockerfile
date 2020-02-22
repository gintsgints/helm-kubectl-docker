FROM alpine:3.4

LABEL maintainer="Gints Polis <polis.gints@gmail.com>"
LABEL description="Image to deploy applications to digital ocean with helm and kubectl"

ENV KUBE_LATEST_VERSION=v1.11.2
ENV HELM_VERSION=v3.1.1
ENV HELM_FILENAME=helm-${HELM_VERSION}-linux-amd64.tar.gz


RUN apk add --update ca-certificates \
 && apk add --update gettext tar gzip \
 && apk add --update curl  \
 && curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl \
 && curl -L https://get.helm.sh/${HELM_FILENAME} | tar xz && mv linux-amd64/helm /bin/helm && rm -rf linux-amd64 \
 && chmod +x /usr/local/bin/kubectl \
 && rm /var/cache/apk/*

CMD ["helm"]
