defmodule VROOM.Shipment do
  @moduledoc false

  @type t() :: %__MODULE__{
          pickup: VROOM.ShipmentStep.t(),
          delivery: VROOM.ShipmentStep.t(),
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
