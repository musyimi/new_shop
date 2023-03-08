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
    |> validate_format(:email, ~r/@/)
    |> update_change(:email, fn email-> String.downcase(email) end)
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:first_name, min: 2, max: 30)
    |> validate_length(:password, min: 8, max: 30)
    |> hash_password

  end

  defp hash_password(%Ecto.Changeset{} = changeset) do
   case changeset do
    %Ecto.Changeset{valid?: true, changes: %{password: password}} ->
      new_changeset = put_change(changeset, :password, Pbkdf2.hash_pwd_salt(password))
      new_changeset

      _ ->
        changeset
   end

  end
end
