defmodule Inmana.Repo.Migrations.CreateSupliesTable do
  use Ecto.Migration

  def change do
    create table(:suplies) do
      add :description, :string
      add :expiration_date, :date
      add :responsible, :string
      add :restaurant_id, references(:restaurants, type: :binary_id)

      timestamps()
    end
  end
end
