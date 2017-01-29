defmodule OandaApi.Api do
  use HTTPoison.Base
    defp token, do: config_or_env(:token)
    defp url, do: config_or_env(:base_url)

    defp config_or_env(key) do
      case Application.fetch_env(:oanda_api, key) do
        {:ok, {:system, var}} -> System.get_env(var)
        {:ok, {:system, var, default}} ->
          case System.get_env(var) do
            nil -> default
            val -> val
          end
        {:ok, value} -> value
        :error -> nil
      end
    end

    def process_url(url) do
        url() <> url
    end

    def process_request_headers(headers) do
        headers
        |> Dict.put(:"Authorization", "Bearer " <> token())
        |> Dict.put(:"Content-Type", "application/json")
    end

    def process_response_body(body) do
        body
        |> Poison.decode!
    end

    @doc "
    A generic Api get
    Example:
    OandaApi.get('resources/1/whatever?query&whatever=19')
    Returns: {:ok, array body}
    "
    def do_get(path, q \\ %{}) do
        case apply(OandaApi.Api, :get, [path, [], [params: q]]) do
          {:error, val} -> {:error, val.reason}
          {:ok, val} -> {:ok, val.body}
        end
    end
end