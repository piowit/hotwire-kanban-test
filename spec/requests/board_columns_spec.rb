require 'rails_helper'

RSpec.describe "/board_bolumns", type: :request do
  let(:board) { Board.create!(name: 'Board 1') }

  let(:valid_attributes) {
    { name: 'Column 1' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET /new" do
    it "renders a successful response" do
      get new_board_board_column_url(board)

      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Board Column and redirects to board" do
        expect {
          post board_board_columns_url(board), params: { board_column: valid_attributes }
        }.to change(BoardColumn, :count).by(1)

        expect(response).to redirect_to(board_url(board))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Board Column and returns 422" do
        expect {
          post board_board_columns_url(board), params: { board_column: invalid_attributes }
        }.to change(BoardColumn, :count).by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested board" do
      board_column = BoardColumn.create!(name: 'Col 1', board: board)
      expect {
        delete board_board_column_url(board, board_column)
      }.to change(BoardColumn, :count).by(-1)

      expect(response).to redirect_to(board_url(board))
    end
  end
end
