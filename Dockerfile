FROM ubuntu:latest

RUN useradd -s "/sbin/nologin" server-runner
USER server-runner

COPY --chown=444 ./build ./build
COPY --chown=744 ./server /usr/local/bin/server

ENV PORT=8080
ENV STATIC_SERVER_FALLBACK_FILE="build/index.html"

EXPOSE 8080

CMD ["server"]

