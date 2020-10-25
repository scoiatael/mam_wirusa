defmodule MamWirusa.Spread.Case do
  use Ecto.Schema
  import Ecto.Changeset

  schema "cases" do
    field :infected_at, :utc_datetime
    field :information, :string

    timestamps()
  end

  @doc false
  def changeset(case, attrs) do
    case
    |> cast(attrs, [:infected_at, :information])
    |> validate_required([:infected_at, :information])
  end
end
