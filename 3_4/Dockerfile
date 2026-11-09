FROM docker:29-cli

RUN apk add --no-cache git

WORKDIR /workspace

COPY builder.sh .

RUN chmod +x /builder.sh

ENTRYPOINT ["/builder.sh"]
