defmodule QueenTest do
  use ExUnit.Case, async: true

  alias Queen

  test "define_position/0" do
    queen_black = {1, 5}
    queen_white = {3, 3}

    assert Queen.attack?(queen_black, queen_white)

    queen_black = {2, 5}
    queen_white = {1, 5}

    assert Queen.attack?(queen_black, queen_white)

    queen_black = {0, 0}
    queen_white = {1, 7}

    refute Queen.attack?(queen_black, queen_white)

    queen_black = {3, 4}
    queen_white = {5, 6}

    assert Queen.attack?(queen_black, queen_white)

    queen_black = {0, 0}
    queen_white = {7, 7}

    assert Queen.attack?(queen_black, queen_white)

    queen_black = {0, 7}
    queen_white = {7, 0}

    assert Queen.attack?(queen_black, queen_white)

    queen_black = {0, 5}
    queen_white = {4, 1}

    assert Queen.attack?(queen_black, queen_white)
  end

  describe "attack_with_obstacle/3" do
    test "with obstacles" do
      queen_black = {1, 5}
      queen_white = {1, 3}
      other_pieces = [{2, 4}, {2, 3}, {2, 4}]

      refute Queen.attack_with_obscacle?(queen_black, queen_white, other_pieces)
    end

    test "without obstacles" do
      queen_black = {0, 7}
      queen_white = {7, 0}
      other_pieces = [{1, 4}, {2, 3}, {2, 4}]

      assert Queen.attack_with_obscacle?(queen_black, queen_white, other_pieces)
    end
  end

  describe "attack_with_check/3" do
    test "with obstacles check" do
      queen_black = {1, 5}
      queen_white = {1, 3}
      other_pieces = [{2, 4}, {2, 3}, {2, 4}]
      king_black = {2, 5}
      king_white = {2, 2}

      refute Queen.attack_with_check?(
               queen_black,
               queen_white,
               other_pieces,
               king_black,
               king_white
             )
    end

    test "without obstacles check" do
      queen_black = {0, 7}
      queen_white = {7, 0}
      other_pieces = [{1, 4}, {2, 3}, {2, 4}]
      king_black = {7, 2}
      king_white = {0, 6}

      assert Queen.attack_with_check?(
               queen_black,
               queen_white,
               other_pieces,
               king_black,
               king_white
             )
    end
  end
end
