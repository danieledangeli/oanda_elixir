defmodule OandaApi do
    @spec candles(String.t, Keyword.t) :: {:ok, HTTPoison.Base.body} | {:error, Error.t}
    def candles(instrument, q \\ %{}) do
        OandaApi.Api.do_get("/v3/instruments/" <> instrument <> "/candles", q)
    end

    @spec accounts() :: {:ok, HTTPoison.Base.body} | {:error, Error.t}
    def accounts() do
        OandaApi.Api.do_get("/v3/accounts")
    end

    @spec account(String.t) :: {:ok, HTTPoison.Base.body} | {:error, Error.t}
    def account(accountId) do
        OandaApi.Api.do_get("/v3/accounts/" <> accountId)
    end

    @spec summary(String.t) :: {:ok, HTTPoison.Base.body} | {:error, Error.t}
    def summary(accountId) do
        OandaApi.Api.do_get("/v3/accounts/" <> accountId <> "/summary")
    end

    @spec changes(String.t, String.t) :: {:ok, HTTPoison.Base.body} | {:error, Error.t}
    def changes(accountId, transactionId) do
        OandaApi.Api.do_get("/v3/accounts/" <> accountId <> "/instruments", %{sinceTransactionID: transactionId})
    end
end
