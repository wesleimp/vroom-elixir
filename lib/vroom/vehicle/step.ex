defmodule VROOM.Vehicle.Step do
  @moduledoc """
  Defines a Vehicle Step object.

  The Vehicle.Step struct has the following properties:

  - `type`: a string (either start, job, pickup, delivery, break or end)
  - `id`: id of the task to be performed at this step if type value is job, pickup, delivery or break;
  - `service_at`: hard constraint on service time;
  - `service_after`: hard constraint on service time lower bound;
  - `service_before`: hard constraint on service time upper bound;

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
