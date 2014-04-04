class AnswersController < InheritedResources::Base

  belongs_to :question, model_name: Question
  before_filter :authenticate_user!

  respond_to :html, :js

  def create
    @answer = Answer.new(permitted_params[:answer])
    @answer.user = current_user
    @answer.question = parent
    create!
  end

  private

  def permitted_params
    params.permit(:question, [
      :title, :content
    ])
  end

end
