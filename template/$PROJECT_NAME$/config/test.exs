import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :<%= @project_name %>, <%= @project_name_camel_case %>.Repo,
  username: "<%= @db_user %>",
  password: "<%= @db_psw %>",
  database: "<%= @project_name %>_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "<%= @db_host %>",
  port: <%= @db_port %>,
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  http: [port: 4002],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  server: true

# phoenix_ecto depends on this flag, that's why wallaby needs it to run tests with ecto integration.
config :<%= @project_name %>, :sql_sandbox, true
