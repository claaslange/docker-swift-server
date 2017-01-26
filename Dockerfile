from swift

ARG SWIFT_ENV
WORKDIR /app

COPY Package.swift /app/Package.swift

RUN swift build --configuration $SWIFT_ENV

COPY . /app

RUN swift build --configuration $SWIFT_ENV
