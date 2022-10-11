defmodule Inmana.Restaurant do
  import Ecto.Changeset
  use Ecto.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:email, :name]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "restaurants" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:name, min: 2)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint([:email])
  end
end
