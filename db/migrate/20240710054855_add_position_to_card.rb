class AddPositionToCard < ActiveRecord::Migration[7.1]
  def change
    add_column :cards, :position, :integer
    BoardColumn.all.each do |board_column|
      board_column.cards.order(:updated_at).each.with_index(1) do |card, index|
        card.update_column :position, index
      end
    end
  end
end
