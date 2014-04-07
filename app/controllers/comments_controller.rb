class CommentsController < InheritedResources::Base

  belongs_to :question, :answer, polymorphic: true
  actions :create, :update, :destroy

  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    @comment = Comment.new(permitted_params[:comment])
    @comment.user = current_user
    @comment.commentable = parent
    create!
  end

  private

  def permitted_params
    params.permit(comment: [
      :content
    ])
  end

end