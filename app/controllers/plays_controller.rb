class PlaysController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]

  #actions
  def index
    if params[:category].blank?
      @plays = Play.newest        
    else
      @category_id = Category.find_by(name: params[:category]).id
      @plays = Play.where(:category_id => @category_id)
    end
    # @categories = Category.all
  end

  def show
    @play = Play.find(params[:id])
  end

  def new
    @play = current_user.plays.build
    #@categories = Category.all.map { |c| [c.name, c.id] }
  end

  def create
    @play = current_user.plays.build(play_params)
    if @play.save
      flash[:notice] = "Play created successfully."
      redirect_to play_path(@play)
    else
      render 'new'
    end
  end

  def edit
    @play = Play.find(params[:id])
    #@categories = Category.all.map { |c| [c.name, c.id] }
  end

  def update
    @play = Play.find(params[:id])
    if @play.update_attributes(play_params)
      flash[:notice] = "play updated successfully."
      redirect_to play_path(@play)
    else
      render 'edit'
    end
  end


  def destroy
    @play = Play.find(params[:id])
    @play.destroy
    flash[:notice] = "Play #{@play.title} deleted successfully."
    redirect_to plays_path
  end

  #private methods

  private

  def play_params
    params.require(:play).permit(:title, :description, :director, :user_id, :category_id, :play_img)
  end
end
