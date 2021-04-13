defmodule VROOM.Job do
  @moduledoc false

  @type t() :: %__MODULE__{
          id: integer(),
          description: binary() | nil,
          location: list(integer()) | nil,
          location_index: integer() | nil,
          service: integer() | nil,
          delivery: list(integer()) | nil,
          pickup: list(integer()) | nil,
          skills: list(integer()) | nil,
          priority: integer(),
          time_windows: list()
        }

  @derive Jason.Encoder
  defstruct [
    :id,
    :description,
    :location,
    :location_index,
    :service,
    :delivery,
    :pickup,
    :skills,
    :priority,
    :time_windows
  ]
end
