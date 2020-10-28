defmodule MamWirusa.Command do
  use Commanded.Application,
    otp_app: :mam_wirusa,
    event_store: [
      adapter: Commanded.EventStore.Adapters.EventStore,
      event_store: MamWirusa.EventStore
    ]

  router(MamWirusa.Command.Router)
end
