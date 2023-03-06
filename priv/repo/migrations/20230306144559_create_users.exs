defmodule Shop.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string
      add :last_name, :string
      add :phone_number, :integer
      add :email, :string
      add :password, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
