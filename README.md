# vroom-elixir

Implementation of VROOM (Vehicle Routing Open-Source Optimization Machine) HTTP client for Elixir.

## Usage

### Install

```elixir
defp deps() do
  [
    {:vroom, "~> 0.1.0"}
  ]
end
```

### Configuration

```elixir
# config/config.exs

config :vroom, VROOM.Request,
    url: "VROOM URL",
    timeout: 15000

# config/prod.exs

config :vroom, VROOM.Request,
    url: "VROOM URL PROD"
```

### Example

```elixir
defmodule Router do
  def solve_route do
    shipment = %VROOM.Shipment{
      amount: [1],
      pickup: %VROOM.Shipment.Step{
        id: 1,
        description: "Pickup #1",
        location: [
          -49.273080825805664,
          -25.437422762495064
        ]
      },
      delivery: %VROOM.Shipment.Step{
        id: 2,
        description: "Delivery #1",
        location: [
          -49.264068603515625,
          -25.436686416884992
        ]
      }
    }

    vehicle = %VROOM.Vehicle{
      capacity: [3],
      description: "John Doe",
      id: 1,
      profile: "car",
      start: [
        -49.273080825805664,
        -25.437422762495064
      ]
    }

    %{"code" => 0, "routes" => routes} = VROOM.solve([vehicle], [shipment], [], %{g: true})

    routes
  end
end
```

For more info, check out the [docs](https://hexdocs.pm/vroom)
