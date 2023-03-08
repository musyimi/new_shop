defmodule ShopWeb.Schema do
  use Absinthe.Schema

  alias ShopWeb.Schema.Resolvers

  import_types(ShopWeb.Schema.Types)

  query do
    @desc "greet"
    field :hello, :string do
      resolve(fn _,_,_ -> {:ok, "worlds"} end)
    end
  end

  mutation do
    field :register_user, :boolean do
      arg(:input, non_null(:registration_input_type))
      resolve(&Resolvers.UserResolver.register_user/3)
    end
  end

end
