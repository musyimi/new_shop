defmodule ShopWeb.Schema.Types.UserType do
  use Absinthe.Schema.Notation

  object :user_type do
    field :id, :id
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    field :phone_number, :integer
    field :inserted_at, :string
    field :updated_at, :string
  end

  input_object :registration_input_type do
    field :email, non_null(:string)
    field :first_name, non_null(:string)
    field :last_name, non_null(:string)
    field :password, non_null(:string)
    field :phone_number, non_null(:integer)
  end
end
