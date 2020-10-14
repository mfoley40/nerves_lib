defmodule Nerves.Lib.UUID do

  @moduledoc """
  Utility routines used by Nerves.
  """

  require Logger

  @doc """
  Generates a version 4 (random) UUID.
  """
  def generate do
    bingenerate() |> encode
  end

  @doc """
  Generates a base 64 encoded UUID without padding
  """
  def b64generate do
    bingenerate() |> Base.encode64()
  end

  @doc """
  Generates a version 4 (random) UUID in the binary format.
  """
  def bingenerate do
    <<u0::48, _::4, u1::12, _::2, u2::62>> = :crypto.strong_rand_bytes(16)
    <<u0::48, 4::4, u1::12, 2::2, u2::62>>
  end

  defp encode(<<u0::32, u1::16, u2::16, u3::16, u4::48>>) do
    hex_pad(u0, 8) <> "-" <>
    hex_pad(u1, 4) <> "-" <>
    hex_pad(u2, 4) <> "-" <>
    hex_pad(u3, 4) <> "-" <>
    hex_pad(u4, 12)
  end

  @doc """
  Convert the given integer into a hex string. Ensure that the returned
  string is the given count characters long. If the hex string is shorter
  than count, pad it with leading 0's such that is is long enough. Any
  hex characters such as A, B, etc are returned in lower case.

  Example:

    hex_pad(30, 5)
    0001e

  """
  def hex_pad(hex, count) do
    hex = Integer.to_string(hex, 16)
    to_lower(hex, :binary.copy("0", count - byte_size(hex)))
  end

  @doc """
  Return true if the given single character string is a hex digit,
  false otherwise.
  """
  def is_hex_digit?(digit) when is_binary(digit) and byte_size(digit) == 1 do
    #Logger.debug "hex_digit #{digit}"
    case Integer.parse(digit, 16) do
      {_x, _r} -> :true
      _ -> :false
    end
  end
  def is_hex_digit?(_digit) do
    #Logger.debug "hex_digit default #{digit}"
    :false
  end

  defp to_lower(<<h, t::binary>>, acc) when h in ?A..?F,
    do: to_lower(t, acc <> <<h + 32>>)
  defp to_lower(<<h, t::binary>>, acc),
    do: to_lower(t, acc <> <<h>>)
  defp to_lower(<<>>, acc),
    do: acc

end
