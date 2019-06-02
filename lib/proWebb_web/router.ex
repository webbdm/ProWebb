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

    resources("/study_sessions", StudySessionController)
    # get("/study_sessions/:id", StudyNotesController, :show)
  end

  # This is for MVC 
  # scope "/", ProWebbWeb do
  #   pipe_through :browser

  #   get "/", PageController, :index
  # end
end
