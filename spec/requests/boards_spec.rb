require 'rails_helper'

RSpec.describe "/boards", type: :request do
  let(:valid_attributes) {
    { name: 'Board 1' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Board.create! valid_attributes
      get boards_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      board = Board.create! valid_attributes
      get board_url(board)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_board_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      board = Board.create! valid_attributes
      get edit_board_url(board)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Board" do
        expect {
          post boards_url, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)
      end

      it "redirects to the created board" do
        post boards_url, params: { board: valid_attributes }
        expect(response).to redirect_to(board_url(Board.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Board" do
        expect {
          post boards_url, params: { board: invalid_attributes }
        }.to change(Board, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post boards_url, params: { board: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: 'Board 2' }
      }

      it "updates the requested board" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: new_attributes }
        expect(board.reload.name).to eq 'Board 2'
      end

      it "redirects to the board" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: new_attributes }
        board.reload
        expect(response).to redirect_to(board_url(board))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        board = Board.create! valid_attributes
        patch board_url(board), params: { board: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested board" do
      board = Board.create! valid_attributes
      expect {
        delete board_url(board)
      }.to change(Board, :count).by(-1)
    end

    it "redirects to the boards list" do
      board = Board.create! valid_attributes
      delete board_url(board)
      expect(response).to redirect_to(boards_url)
    end
  end
end
