# In this file, we load production configuration and secrets
# from environment variables. please be sure not hard code variables.
import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :<%= @project_name %>, <%= @project_name_camel_case %>Web.Endpoint,
  http: [:inet6, port: String.to_integer(System.get_env("PORT") || "80")],
  secret_key_base: secret_key_base
