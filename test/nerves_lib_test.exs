defmodule Nerves.Lib.Test do
  use ExUnit.Case
  doctest Nerves.Lib.UUID

  test "start test" do
    a = 1
    b = 2
    {result, pid} = Nerves.Lib.start(a, b)
    assert result == :ok
    assert is_pid(pid)
  end
end
