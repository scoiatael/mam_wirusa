defmodule MamWirusa.Spread do
  @moduledoc """
  The Spread context.
  """

  import Ecto.Query, warn: false
  alias MamWirusa.Repo

  alias MamWirusa.Spread.Case
  alias MamWirusa.Command
  alias MamWirusa.Commands.ReportCase

  @doc """
  Returns the list of cases.

  ## Examples

      iex> list_cases()
      [%Case{}, ...]

  """
  def list_cases do
    Repo.all(Case)
  end

  @doc """
  Gets a single case.

  Raises `Ecto.NoResultsError` if the Case does not exist.

  ## Examples

      iex> get_case!(123)
      %Case{}

      iex> get_case!(456)
      ** (Ecto.NoResultsError)

  """
  def get_case!(id), do: Repo.get!(Case, id)

  @doc """
  Creates a case.

  ## Examples

      iex> create_case(%{field: value})
      {:ok, %Case{}}

      iex> create_case(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_case(attrs \\ %{}) do
    with {:ok, %Case{} = case} <- create_case_datum(attrs) do
      {create_case_event(case), case}
    end
  end

  defp create_case_event(%Case{
         uuid: uuid,
         infected_at: infected_at,
         location: %Geo.Point{coordinates: {longitude, latitude}},
         location_accuracy: location_accuracy
       }) do
    Command.dispatch(%ReportCase{
      uuid: uuid,
      infected_at: infected_at,
      location: %{lat: latitude, long: longitude},
      location_accuracy: location_accuracy
    })
  end

  defp create_case_datum(attrs) do
    %Case{}
    |> Case.changeset(attrs)
    |> Repo.insert()
  end
end
