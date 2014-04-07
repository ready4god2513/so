class VotesController < InheritedResources::Base

  belongs_to :comment, :answer, :question, polymorphic: true
  actions :create, :update, :destroy

  before_filter :authenticate_user!
  respond_to :html, :js

  def create
    @vote = Vote.new(permitted_params[:vote])
    @vote.user = current_user
    @vote.voteable = parent
    create!
  end

  private

  def permitted_params
    params.permit(vote: [
      :direction
    ])
  end

end