defmodule VROOM.Vehicle do
  @moduledoc """
  Describes what kind of transportation type the driver is using. The default
  profile is `car`.

  The Vehicle struct has the following properties:

  - `profile`: routing profile (defaults to car)
  - `description`: a string describing this vehicle
  - `start`: coordinates list
  - `start_index`: index of relevant row and column in custom matrix
  - `end`: coordinates list
  - `end_index`: index of relevant row and column in custom matrix
  - `capacity`: an list of integers describing multidimensional quantities
  - `skills`: an list of integers defining skills
  - `time_window`: a time_window struct describing working hours
  - `breaks`: an list of break structs
  - `steps`: an list of vehicle_step structs describing a custom route for this vehicle (only makes sense when using -c)
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
          steps: [VROOM.Vehicle.Step.t()] | nil
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
