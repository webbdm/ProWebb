defmodule ProWebb.Repo.Migrations.AddNotesTable do
  use Ecto.Migration

  def up do
    create table("notes") do
      add(:user_id, references(:users))
      add(:text, :text)
      add(:study_session_id, references(:study_sessions))

      timestamps()
    end
  end

  def down do
    drop(table("notes"))
  end
end
