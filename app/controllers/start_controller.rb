class StartController < ApplicationController
 
  def groups
    reset_session
  end

  def name
    if params[:group_id].present?
      session[:group_id] = params[:group_id]
      @group = session[:group_id]
    else
      redirect_to root_path
    end
  end

  def welcome
    if params[:data].present? && params[:data][:name].present?
      @player = Player.new
      @player.name = params[:data][:name]
      @player.group_id = session[:group_id]

      if @player.save
        session[:player_id] = @player.id
      else
        flash[:danger] = "Talvez sua internet falhou no envio dos dados, tente novamente."
        redirect_to name_path
      end
    else
      flash[:danger] = "Necessário informar seu nome!!"
      redirect_to name_path
    end
  end

  
  def play
  end

 

end