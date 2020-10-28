defmodule MamWirusa.Repo.Migrations.CreateCases do
  use Ecto.Migration

  def change do
    create table(:cases, primary_key: false) do
      add :uuid, :uuid, primary_key: true, default: fragment("uuid_generate_v4()")
      add :infected_at, :utc_datetime, null: false
      add :information, :text, default: "", null: false
      add :properties, :map, default: %{}, null: false
      add :location, :geometry, null: false
      add :location_accuracy, :integer, null: false

      timestamps()
    end
  end
end
