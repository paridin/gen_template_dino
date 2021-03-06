# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :<%= @project_name %>,
  ecto_repos: [<%= @project_name_camel_case %>.Repo],
  generators: [binary_id: true]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Configures the endpoint
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  url: [host: "<%= @project_domain %>"],
  secret_key_base: "<%= @secret_key_base %>",
  render_errors: [view: <%= @project_name_camel_case %>Web.ErrorView, accepts: ~w(html json)],
  pubsub_server: <%= @project_name_camel_case %>.PubSub

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Config LiveView
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  live_view: [
    signing_salt: "<%= @signing_salt_live %>"
  ]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
