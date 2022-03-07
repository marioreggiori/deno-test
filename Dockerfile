FROM denoland/deno:alpine AS build
WORKDIR /usr/src/app
COPY . .
RUN deno bundle -q app.ts bundle.ts
RUN deno compile --no-prompt --no-check --allow-net bundle.ts

FROM denoland/deno:alpine
COPY --from=build /usr/src/app/bundle /app
CMD ["/app"]
