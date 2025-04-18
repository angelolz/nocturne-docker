FROM node:20 AS builder
RUN apt-get update && apt-get install -y git
WORKDIR /nocturne-ui

RUN git clone https://github.com/usenocturne/nocturne-ui .

RUN npm install
RUN npm install sharp
RUN npm run build

FROM node:20 AS runner
WORKDIR /nocturne-ui

COPY --from=builder /nocturne-ui/.next/standalone ./
COPY --from=builder /nocturne-ui/.next/static ./.next/static
COPY --from=builder /nocturne-ui/public ./public

EXPOSE 3000
CMD ["node", "server.js"]
