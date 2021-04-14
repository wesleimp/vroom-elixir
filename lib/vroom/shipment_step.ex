defmodule VROOM.ShipmentStep do
  @moduledoc """
  Defines a Shipment Step object.

  https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#shipments
  """

  @type coordinates() :: list(float())
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
