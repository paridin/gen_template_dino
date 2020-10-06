# In this file, we load production configuration and secrets
# from environment variables. You can also hardcode secrets,
# although such is generally not recommended and you have to
# remember to add this file to your .gitignore.
import Config

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    For example: ecto://USER:PASS@HOST/DATABASE
    """

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

port = System.get_env("HTTP_PORT") || "80"

schema = case port do
  "443" -> "https"
  "80" -> "http"
  _ -> System.get_env("HTTP_SCHEMA") || raise """
  environment variable HTTP_SCHEMA is required since we can't get it from bases protocol.
  """
end

config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
    url: [
      schema: schema,
      host: System.get_env("HTTP_HOST") || "localhost",
      port: String.to_integer(System.get_env("URL_PORT") || port)
    ],
    http: [:inet6, port: String.to_integer(port)],
    # if you need configure https here is the place.
    check_origin: (System.get_env("HTTP_ORIGINS") || "localhost") |> String.split(" "),
    secret_key_base: secret_key_base

config :<%= @project_name %>, <%= @project_name_camel_case %>.Repo,
  # ssl: true,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
