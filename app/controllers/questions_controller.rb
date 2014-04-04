class QuestionsController < InheritedResources::Base

  before_filter :authenticate_user!, except: [:index, :show]

  def create
    @question = Question.new(permitted_params[:question])
    @question.user = current_user
    create!
  end

  private

  def permitted_params
    params.permit(question: [
      :title, :content
    ])
  end

end