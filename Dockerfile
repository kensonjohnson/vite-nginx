# Step 1: Build the application
FROM node:22-alpine AS builder
WORKDIR /app
COPY . .
RUN npm ci
RUN npm run build

# Step 2: Set up the production environment
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html