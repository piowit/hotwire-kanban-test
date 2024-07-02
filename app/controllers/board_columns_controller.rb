class BoardColumnsController < ApplicationController
  def new
    @board = Board.find(params[:board_id])
    @board_column = @board.board_columns.new
  end

  def edit
    @board_column = BoardColumn.find(params[:id])
  end

  def create
    @board = Board.find(params[:board_id])
    @board_column = @board.board_columns.new(board_column_params)

    respond_to do |format|
      if @board_column.save
        format.html { redirect_to board_url(@board), notice: "BoardColumn was successfully created." }
        format.json { render :show, status: :created, location: @board }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @board_column.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @board_column = BoardColumn.find params[:id]

    respond_to do |format|
      if @board_column.update(board_column_params)
        format.html { redirect_to board_url(@board), notice: "BoardColumn was successfully updated." }
        format.json { render :show, status: :ok, location: @board_column }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @board_column.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @board_column = BoardColumn.find params[:id]
    board = @board_column.board
    @board_column.destroy!

    respond_to do |format|
      format.html { redirect_to board_url(board), notice: "BoardColumn was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def board_column_params
      params.require(:board_column).permit(:name)
    end
end
