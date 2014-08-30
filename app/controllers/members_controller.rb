class MembersController < ApplicationController

  before_action :authenticate_user!
  before_action :find_idea

  def create
    @member      = @idea.members.new
    @member.user = current_user
    if @member.save
      redirect_to @idea, notice: "Joined!"
    else
      redirect_to @idea, alert: "Can't Joined!"
    end
  end

  def destroy
    @member = current_user.members.find params[:id]
    if @member.destroy
      redirect_to @idea, notice: "UnJoined!"
    else
      redirect_to @idea, alert: "Can't Joined!"
    end
  end

  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end


end
