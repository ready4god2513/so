class AnswersController < InheritedResources::Base

  belongs_to :question
  before_filter :authenticate_user!

  respond_to :html, :js

  def create
    @answer = Answer.new(permitted_params[:answer])
    @answer.user = current_user
    @answer.question = parent
    create! { question_url(parent) }
  end

  private

  def permitted_params
    params.permit(answer: [
      :title, :content
    ])
  end

end
