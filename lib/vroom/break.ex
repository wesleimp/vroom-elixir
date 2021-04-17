defmodule VROOM.Break do
  @moduledoc """
  Defines a break during a route. A Vehicle can have many breaks.

  The Break struct has the following properties:

  - `time_windows`: an list of time_window objects describing valid slots for break start;
  - `service`: break duration (defaults to 0);
  - `description`: a string describing a break
  """

  @type t() :: %__MODULE__{
          id: integer(),
          time_windows: [integer()],
          service: integer() | nil,
          description: String.t() | nil
        }

  @derive Jason.Encoder

  defstruct [
    :id,
    :time_windows,
    :service,
    :description
  ]
end
