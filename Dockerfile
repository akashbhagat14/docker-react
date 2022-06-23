## Tagged the block as builder
FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build 


## /app/build will have the files/dependencies created in previous block
## New block for nginx container

FROM nginx
EXPOSE 80

## Copying files from builder block /app/build
COPY --from=builder /app/build /usr/share/nginx/html






