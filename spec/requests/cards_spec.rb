require 'rails_helper'

RSpec.describe "Cards", type: :request do
  let(:valid_attributes) do
    { title: 'Column 1', description: 'Hello World' }
  end
  let(:invalid_attributes) do
    { title: nil, description: 'Hello World' }
  end

  describe "GET /new" do
    it "renders a successful response" do
      board_column = create(:board_column)

      get new_board_column_card_url(board_column)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Card and redirects to board" do
        board_column = create(:board_column)
        expect {
          post board_column_cards_url(board_column), params: { card: valid_attributes }
        }.to change(board_column.cards, :count).by(1)

        expect(response).to redirect_to(board_url(board_column.board))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Board Column and returns 422" do
        board_column = create(:board_column)
        expect {
          post board_column_cards_url(board_column), params: { card: invalid_attributes }
        }.to change(board_column.cards, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
