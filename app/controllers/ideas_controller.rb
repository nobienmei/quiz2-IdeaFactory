class IdeasController < ApplicationController
  #ユーザーログインしていない場合はワーニングを返す
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]

  def index
    @ideas  = Idea.all
    @idea = Idea.new
    # @like     = @idea.like_for(current_user) || Like.new
  end

  def show
    #@comment = Comment.new
    #@member = @idea.members.where(user: current_user).first
    #@like = @idea.likes.where(user: current_user).first
  end

  def new
     @idea = Idea.new
  end

  def edit
  end

  def create
    @idea = current_user.ideas.new idea_params
    if @idea.save
      redirect_to ideas_path, notice: "Idea created successfully"
    else
      render :new
    end

  end

  private


    def idea_params
      params.require(:idea).permit(:title, :body)
    end
end
