defmodule <%= @project_name_camel_case %>.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: <%= @project_name_camel_case %>.Repo
end
