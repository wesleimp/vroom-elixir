defmodule VROOM.Shipment do
  @moduledoc """
  Describe pickup and delivery task.

  The Shipment struct has the follwing properties:

  - `pickup`: a shipment_step struct describing pickup;
  - `elivery` a shipment_step struct describing delivery;
  - `amount`: an list of integers describing multidimensional quantities;
  - `skills`: an list of integers defining mandatory skills;
  - `priority`: an integer in the [0, 100] range describing priority level (defaults to 0)
  """

  @type t() :: %__MODULE__{
          pickup: VROOM.Shipment.Step.t(),
          delivery: VROOM.Shipment.Step.t(),
          amount: list() | nil,
          skills: list() | nil,
          priority: integer() | nil
        }

  @derive Jason.Encoder

  defstruct [
    :pickup,
    :delivery,
    :amount,
    :skills,
    :priority
  ]
end
