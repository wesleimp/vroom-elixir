defmodule VROOM.Break do
  @moduledoc false

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
