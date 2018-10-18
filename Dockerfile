FROM alpine:3.4
RUN apk --no-cache add curl ca-certificates bash
RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
Run curl -Lo /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/v1.0.8/kustomize_1.0.8_linux_amd64
RUN chmod +x /usr/local/bin/kubectl
RUN chmod +x /usr/local/bin/kustomize
COPY update.sh /bin/
ENTRYPOINT ["/bin/bash"]
CMD ["/bin/update.sh"]
