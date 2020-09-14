defmodule Product.Repo.Migrations.CreateDevices do
  use Ecto.Migration

  def change do
    create table(:devices) do
      add :name, :string
      add :sku, :string
      add :price, :string

      timestamps()
    end

  end
end
