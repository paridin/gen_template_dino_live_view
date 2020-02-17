defmodule GenTemplateDinoLiveView do

  @moduledoc File.read!(Path.join([__DIR__, "../README.md"]))

  use MixTemplates,
    name:       :gen_template_dino_live_view,
    short_desc: "An opinionated template to create phoenix apps, using live view and tailwind.",
    source_dir: "../template",
    options:    [
      project_version: [default: "0.1.0"],
      secret_key_base: [default: salt(64)],
      signing_salt_session: [default: salt(8)],
      signing_salt_live: [default: salt(32)]
    ]

  def clean_up(assigns) do
    base_assets = Path.expand("#{source_dir()}/../../base/assets/")
    target_assets = Path.expand("#{assigns.target_subdir}/assets/")
    File.cp_r(base_assets, target_assets)
  end

  defp salt(length) do
    :crypto.strong_rand_bytes(length) |> Base.encode64 |> binary_part(0, length)
  end
end
