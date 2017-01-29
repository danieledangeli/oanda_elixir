# Oanda Api Elixir

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `oanda_api` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:oanda_api, "~> 0.1.0"}]
    end
    ```

  2. Ensure `oanda_api` is started before your application:

    ```elixir
    def application do
      [applications: [:oanda_api]]
    end
    ```
## Configuration

  1. Add `oanda_api` to your config and define OANDA the base url and token.

    ```elixir
    use Mix.Config
        config :oanda_api,
             token: "test_token",
             base_url: "https://api-fxtrade.oanda.com"
    ```


=======