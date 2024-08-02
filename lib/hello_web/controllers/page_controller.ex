defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  def home(conn, _params) do
    run_mode = if System.get_env("RELEASE_NAME"), do: "release", else: "mix"
    owner_site_url = Application.get_env(:hello, HelloWeb.Endpoint)[:owner_site_url]
    repository_url = Application.get_env(:hello, HelloWeb.Endpoint)[:repository_url]

    conn
    |> render(:home,
      run_mode: run_mode,
      phoenix_version: Application.spec(:phoenix, :vsn),
      elixir_version: System.version(),
      owner_site_url: owner_site_url,
      repository_url: repository_url
    )
  end
end
