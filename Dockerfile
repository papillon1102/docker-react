
# Build phase
FROM node:14-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# This mean : copy folder /app/build from
# [ build phase ] to /usr/share/nginx/html
