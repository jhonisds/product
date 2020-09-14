defmodule Product.Devices.Device do
  use Ecto.Schema
  import Ecto.Changeset

  schema "devices" do
    field :name, :string
    field :price, :string
    field :sku, :string

    timestamps()
  end

  @doc false
  def changeset(device, attrs) do
    device
    |> cast(attrs, [:name, :sku, :price])
    |> validate_required([:name, :sku, :price])
  end
end
