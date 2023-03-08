defmodule ShopWeb.Schema.Resolvers.UserResolver do

  alias Shop.Auth

  def register_user(_,%{input: input},_) do

    IO.inspect(input)
    res = Auth.create_user(input)
    IO.puts("create_user => ")
    IO.inspect(res)
    {:ok, true}
  end
end
