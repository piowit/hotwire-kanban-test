class CardsController < ApplicationController
  def new
    @board_column = BoardColumn.find(params[:board_column_id])
    @card = Card.new(board_column: @board_column)
  end

  def create
    @board_column = BoardColumn.find(params[:board_column_id])
    @card = @board_column.cards.new(card_params)

    respond_to do |format|
      if @card.save
        format.html { redirect_to board_url(@card.board), notice: "Card was successfully created." }
        format.json { render :show, status: :created, location: @card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def card_params
      params.require(:card).permit(:title, :description)
    end
end
