FROM alpine:latest
MAINTAINER Chance Hudson

RUN apk add --no-cache nodejs nodejs-npm git python g++ make

WORKDIR /root

RUN npm install libp2p-webrtc-star

FROM alpine:latest

RUN apk add --no-cache nodejs
COPY --from=0 /root /root

CMD ["node", "/root/node_modules/libp2p-webrtc-star/src/sig-server/bin.js"]
