class CommentsController < ApplicationController

  def create
   @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype_id)
    else
      @prototype = Prototype.find(@comment.prototype_id)
      @comments = Comment.where(prototype_id: @prototype.id)
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end

end
