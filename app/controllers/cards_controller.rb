class CardsController < ApplicationController
  load_and_authorize_resource

  def index
    @cards = Board.find(params[:board_id]).cards
  end
end
