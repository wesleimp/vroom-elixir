defmodule VROOM.Job do
  @moduledoc """
  A Job is a description of a place to visit.

  The Job struct has the folling properties:

  - `id`: the job identifier;
  - `location`: the coordinates list
  - location_index]: index of relevant row and column in custom matrix;
  - `service`: job service duration (defaults to 0);
  - `amount`: an list of integers describing multidimensional quantities;
  - `delivery`: an list of integers describing multidimensional quantities for delivery;
  - `pickup`: an list of integers describing multidimensional quantities for pickup;
  - `skills`: an list of integers defining mandatory skills;
  - `priority`: an integer in the [0, 100] range describing priority level (defaults to 0);
  - `time_windows`: an list of time_window structs describing valid slots for job service start
  """

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
