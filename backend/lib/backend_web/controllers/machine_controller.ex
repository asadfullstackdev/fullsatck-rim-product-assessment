defmodule BackendWeb.MachineController do
  use BackendWeb, :controller
  alias Backend.Machines
  alias Backend.Machines.Machine

  action_fallback BackendWeb.FallbackController

  def index(conn, _params) do
    machines = Machines.list_machines()
    json(conn, machines)
  end
end
