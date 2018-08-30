class CardsController < ApplicationController
  def index
    @cards = Board.find(params[:board_id]).cards
  end
end
