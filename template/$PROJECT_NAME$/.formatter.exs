[
  import_deps: [:ecto_sql, :phoenix],
  inputs: ["mix.exs", "*.{ex,exs}", "priv/*/seeds.exs", "{config,lib,test}/**/*.{ex,exs}"],
  subdirectories: ["priv/*/migrations"]
]
