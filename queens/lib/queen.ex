defmodule Queen do
  defstruct [:color, :position]

  def new(color: color, position: position) do
    %{color: color, position: position}
  end

  def attack?(queen_black, queen_white) do
    queen_movement?(queen_black.position, queen_white.position)
  end

  def attack_with_obscacle?(queen_black, queen_white, [_ | _] = obstacles) do
    queen_movement?(queen_black.position, queen_white.position) &&
      !obstacle?(queen_black.position, obstacles)
  end

  def attack_with_check?(queen_black, queen_white, [_ | _] = obstacles, king_black, king_white) do
    queen_movement?(queen_black.position, queen_white.position) &&
      !obstacle?(queen_black.position, obstacles) &&
      (check?(queen_black.position, king_white) ||
         check?(queen_white.position, king_black))
  end

  def obstacle?(position_queen, others) do
    Enum.any?(others, &queen_movement?(&1, position_queen)) |> IO.inspect(label: :res)
  end

  def check?(position_queen, position_king) do
    queen_movement?(position_queen, position_king)
  end

  def queen_movement?({x1, y1}, {x2, y2}) when (x1 - x2) * -1 == y1 - y2 do
    true
  end

  def queen_movement?({x1, y1}, {x2, y2}) when x1 - x2 == y1 - y2 do
    true
  end

  def queen_movement?({x, _}, {x, _}) do
    true
  end

  def queen_movement?({_, y}, {_, y}) do
    true
  end

  def queen_movement?(_, _), do: false
end
