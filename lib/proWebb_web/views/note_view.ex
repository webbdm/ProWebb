defmodule ProWebbWeb.NoteView do
  use ProWebbWeb, :view
  alias ProWebbWeb.NoteView

  def render("index.json", %{notes: notes}) do
    %{data: render_many(notes, NoteView, "note.json")}
  end

  def render("show.json", %{note: note}) do
    %{data: render_one(note, NoteView, "note.json")}
  end

  def render("note.json", %{note: note}) do
    %{
      id: note.id,
      user_id: note.user_id,
      text: note.text,
      study_session_id: note.study_session_id
    }
  end
end
