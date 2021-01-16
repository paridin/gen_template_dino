
defmodule <%= @project_name_camel_case %>.Release do
  @moduledoc false
  # To run on Docker image replace the last line with the following line.
  # CMD trap 'exit' INT; /opt/app/bin/$(ls /opt/app/bin) eval "<%= @project_name_camel_case %>.Release.migrate" &&
  # /opt/app/bin/$(ls /opt/app/bin) start
  @app :<%= @project_name %>

  def migrate do
    load_app()

    for repo <- repos() do
      {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :up, all: true))
    end
  end

  def rollback(repo, version) do
    load_app()
    {:ok, _, _} = Ecto.Migrator.with_repo(repo, &Ecto.Migrator.run(&1, :down, to: version))
  end

  defp repos do
    Application.fetch_env!(@app, :ecto_repos)
  end

  defp load_app do
    Application.load(@app)
  end
end
