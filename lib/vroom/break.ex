defmodule VROOM.Break do
  @moduledoc """
  Defines a Vehicle Break object.

  https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#vehicles
  """

  @type t() :: %__MODULE__{
          id: integer(),
          time_windows: [integer()],
          service: integer() | nil,
          description: binary() | nil
        }

  @derive Jason.Encoder
  defstruct [
    :id,
    :time_windows,
    :service,
    :description
  ]
end
