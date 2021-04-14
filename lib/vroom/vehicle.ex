defmodule VROOM.Vehicle do
  @moduledoc """
  Defines a Vehicle Step object.

  https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#vehicles
  """

  @type coordinates() :: list(float())
  @type t() :: %__MODULE__{
          id: integer(),
          profile: binary() | nil,
          description: binary() | nil,
          start: coordinates() | nil,
          start_index: integer() | nil,
          end: coordinates() | nil,
          end_index: integer() | nil,
          capacity: list(integer()) | nil,
          skills: list(integer()) | nil,
          time_window: list() | nil,
          breaks: [VROOM.Break.t()] | nil,
          speed_factor: float(),
          steps: [VROOM.VehicleStep.t()] | nil
        }

  @derive Jason.Encoder
  defstruct [
    :id,
    :profile,
    :description,
    :start,
    :start_index,
    :end,
    :end_index,
    :capacity,
    :skills,
    :time_window,
    :breaks,
    :speed_factor,
    :steps
  ]
end
