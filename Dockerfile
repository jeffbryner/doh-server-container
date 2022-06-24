FROM alpine:latest

RUN addgroup --gid 10001 --system nonroot \
    && adduser  --uid 10000 --system --ingroup nonroot --home /home/nonroot nonroot

RUN apk add --no-cache tini
RUN apk add --no-cache bind-tools
RUN apk add cargo
RUN cargo install --root /usr doh-proxy


#USER nonroot
EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--", "/usr/bin/doh-proxy"]
CMD ["--allow-odoh-post", "--listen-address","0.0.0.0:3000"]