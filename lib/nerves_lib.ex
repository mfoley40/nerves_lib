defmodule Nerves.Lib do

  # REVIEW not sure why we need this, but I couldn't get relx to stop
  # stripping out nerves_lib dependencies when baking firmware
  # without having a full app structure for nerves_lib - @ghitchens

  use Application

  @doc false
  def start(_type, _args) do
    {:ok, self()}
  end

end
