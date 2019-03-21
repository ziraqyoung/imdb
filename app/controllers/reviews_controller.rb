class ReviewsController < ApplicationController
    
    before_action :authenticate_user!, only: [:new, :edit]
    before_action :set_play

    #actions
    def new
        @review = Review.new
    end

    def create
        @review = Review.new(review_params)
        @review.play_id = @play.id
        @review.user_id = current_user.id

        if @review.save
            flash[:notice] = "Review created succesfully."
            redirect_to play_path(@play)
        else
            render 'new'
        end
    end

    def edit
        #play is found already
        @review = Review.find(params[:id])
    end

    def update
        @review = Review.find(params[:id])
        if @review.update_attributes(review_params)
            flash[:notice] = "Review updated!"
            redirect_to play_path(@play)
        else
            render 'edit'
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        redirect_to(@play)
    end

    #private methods

    private

    def review_params
        params.require(:review).permit(:rating, :comment)
    end

    def set_play
        @play = Play.find(params[:play_id])
    end
    
end
