class GameController < ApplicationController
  before_action :validate_session!

  def play!
    if session[:play].nil?
      session[:play] = 1 
    else
      session[:play] = session[:play] + 1
    end

    @image_url = "http://tccgame.s3-website-sa-east-1.amazonaws.com/images/"
    @play = session[:play]

    @round  = Round.turn!(@play, session[:group_id])
    @turn   = Round.player_turn!(@play, session[:group_id])
    @images = Round.images!(@play)

    redirect_to game_finished_path unless Round.play!({index: @play, player: @turn, choice: params[:t], group_id: session[:group_id]})

  end

  def finish!
  end


  private

  def validate_session!
    redirect_to root_path if session[:player_id].nil?
  end

end
