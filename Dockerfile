# Multi-stage build for FanSwoon application with optimized caching

# Stage 1: Client dependencies
FROM node:18-alpine as client-deps
WORKDIR /app/client
# Copy only package files for dependency installation
COPY client/package*.json ./
# Install dependencies with cache
RUN npm ci

# Stage 2: Build the React client
FROM client-deps as client-builder
WORKDIR /app/client
# Copy client source code
COPY client/ ./
# Build the client
RUN npm run build

# Stage 3: Server dependencies
FROM node:18-alpine as server-deps
WORKDIR /app/server
# Copy only package files for dependency installation
COPY server/package*.json ./
# Install production dependencies with cache
RUN npm ci --only=production

# Stage 4: Production environment
FROM node:18-alpine
WORKDIR /app

# Create necessary directories
RUN mkdir -p /app/client/build /app/server /app/uploads/profile /app/uploads/audio

# Copy built client from the client-builder stage
COPY --from=client-builder /app/client/build /app/client/build

# Copy server dependencies from server-deps stage
COPY --from=server-deps /app/server/node_modules /app/server/node_modules

# Copy server files
COPY server/ /app/server/

# Set working directory to server
WORKDIR /app/server

# Create a non-root user and switch to it
RUN addgroup -g 1001 -S appuser && \
    adduser -u 1001 -S appuser -G appuser
RUN chown -R appuser:appuser /app
USER appuser

# Expose the port the server listens on
EXPOSE 5001

# Set environment variables
ENV NODE_ENV=production
ENV PORT=5001

# Start the server
CMD ["node", "server.js"]
