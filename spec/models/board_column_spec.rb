require 'rails_helper'

RSpec.describe BoardColumn, type: :model do
  it 'validates presence of name' do
    expect(BoardColumn.new(name: nil)).not_to be_valid
  end

  it 'validates presence of board' do
    expect(BoardColumn.new(name: 'Column 1', board: nil)).not_to be_valid
  end
end
