defmodule MamWirusa.Command.Router do
  use Commanded.Commands.Router

  alias MamWirusa.{Commands.ReportCase, Aggregates.Case}

  dispatch(ReportCase, to: Case, identity: :uuid)
end
