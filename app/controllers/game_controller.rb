class GameController < ApplicationController
  before_action :validate_session!

  def play!
    if session[:play].nil?
      session[:play] = 1 
    else
      session[:play] = session[:play] + 1
    end

    @play = session[:play]
    @round = (@play.to_i / 2)
    @round = @round == 0 ? 1 : @round
    @turn  = @play.to_i % 2
  end

  def finish!
  end


  private

  def validate_session!
    redirect_to root_path if session[:player_id].nil?
  end

end
