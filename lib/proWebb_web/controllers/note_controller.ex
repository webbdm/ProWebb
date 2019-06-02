defmodule ProWebbWeb.NoteController do
  use ProWebbWeb, :controller

  alias ProWebb.Study.Note

  action_fallback(ProWebbWeb.FallbackController)

  def index(conn, _params) do
    notes = Note.list_notes()
    render(conn, "index.json", notes: notes)
  end

  def create(conn, %{"note" => note_params}) do
    with {:ok, %Note{} = note} <- Note.create_note(note_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.note_path(conn, :show, note))
      |> render("show.json", note: note)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.puts(id)
    note = Note.get_note!(id)
    render(conn, "show.json", note: note)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = Note.get_note!(id)

    with {:ok, %Note{} = note} <- Note.update_note(note, note_params) do
      render(conn, "show.json", note: note)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = Note.get_note!(id)

    with {:ok, %Note{}} <- Note.delete_note(note) do
      send_resp(conn, :no_content, "")
    end
  end
end
