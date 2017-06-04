FROM microsoft/dotnet AS dist
RUN apt-get update \
 && apt-get install -y --no-install-recommends unzip \
 && curl -sSL https://aka.ms/getvsdbgsh | bash /dev/stdin -v latest -l /vsdbg \
 && rm -rf /var/lib/apt/lists/*

FROM busybox
COPY --from=dist /vsdbg /vsdbg