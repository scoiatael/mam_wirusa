# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MamWirusa.Repo.insert!(%MamWirusa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

for _ <- 1..2000 do
  lat = 52.25 + 0.9 * :rand.normal()
  long = 19.25 + 1.8 * :rand.normal()

  MamWirusa.Repo.insert!(%MamWirusa.Spread.Case{
    infected_at: DateTime.utc_now() |> DateTime.truncate(:second),
    location_accuracy: 6 + :rand.uniform(4),
    location: %Geo.Point{coordinates: {long, lat}}
  })
end
