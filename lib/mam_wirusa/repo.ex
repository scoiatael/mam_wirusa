defmodule MamWirusa.Repo do
  use Ecto.Repo,
    otp_app: :mam_wirusa,
    adapter: Ecto.Adapters.Postgres
end
