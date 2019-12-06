defmodule Day5 do

  @default_path "lib/day5/input"

  def run(input, path \\ @default_path) do
    path
    |> load_file()
    |> transcribe(0, input)
  end

  defp load_file(path) do
    path
    |> File.read!()
    |> String.trim
    |> String.split(",")
  end

  defp transcribe(op_list, pos, input) do
    op_list
    |> Enum.slice(pos, 4)
    |> cast_opcode
    |> do_transcribe(op_list, pos, input)
  end

  defp do_transcribe([{_, "99"} | _], _, _, _), do: "finished"

  defp do_transcribe([{modes, "01"}, a1, a2, store_str], codes, pos, input) do
    store_pos = String.to_integer(store_str)
    [var1, var2] = get_vars(modes, [a1, a2], codes)
    codes |> List.replace_at(store_pos, Integer.to_string(var1 + var2)) |> transcribe(pos + 4, input)
  end

  defp do_transcribe([{modes, "02"}, a1, a2, store_str], codes, pos, input) do
    store_pos = String.to_integer(store_str)
    [var1, var2] = get_vars(modes, [a1, a2], codes)
    codes |> List.replace_at(store_pos, Integer.to_string(var1 * var2)) |> transcribe(pos + 4, input)
  end

  defp do_transcribe([{_, "03"}, input_pos | _], codes, pos, input) do
    codes
    |> List.replace_at(String.to_integer(input_pos), input)
    |> transcribe(pos + 2, input)
  end

  defp do_transcribe([{_, "04"}, output_pos | _], codes, pos, input) do
    codes |> Enum.at(String.to_integer(output_pos)) |> IO.inspect(label: "Val")
    transcribe(codes, pos + 2, input)
  end

  defp do_transcribe([{modes, "05"}, a1, a2, _], codes, pos, input) do
    [var1, var2] = get_vars(modes, [a1, a2], codes)
    if var1 != 0 do
      transcribe(codes, var2, input)
    else
      transcribe(codes, pos + 3, input)
    end
  end

  defp do_transcribe([{modes, "06"}, a1, a2, _], codes, pos, input) do
    [var1, var2] = get_vars(modes, [a1, a2], codes)
    if var1 == 0 do
      transcribe(codes, var2, input)
    else
      transcribe(codes, pos + 3, input)
    end
  end

  defp do_transcribe([{modes, "07"}, a1, a2, store_str], codes, pos, input) do
    store_pos = String.to_integer(store_str)
    [var1, var2] = get_vars(modes, [a1, a2], codes)

    if var1 < var2 do
      List.replace_at(codes, store_pos, "1")
    else
      List.replace_at(codes, store_pos, "0")
    end
    |> transcribe(pos + 4, input)
  end

  defp do_transcribe([{modes, "08"}, a1, a2, store_str], codes, pos, input) do
    store_pos = String.to_integer(store_str)
    [var1, var2] = get_vars(modes, [a1, a2], codes)

    if var1 == var2 do
      List.replace_at(codes, store_pos, "1")
    else
      List.replace_at(codes, store_pos, "0")
    end
    |> transcribe(pos + 4, input)
  end

  defp get_vars(modes, args, codes) do
    modes
    |> Enum.zip(args)
    |> Enum.map(fn
      {"0", arg} -> Enum.at(codes, String.to_integer(arg)) |> String.to_integer
      {"1", arg} -> String.to_integer(arg)
    end)
  end

  defp cast_opcode([opcode | t]) do
    {mode, op} =
      opcode
      |> String.pad_leading(4, "0")
      |> String.split_at(-2)

    [{String.reverse(mode) |> String.graphemes, op} | t]
  end
end

Day5.run("5")
