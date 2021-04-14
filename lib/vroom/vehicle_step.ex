defmodule VROOM.VehicleStep do
  @moduledoc """
  Defines a Vehicle Step object.

  https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#vehicles
  """

  @type t() :: %__MODULE__{
          type: binary(),
          id: integer() | nil,
          service_at: integer() | nil,
          service_after: integer() | nil,
          service_before: integer() | nil
        }

  @derive Jason.Encoder
  defstruct [
    :type,
    :id,
    :service_at,
    :service_after,
    :service_before
  ]
end
