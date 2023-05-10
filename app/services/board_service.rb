# frozen_string_literal: true

class BoardService < ApplicationService

  def add_mines(board, count)
    matrix = get_matrix(board)
    board_cells_count = board.board_mines.count
    return matrix if count <= 0 || board_cells_count >= board.height * board.width

    count = board.height * board.width - board_cells_count if count + board_cells_count > board.height * board.width
    board_mines = []

    while count > 0
      mine = create_tmp_mine(matrix)
      while matrix[mine.y][mine.x] == 1
        mine = create_tmp_mine(matrix)
      end
      matrix[mine.y][mine.x] = 1
      board_mines << {
        board_id: board.id,
        x: mine.x,
        y: mine.y,
      }
      count -= 1
    end
    BoardMine.insert_all(board_mines)

    matrix
  end

  def get_matrix(board)
    matrix = Array.new(board.height) { Array.new(board.width, 0) }
    board.board_mines.each do |mine|
      matrix[mine.y][mine.x] = 1
    end

    matrix
  end

  private

  def create_tmp_mine(matrix)
    bomb = OpenStruct.new
    bomb.y = rand(matrix.count)
    bomb.x = rand(matrix[bomb.y].count)
    bomb
  end
end
