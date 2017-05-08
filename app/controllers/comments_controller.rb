class CommentsController < ApplicationController
  def destroy
    @comment = Comment.find_by(id: params[:id])
    unless @comment.nil?
      @comment.destroy
    end
    respond_to do |format|
      format.html {}
      format.js { render 'leads/comments/destroy.js.erb'}
    end
  end
  def new
  end
  def create
    @lead = Lead.find_by_id(params[:lead_id])
    @lead.comments.create(comment_params)
    @lead.save
    respond_to do |format|
      format.html {}
      format.js { render 'leads/comments/create.js.erb'}
    end
  end

  private
  def comment_params
    params.require(:comments).permit(:comment)
  end
end
