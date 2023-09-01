defmodule Discuss.Topic do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Topic

  schema "topics" do
    field :title, :string
    # timestamps()
  end

  def changeset(%Topic{} = topic, params \\ %{}) do
    topic
    |> cast(params, [:title])
    |> validate_required([:title])
    |> validate_length(:title, min: 5)
    |> unique_constraint(:title)
  end
end
