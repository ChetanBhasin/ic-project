FROM rust:1.72 as build
ENV PKG_CONFIG_ALLOW_CROSS=1

WORKDIR /usr/src/s3-load-test
COPY . .

RUN cargo install --path .

FROM gcr.io/distroless/cc-debian12

COPY --from=build /usr/local/cargo/bin/s3-load-test /usr/local/bin/others-api

CMD ["s3-load-test"]
