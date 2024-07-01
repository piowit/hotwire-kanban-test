require 'rails_helper'

RSpec.describe Board, type: :model do
  it 'validates presence of name' do
    expect(Board.new(name: nil)).not_to be_valid
  end
end
