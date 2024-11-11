FROM elixir:1.14-alpine

# Set environment variables
ENV MIX_ENV=prod
ENV LANG=C.UTF-8

# Set the DATABASE_URL environment variable for connecting to PostgreSQL
# The host should be the name of the PostgreSQL container in the Docker Compose network
ENV DATABASE_URL=postgresql://postgres:postgres@postgres_db:5432/backend_dev

# Set the SECRET_KEY_BASE environment variable (replace with your generated secret key)
ENV SECRET_KEY_BASE=vMDgAnJyJlK4K3AkTKnprxgjrbLZ3nDE2VoxqqJOcjyXPXLxERtCXoAuxLqx1Qd7

# Install dependencies
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new 1.5.9 --force

# Set working directory
WORKDIR /app

# Copy application files
COPY . .

# Install dependencies and compile the application
RUN mix deps.get
RUN mix compile

# Expose port for the Phoenix application
EXPOSE 4000

# Run the Phoenix server in production mode
CMD ["mix", "phx.server"]
