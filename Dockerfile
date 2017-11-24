FROM node:6.12.0-alpine AS builder
WORKDIR /src
ADD package.json .
RUN yarn
ADD . .
RUN yarn build

FROM node:8.9.1-alpine
WORKDIR /src
COPY --from=builder /src .
CMD ["yarn", "start"]
