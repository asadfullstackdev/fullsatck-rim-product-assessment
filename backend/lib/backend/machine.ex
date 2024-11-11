defmodule Backend.Machines.Machine do
  use Ecto.Schema
  import Ecto.Changeset

  schema "machines" do
    field :name, :string
    field :description, :string
    field :status, :string
    timestamps() # Add timestamps fields automatically: inserted_at and updated_at
  end

  # Changeset function for validating and casting data
  def changeset(machine, attrs) do
    machine
    |> cast(attrs, [:name, :description, :status])
    |> validate_required([:name, :status])
    |> validate_length(:description, max: 500, allow_nil: true)  # Optional: Validate max length of description
    |> validate_inclusion(:status, ["active", "inactive", "maintenance"])  # Optional: Validate status
  end
end
