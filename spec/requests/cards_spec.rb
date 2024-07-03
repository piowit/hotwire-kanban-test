require 'rails_helper'

RSpec.describe "Cards", type: :request do
  describe "GET /new" do
    it "renders a successful response" do
      board_column = create(:board_column)

      get new_board_column_card_url(board_column)
      expect(response).to be_successful
    end
  end
end
