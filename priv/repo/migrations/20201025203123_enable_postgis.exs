defmodule MamWirusa.Repo.Migrations.EnablePostgis do
  use Ecto.Migration

  def up do
    execute("CREATE EXTENSION IF NOT EXISTS postgis")
    execute("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\"")
  end

  def down do
  end
end
