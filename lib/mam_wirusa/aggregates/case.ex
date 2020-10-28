defmodule MamWirusa.Aggregates.Case do
  alias __MODULE__
  alias MamWirusa.{Events.CaseReported, Commands.ReportCase}

  defstruct [:uuid]

  def execute(%Case{uuid: nil}, %ReportCase{
        uuid: uuid,
        infected_at: infected_at,
        location: location,
        location_accuracy: location_accuracy
      }) do
    %CaseReported{
      uuid: uuid,
      infected_at: infected_at,
      location: location,
      location_accuracy: location_accuracy
    }
  end

  def execute(%Case{}, %ReportCase{}) do
    {:error, :case_already_reported}
  end

  def apply(%Case{} = case, %CaseReported{uuid: uuid}) do
    %Case{case | uuid: uuid}
  end
end
