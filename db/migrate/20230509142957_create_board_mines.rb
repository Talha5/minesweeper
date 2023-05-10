class CreateBoardMines < ActiveRecord::Migration[7.0]
  def change
    create_table :board_mines do |t|
      t.references :board, index: true
      t.integer :x
      t.integer :y

      t.index [:board_id, :x, :y], unique: true
      t.timestamps
    end
  end
end
