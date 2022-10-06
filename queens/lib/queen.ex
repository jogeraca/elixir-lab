defmodule Queen do
  @spec attack?(tuple(), tuple()) :: boolean
  def attack?(queen_black, queen_white) do
    queen_movement?(queen_black, queen_white)
  end

  @spec attack_with_obscacle?(tuple(), tuple(), nonempty_maybe_improper_list) :: boolean
  def attack_with_obscacle?(queen_black_pos, queen_white_pos, [_ | _] = obstacles) do
    queen_movement?(queen_black_pos, queen_white_pos) &&
      !obstacle?(queen_black_pos, obstacles)
  end

  @spec attack_with_check?(tuple(), tuple(), nonempty_maybe_improper_list, tuple(), tuple()) ::
          boolean
  def attack_with_check?(
        queen_black_pos,
        queen_white_pos,
        [_ | _] = obstacles,
        king_black,
        king_white
      ) do
    queen_movement?(queen_black_pos, queen_white_pos) &&
      !obstacle?(queen_black_pos, obstacles) &&
      (check?(queen_black_pos, king_white) ||
         check?(queen_white_pos, king_black))
  end

  @spec obstacle?(tuple(), list(tuple())) :: boolean
  defp obstacle?(position_queen, others) do
    Enum.any?(others, &queen_movement?(&1, position_queen))
  end

  @spec check?(tuple(), tuple()) :: boolean
  defp check?(position_queen, position_king) do
    queen_movement?(position_queen, position_king)
  end

  @spec queen_movement?(tuple(), tuple()) :: boolean
  defp queen_movement?({x1, y1}, {x2, y2}) when (x1 - x2) * -1 == y1 - y2 do
    true
  end

  defp queen_movement?({x1, y1}, {x2, y2}) when x1 - x2 == y1 - y2 do
    true
  end

  defp queen_movement?({x, _}, {x, _}) do
    true
  end

  defp queen_movement?({_, y}, {_, y}) do
    true
  end

  defp queen_movement?(_, _), do: false
end
