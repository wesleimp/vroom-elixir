defmodule VROOM.Request do
  @moduledoc false

  use Tesla

  require Logger

  @vroom_url Application.get_env(:vroom, :url)

  plug(Tesla.Middleware.BaseUrl, @vroom_url)
  plug(Tesla.Middleware.Headers, [{"content-type", "application/json"}])
  plug(Tesla.Middleware.FollowRedirects)
  plug(Tesla.Middleware.JSON)
  plug(Tesla.Middleware.Logger)

  def vroom(vehicles, shipments, jobs, options) do
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
