defmodule OandaApi.Api.Test do
  use ExUnit.Case
  doctest OandaApi

  test "test it decorates url properly" do
    {_, base_url} = Application.fetch_env(:oanda_api, :base_url)
    assert   base_url <> "/test/1" == OandaApi.Api.process_url("/test/1")
  end

   test "test it decorates headers" do
      {_, token} = Application.fetch_env(:oanda_api, :token)
      assert [{:"Content-Type", "application/json"}, {:Authorization, "Bearer " <> token}] == OandaApi.Api.process_request_headers([])
    end
end
