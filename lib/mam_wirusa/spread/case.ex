defmodule MamWirusa.Spread.Case do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uuid, :binary_id, autogenerate: true}

  schema "cases" do
    field :infected_at, :utc_datetime
    field :information, :string, default: ""
    field :location, Geo.PostGIS.Geometry
    field :location_accuracy, :integer
    embeds_one(:properties, MamWirusa.Spread.Case.Properties)

    timestamps()
  end

  def changeset(case, attrs) do
    case
    |> cast(attrs, [:infected_at, :information, :location, :location_accuracy])
    |> cast_embed(:properties)
    |> validate_required([:infected_at, :location, :location_accuracy])
  end
end
