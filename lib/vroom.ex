defmodule VROOM do
  @moduledoc """
  This module defines the implementation of VROOM (Vehicle Routing Open-Source
  Optimization Machine) HTTP client.
  """

  use Tesla

  require Logger

  alias VROOM.{Job, Vehicles}

  @vroom_url Application.get_env(:vroom, :url)

  plug(Tesla.Middleware.BaseUrl, @vroom_url)
  plug(Tesla.Middleware.Headers, [{"content-type", "application/json"}])
  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)

  @doc """
  Calls the VROOM API and get the computed solution.

  The computed solution follows the VROOM output.

  For more info, check the [output section](https://github.com/VROOM-Project/vroom/blob/master/docs/API.md#output) in the docs.
  """
  @spec solve([Vehicles.t()], [Shipments.t()], [Job.t()], map()) :: map()
  def solve(vehicles, shipments, jobs, options \\ %{}) do
    with request_body <- prepare_request_body(vehicles, shipments, jobs, options),
         {:ok, %{status: 200, body: response_body}} <- post("/", request_body) do
      response_body
    else
      error ->
        Logger.error("Could not solve VRP #{inspect(error)}", context: "VROOM")
        {:error, :request_error}
    end
  end

  defp prepare_request_body(vehicles, shipments, jobs, options) do
    %{
      "vehicles" => Enum.map(vehicles, &prune_nils/1),
      "shipments" => Enum.map(shipments, &prune_nils/1),
      "jobs" => Enum.map(jobs, &prune_nils/1),
      "options" => options
    }
  end

  @spec reducer({any, any}, map) :: map
  defp reducer({k, v}, map) when is_map(v), do: Map.put(map, k, prune_nils(v))
  defp reducer({_k, v}, map) when is_nil(v), do: map
  defp reducer({k, v}, map), do: Map.put(map, k, v)

  @spec prune_nils(map) :: map
  defp prune_nils(s) when is_struct(s), do: s |> Map.from_struct() |> Enum.reduce(%{}, &reducer/2)
  defp prune_nils(m) when is_map(m), do: Enum.reduce(m, %{}, &reducer/2)
end
