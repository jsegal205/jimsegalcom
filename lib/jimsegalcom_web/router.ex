defmodule JimsegalcomWeb.Router do
  use JimsegalcomWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {JimsegalcomWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", JimsegalcomWeb do
    pipe_through :browser

    get "/", PageController, :home

    get "/projects", ProjectController, :index

    scope "/recipes" do
      get "/", RecipeController, :index
      get "/:slug", RecipeController, :show
    end

    get "/isjimwearingshorts", ShortsController, :index
    get "/ischicagocolderthananchorage", IsColderThanController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", JimsegalcomWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:jimsegalcom, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: JimsegalcomWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  # always at the end!
  scope "/", JimsegalcomWeb do
    pipe_through :browser
    # catchall
    get "/*path", ErrorController, :not_found
  end
end
