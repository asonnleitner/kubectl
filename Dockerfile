FROM centos:8 as builder

WORKDIR /etc/yum.repos.d

COPY . .

RUN yum install -y kubectl jq

RUN echo $(kubectl version --client --output json | jq -r '.clientVersion.gitVersion') > /.kubectl_version

FROM alpine:latest as production

RUN apk update && apk upgrade

COPY --from=builder /usr/bin/kubectl /usr/bin/kubectl

COPY --from=builder /.kubectl_version /.kubectl_version

RUN addgroup -g 1000 kubectl && adduser -G kubectl -g kubectl -s /bin/sh -D kubectl

USER kubectl

ENTRYPOINT ["/usr/bin/kubectl"]
