defmodule MamWirusa.Events.CaseReported do
  @derive Jason.Encoder
  defstruct [:uuid, :infected_at, :information, :location, :location_accuracy, :properties]
end
