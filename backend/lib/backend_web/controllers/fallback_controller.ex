defmodule BackendWeb.FallbackController do
  use BackendWeb, :controller

  # Handle "not found" errors
  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> json(%{error: "Resource not found"})
  end

  # Handle other errors
  def call(conn, {:error, reason}) do
    conn
    |> put_status(:internal_server_error)
    |> json(%{error: reason})
  end
end
