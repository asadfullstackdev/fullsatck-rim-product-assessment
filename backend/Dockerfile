# Stage 1: Build stage
FROM elixir:1.14-alpine AS build

# Set environment variables
ENV MIX_ENV=prod
ENV LANG=C.UTF-8

# Install dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new 1.5.9 --force

# Set working directory
WORKDIR /app

# Copy the project files
COPY . .

# Install dependencies and compile the application
RUN mix deps.get --only prod
RUN mix compile

# Stage 2: Release stage
FROM elixir:1.14-alpine

# Set environment variables
ENV MIX_ENV=prod
ENV LANG=C.UTF-8
ENV DATABASE_URL=postgresql://postgres:postgres@postgres_db:5432/backend_dev
ENV SECRET_KEY_BASE=vMDgAnJyJlK4K3AkTKnprxgjrbLZ3nDE2VoxqqJOcjyXPXLxERtCXoAuxLqx1Qd7

# Set working directory
WORKDIR /app

# Copy compiled app from the build stage
COPY --from=build /app .

# Install runtime dependencies for running the Phoenix server
RUN mix deps.get --only prod
RUN mix release

# Expose port for the Phoenix application
EXPOSE 4000

# Run the Phoenix server in production mode
CMD ["_build/prod/rel/backend/bin/backend", "start"]
