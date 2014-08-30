class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_question

  def create
    @like      = @idea.likes.new
    @like.user = current_user
    if @like.save
      redirect_to @idea, notice: "Liked!"
    else
      redirect_to @idea, alert: "Can't Like!"
    end
  end


  def destroy
    like = current_user.likes.find params[:id]
    if like.destroy
      redirect_to @idea, notice: "UnLiked!"
    else
      redirect_to @idea, alert: "Can't UnLike!"
    end
  end

  private

  def find_question
    @idea  = Idea.find params[:idea_id]
  end

end
