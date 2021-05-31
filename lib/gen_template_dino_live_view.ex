defmodule GenTemplateDinoLiveView do
  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name: :gen_template_dino_live_view,
    short_desc:
      "An opinionated template to create phoenix apps, using live view, live dashboard and tailwind, SSL Ready.",
    source_dir: "../template",
    options: [
      build_with: [default: "dino liveview template version 0.2.22"],
      project_version: [default: "0.1.0"],
      secret_key_base: [default: salt(64)],
      signing_salt_session: [default: salt(8)],
      signing_salt_live: [default: salt(32)],
      basic_auth_user: [default: "dino"],
      basic_auth_password: [default: salt(10)],
      project_domain: [default: "localhost"]
    ]

  def clean_up(assigns) do
    base_assets = Path.expand("#{source_dir()}/../../base/assets/")
    target_assets = Path.expand("#{assigns.target_subdir}/assets/")
    # generate testing certs
    System.cmd("/bin/bash", ["-c", "mkdir -p ./#{assigns.target_subdir}/priv/{ssl,static/{js,css},uploads}"])

    System.cmd("/bin/bash", [
      "-c",
      "touch ./#{assigns.target_subdir}/priv/static/{js/app.js,css/app.css}"
    ])

    IO.inspect(
      ~s[cd #{assigns.target_subdir} && mix deps.get && npm i --prefix assets && mix phx.gen.cert -o priv/ssl/#{
        assigns.project_name
      } && mix format && git init],
      pretty: true,
      label: "You are almost ready, let's run this"
    )

    File.cp_r(base_assets, target_assets)
    # copy github action for testing
    copy_github_action(assigns)
  end

  def copy_github_action(assigns) do
    base = Path.expand("#{source_dir()}/../../base/github_action/")
    target = Path.expand("#{assigns.target_subdir}/")
    File.cp_r(base, target)
  end

  defp salt(length) do
    :crypto.strong_rand_bytes(length) |> Base.encode64() |> binary_part(0, length)
  end
end
