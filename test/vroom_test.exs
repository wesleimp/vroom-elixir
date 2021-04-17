defmodule VROOMTest do
  @moduledoc false
  use ExUnit.Case
  doctest VROOM

  alias VROOM.{Shipment, Vehicle}

  @shipment_1 %Shipment{
    amount: [1],
    pickup: %Shipment.Step{
      id: 1,
      description: "Pickup #1",
      location: [
        -49.273080825805664,
        -25.437422762495064
      ]
    },
    delivery: %Shipment.Step{
      id: 2,
      description: "Delivery #1",
      location: [
        -49.264068603515625,
        -25.436686416884992
      ]
    }
  }

  @vehicle_1 %Vehicle{
    capacity: [3],
    description: "John Doe",
    id: 1,
    profile: "car",
    start: [
      -49.273080825805664,
      -25.437422762495064
    ]
  }

  test "solve shipments without jobs" do
    assert %{"code" => 0, "routes" => routes} =
             VROOM.solve([@vehicle_1], [@shipment_1], [], %{g: true})

    assert [
             %{
               "steps" => [
                 %{"type" => "start"},
                 %{"type" => "pickup", "id" => 1},
                 %{"type" => "delivery", "id" => 2}
               ]
             }
           ] = routes
  end
end
