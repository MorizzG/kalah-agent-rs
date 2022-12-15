FROM rust:latest as builder

WORKDIR /usr/src/kalah
COPY . .
RUN cargo install --path .

FROM debian:bullseye-slim

# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/kalah /usr/local/bin/kalah

CMD ["kalah"]