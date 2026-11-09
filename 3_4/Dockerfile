FROM docker:29-cli

RUN apk add --no-cache git

WORKDIR /workspace

COPY builder.sh .

ENTRYPOINT ["/workspace/builder.sh"]
