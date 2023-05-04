# syntax = docker/dockerfile:1.2
FROM nixos/nix:latest AS builder

RUN mkdir /tmp/nix-store-closure
COPY . /tmp/build
WORKDIR /tmp/build

RUN \
    #--mount=type=cache,target=/nix/store,from=nixos/nix:latest,source=/nix/store \
    nix \
    --extra-experimental-features "nix-command flakes" \
    --option filter-syscalls false \
    --show-trace \
    --log-format raw \
    build . \
    && cp -R $(nix-store -qR result/) /tmp/nix-store-closure

FROM scratch

WORKDIR /app

COPY --from=builder /tmp/nix-store-closure /nix/store
COPY --from=builder /tmp/build/result /app
ENTRYPOINT ["/app/bin/github-linguist"]

