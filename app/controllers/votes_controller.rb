class VotesController < InheritedResources::Base

  belongs_to :comment, :answer, :question, polymorphic: true
  actions :create, :update, :destroy

  before_filter :authenticate_user!
  before_filter :delete_existing_vote
  respond_to :html, :js

  def create
    @vote = Vote.new(permitted_params[:vote])
    @vote.user = current_user
    @vote.voteable = parent
    create!
  end

  private

  # This is probably not the best way to do it.  But it works for a prototype
  def delete_existing_vote
    parent.votes.where{user_id.eq my{current_user.id}}.destroy_all
  end

  def permitted_params
    params.permit(vote: [
      :direction
    ])
  end

end