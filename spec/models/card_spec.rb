require 'rails_helper'

RSpec.describe Card, type: :model do
  it 'validates presence of title' do
    expect(Card.new(title: nil)).not_to be_valid
  end

  it 'validates presence of board column' do
    expect(Card.new(title: "Card 1", board_column: nil)).not_to be_valid
  end

  it 'has board from board column' do
    board = Board.create!(name: 'Board')
    board_column = BoardColumn.create!(name: 'Col', board: board)
    card = Card.create!(title: 'card', board_column: board_column)

    expect(card.board).to eq board
  end
end
