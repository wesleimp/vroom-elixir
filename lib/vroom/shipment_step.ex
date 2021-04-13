defmodule VROOM.ShipmentStep do
  @moduledoc false

  @type coordinates() :: list(Float.t())
  @type t() :: %__MODULE__{
          id: integer(),
          description: binary() | nil,
          location: coordinates() | nil,
          location_index: integer() | nil,
          service: integer() | nil,
          time_windows: list(integer()) | nil
        }

  @derive Jason.Encoder
  defstruct [
    :id,
    :description,
    :location,
    :location_index,
    :service,
    :time_windows
  ]
end
