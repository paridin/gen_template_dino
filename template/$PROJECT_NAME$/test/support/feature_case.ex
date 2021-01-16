defmodule <%= @project_name_camel_case %>Web.FeatureCase do
  @moduledoc """
  Feature Case
  """

  use ExUnit.CaseTemplate
  alias Ecto.Adapters.SQL.Sandbox

  using do
    quote do
      use Wallaby.DSL

      import Plug.Conn
      import Phoenix.ConnTest
      import Phoenix.LiveViewTest
      import <%= @project_name_camel_case %>Web.ConnCase.Helpers

      import <%= @project_name_camel_case %>.Factory
      alias <%= @project_name_camel_case %>Web.Router.Helpers, as: Routes

      @endpoint <%= @project_name_camel_case %>Web.Endpoint
    end
  end

  setup tags do
    :ok = Sandbox.checkout(<%= @project_name_camel_case %>.Repo)

    unless tags[:async] do
      Sandbox.mode(<%= @project_name_camel_case %>.Repo, {:shared, self()})
    end

    metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(<%= @project_name_camel_case %>.Repo, self())
    {:ok, session} = Wallaby.start_session(metadata: metadata)
    {:ok, session: session}
  end
end
