defmodule ProWebbWeb.StudySessionView do
  use ProWebbWeb, :view
  alias ProWebbWeb.StudySessionView

#   def render("index.json", %{study_sessions: study_sessions}) do
#     %{data: render_many(study_sessions, StudySessionView, "study_session.json")}
#   end

#   def render("show.json", %{study_session: study_session}) do
#     %{data: render_one(study_session, StudySessionView, "study_session.json")}
#   end

  def render("study_session.json", %{study_session: study_session}) do
    %{id: study_session.id, date: study_session.date, name: study_session.name}
  end
end
