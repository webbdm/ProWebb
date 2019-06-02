defmodule ProWebb.Study.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field(:text, :string)
    field(:user_id, :id)
    field(:study_session_id, :id)

    belongs_to(:users, ProWebb.Study.User)
    belongs_to(:study_sessions, ProWebb.Study.StudySession)

    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:text])
    |> validate_required([:text])
  end
end
