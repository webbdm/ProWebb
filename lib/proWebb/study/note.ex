defmodule ProWebb.Study.Note do
  use Ecto.Schema
  import Ecto.Changeset
  @derive {Jason.Encoder, only: [:id, :user_id, :text, :study_session_id]}

  schema "notes" do
    field(:text, :string)
    field(:user_id, :id)
    field(:study_session_id, :id)

    # belongs_to(:user, ProWebb.Study.User)
    # belongs_to(:study_sessions, ProWebb.Study.StudySession)

    timestamps()
  end

  @doc false
  def changeset(note, attrs \\ :empty) do
    note
    |> cast(attrs, [:id, :text, :study_session_id, :user_id])
  end
end

# Remove name references from controller
