defmodule Nerves.Lib do

  # REVIEW not sure why we need this, but I couldn't get relx to stop
  # stripping out nerves_lib dependencies when baking firmware
  # without having a full app structure for nerves_lib - @ghitchens

  use Application
  import Supervisor.Spec, warn: false
  @sup Nerves.Lib.Supervisor
  @doc false
  def start(_type, _args) do
    Supervisor.start_link [], strategy: :one_for_one, name: @sup
  end

end
