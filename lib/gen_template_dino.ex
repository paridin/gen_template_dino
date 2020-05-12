defmodule GenTemplateDino do

  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name:       :gen_template_dino,
    short_desc: "Template for an opinionated elixir app it includes (ecto / phoenix) customs layer.",
    source_dir: "../template",
    based_on:   :gen_template_dino_live_view,
    options:    [
      project_version: [default: "0.1.0"],
      db_user: [default: "postgres"],
      db_psw: [default: "postgres"],
      db_host: [default: "localhost"],
      db_port: [default: 5432],
    ]

    # def populate_assigns(assigns, options) do
    #   # ...
    # end

end
