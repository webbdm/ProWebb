defmodule ProWebbWeb.StudySessionController do
  use ProWebbWeb, :controller
  import Ecto.Query, warn: false

  alias ProWebb.Study.StudySession
  alias ProWebb.Repo

  action_fallback(ProWebbWeb.FallbackController)

  def index(conn, _params) do
    study_sessions =
      StudySession
      |> preload(:notes)
      |> Repo.all()

    json(conn, study_sessions)
    # render(conn, "index.json", study_sessions: study_sessions)
  end

  #   def create(conn, %{"study_session" => study_session_params}) do
  #     with {:ok, %StudySession{} = study_session} <- StudySession.create_study_session(study_session_params) do
  #       conn
  #       |> put_status(:created)
  #       |> put_resp_header("location", Routes.study_session_path(conn, :show, study_session))
  #       |> render("show.json", study_session: study_session)
  #     end
  #   end

  def show(conn, %{"id" => id}) do
    IO.puts(id)

    study_session =
      StudySession
      |> preload(:notes)
      |> Repo.get(id)

    json(conn, study_session)
    # render(conn, "show.json", study_session: study_session)
  end

  #   def update(conn, %{"id" => id, "study_session" => study_session_params}) do
  #     study_session = StudySession.get_study_session!(id)

  #     with {:ok, %StudySession{} = study_session} <- StudySession.study_session(study_session, study_session_params) do
  #       render(conn, "show.json", study_session: study_session)
  #     end
  #   end

  #   def delete(conn, %{"id" => id}) do
  #     study_session = StudySession.get_study_session!(id)

  #     with {:ok, %StudySession{}} <- StudySession.delete_study_session(study_session) do
  #       send_resp(conn, :no_content, "")
  #     end
  #   end
end
