defmodule Shop.Auth.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :password, :string
    field :phone_number, :integer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :phone_number, :email, :password])
    |> validate_required([:first_name, :last_name, :phone_number, :email, :password])
    |> unique_constraint(:email)
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:password, min: 8, max: 30)
  end
end
