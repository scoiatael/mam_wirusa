defmodule MamWirusaWeb.PageController do
  use MamWirusaWeb, :controller

  alias MamWirusa.Spread

  plug :cache

  def index(conn, _params) do
    render(conn, "index.html", cases: Spread.list_cases(4000) |> serialize_cases)
  end

  defp serialize_cases(cases) do
    Enum.map(cases, fn %{
                         location_accuracy: location_accuracy,
                         location: %{coordinates: {long, lat}},
                         information: information,
                         infected_at: infected_at
                       } ->
      [long, lat, location_accuracy, information, infected_at]
    end)
  end

  def privacy(conn, _params) do
    render(conn, "privacy.html")
  end

  defp cache(conn, _) do
    Plug.Conn.put_resp_header(conn, "cache-control", "max-age=1, public")
  end
end
