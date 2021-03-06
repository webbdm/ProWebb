defmodule ProWebbWeb.Router do
  use ProWebbWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(CORSPlug, origin: "*")
    plug(:accepts, ["json"])
  end

  scope "/api", ProWebbWeb do
    pipe_through(:api)

    # resources("/users", UserController) 
    # get("/user/:id", UserController, :show) 

    resources("/notes", NoteController)
    get("/notes", NoteController, :index)
    get("/notes/:id", NoteController, :show)

    resources("/study_sessions", StudySessionController)

    get("/study_sessions", StudySessionController, :index)
    get("/study_sessions/:id", StudySessionController, :show)

    post("/study_sessions", StudySessionController, :create)
    options("/study_sessions", StudySessionController, :create)
  end

  # This is for MVC 
  # scope "/", ProWebbWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end
end
