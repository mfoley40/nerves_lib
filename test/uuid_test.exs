defmodule Nerves.Lib.UUID.Test do
  use ExUnit.Case
  doctest Nerves.Lib.UUID

  require Logger

  @tag UUIDTest
  test "generate test" do
    x = Nerves.Lib.UUID.generate

    assert is_binary(x)
    assert byte_size(x) == 36
    assert String.at(x,8) == "-"
    assert String.at(x,13) == "-"
    assert String.at(x,18) == "-"
    assert String.at(x,23) == "-"

    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,0))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,1))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,2))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,3))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,4))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,5))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,6))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,7))

    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,9))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,10))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,11))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,12))

    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,14))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,15))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,16))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,17))

    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,19))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,20))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,21))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,22))

    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,24))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,25))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,26))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,27))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,28))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,29))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,30))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,31))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,32))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,33))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,34))
    assert Nerves.Lib.UUID.is_hex_digit?(String.at(x,35))
  end

  @tag UUIDTest
  test "b64generate test" do
    x = Nerves.Lib.UUID.b64generate

    assert is_binary(x)
    assert byte_size(x) == 24
  end

  @tag UUIDTest
  test "bingenerate test" do
    x = Nerves.Lib.UUID.bingenerate

    assert is_binary(x)
    assert byte_size(x) == 16
  end

  @tag UUIDTest
  test "is_hex_digit? test" do
    assert Nerves.Lib.UUID.is_hex_digit?("0") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("1") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("2") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("3") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("4") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("5") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("6") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("7") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("8") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("9") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("A") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("B") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("C") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("D") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("E") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("F") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("a") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("b") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("c") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("d") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("e") == :true
    assert Nerves.Lib.UUID.is_hex_digit?("f") == :true

    assert Nerves.Lib.UUID.is_hex_digit?("00") == :false
    assert Nerves.Lib.UUID.is_hex_digit?("AB") == :false
    assert Nerves.Lib.UUID.is_hex_digit?("g") == :false
    assert Nerves.Lib.UUID.is_hex_digit?("z") == :false
    assert Nerves.Lib.UUID.is_hex_digit?(" ") == :false
    assert Nerves.Lib.UUID.is_hex_digit?("?") == :false

  end

  @tag UUIDTest
  test "hex_pad test" do
    x = Nerves.Lib.UUID.hex_pad(16, 5)
    assert x == "00010"

    x = Nerves.Lib.UUID.hex_pad(32, 2)
    assert x == "20"

    x = Nerves.Lib.UUID.hex_pad(0, 3)
    assert x == "000"

    x = Nerves.Lib.UUID.hex_pad(485963210, 8)
    assert x == "1cf735ca"

    x = Nerves.Lib.UUID.hex_pad(485963210, 18)
    assert x == "00000000001cf735ca"

    x = Nerves.Lib.UUID.hex_pad(1, 1)
    assert x == "1"
  end
end
