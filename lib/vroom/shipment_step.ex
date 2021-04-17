defmodule VROOM.Shipment.Step do
  @moduledoc """
  It's similar to a Job.

  The ShipmentStep has the following properties:

  - `description`: a string describing this step;
  - `location`: coordinates list;
  - `location_index`: index of relevant row and column in custom matrix;
  - `service`: task service duration (defaults to 0);
  - `time_windows`: an list of time_window structs describing valid slots for task service start
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
