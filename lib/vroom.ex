defmodule VROOM do
  @moduledoc """
  This module defines the implementation of VROOM (Vehicle Routing Open-Source
  Optimization Machine) HTTP client.
  """

  @spec solve([Vehicles.t()], [Shipments.t()], [Job.t()], map()) :: map()
  @doc """
  Calls the VROOM API and get the computed solution.

  The computed solution follows the VROOM output.

  For more info, check the [output section](https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#output) in the docs.
  """
  def solve(vehicles, shipments, jobs, options \\ %{}) do
    VROOM.Request.vroom(vehicles, shipments, jobs, options)
  end
end
