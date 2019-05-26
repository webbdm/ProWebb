defmodule ProWebb.Repo.Migrations.AddStudySessionsTable do
  use Ecto.Migration

  def up do
    create table("study_sessions") do
      add(:name, :varchar)
      add(:date, :date)

      timestamps()
    end
  end

  def down do
    drop(table("study_sessions"))
  end
end
