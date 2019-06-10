defmodule ProWebb.Study.StudySession do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :name, :date, :notes]}

  schema "study_sessions" do
    field(:date, :date)
    field(:name, :string)

    has_many(:notes, ProWebb.Study.Note)

    timestamps()
  end

  @doc false
  def changeset(study_session, attrs) do
    study_session
    |> cast(attrs, [:name, :date])
    |> validate_required([:name, :date])
  end
end
